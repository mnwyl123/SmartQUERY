package com.dcits.credit.controller.rest.test;

import com.dcits.platform.util.Logger;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.SQLException;

public class Test {
	private static Logger logger = Logger.getLogger(Test.class);
	public static void main(String[] args) throws SQLException, MalformedURLException {

		 //1.获取企业待核查异议事项
        URL url1 = new URL("http://localhost:8281/SmartSense/rest/ObjectionComInterface/queryReportObjPendAud");
		String  param1 = "{\"USERNAME\":\"709001\",\"DATAPROVIDERORGCODE\":\"HBF00000000011\","
				+ "\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"001\",\"BEGINDATE\":\"2016-01-01\","
				+ "\"ENDDATE\":\"2016-01-01\",\"REPORT_TYPE\":\"1\"}";
		 //2.获取企业待核查异议事项附件信息
        URL url2 = new URL("http://localhost:8281/SmartSense/rest/ObjectionComInterface/queryReportObjPendAudInfo");
        String  param2 = "{\"USERNAME\":\"709001\",\"DATAPROVIDERORGCODE\":\"HBF00000000011\","
        		+ "\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"001\","
        		+ "\"OBJCHECKID\":\"01234567890123456789\",\"REPORT_TYPE\":\"2\"}";
		 //3.反馈企业异议事项核查结果
        URL url3 = new URL("http://localhost:8281/SmartSense/rest/ObjectionComInterface/queryReportObjCheckResult");
        String  param3 = "{\"USERNAME\":\"709001\",\"DATAPROVIDERORGCODE\":\"HBF00000000011\","
        		+ "\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"001\","
        		+ "\"PHONENUM\":\"18298762345\",\"OBJCHECKID\":\"1003002300420040203\","
        		+ "\"OBJCHECKNUM\":\"100022\",\"CHECKRESULT\":\"1\",\"CHECKRESULTDESC\":\"已确认数据遗漏\",\"REPORT_TYPE\":\"3\"}";
        //4.反馈企业异议事项更正结果
        URL url4 = new URL("http://localhost:8281/SmartSense/rest/ObjectionComInterface/queryReportObjCorrResult");
        String  param4 = "{\"USERNAME\":\"709001\",\"DATAPROVIDERORGCODE\":\"HBF00000000011\","
        		+ "\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
        		+ "\"OBJCORRECTID\":\"01234567890123456789\",\"CORRECTRESULT\":\"1\","
        		+ "\"ENCLOSUREINF\":\"skkdaksllsalddkfkskdfks\",\"CORRECTDESC\":\"已确认数据遗漏\",\"REPORT_TYPE\":\"4\"}";
        //5.查询企业异议事项更正结果接受情况
        URL url5 = new URL("http://localhost:8281/SmartSense/rest/ObjectionComInterface/queryReportObjCorrResultRec");
        String  param5 = "{\"USERNAME\":\"709001\",\"DATAPROVIDERORGCODE\":\"HBF00000000011\","
        		+ "\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
        		+ "\"OBJCHECKID\":\"192838293402020\",\"REPORT_TYPE\":\"5\"}";
        //6.添加企业标注
        URL url6 = new URL("http://localhost:8281/SmartSense/rest/ObjectionComInterface/queryReportObjAddAnnotation");
        String  param6 = "{\"USERNAME\":\"709001\",\"DATAPROVIDERORGCODE\":\"HBF00000000011\","
        		+ "\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
        		+ "\"ENTNAME\":\"广东前海贸易有限公司\",\"ENTIDTYPE\":\"01\",\"ENTIDNUM\":\"HBS0021919203123\","
        		+ "\"BUSINESSCODE\":\"ABH0000000001000069287823\",\"LOCATEINFNM\":\"4\","
        		+ "\"LOCATEINFTYPE\":\"1,4,5,12\",\"DATAOCCURORGCODE\":\"ABH00000000010\",\"OBJDESC\":\"信贷信息\",\"REPORT_TYPE\":\"6\"}";
        //7.删除企业标注
        URL url7 = new URL("http://localhost:8281/SmartSense/rest/ObjectionComInterface/queryReportObjDeleAnnotation");
        String  param7 = "{\"USERNAME\":\"test\",\"DATAPROVIDERORGCODE\":\"HBF00000000011\","
        		+ "\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
        		+ "\"SERVICERETURNCODE\":\"0123456789\",\"REPORT_TYPE\":\"7\"}";                     
        //8.企业单笔请求接口
		URL url8 = new URL("http://10.202.18.30:9001/SmartSense/rest/companyInterface/queryRequest");
        String  param8 = "{\"USERNAME\":\"cxy\",\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
        		+ "\"CLIENT_NAME\":\"样本报告有限公司\",\"CREDENTIALS_NO_TYPE\":\"30\",\"CHINA_CREDIT_CODE\":\"68690571-9\","
        		+ "\"QUERY_REASON\":\"10\",\"CHANNEL_ID\":\"003\",\"IS_CHECK_IMAGE\":\"0\",\"CUST_MANAGER\":\"个人测试申请\",\"IS_USE\":\"0\","
        		+ "\"CHANNEL_QUERY_NO\":\"33333333333333333333333333333333333\",\"QUERYORGCODE\":\"HBF00000100001\",\"ServiceCode\":\"YHBGRXYBG_02\",\"WARRANT_MATURITY_DATE\":\"99991230\","
        		+ "\"INTERNAL\":\"6adbe8ab411c483ba7c49f7a54eeee1bfe640d10136e49ac88dc9cfc28e6c213\"}";       		
        //9.企业单笔查询接口
		URL url9 = new URL("http://10.202.18.30:9001/SmartSense/rest/companyInterface/queryReport");
		String  param9 = "{\"USERNAME\":\"cxy\",\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
	        		+ "\"CLIENT_NAME\":\"北京报告样本\",\"CREDENTIALS_TYPE\":\"30\",\"CREDENTIALS_NO\":\"68690571-9\","
	        		+ "\"QUERY_REASON\":\"10\",\"QUERY_VERSION\":\"02\",\"CHANNEL_ID\":\"003\",\"IS_CHECK_IMAGE\":\"0\",\"CUST_MANAGER\":\"个人测试申请\",\"IS_USE\":\"0\","
	        		+ "\"CHANNEL_QUERY_NO\":\"333333333333333333333333333333333333333333\",\"ServiceCode\":\"YHBGRXYBG_02\",\"WARRANT_MATURITY_DATE\":\"99991230\",\"INTERNAL\":\"6adbe8ab411c483ba7c49f7a54eeee1bfe640d10136e49ac88dc9cfc28e6c213\"}";
        //10.个人单笔请求接口
		URL url10 = new URL("http://10.202.18.30:9001/SmartSense/rest/personInterface/queryRequest");		
 		String  param10 =  "{\"USERNAME\":\"cxy\",\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
         		+ "\"CLIENT_NAME\":\"琪琪\",\"CREDENTIALS_TYPE\":\"10\",\"CREDENTIALS_NO\":\"11010819931010444X\","
         		+ "\"QUERY_REASON\":\"02\",\"CHANNEL_ID\":\"003\",\"IS_CHECK_IMAGE\":\"0\",\"CUST_MANAGER\":\"3333\",\"IS_USE\":\"0\","
         		+ "\"CHANNEL_QUERY_NO\":\"8888\",\"ServiceCode\":\"yhbgrxybg_02\",\"WARRANT_MATURITY_DATE\":\"99991230\","
         		+ "\"INTERNAL\":\"6adbe8ab411c483ba7c49f7a54eeee1bfe640d10136e49ac88dc9cfc28e6c213\"}";   
		//11.个人单笔查询接口
 		URL url11 = new URL("http://10.202.18.30:9001/SmartSense/rest/personInterface/queryReport");		
		String  param11 =  "{\"USERNAME\":\"cxy\",\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
        		+ "\"CLIENT_NAME\":\"张某某\",\"CREDENTIALS_TYPE\":\"10\",\"CREDENTIALS_NO\":\"11010819931010444X\","
        		+ "\"QUERY_REASON\":\"02\",\"CHANNEL_ID\":\"003\",\"IS_CHECK_IMAGE\":\"0\",\"CUST_MANAGER\":\"3333\",\"IS_USE\":\"0\","
        		+ "\"CHANNEL_QUERY_NO\":\"888888888\",\"ServiceCode\":\"yhbgrxybg_02\",\"WARRANT_MATURITY_DATE\":\"99991230\","
        		+ "\"INTERNAL\":\"6adbe8ab411c483ba7c49f7a54eeee1bfe640d10136e49ac88dc9cfc28e6c213\"}";  
	    //30.个人信贷请求
        URL url30 = new URL("http://10.202.18.30:9001/SmartSense/rest/personLoanInterface/queryRequest");
        String  param30 = "{\"USERNAME\":\"web_cxy\",\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
         		+ "\"CLIENT_NAME\":\"张无忌\",\"CREDENTIALS_TYPE\":\"10\",\"CREDENTIALS_NO\":\"11010819931010444X\",\"WARRANT_MATURITY_DATE\":\"99991230\","
         		+ "\"QUERY_REASON\":\"01\",\"QUERY_TYPE\":\"02\",\"CUST_MANAGER\":\"个人测试申请\",\"CHANNEL_ID\":\"003\",\"IS_CHECK_IMAGE\":\"0\",\"IS_USE\":\"1\","
         		+ "\"CHANNEL_QUERY_NO\":\"205\",\"QUERY_VERSION\":\"02\",\"CHECK_SYS_NAME\":\"cxy\",\"INTERNAL\":\"6adbe8ab411c483ba7c49f7a54eeee1bfe640d10136e49ac88dc9cfc28e6c213\"}";
        //31.个人信贷查询
        URL url31 = new URL("http://21.129.81.51:22456/SmartSense/rest/personLoanInterface/queryReport");
        String  param31 = "{\"USERNAME\":\"web_cxy\","
         		+ "\"CHANNEL_ID\":\"003\","
         		+ "\"CHANNEL_QUERY_NO\":\"205\"}";
        
        //33.企业信贷请求
        URL url33 = new URL("http://10.202.18.30:9001/SmartSense/rest/companyLoanInterface/queryComRequest");
        String  param33 = "{\"USERNAME\":\"cxy\",\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
         		+ "\"CLIENT_NAME\":\"北京报告样本公司\",\"CREDENTIALS_NO_TYPE\":\"30\",\"CHINA_CREDIT_CODE\":\"68690571-9\",\"WARRANT_MATURITY_DATE\":\"99991230\","
         		+ "\"QUERY_REASON\":\"10\",\"QUERY_TYPE\":\"02\",\"CUST_MANAGER\":\"个人测试申请\",\"CHANNEL_ID\":\"003\",\"IS_CHECK_IMAGE\":\"0\",\"IS_USE\":\"1\","
         		+ "\"CHANNEL_QUERY_NO\":\"400\",\"QUERY_VERSION\":\"02\",\"CHECK_SYS_NAME\":\"cxy\",\"INTERNAL\":\"6adbe8ab411c483ba7c49f7a54eeee1bfe640d10136e49ac88dc9cfc28e6c213\"}";
        //34.企业信贷查询
        URL url34 = new URL("http://10.202.18.30:9001/SmartSense/rest/companyLoanInterface/queryComReport");
        String  param34 = "{\"USERNAME\":\"cxy\","
         		+ "\"CHANNEL_ID\":\"003\","
         		+ "\"CHANNEL_QUERY_NO\":\"400\"}";
        //35.个人/企业原始报告查询 
        URL url35 = new URL("http://10.202.18.30:9001/SmartSense/rest/personLoanInterface/queryOriginalReport");
        String  param35 = "{\"USERNAME\":\"web_cxy\","
         		+ "\"CHANNEL_ID\":\"003\","
         		+ "\"ID\":\"57bc819fbca643478d3528c90bde65f6092e93c805d1434aa44bfaf3b6c33404\","
         		+ "\"CHANNEL_QUERY_NO\":\"400\"}";
        String  param36 = "{\"USERNAME\":\"web_cxy\","
         		+ "\"CHANNEL_ID\":\"003\","
         		+ "\"ID\":\"600b0689976a4706a139c562d1b804bd777022b5efc9424fb3a2d9a7029643bd\","
         		+ "\"CHANNEL_QUERY_NO\":\"205\"}";
        //12.个人批量请求接口
        URL url12 = new URL("http://localhost:8281/SmartSense/rest/personInterface/queryRequest_batch");
        String  param12 = "[{\"USERNAME\":\"test\",\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
        		+ "\"CLIENT_NAME\":\"张三\",\"CREDENTIALS_TYPE\":\"1\",\"CREDENTIALS_NO\":\"916100007197308111\","
        		+ "\"QUERY_REASON\":\"01\",\"QUERY_VERSION\":\"02\",\"CHANNEL_ID\":\"003\",\"IS_CHECK_IMAGE\":\"1\",\"CUST_MANAGER\":\"个人测试申请\",\"IS_USE\":\"0\","
        		+ "\"CHANNEL_QUERY_NO\":\"23\",\"ServiceCode\":\"yhbgrxybg_02\",\"WARRANT_MATURITY_DATE\":\"99991230\",\"INTERNAL\":\"6adbe8ab411c483ba7c49f7a54eeee1bfe640d10136e49ac88dc9cfc28e6c213\"},"
        		+ "{\"USERNAME\":\"test\",\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
        		+ "\"CLIENT_NAME\":\"张三1\",\"CREDENTIALS_TYPE\":\"1\",\"CREDENTIALS_NO\":\"916100007197308111\","
        		+ "\"QUERY_REASON\":\"01\",\"QUERY_VERSION\":\"02\",\"CHANNEL_ID\":\"003\",\"IS_CHECK_IMAGE\":\"1\",\"CUST_MANAGER\":\"个人测试申请\",\"IS_USE\":\"0\","
        		+ "\"CHANNEL_QUERY_NO\":\"23\",\"ServiceCode\":\"yhbgrxybg_02\",\"WARRANT_MATURITY_DATE\":\"99991230\",\"INTERNAL\":\"6adbe8ab411c483ba7c49f7a54eeee1bfe640d10136e49ac88dc9cfc28e6c213\"}]"; 
         //13.个人批量查询接口
         URL url13 = new URL("http://localhost:8281/SmartSense/rest/personInterface/queryReport_batch");
         String  param13 = "[{\"USERNAME\":\"104166\",\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
         		+ "\"CLIENT_NAME\":\"WGX\",\"CREDENTIALS_TYPE\":\"0\",\"CREDENTIALS_NO\":\"610113199011112222\","
         		+ "\"QUERY_REASON\":\"02\",\"CHANNEL_ID\":\"003\",\"IS_CHECK_IMAGE\":\"0\",\"CUST_MANAGER\":\"3333\",\"IS_USE\":\"0\","
         		+ "\"CHANNEL_QUERY_NO\":\"23\",\"ServiceCode\":\"yhbgrxybg_02\",\"WARRANT_MATURITY_DATE\":\"99991230\",\"INTERNAL\":\"6adbe8ab411c483ba7c49f7a54eeee1bfe640d10136e49ac88dc9cfc28e6c213\"},"
         		+ "{\"USERNAME\":\"104166\",\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
         		+ "\"CLIENT_NAME\":\"WGX\",\"CREDENTIALS_TYPE\":\"0\",\"CREDENTIALS_NO\":\"610113199011112222\","
         		+ "\"QUERY_REASON\":\"02\",\"CHANNEL_ID\":\"003\",\"IS_CHECK_IMAGE\":\"0\",\"CUST_MANAGER\":\"3333\",\"IS_USE\":\"0\","
         		+ "\"CHANNEL_QUERY_NO\":\"23\",\"ServiceCode\":\"yhbgrxybg_02\",\"WARRANT_MATURITY_DATE\":\"99991230\",\"INTERNAL\":\"6adbe8ab411c483ba7c49f7a54eeee1bfe640d10136e49ac88dc9cfc28e6c213\"}]"; 
        //14.企业批量请求接口
         URL url14 = new URL("http://localhost:8281/SmartSense/rest/companyInterface/queryRequest_batch");
         String  param14 = "[{\"USERNAME\":\"test\",\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
        		+ "\"CLIENT_NAME\":\"张三\",\"CREDENTIALS_NO_TYPE\":\"1\",\"CHINA_CREDIT_CODE\":\"HBF00000000001\","
        		+ "\"QUERY_REASON\":\"01\",\"CHANNEL_ID\":\"003\",\"IS_CHECK_IMAGE\":\"0\",\"CUST_MANAGER\":\"个人测试申请\",\"IS_USE\":\"0\","
        		+ "\"CHANNEL_QUERY_NO\":\"23\",\"QUERYORGCODE\":\"HBF00000100001\",\"ServiceCode\":\"YHBGRXYBG_02\",\"WARRANT_MATURITY_DATE\":\"99991230\",\"INTERNAL\":\"6adbe8ab411c483ba7c49f7a54eeee1bfe640d10136e49ac88dc9cfc28e6c213\"},"
        		+ "{\"USERNAME\":\"test\",\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
        		+ "\"CLIENT_NAME\":\"张三1\",\"CREDENTIALS_NO_TYPE\":\"1\",\"CHINA_CREDIT_CODE\":\"HBF00000000001\","
        		+ "\"QUERY_REASON\":\"01\",\"CHANNEL_ID\":\"003\",\"IS_CHECK_IMAGE\":\"0\",\"CUST_MANAGER\":\"个人测试申请\",\"IS_USE\":\"0\","
        		+ "\"CHANNEL_QUERY_NO\":\"23\",\"QUERYORGCODE\":\"HBF00000100001\",\"ServiceCode\":\"YHBGRXYBG_02\",\"WARRANT_MATURITY_DATE\":\"99991230\",\"INTERNAL\":\"6adbe8ab411c483ba7c49f7a54eeee1bfe640d10136e49ac88dc9cfc28e6c213\"}]"; 
        //15.企业批量查询接口
         URL url15 = new URL("http://localhost:8281/SmartSense/rest/companyInterface/queryReport_batch");
         String  param15 = "[{\"USERNAME\":\"104166\",\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
        		+ "\"CLIENT_NAME\":\"3ii3i3\",\"CREDENTIALS_NO_TYPE\":\"1\",\"CHINA_CREDIT_CODE\":\"6101131990111122\","
        		+ "\"QUERY_REASON\":\"01\",\"CHANNEL_ID\":\"004\",\"IS_CHECK_IMAGE\":\"0\",\"CUST_MANAGER\":\"个人测试申请\",\"IS_USE\":\"0\","
        		+ "\"CHANNEL_QUERY_NO\":\"23\",\"QUERYORGCODE\":\"HBF00000100001\",\"ServiceCode\":\"YHBGRXYBG_02\",\"WARRANT_MATURITY_DATE\":\"99991230\",\"INTERNAL\":\"6adbe8ab411c483ba7c49f7a54eeee1bfe640d10136e49ac88dc9cfc28e6c213\"},"
        		+ "{\"USERNAME\":\"104166\",\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
        		+ "\"CLIENT_NAME\":\"3ii3i3\",\"CREDENTIALS_NO_TYPE\":\"1\",\"CHINA_CREDIT_CODE\":\"6101131990111122\","
        		+ "\"QUERY_REASON\":\"01\",\"CHANNEL_ID\":\"004\",\"IS_CHECK_IMAGE\":\"0\",\"CUST_MANAGER\":\"个人测试申请\",\"IS_USE\":\"0\","
        		+ "\"CHANNEL_QUERY_NO\":\"23\",\"QUERYORGCODE\":\"HBF00000100001\",\"ServiceCode\":\"YHBGRXYBG_02\",\"WARRANT_MATURITY_DATE\":\"99991230\",\"INTERNAL\":\"6adbe8ab411c483ba7c49f7a54eeee1bfe640d10136e49ac88dc9cfc28e6c213\"}]"; 
        //16.个人信贷批量请求
         URL url16 = new URL("http://localhost:8281/SmartSense/rest/personLoanInterface/queryRequest_batch");
         String  param16 = "[{\"USERNAME\":\"test\",\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
         		+ "\"CLIENT_NAME\":\"张三\",\"CREDENTIALS_TYPE\":\"1\",\"CREDENTIALS_NO\":\"HBF00000000001\",\"WARRANT_MATURITY_DATE\":\"99991230\","
         		+ "\"QUERY_REASON\":\"01\",\"QUERY_TYPE\":\"02\",\"CUST_MANAGER\":\"个人测试申请\",\"CHANNEL_ID\":\"003\",\"IS_CHECK_IMAGE\":\"0\",\"IS_USE\":\"1\","
         		+ "\"CHANNEL_QUERY_NO\":\"3\",\"CHECK_SYS_NAME\":\"test\",\"INTERNAL\":\"6adbe8ab411c483ba7c49f7a54eeee1bfe640d10136e49ac88dc9cfc28e6c213\"},"
         		+ "{\"USERNAME\":\"test\",\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
         		+ "\"CLIENT_NAME\":\"张三\",\"CREDENTIALS_TYPE\":\"1\",\"CREDENTIALS_NO\":\"HBF00000000001\",\"WARRANT_MATURITY_DATE\":\"99991230\","
         		+ "\"QUERY_REASON\":\"01\",\"QUERY_TYPE\":\"02\",\"CUST_MANAGER\":\"个人测试申请\",\"CHANNEL_ID\":\"003\",\"IS_CHECK_IMAGE\":\"0\",\"IS_USE\":\"1\","
         		+ "\"CHANNEL_QUERY_NO\":\"2\",\"CHECK_SYS_NAME\":\"test\",\"INTERNAL\":\"6adbe8ab411c483ba7c49f7a54eeee1bfe640d10136e49ac88dc9cfc28e6c213\"}]";  
        //17.个人信贷批量查询
         URL url17 = new URL("http://localhost:8281/SmartSense/rest/personInterface/queryReport_batch");
         String  param17 = "[{\"USERNAME\":\"104166\",\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
         		+ "\"CLIENT_NAME\":\"WGX\",\"CREDENTIALS_TYPE\":\"0\",\"CREDENTIALS_NO\":\"610113199011112222\","
         		+ "\"QUERY_REASON\":\"02\",\"CHANNEL_ID\":\"003\",\"IS_CHECK_IMAGE\":\"0\",\"CUST_MANAGER\":\"3333\",\"IS_USE\":\"0\","
         		+ "\"CHANNEL_QUERY_NO\":\"23\",\"ServiceCode\":\"yhbgrxybg_02\",\"WARRANT_MATURITY_DATE\":\"99991230\",\"INTERNAL\":\"6adbe8ab411c483ba7c49f7a54eeee1bfe640d10136e49ac88dc9cfc28e6c213\"},"
         		+ "{\"USERNAME\":\"104166\",\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
         		+ "\"CLIENT_NAME\":\"WGX\",\"CREDENTIALS_TYPE\":\"0\",\"CREDENTIALS_NO\":\"610113199011112222\","
         		+ "\"QUERY_REASON\":\"02\",\"CHANNEL_ID\":\"003\",\"IS_CHECK_IMAGE\":\"0\",\"CUST_MANAGER\":\"3333\",\"IS_USE\":\"0\","
         		+ "\"CHANNEL_QUERY_NO\":\"23\",\"ServiceCode\":\"yhbgrxybg_02\",\"WARRANT_MATURITY_DATE\":\"99991230\",\"INTERNAL\":\"6adbe8ab411c483ba7c49f7a54eeee1bfe640d10136e49ac88dc9cfc28e6c213\"}]"; 
        //18.企业信贷批量请求
         URL url18 = new URL("http://localhost:8281/SmartSense/rest/companyLoanInterface/queryComRequest_batch");
         String  param18 = "[{\"USERNAME\":\"test\",\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
        		+ "\"CLIENT_NAME\":\"张三\",\"CREDENTIALS_NO_TYPE\":\"1\",\"CHINA_CREDIT_CODE\":\"HBF00000000001\","
        		+ "\"QUERY_REASON\":\"01\",\"QUERY_TYPE\":\"02\",\"QUERY_VERSION\":\"02\",\"CHANNEL_ID\":\"003\",\"IS_CHECK_IMAGE\":\"0\",\"CUST_MANAGER\":\"个人测试申请\",\"IS_USE\":\"0\","
        		+ "\"CHANNEL_QUERY_NO\":\"23\",\"CHECK_SYS_NAME\":\"test\",\"QUERYORGCODE\":\"HBF00000100001\",\"ServiceCode\":\"YHBGRXYBG_02\",\"WARRANT_MATURITY_DATE\":\"99991230\",\"INTERNAL\":\"6adbe8ab411c483ba7c49f7a54eeee1bfe640d10136e49ac88dc9cfc28e6c213\"},"
        		+ "{\"USERNAME\":\"test\",\"ORIGINATEORGCODE\":\"HBF00000000011\",\"ORIGINATEUSERCODE\":\"002\","
        		+ "\"CLIENT_NAME\":\"张三1\",\"CREDENTIALS_NO_TYPE\":\"1\",\"CHINA_CREDIT_CODE\":\"HBF00000000001\","
        		+ "\"QUERY_REASON\":\"01\",\"QUERY_TYPE\":\"02\",\"QUERY_VERSION\":\"02\",\"CHANNEL_ID\":\"003\",\"IS_CHECK_IMAGE\":\"0\",\"CUST_MANAGER\":\"个人测试申请\",\"IS_USE\":\"0\","
        		+ "\"CHANNEL_QUERY_NO\":\"23\",\"CHECK_SYS_NAME\":\"test\",\"QUERYORGCODE\":\"HBF00000100001\",\"ServiceCode\":\"YHBGRXYBG_02\",\"WARRANT_MATURITY_DATE\":\"99991230\",\"INTERNAL\":\"6adbe8ab411c483ba7c49f7a54eeee1bfe640d10136e49ac88dc9cfc28e6c213\"}]";           
         //19.中征码查询
 		URL url19 = new URL("http://10.202.18.30:9001/SmartSense/rest/queryLoanCardNoInterface/queryRequest");
         String  param19 = "{\"USERNAME\":\"web_cxy\",\"CREDITCODE\":\"\",\"LOANCARDNO\":\"\","
         		+ "\"SDEPORGCODE\":\"18507965-8\",\"REGISTERTYPE\":\"\",\"REGISTERCODE\":\"\"}";
         //密码修改
         URL url20 = new URL("http://21.129.81.51:22456/SmartSense/rest/updatePWDInterface/updatePwd");
         String  param20 = "{\"USERNAME\":\"YLB_jkcx\"}"; 
//         String[] param = {param19};
////          URL[] Url = {url1,url2,url3,url4,url5,url6,url7};
//          URL[] Url = {url19};
//          for(int i=0;i<param.length;i++){
//        	   WbSave(param[i],Url[i]); 
//          }
        WbSave(param31,url31);
	   }  
	/**
    * 征信查询申请资料上传
    * @param str
    */
	@SuppressWarnings("unused")
	public static void WbSave(String str,URL StrUrl ) {
		URL url;
		try {
			byte[] b = str.getBytes("utf-8");
			url = StrUrl;		
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");// 提交模式
			// 是否允许输入输出
			conn.setDoInput(true);
			conn.setDoOutput(true);
			conn.setConnectTimeout(60000);// 连接超时 单位毫秒
			conn.setReadTimeout(60000);// 读取超时 单位毫秒
			// 设置请求头里面的数据，以下设置用于解决http请求code415的问题
			conn.setRequestProperty("Content-Type",
					"application/json;charset=UTF-8");
			// 链接地址
			conn.connect();
			// 发送参数
			OutputStream writer = conn.getOutputStream();
			writer.write(b);

			// 清理当前编辑器的左右缓冲区，并使缓冲区数据写入基础流
			writer.flush();
			writer.close();
			if (conn.getResponseCode() != 200) {
				throw new RuntimeException("Failed : HTTP error code : "
						+ conn.getResponseCode());
			}
			BufferedReader reader = new BufferedReader(new InputStreamReader(
					conn.getInputStream(), "utf-8"));
			String lines = reader.readLine();// 读取请求结果
			logger.debug(lines);
			// JSONObject js=JSONObject.fromObject(lines);
			reader.close();
			conn.disconnect();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			logger.error(e.getMessage(),e);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			logger.error(e.getMessage(),e);
		} catch (Exception e){
			logger.debug("4444444444444444444444444444444444444444444444");
			logger.error(e.getMessage(),e);
		}
		
	}
	/**
	    * 征信查询申请资料上传
	    * @param str
	    */
		@SuppressWarnings("unused")
		private static void queryReport(String str) {
			URL url;
			try {
				byte[] b = str.getBytes("utf-8");
				//url = new URL("http://localhost:7001/SmartSense/rest/WbqqCreditQuery/save");
				url = new URL("http://localhost:8281/SmartSense/rest/AsynchronousService/queryReport");
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("POST");// 提交模式
				// 是否允许输入输出
				conn.setDoInput(true);
				conn.setDoOutput(true);
				conn.setConnectTimeout(60000);// 连接超时 单位毫秒
				conn.setReadTimeout(60000);// 读取超时 单位毫秒
				// 设置请求头里面的数据，以下设置用于解决http请求code415的问题
				conn.setRequestProperty("Content-Type",
						"application/json;charset=UTF-8");
				// 链接地址
				conn.connect();
				// 发送参数
				OutputStream writer = conn.getOutputStream();
				writer.write(b);

				// 清理当前编辑器的左右缓冲区，并使缓冲区数据写入基础流
				writer.flush();
				writer.close();
				if (conn.getResponseCode() != 200) {
					throw new RuntimeException("Failed : HTTP error code : "
							+ conn.getResponseCode());
				}
				BufferedReader reader = new BufferedReader(new InputStreamReader(
						conn.getInputStream(), "utf-8"));
				String lines = reader.readLine();// 读取请求结果
				logger.debug(lines);
				// JSONObject js=JSONObject.fromObject(lines);
				reader.close();
				conn.disconnect();

			} catch (MalformedURLException e) {
				// TODO Auto-generated catch block
				logger.error(e.getMessage(),e);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				logger.error(e.getMessage(),e);
			}
			
		}	
}
