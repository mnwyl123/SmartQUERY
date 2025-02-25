package com.dcits.credit.service.dataSubmission.impl;

import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.httpclient.methods.multipart.FilePart;
import org.apache.commons.httpclient.methods.multipart.Part;
import org.apache.commons.httpclient.methods.multipart.StringPart;
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
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.stereotype.Service;

import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.dataSubmission.IDataSubmissionService;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.DESUtil;
import com.dcits.platform.util.Logger;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;

/**
 * 数据报送
 * @author wang.wenming
 *
 */
@Service("dataSubmissionService")
public class DataSubmissionServiceImpl implements IDataSubmissionService {

	@Resource(name="daoSupport")
	private DaoSupport dao;
	@Resource(name="indAppReService")
	private IndAppReManager indAppReService;
	private static com.dcits.platform.util.Logger logger = Logger.getLogger(DataSubmissionServiceImpl.class);
	/**
	 * 个人征信数据列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> getCifmPersonList(Page page) throws Exception {
		return (List<PageData>)dao.findForList("DataSubmissionPerson.listPage",page);
	}
	/**
	 * 唯一标识查询个人征信数据
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData getCifmPersonObject(String id) throws Exception {
		return (PageData)dao.findForObject("DataSubmissionPerson.listObjectById",id);
	}
	/**
	 * 唯一标识查询个人征信数据
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listUrlById(String id) throws Exception {
		return (List<PageData>)dao.findForList("DataSubmissionPerson.listUrlById",id);
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
		return (List<PageData>)dao.findForList("DataSubmissionCompany.listPage",page);
	}
	/**
	 * 唯一标识查询企业征信数据
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData getCifmCompanyObject(String id) throws Exception {
		return (PageData)dao.findForObject("DataSubmissionCompany.listObjectById",id);
	}
	/**
	 * 发送报文到指定接口的调用方法
	 * @param queryId
	 * @param dataType 上报数据类型：1:个人征信查询明细 2:企业征信查询明细
	 * @return
	 * @throws Exception 
	 */
	public String sendSubmissionData(String queryId,String dataType){
		String returnInfo = "";
		boolean report = indAppReService.findQueryType("REPORTTYPE");
		if(!report){
			return returnInfo;
		}
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
				pd1 = getCifmPersonObject(queryId);
				orgId=pd1.getString("ORG_ID_PERBANK");   //机构编码
			}
			else{
				xml = getCompanyByte(queryId);
				pd1 = getCifmCompanyObject(queryId);
				flag ="2";
				orgId=pd1.getString("ORG_ID_COMBANK");   //机构编码
				//orgId="79103141005";
				tableName ="QYZXCXMX";
			}
			//接口地址
			String url = BaseController.getPropertiesValue("IFAddress");
			logger.debug("+++++++++++++++++xml++++++++++++++++++"+ xml);
			logger.debug("+++++++++++++++++url++++++++++++++++++"+ url);
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
	            // 把一个普通参数和文件上传给下面这个地址 是一个servlet
	            
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
	            logger.debug("+++++++++++++++++response++++++++++++++++++"+ response);
	            // 获取响应对象
	            HttpEntity resEntity = response.getEntity();
	            if (resEntity != null) {
	                returnInfo=EntityUtils.toString(resEntity, Charset.forName("UTF-8"));
	            }
	            logger.debug("+++++++++++++++++returnInfo++++++++++++++++++"+ returnInfo);
	            // 销毁
	            EntityUtils.consume(resEntity);
	            //删除本地文件
	            file.delete();
	            
	            if(!returnInfo.startsWith("<?xml version=")){
	            	returnInfo = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"+xml;
	    		}
	    		Document doc = DocumentHelper.parseText(returnInfo);
	    		Element CFX = doc.getRootElement();
	    		String CODE = CFX.element("Name").getStringValue();
	    		Element MSG = CFX.element("MSG");
	    		Element GRYCDATA = MSG.element("GRYCDATA");
	    		String YCID = GRYCDATA.element("YCID").getStringValue();
	    		String DATAID = GRYCDATA.element("DATAID").getStringValue();
	    		String CXLSH = GRYCDATA.element("CXLSH").getStringValue();
	    		String JRJGBM = GRYCDATA.element("JRJGBM").getStringValue();
	    		if(CODE.equals("0")) {
	    			List<PageData> al_files = listUrlById(queryId);
		            SimpleDateFormat sdf = new SimpleDateFormat();
		    		Part[] parts = new Part[al_files.size() + 4];
		    		parts[0] = new StringPart("DATA_ID",URLEncoder.encode(DATAID,"utf-8"));
		    		parts[1] = new StringPart("YC_ID", URLEncoder.encode(YCID, "utf-8"));
		    		parts[2] = new StringPart("SRC_ID", URLEncoder.encode(JRJGBM, "utf-8"));
		    		parts[3] = new StringPart("TIME", sdf.format(new Date()));

		    		for (int i = 0; i < al_files.size(); i++) {
		    			URL path = new URL(al_files.get(i).toString());
		    			DataInputStream InputStream = new DataInputStream(path.openStream());
		    			FileOutputStream OutputStream = new FileOutputStream(new File(PathUtil.getClasspath() + Const.FILEPATHFILE + "/" +"fxcjg.png"));
		    			ByteArrayOutputStream Output = new ByteArrayOutputStream();
		    			byte[] buffer = new byte[1024];
		    			int length;
		    			while((length = InputStream.read(buffer))>0) {
		    				Output.write(buffer,0,length);
		    			}
		    			OutputStream.write(Output.toByteArray());
		    			InputStream.close();
		    			OutputStream.close();
		    			File fileyx = new File(PathUtil.getClasspath() + Const.FILEPATHFILE + "/" +"fxcjg.png");
		    			String name = fileyx.getName();
		    			parts[i + 4] = new FilePart(name, fileyx); 
		    		}
	    		}
	            
	    		
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
		pd = getCifmPersonObject(queryId);
		sb = new StringBuffer();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String cred = DESUtil.decrypt("enhjeA==",pd.getString("CREDENTIALS_NO"));
		String SFYD = "";
		if(pd.getString("CREDENTIALS_TYPE").equals("10")) {
			if(cred.length()==18) {
				cred = cred.substring(0,6)+"********"+cred.substring(16);
			}
			if(cred.length()==15) {
				cred = cred.substring(0,6)+"******"+cred.substring(17);
			}
		}else {
			cred = cred.substring(0,cred.length()-6)+"******";
		}
		if(cred.substring(0,2).equals("22")) {
			SFYD = "1";
		}else {
			SFYD = "0";
		}
		//返回内容
		//sb.append("D10027910H0001");
		/*sb.append(pd.getString("ORG_ID_PERBANK")+",");
		sb.append(pd.getString("BRANCH_CODE")+",");
		sb.append(pd.getString("BRANCH_NAME")+",");
		sb.append(pd.getString("USER_SYS_NAME")+",");
		sb.append(pd.getString("USER_REAL_NAME")+",");
		sb.append(pd.getString("QUERY_TIME")+",");
		sb.append(DESUtil.decrypt("enhjeA==",pd.getString("CLIENT_NAME"))+",");
		sb.append(pd.getString("CREDENTIALS_TYPE")+",");
		sb.append(DESUtil.decrypt("enhjeA==",pd.getString("CREDENTIALS_NO"))+",");
		sb.append(pd.getString("QUERY_REASON")+",");
		sb.append("01"+",");//01银行版
		sb.append(pd.getString("IS_GET")+",");
		sb.append(pd.getString("CHECK_TIME")+",");
		sb.append(pd.getString("IP"));*/
		//返回内容
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>"+"\r\n");
		sb.append("<CFX>"+"\r\n");
		sb.append("<HEAD>"+"\r\n");
		sb.append("<VER>"+pd.getString("QUERY_VERSION")+"</VER>"+"\r\n");
		sb.append("<SRC>"+"D10052410H0001"+"</SRC>"+"\r\n");
		sb.append("<DES>"+"A1000165000529"+"</queryOrgName>"+"\r\n");
		sb.append("<APPCODE>"+"JLSZXFXCJG"+"</APPCODE>"+"\r\n");
		sb.append("<MSGNO>"+"1001"+"</MSGNO>"+"\r\n");
		sb.append("<MSGID>"+"D10052410H0001_"+sdf.format(new Date())+"</MSGID>"+"\r\n");
		sb.append("<COMMAND>"+"</COMMAND>"+"\r\n");
		sb.append("<SENDDATE>"+sdf1.format(new Date())+"</SENDDATE>"+"\r\n");
		sb.append("<RESERVE>"+"</RESERVE>"+"\r\n");
		sb.append("</HEAD>"+"\r\n");
		sb.append("<MSG>"+"\r\n");
		sb.append("<GRZXMXB>"+"\r\n");
		sb.append("<MSGNO>"+"吉林亿联银行股份有限公司"+"</MSGNO>"+"\r\n");
		sb.append("<CXLSH>"+ queryId.substring(50) +"</CXLSH>"+"\r\n");
		sb.append("<CZYH>"+ pd.getString("CREDIT_CODE") +"</CZYH>"+"\r\n");
		sb.append("<CXRXM>"+ pd.getString("CREDIT_NAME") +"</CXRXM>"+"\r\n");
		sb.append("<GRJGDM>"+ "D10052410H0001" +"</GRJGDM>"+"\r\n");
		sb.append("<BCXRXM>"+ DESUtil.decrypt("enhjeA==",pd.getString("CLIENT_NAME")) +"</BCXRXM>"+"\r\n");
		sb.append("<BCXRZJLX>"+ pd.getString("CREDENTIALS_TYPE") +"</BCXRZJLX>"+"\r\n");
		sb.append("<BCXRZJHM>"+ cred +"</BCXRZJHM>"+"\r\n");
		sb.append("<CXSJ>"+ pd.getString("APPLICATION_TIME") +"</CXSJ>"+"\r\n");
		sb.append("<GRCXYY>"+ pd.getString("QUERY_REASON") +"</GRCXYY>"+"\r\n");
		sb.append("<YWSQSBH>"+ pd.getString("YWSHS") +"</YWSQSBH>"+"\r\n");
		sb.append("<SQSJ>"+ pd.getString("SQTIME") +"</SQSJ>"+"\r\n");
		sb.append("<BGSYR>"+ DESUtil.decrypt("enhjeA==",pd.getString("CLIENT_NAME")) +"</BGSYR>"+"\r\n");
		sb.append("<MQSQ>"+ pd.getString("MQNAME") +"</MQSQ>"+"\r\n");
		sb.append("<SQFS>"+ pd.getString("SHFS") +"</SQFS>"+"\r\n");
		sb.append("<SFYD>"+ SFYD +"</SFYD>"+"\r\n");
		sb.append("<YWRLSB>"+ pd.getString("RLSB") +"</YWRLSB>"+"\r\n");
		sb.append("<YWLB>"+ pd.getString("YWLB") +"</YWLB>"+"\r\n");
		sb.append("<CHYH>"+ pd.getString("CREDIT_CODE") +"</CHYH>"+"\r\n");
		sb.append("<MQSHYH>"+ pd.getString("YMQNAME") +"</MQSHYH>"+"\r\n");
		sb.append("<JRJGBM>"+ "D10052410H0001" +"</JRJGBM>"+"\r\n");
		sb.append("<YWFFSJ>"+ pd.getString("YWFF") +"</YWFFSJ>"+"\r\n");
		sb.append("</GRZXMXB>"+"\r\n");
		sb.append("</MSG>"+"\r\n");
		sb.append("</CFX>");
		logger.debug(sb.toString());
		return sb.toString();
	}
	/**
	 * 更新流程表状态
	 * @param queryId
	 * @throws Exception
	 */
	public void updateStatus(PageData pd) throws Exception{
		dao.update("DataSubmissionCompany.updateStatus", pd);
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
		sb.append(pd.getString("ORG_ID_COMBANK")+",");
		sb.append(pd.getString("BRANCH_CODE")+",");
		sb.append(pd.getString("BRANCH_NAME")+",");
		sb.append(pd.getString("USER_SYS_NAME")+",");
		sb.append(pd.getString("USER_REAL_NAME")+",");
		sb.append(pd.getString("DEPARTMENT_NAME")+",");
		sb.append(pd.getString("QUERY_TIME")+",");
		sb.append(pd.getString("COMPANY_NAME")+",");
		//sb.append(pd.getString("QUERY_REASON")+",");
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
		logger.debug(sb.toString());
		return sb.toString();
	}

}
