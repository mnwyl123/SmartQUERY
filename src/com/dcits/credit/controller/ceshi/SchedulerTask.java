package com.dcits.credit.controller.ceshi;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.quartz.Job;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.dcits.credit.controller.rest.util.RequestReportUtil;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.personInquiry.PersonInquiryManager;
import com.dcits.credit.util.PasswordOper;
import com.dcits.credit.util.ReportUtil;
import com.dcits.credit.util.sm3.SM3Digest;
import com.dcits.credit.wsimport.IServiceUtil;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.Logger;
import com.dcits.platform.util.PageData;


@Component
public class SchedulerTask extends BaseController {
    protected Logger logger = Logger.getLogger(this.getClass());
	@Resource(name="PersonInquiryService")
	public PersonInquiryManager personInquiryService;
	@Resource(name="indAppReService")
	private IndAppReManager indAppReService;
	 
	 public void updatePwd(){
		 logger.error("BIGIN START UPDATEPWD MUNAN");
		PageData pdtmp =new PageData();
			
		try {
			pdtmp.put("ISWHITE", "1");
			List<PageData> listPd = indAppReService.getCREDITNUM(pdtmp);
			for (PageData pd : listPd){
				pd.put("USERNAME", pd.get("CREDIT_CODE"));
				update(pd);
			}
		} catch (Exception e) {
			logger.error("get USERNAME  to pwd has error: "+ e.getMessage());
		}	
	 }
	 
	 public void update(PageData pd){
	
		String NEW_PASSWORD=randomPWD();
		pd.put("NEW_PASSWORD", NEW_PASSWORD);	
		logger.error("NEW_PASSWORD : "+ NEW_PASSWORD);
		try {
			pd.put("CURRENT_PASSWORD", PasswordOper.decode(pd.getString("CURRENT_PASSWORD")));
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
			System.out.println("***********修改密码请求报文***********");
			System.out.println(strBuf.toString());
			String reponseXml = com.dcits.credit.serviceaccept.IServiceUtil.queryReport_UpdatePwd(strBuf.toString());
			System.out.println("***********密码修改完成返回报文***********");
			System.out.println(reponseXml);
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
						System.out.println("***********"+pd.getString("USERNAME")+"密码修改完成***********");
						//System.out.println("***********"+pd.getString("USERNAME")+"密码修改完成***********");
						System.out.println("旧密码："+pd.getString("CURRENT_PASSWORD")+"   新密码："+pd.getString("NEW_PASSWORD"));
						//System.out.println("旧密码："+pd.getString("CURRENT_PASSWORD")+"   新密码："+pd.getString("NEW_PASSWORD"));
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
				resultPd.put("PREVIOUS_PASSWORD", pd.getString("PREVIOUS_PASSWORD"));//旧密码不变未解密
				resultPd.put("CURRENT_PASSWORD", PasswordOper.encode(pd.getString("CURRENT_PASSWORD")));//新密码为之前的密码
				indAppReService.updatePerbankInfo(resultPd);	
				System.out.println("*********"+resultPd.getString("RESULTDESC")+"**********");
				//System.out.println("*********"+resultPd.getString("RESULTDESC")+"**********");
			}
		
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		
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
