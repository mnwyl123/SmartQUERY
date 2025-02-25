package com.dcits.credit.util.crawler.personCredit;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import org.apache.log4j.Logger;
import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.interactions.Action;
import org.openqa.selenium.interactions.Actions;

import com.dcits.credit.entity.ExecuteSQL;
import com.dcits.credit.util.PasswordOper;
import com.dcits.credit.util.crawler.WaitTime;
import com.dcits.credit.util.crawler.WebDriverInfo;


public class RHPerPwdUpdate {

	private static Logger logger = Logger.getLogger(RHPerPwdUpdate.class);
	//main方法
	public static void main(String[] args){
		//new RHPerPwdUpdate().updatePWD();
//        String decode = PasswordOper.decode("eDEyMzQ1Njc4OQ==");
//        System.out.println(decode);
        String xxx = PasswordOper.encode("ftpuser");
       logger.debug(xxx);
		//new RHPerPwdUpdate().finTesk();
	}
	public void finTesk(){
		final ScheduledExecutorService service = Executors  
                .newSingleThreadScheduledExecutor(); 
		ExecuteSQL execute = new ExecuteSQL();
		String sql ="update SYS_INFO SET SYS_STATUS='0' WHERE SYS_NO='1'";
		execute.executeSQL(sql);
		Runnable runnable = new Runnable() { 
			ExecuteSQL execute = new ExecuteSQL();
            public void run() {
            	logger.debug("定时任务执行"+new SimpleDateFormat("yyyyMMdd").format(new Date()));
            	String sql ="select STATUS from CIFM_FLOW_STATUS";
            	ResultSet result = execute.getSQLResult(sql);
	            try {
	            	List<String> list=new ArrayList<String>();
	            	while(result.next()){
	            		list.add(result.getString("STATUS"));
	            	}
	            	if(!(list.contains("02"))){
						service.shutdown();
						logger.debug("定时任务关闭");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					logger.error(e.getMessage(),e);
				}
            	
            }  
        };    
        // 第二个参数为首次执行的延时时间，第三个参数为定时执行的间隔时间  
       service.scheduleAtFixedRate(runnable, 1, 2, TimeUnit.SECONDS);
	}
	//登录系统及中间页面处理
		public void updatePWD(){
			new RHPerPwdUpdate().finTesk();
			logger.info("密码修改开始");
			ExecuteSQL execute = new ExecuteSQL();
			//查到所有到期密码的人行用户
			String sql = "select CREDIT_CODE USERNAME,CURRENT_PASSWORD,"
						+"(select ORG_ID_PERBANK from sys_org where org_id = "
						+"(select org_id from sys_user_org where user_id="
						+"(select user_id from sys_user where USERNAME_PERBANK = a.credit_code and rownum=1)"
						+") and rownum=1) ORGCODE"
						+" from CIFM_CREDIT_ACCT_MANAGE a"
						+" where PWD_EXPIRES_DATE=to_char(sysdate,'yyyymmdd')";
			ResultSet result = execute.getSQLResult(sql);
			try {
				while(result.next()){
					String url = "http://9.88.47.3/credituniontest/login.jsp";
					//加载浏览器驱动
					WebDriver dr = WebDriverInfo.getWebDriver();
					dr.get(url);
					String username = result.getString("USERNAME");
					String current_password = result.getString("CURRENT_PASSWORD");
					//对密码解密
					current_password = PasswordOper.decode(current_password);
					//按照一定规则获取8-20位的随机密码
					String new_password = randomPWD();
					//String new_password="x123456789";
					logger.info("旧密码是："+current_password);
					logger.info("新密码是："+new_password);
					//将新密码落库
					sql = "update CIFM_CREDIT_ACCT_MANAGE set PREVIOUS_PASSWORD = '"+PasswordOper.encode(current_password)+"'"
						  +",CURRENT_PASSWORD = '"+PasswordOper.encode(new_password)+"'"
						  +",CURRENT_TIME = to_char(sysdate,'yyyymmdd')"
						  +",PWD_EXPIRES_DATE = to_char(sysdate+58,'yyyymmdd')"
						  +" where CREDIT_CODE = '"+username+"'";
					execute.executeSQL(sql);
					logger.debug("==================================");
					logger.debug(new_password);
					logger.debug(PasswordOper.encode(new_password));
					logger.debug("==================================");
					WaitTime.waitForLoad(dr);
					//等待页面加载完成
					WaitTime.waitLoadTime(dr,1);
					//登录系统
					//dr.findElement(By.name("orgCode")).sendKeys(result.getString("ORGCODE"));
					dr.findElement(By.name("userid")).sendKeys(username);
					dr.findElement(By.name("password")).sendKeys(current_password);
					Actions builder = new Actions(dr);
					Action mouseOverLogin = builder.moveToElement(dr.findElement(By.name("B1"))).click().build();
					mouseOverLogin.perform();
					//判断是否跳转成功
					WaitTime.waitLoadTime(dr,1);
					
					//加载修改密码的界面
					url = "http://9.88.47.3/credituniontest/changepasswordauth.jsp";
					dr.get(url);
					WaitTime.waitForLoad(dr);
					//等待页面加载完成
					WaitTime.waitLoadTime(dr,2);
					
					//定位到修改密码的界面
					//dr.switchTo().frame(dr.findElement(By.name("user")));
					
					if(current_password != null){
						//旧密码
						dr.findElement(By.name("oldpassword")).sendKeys(current_password);
					}
					if(new_password != null){
						//新密码
						dr.findElement(By.name("newpassword")).sendKeys(new_password);
						//确认密码
						dr.findElement(By.name("newpasswordvalid")).sendKeys(new_password);
					}					
					//点击提交按钮
					builder = new Actions(dr);
					Action mouseOverQuery = builder.moveToElement(dr.findElement(By.name("B1"))).click().build();
					mouseOverQuery.perform();
					WaitTime.threadWait(10);
					//弹出确认框进行确认
					Alert alert = dr.switchTo().alert();
					alert.accept();
					WaitTime.waitForLoad(dr);
					//等待页面加载完成
					WaitTime.waitLoadTime(dr,3);
					//关闭浏览器
					dr.quit();
					logger.info("密码修改结束");
				}
			} catch (Exception e) {
				logger.info(e.getMessage(),e);
			}
			
		}
		
		//生成8-20位随机密码
		public static String randomPWD(){
			String password = "";
			//按规则生成新密码8~20个字符，至少包含‘0至9’、‘A至Z’、‘a至z’、‘-_@#’字符中,两种或两种以上的字符	
			int pwdLength = (int)(Math.random()*13+8); 
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
