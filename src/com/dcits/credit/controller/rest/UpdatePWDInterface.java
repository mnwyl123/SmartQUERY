package com.dcits.credit.controller.rest;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import javax.annotation.Resource;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Component;

import com.dcits.credit.controller.rest.util.MyRejectedExecutionHandler;
import com.dcits.credit.controller.rest.util.RequestReportUtil;
import com.dcits.credit.entity.FtpUtil;
import com.dcits.credit.entity.WbCopyFileRunnable;
import com.dcits.credit.entity.WebServiceRunnable;
import com.dcits.credit.entity.WebServiceRunnable_batch;
import com.dcits.credit.service.EnterAppReview.EntAppReManager;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.QueryDateOperatorService.QueryDateOperatorManager;
import com.dcits.credit.service.companyInquiry.CompanyInquiryManager;
import com.dcits.credit.service.personInquiry.PersonInquiryManager;
import com.dcits.credit.service.rest.CompanyInterfaceService;
import com.dcits.credit.service.rest.ReportInterfaceService;
import com.dcits.credit.util.PasswordOper;
import com.dcits.credit.util.ReportUtil;
import com.dcits.credit.util.WbqqInnerRunnable;
import com.dcits.credit.util.sm3.SM3Digest;
import com.dcits.credit.wsimport.IServiceUtil;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;
import com.dcits.platform.util.UuidUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import com.dcits.credit.service.dataSubmission.IDataSubmissionService;
/** 
 * 密码修改接口
 * 
 */ 
@Component
@Path("/updatePWDInterface")
public class UpdatePWDInterface extends BaseController{  
	@Resource(name="PersonInquiryService")
	public PersonInquiryManager personInquiryService;
	@Resource(name="indAppReService")
	private IndAppReManager indAppReService;
	
	
	@POST
	@Path("/updatePwd")
	public JSONObject updatePwd(InputStream is){
		 PageData pd =new PageData();
		JSONObject json = new JSONObject();
		JSONObject returnjson = new JSONObject();
		String sysNo="1";
		PageData pd1=new PageData();
		pd1.put("sysNo", sysNo);
		try {
			pd1 = personInquiryService.findSysStatus(pd1);
		} catch (Exception e1) {
			logger.error(e1.getMessage(),e1);
		}
		if(pd1.getString("SYS_STATUS").equals("0")){
			 returnjson.put("errorcode", "08");
			 returnjson.put("errormsg", "系统维护中");
			 return returnjson;
		}
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf-8"));
			String lines = br.readLine();
			json = JSONObject.fromObject(lines);
			logger.info("修改密码报文："+json);
			logger.info("request json............" + json);
			
			//提取字段，判断字段
			if(json.get("USERNAME")!=null&&!json.get("USERNAME").equals("")){				
				pd.put("USERNAME", json.get("USERNAME"));//征信用户名
			}else{
				logger.info("USERNAME参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常(USERNAME)");
				return returnjson;
			}			
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			returnjson.put("errorcode", "03");
			returnjson.put("errormsg", "参数解析异常");
			return returnjson;
		}		
		
		String NEW_PASSWORD=randomPWD();
		pd.put("NEW_PASSWORD", NEW_PASSWORD);		
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
						returnjson.put("message", "success");
						return returnjson;
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
			logger.error(e.getMessage(),e);
		}
		
		
		return returnjson;
	}  
	//生成8-16位随机密码
	public static String randomPWD(){
		String password = "";
		//按规则生成新密码8~16个字符，至少包含‘0至9’、‘A至Z’、‘a至z’、‘-_@#’字符中,两种或两种以上的字符	
		int pwdLength = (int)(Math.random()*8+8); 
		//规则字符
		String[] connection1 = {"0","1","2","3","4","5","6","7","8","9"};
		String[] connection2 = {"q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h","j","k","l","z","x","c","v","b","n","m"};
		String[] connection3 = {"Q","W","E","R","T","Y","U","I","O","P","A","S","D","F","G","H","J","K","L","Z","X","C","V","B","N","M"};
		String[] connection4 = {"-","_","@","#"};
		
		int flag = 0;
		for(int i=0; i<pwdLength; i++){
			//1-4的随机整数
			int random1234 = (int)(Math.random()*4+1);
			while(random1234 == flag){
				random1234 = (int)(Math.random()*4+1);
			}
			flag = random1234;
			if(random1234 == 1){
				int randomN = (int)(Math.random()*10);
				password += connection1[randomN];
			}
			if(random1234 == 2){
				int randomN = (int)(Math.random()*26);
				password += connection2[randomN];
			}
			if(random1234 == 3){
				int randomN = (int)(Math.random()*26);
				password += connection3[randomN];
			}
			if(random1234 == 4){
				int randomN = (int)(Math.random()*4);
				password += connection4[randomN];
			}
		}
		return password;
	}	
	
}  
