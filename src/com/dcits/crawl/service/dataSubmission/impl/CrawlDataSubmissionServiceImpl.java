package com.dcits.crawl.service.dataSubmission.impl;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Date;
//import java.net.URL;
import java.util.List;

import javax.annotation.Resource;

import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Service;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.crawl.service.dataSubmission.IDataSubmissionService;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.DESUtil;

import com.dcits.platform.util.PageData;
import com.dcits.crawl.util.PathUtil;

/**
 * 数据报送
 * @author wang.wenming
 *
 */
@Service("crawlDataSubmissionService")
public class CrawlDataSubmissionServiceImpl implements IDataSubmissionService {

	@Resource(name="daoSupport")
	private DaoSupport dao;
	
	/**
	 * 个人征信数据列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> getCifmPersonList(Page page) throws Exception {
		return (List<PageData>)dao.findForList("ClawerDataSubmissionPerson.listPage",page);
	}
	/**
	 * 唯一标识查询个人征信数据
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData getCifmPersonObject(String id) throws Exception {
		return (PageData)dao.findForObject("ClawerDataSubmissionPerson.listObjectById",id);
	}
	/**
	 * 企业征信数据列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> getCifmCompanyList(Page page) throws Exception {
		return (List<PageData>)dao.findForList("ClawerDataSubmissionCompany.listPage",page);
	}
	/**
	 * 唯一标识查询企业征信数据
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData getCifmCompanyObject(String id) throws Exception {
//		return (PageData)dao.findForObject("ClawerDataSubmissionCompany.listObjectById",id);
		try {
			PageData page = (PageData) dao.findForObject("ClawerDataSubmissionCompany.listObjectById", id);
			String COMPANY_NAME = page.getString("COMPANY_NAME");
			String CHINA_CREDIT_CODE = page.getString("CHINA_CREDIT_CODE");
			COMPANY_NAME = DESUtil.decrypt("enhjeA==", COMPANY_NAME);
			CHINA_CREDIT_CODE = DESUtil.decrypt("enhjeA==", CHINA_CREDIT_CODE);
			page.put("COMPANY_NAME", COMPANY_NAME);
			page.put("CHINA_CREDIT_CODE", CHINA_CREDIT_CODE);
			return page;
		} catch (Exception e) {
			return null;
		}
	}
	/**
	 * 发送报文到指定接口的调用方法
	 * @param id
	 * @param dataType 上报数据类型：1:个人征信查询明细 2:企业征信查询明细
	 * @return
	 * @throws Exception 
	 */
	public String sendSubmissionData(String queryId,String dataType){
		String returnInfo = "";
		String xml = null;
		PageData pd = new PageData();
		PageData pd1 = new PageData();
		pd.put("QUERYID", queryId);		
		String fileName = "";
		String flag ="1";  //客户类型
		String orgId="";   //机构编码
		String tableName ="GRZXCXMX";
		String filePath = PathUtil.getClasspath() +Const.FILEPATHFILE;
		try {
			if("1".equals(dataType)){
				xml = getPersonByte(queryId);
				//pd1 = getCifmPersonObject(queryId);
				/*orgId=pd1.getString("ORG_ID_PERBANK");*/   //机构编码
				orgId="D10052410H0001";
			}
			else{
				xml = getCompanyByte(queryId);
				//pd1 = getCifmCompanyObject(queryId);
				flag ="2";
				//orgId=pd1.getString("ORG_ID_COMBANK");   //机构编码
				//orgId="79103141005";
				orgId="D10052410H0001";
				tableName ="QYZXCXMX";
			}
			//接口地址
			String url = BaseController.getPropertiesValue("IFAddress");
//			//接口字符集编码
//			String encoding = getPropertiesValue("IFEncoding");
//			//方法调用
//			HttpClient hc = new HttpClient();
//			//接口地址
//			PostMethod post = new PostMethod(url);
//			//超时设置
//			hc.getHttpConnectionManager().getParams().setConnectionTimeout(5000);
//			//格式转换
//			//post.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET, encoding);
//			//发送xml数据
//			post.setRequestEntity(new StringRequestEntity(xml, "text/xml", encoding));
//			//执行请求
//			hc.executeMethod(post);
//			//返回信息
//			returnInfo = new String(post.getResponseBody(),encoding);
			
			fileName = orgId+"_"+tableName+"_"+new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())+".txt";
			CloseableHttpClient httpClient = null;
	        CloseableHttpResponse response = null;
	      //创建文件
			File file = new File(filePath+fileName);
	        try {
				if(!file.exists()){
					file.createNewFile();
				}
				FileWriter writer = new FileWriter(file.getAbsoluteFile());
				writer.write(xml);
				writer.flush();
				writer.close();
	            //httpClient = getHttpClient();//https
	            httpClient = HttpClients.createDefault();  //http

	            String urlTarget = BaseController.getPropertiesValue("urlTarget");
	            int portTarget = Integer.parseInt(BaseController.getPropertiesValue("portTarget"));
	            String schemeTarget = BaseController.getPropertiesValue("schemeTarget");
	            HttpHost  target = new HttpHost(urlTarget,portTarget,schemeTarget);
	            // 把一个普通参数和文件上传给下面这个地址 是一个servlet
	            HttpPost httpPost = new HttpPost(url);
	            RequestConfig requestConfig = RequestConfig.custom()
	                    .setConnectionRequestTimeout(15000)
	                    .setConnectTimeout(15000)
	                    .setSocketTimeout(15000)
	                    .build();
	               httpPost.setConfig(requestConfig);
	            // 把文件转换成流对象FileBody
	            FileBody bin = new FileBody(new File(filePath+fileName));

	            StringBody bankCode = new StringBody(orgId, ContentType.create(
	                    "text/plain", Consts.ASCII));
	            StringBody type = new StringBody(flag, ContentType.create(
	                    "text/plain", Consts.ASCII));

	            HttpEntity reqEntity = MultipartEntityBuilder.create()
	                    // 相当于<input type="file" name="file"/>
	                    .addPart("file", bin)
	                    
	                    // 相当于<input type="text" name="userName" value=userName>
	                    .addPart("bankCode", bankCode)
	                    .addPart("dataType", type)
	                    .build();

	            httpPost.setEntity(reqEntity);

	            // 发起请求 并返回请求的响应
//	            response = httpClient.execute(httpPost);
	            response = httpClient.execute(target,httpPost);
	            
	            // 获取响应对象
	            HttpEntity resEntity = response.getEntity();
	            if (resEntity != null) {
	                returnInfo=EntityUtils.toString(resEntity, Charset.forName("UTF-8"));
	            }
	            
	            // 销毁
	            EntityUtils.consume(resEntity);
	            //删除本地文件
	            file.delete();
	        }catch (Exception e){
	            e.printStackTrace();
	            //删除本地文件
	            file.delete();
	        }finally {
	            try {
	                if(response != null){
	                    response.close();
	                }
	                if(httpClient != null){
	                    httpClient.close();
	                }
	            } catch (IOException e) {
	            	e.printStackTrace();
	            }
	        }
	        if(returnInfo.contains("success")){
	        	pd.put("SENDSTATUS", "1");
	        }else{
	        	pd.put("SENDSTATUS", "0");
	        }
		} catch (Exception e) {
			pd.put("SENDSTATUS", "0");	
			e.printStackTrace();
		} 
		try {
			updateStatus(pd);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return returnInfo;
	}
	/**
	 * 获取个人xml
	 * @param queryId
	 * @return
	 * @throws Exception 
	 */
	public String getPersonByte(String queryId) throws Exception{
		PageData pd = null;
		StringBuffer sb = null;
		//pd = getCifmPersonObject(queryId);
		sb = new StringBuffer();
		//返回内容
		//sb.append("D10027910H0001");
		/*sb.append(pd.getString("ORG_ID_PERBANK")+",");
		sb.append(pd.getString("BRANCH_CODE")+",");
		sb.append(pd.getString("BRANCH_NAME")+",");
		sb.append(pd.getString("USER_SYS_NAME")+",");
		sb.append(pd.getString("USER_REAL_NAME")+",");
		sb.append(pd.getString("QUERY_TIME")+",");
		sb.append(pd.getString("CLIENT_NAME")+",");
		sb.append(pd.getString("CREDENTIALS_TYPE")+",");
		sb.append(pd.getString("CREDENTIALS_NO")+",");
		sb.append(pd.getString("QUERY_REASON")+",");
		sb.append("01"+",");//01银行版
		sb.append(pd.getString("IS_GET")+",");
		sb.append(pd.getString("CHECK_TIME")+",");
		sb.append(pd.getString("IP"));*/
//		sb.append(getParentBranchCode(queryId,"1")+",");	//上级机构代码，征信中心分配给总行的机构代码,1代表个人
//		String topLevelOrgCode = getTopLevelOrgCode("TOP_LEVEL_ORG_CODE");
//		sb.append(topLevelOrgCode + ",");	//信合的顶级机构代码为总行代码唯一，由数据库参数表查出
//		sb.append(pd.getString("ORG_ID_PERBANK")+",");		//查询网点机构码
//		sb.append(pd.getString("ORG_NAME")+",");		//查询网点名称
//		sb.append(pd.getString("USER_SYS_NAME")+",");
//		sb.append(pd.getString("USER_REAL_NAME")+",");
//		sb.append(pd.getString("QUERY_TIME")+",");
//		sb.append(pd.getString("CLIENT_NAME")+",");
//		sb.append(pd.getString("CREDENTIALS_TYPE")+",");
//		sb.append(pd.getString("CREDENTIALS_NO")+",");
//		sb.append(pd.getString("QUERY_REASON")+",");
//		sb.append("01"+",");//01银行版
//		sb.append(pd.getString("IS_GET")+",");
//		sb.append(pd.getString("CHECK_TIME")+",");
//		sb.append(pd.getString("IP"));

		
		
		sb.append("D10052410H0001"+",");//上级机构代码，
		sb.append("D10052410H0001"+",");	//查询网点机构码
		sb.append(pd.getString("ORG_NAME")+",");		//查询网点名称
		sb.append(pd.getString("USER_SYS_NAME")+",");
		sb.append(pd.getString("USER_REAL_NAME")+",");
		sb.append(pd.getString("QUERY_TIME")+",");
		sb.append(pd.getString("CLIENT_NAME")+",");
		sb.append(pd.getString("CREDENTIALS_TYPE")+",");
		sb.append(pd.getString("CREDENTIALS_NO")+",");
		sb.append(pd.getString("QUERY_REASON")+",");
		sb.append("01"+",");//01银行版
		sb.append(pd.getString("IS_GET")+",");
		sb.append(pd.getString("CHECK_TIME")+",");
		sb.append(pd.getString("IP"));
//		sb.append("亿联银行"+",");
//		sb.append("cxy"+",");
//		sb.append("查询员"+",");
//		sb.append("2020-01-09 18:13:02"+",");
//		sb.append("王小二"+",");
//		sb.append("10"+",");
//		sb.append("622926198501293785"+",");
//		sb.append("01"+",");
//		sb.append("01"+",");//01银行版
//		sb.append("0"+",");
//		sb.append("2020-01-09 18:13:02"+",");
//		sb.append("172.25.101.107");
		/*//返回内容
		sb.append("<DataHead>个人征信报告</DataHead>"+"\r\n");
		sb.append("<DataBody>"+"\r\n");
		sb.append("  <upOrgCode>D10027910H0001</upOrgCode>"+"\r\n");
		sb.append("  <queryOrgNo>"+pd.getString("ORG_CODE")+"</queryOrgNo>"+"\r\n");
		sb.append("  <queryOrgName>"+pd.getString("BRANCH_NAME")+"</queryOrgName>"+"\r\n");
		sb.append("  <queryUserSysName>"+pd.getString("USER_SYS_NAME")+"</queryUserSysName>"+"\r\n");
		sb.append("  <queryUserName>"+pd.getString("USER_REAL_NAME")+"</queryUserName>"+"\r\n");
		sb.append("  <queryTime>"+pd.getString("QUERY_TIME")+"</queryTime>"+"\r\n");
		sb.append("  <queriedUserName>"+pd.getString("CLIENT_NAME")+"</queriedUserName>"+"\r\n");
		sb.append("  <certType>"+pd.getString("CREDENTIALS_TYPE")+"</certType>"+"\r\n");
		sb.append("  <certNo>"+pd.getString("CREDENTIALS_NO")+"</certNo>"+"\r\n");
		sb.append("  <queryReason>"+pd.getString("QUERY_REASON")+"</queryReason>"+"\r\n");
		sb.append("  <queryFormatName>"+pd.getString("QUERY_VERSION")+"</queryFormatName>"+"\r\n");
		sb.append("  <isQueried>"+pd.getString("IS_GET")+"</isQueried>"+"\r\n");
		sb.append("  <queryAuthTime>"+pd.getString("CHECK_TIME")+"</queryAuthTime>"+"\r\n");
		sb.append("  <queryComputerIP>"+pd.getString("IP")+"</queryComputerIP>"+"\r\n");
		sb.append("</DataBody>");*/
		
		System.out.println(sb.toString());
		return sb.toString();
	}
	/**
	 * 更新流程表状态
	 * @param queryId
	 * @throws Exception
	 */
	public void updateStatus(PageData pd) throws Exception{
		dao.update("ClawerDataSubmissionCompany.updateStatus", pd);
	}
	/**
	 * 获取企业xml
	 * @param queryId
	 * @return
	 * @throws Exception 
	 */
	public String getCompanyByte(String queryId) throws Exception{
		PageData pd = null;
		pd = getCifmCompanyObject(queryId);
		//返回内容
		StringBuffer sb = new StringBuffer();
		//sb.append("79103141005");
		sb.append("D10052410H0001"+",");//上级机构代码
		sb.append(pd.getString("ORG_ID_COMBANK")+",");
		sb.append(pd.getString("BRANCH_CODE")+",");
		sb.append(pd.getString("BRANCH_NAME")+",");
		sb.append(pd.getString("USER_SYS_NAME")+",");
		sb.append(pd.getString("USER_REAL_NAME")+",");
		sb.append(pd.getString("DEPARTMENT_NAME")+",");
		sb.append(pd.getString("QUERY_TIME")+",");
		sb.append(pd.getString("COMPANY_NAME")+",");
		sb.append(pd.getString("QUERY_REASON")+",");
		sb.append(pd.getString("CHINA_CREDIT_CODE")+",");
		sb.append(pd.getString("IS_GET")+",");
		sb.append(pd.getString("CHECK_TIME")+",");
		sb.append(pd.getString("IP"));
		/*//返回内容
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"GB2312\" standalone=\"no\"?>"+"\r\n");
		sb.append("<DataHead>企业征信报告</DataHead>"+"\r\n");
		sb.append("<DataBody>"+"\r\n");
		sb.append("  <upOrgCode>79103141005</upOrgCode>"+"\r\n");
		sb.append("  <queryOrgNo>"+pd.getString("ORG_CODE")+"</queryOrgNo>"+"\r\n");
		sb.append("  <queryOrgName>"+pd.getString("BRANCH_NAME")+"</queryOrgName>"+"\r\n");
		sb.append("  <queryUserSysName>"+pd.getString("USER_SYS_NAME")+"</queryUserSysName>"+"\r\n");
		sb.append("  <queryUserName>"+pd.getString("USER_REAL_NAME")+"</queryUserName>"+"\r\n");
		sb.append("  <deptName>"+pd.getString("DEPARTMENT_NAME")+"</deptName>"+"\r\n");
		sb.append("  <queryTime>"+pd.getString("QUERY_TIME")+"</queryTime>"+"\r\n");
		sb.append("  <companyName>"+pd.getString("COMPANY_NAME")+"</companyName>"+"\r\n");
		sb.append("  <queryReason>"+pd.getString("QUERY_REASON")+"</queryReason>"+"\r\n");
		sb.append("  <zzCode>"+pd.getString("CHINA_CREDIT_CODE")+"</zzCode>"+"\r\n");
		sb.append("  <isQueried>"+pd.getString("IS_GET")+"</isQueried>"+"\r\n");
		sb.append("  <queryAuthTime>"+pd.getString("CHECK_TIME")+"</queryAuthTime>"+"\r\n");
		sb.append("  <queryComputerIP>"+pd.getString("IP")+"</queryComputerIP>"+"\r\n");
		sb.append("</DataBody>");*/
		System.out.println(sb.toString());
		return sb.toString();
	}

}
