package com.dcits.credit.entity;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import com.dcits.credit.controller.rest.util.RequestReportUtil;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.personInquiry.PersonInquiryManager;
import com.dcits.credit.util.PasswordOper;
import com.dcits.credit.util.ReportUtil;
import com.dcits.credit.util.sm3.SM3Digest;
import com.dcits.credit.wsimport.IServiceUtil;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.PageData;

import net.sf.json.JSONObject;

public class UpdatePWD extends BaseController{  

	@Resource(name="PersonInquiryService")
	public PersonInquiryManager personInquiryService;
	@Resource(name="indAppReService")
	private IndAppReManager indAppReService;
	
	public boolean updatePwd(String CREDIT_CODE,String CURRENT_PASSWORD){
		PageData pd =new PageData();
		boolean flag= false;
		pd.put("USERNAME", CREDIT_CODE);//用户名
		pd.put("NEW_PASSWORD", CURRENT_PASSWORD);//新密码
		PageData pwdInfo;
		try {
			pwdInfo = indAppReService.findPerbankInfo(pd);
			pd.put("CURRENT_PASSWORD", PasswordOper.decode(pwdInfo.getString("CURRENT_PASSWORD")));
			PageData sqlPd = new PageData();
			String sql = "SELECT VALUE from SERVER_MESSAGE_INFO  WHERE CODE = 'PER_QueryOrgCode'";
			sqlPd.put("selectSql", sql);
			PageData QUERY_ORG_CODE =indAppReService.selectPdInfo(sqlPd);
			sql = "SELECT VALUE from SERVER_MESSAGE_INFO  WHERE CODE = 'RECE_ORG_CODE'";
			sqlPd.put("selectSql", sql);
			PageData RECE_ORG_CODE = (PageData) indAppReService.selectPdInfo(sqlPd);
			
			//拼接修改密码请求报文
			StringBuffer strBuf = new StringBuffer();
			strBuf.append(ReportUtil.headInfo(QUERY_ORG_CODE.getString("VALUE"),RECE_ORG_CODE.getString("VALUE"),"L101"));
			strBuf.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
			strBuf.append("<Document>");
			strBuf.append("<Head>");
			strBuf.append("<QueryOrgCode>"+QUERY_ORG_CODE.getString("VALUE")+"</QueryOrgCode>");
			strBuf.append("<UserCode>"+pd.getString("USERNAME")+"</UserCode>");
			strBuf.append("<Password>"+SM3Digest.SM3OfUpper(pd.getString("CURRENT_PASSWORD"))+"</Password>");
			strBuf.append("</Head>");
			strBuf.append("<Msg>");
			strBuf.append("<UserCode>"+pd.getString("USERNAME")+"</UserCode>");//用户账号
			strBuf.append("<OPassword>"+pd.getString("CURRENT_PASSWORD")+"</OPassword>");//旧密码
			strBuf.append("<NPassword>"+pd.getString("NEW_PASSWORD")+"</NPassword>");//新密码		
			strBuf.append("</Msg>");
			strBuf.append("</Document>");	
			strBuf.append("{S:"+ReportUtil.numSignature(strBuf.toString())+":S}"); //数字签名
			logger.info("***********修改密码请求报文***********");
			logger.info(strBuf.toString());
			String reponseXml = IServiceUtil.queryReport_UpdatePwd(strBuf.toString());
			logger.info("***********密码修改完成返回报文***********");
			logger.info(reponseXml);
			PageData reponsePd = RequestReportUtil.parseXml_updPwd(reponseXml);
			if(reponsePd!=null){
				PageData resultPd = new PageData();						
				String date =new SimpleDateFormat("yyyyMMdd").format(new Date());
				resultPd.put("UPDATE_TIME",date);//修改时间	
				resultPd.put("USERNAME", pd.getString("USERNAME"));		
				resultPd.put("RESULTCODE", reponsePd.getString("ResultCode"));
				resultPd.put("RESULTDESC", reponsePd.getString("ResultDesc"));
				if(reponsePd.getString("ModifResultCode")!=null){					
					resultPd.put("MODIFRESULTCODE", reponsePd.getString("ModifResultCode"));									
					if(("0").equals(reponsePd.getString("ModifResultCode"))){
						resultPd.put("PREVIOUS_PASSWORD", PasswordOper.encode(pd.getString("CURRENT_PASSWORD")));//之前的密码
						resultPd.put("CURRENT_PASSWORD", PasswordOper.encode(pd.getString("NEW_PASSWORD")));//新密码
						resultPd.put("ERRDESC", null);	
						indAppReService.updatePerbankInfo(resultPd);//更新perbank表信息
						//更新CIFM_CREDIT_ACCT_MANAGE表密码信息
						sql="update CIFM_CREDIT_ACCT_MANAGE set CURRENT_PASSWORD = '"
						    +resultPd.getString("CURRENT_PASSWORD")+"',PREVIOUS_PASSWORD = '"
						    +resultPd.getString("PREVIOUS_PASSWORD")+"' where CREDIT_CODE = '"
						    +resultPd.getString("USERNAME")+"'";
						sqlPd.put("updateSql", sql);
						indAppReService.updateInfo(sqlPd);							
						logger.info("***********"+pd.getString("USERNAME")+"密码修改完成***********");
						//System.out.println("***********"+pd.getString("USERNAME")+"密码修改完成***********");
						logger.info("旧密码："+pd.getString("CURRENT_PASSWORD")+"   新密码："+pd.getString("NEW_PASSWORD"));
						//System.out.println("旧密码："+pd.getString("CURRENT_PASSWORD")+"   新密码："+pd.getString("NEW_PASSWORD"));
						flag = true;
						return flag;
					}else if(reponsePd.getString("ErrDesc")!=null){
						resultPd.put("ERRDESC", reponsePd.getString("ErrDesc"));						
					}else{
						resultPd.put("ERRDESC", null);
					}					
				}else{
					resultPd.put("ModifResultCode", null);
					resultPd.put("ERRDESC", null);
				}
				//修改失败 还是之前的密码
				resultPd.put("PREVIOUS_PASSWORD", pwdInfo.getString("PREVIOUS_PASSWORD"));//旧密码不变未解密
				resultPd.put("CURRENT_PASSWORD", PasswordOper.encode(pd.getString("CURRENT_PASSWORD")));//新密码为之前的密码
				indAppReService.updatePerbankInfo(resultPd);	
				logger.info("*********"+resultPd.getString("RESULTDESC")+"**********");
				//System.out.println("*********"+resultPd.getString("RESULTDESC")+"**********");
			}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return flag;
	}  
}
