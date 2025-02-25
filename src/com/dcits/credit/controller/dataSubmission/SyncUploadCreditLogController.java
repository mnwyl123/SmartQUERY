package com.dcits.credit.controller.dataSubmission;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dcits.credit.service.dataSubmission.IDataSubmissionService;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.PageData;

/**
 * 数据报送
 * 
 * @author wang.wenming
 *
 */
@Controller
@RequestMapping(value = "/syncUploadCreditLog")
public class SyncUploadCreditLogController extends BaseController {

	@Resource(name = "dataSubmissionService")
	private IDataSubmissionService iDataSubmissionService;

	// @Resource(name="dataSubmissionService")
	// private IDataSubmissionService DataSubmissionService;

	/**
	 * 发送报文到指定的接口
	 * 
	 * @return
	 */
	@RequestMapping(value = "/sendData")
	@ResponseBody
	public Object sendSubmissionData() {
		PageData pd = getPageData();
		String queryId = pd.getString("id");
		String dataType = pd.getString("dataType");
		pd.put("QUERYID", queryId);
		Map<String, String> map = new HashMap<String, String>();
		try {
			iDataSubmissionService.sendSubmissionData(queryId,dataType);
		} catch (Exception e) {
			pd.put("SENDSTATUS", "0");
			logger.error(e.getMessage());
			map.put("result", "error");
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	/**
	 * 批量发送报文到指定的接口
	 * 
	 * @return
	 */
	@RequestMapping(value = "/sendDataBatch")
	@ResponseBody
	public Object sendSubmissionDataBatch() {
		PageData pd = getPageData();
		String DATA_IDS = pd.getString("DATA_IDS");
		String queryId = pd.getString("id");
		String dataType = pd.getString("dataType");
		pd.put("QUERYID", queryId);
		Map<String, String> map = new HashMap<String, String>();
		try {
			if (null != DATA_IDS && !"".equals(DATA_IDS)) {
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				for (int i = 0; i < ArrayDATA_IDS.length; i++) {
					PageData newpd=new PageData();
					queryId = ArrayDATA_IDS[i];
					newpd.put("QUERYID", queryId);
					iDataSubmissionService.sendSubmissionData(queryId,dataType);
				}
			}
		} catch (Exception e) {
			pd.put("SENDSTATUS", "0");
			logger.error(e.getMessage());
			map.put("result", "error");
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	/**
	 * 发送报文到指定的接口
	 * 
	 * @return
	 */
	@RequestMapping(value = "/sendDataold")
	@ResponseBody
	public Object sendSubmissionDataold() {
		PageData pd = getPageData();
		PageData pd1 = new PageData();
		String queryId = pd.getString("id");
		String dataType = pd.getString("dataType");
		pd.put("QUERYID", queryId);
		String xml = null;
		Map<String, String> map = new HashMap<String, String>();
		String flag = "1"; // 客户类型
		String orgId = ""; // 机构编码
		String tableName = "GRZXCXMX";
		try {
			if ("1".equals(dataType)) {
				xml = iDataSubmissionService.getPersonByte(queryId);
				pd1 = iDataSubmissionService.getCifmPersonObject(queryId);
				orgId = pd1.getString("ORG_ID_PERBANK"); // 机构编码
			} else {
				xml = iDataSubmissionService.getCompanyByte(queryId);
				pd1 = iDataSubmissionService.getCifmCompanyObject(queryId);
				flag = "2";
				orgId = pd1.getString("ORG_ID_COMBANK"); // 机构编码
				// orgId="79103141005";
				tableName = "QYZXCXMX";
			}
			String str = "{\"flag\":\""+flag+"\",\"orgId\":\""+orgId+"\",\"tableName\":\""+tableName+"\",\"xml\":\""+xml+"\",\"ID\":\""+pd.getString("ID")+"\"}";
			byte[] b = str.getBytes("utf-8");
			URL url = new URL(BaseController.getServerInfo().getString("spideUrl")+"ClawerServer/rest/SyncUploadCreditLog/sendData");
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
			reader.close();
			conn.disconnect();
			if (lines.contains("success")) {
				map.put("result", "success");
				pd.put("SENDSTATUS", "1");
			} else {
				map.put("result", "error");
				pd.put("SENDSTATUS", "0");
			}
		} catch (Exception e) {
			pd.put("SENDSTATUS", "0");
			logger.error(e.getMessage());
			map.put("result", "error");
		}
		try {
			iDataSubmissionService.updateStatus(pd);
		} catch (Exception e1) {
			logger.error(e1.getMessage());
		}
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 批量发送报文到指定的接口
	 * 
	 * @return
	 */
	@RequestMapping(value = "/sendDataBatchold")
	@ResponseBody
	public Object sendSubmissionDataBatchold() {
		PageData pd = getPageData();
		PageData pd1 = new PageData();
		String DATA_IDS = pd.getString("DATA_IDS");
		String queryId = pd.getString("id");
		String dataType = pd.getString("dataType");
		pd.put("QUERYID", queryId);
		String returnInfo = null;
		String xml = null;
		Map<String, String> map = new HashMap<String, String>();
		String flag = "1"; // 客户类型
		String orgId = "D10027910H0001"; // 机构编码
		String tableName = "GRZXCXMX";

		if (!("1".equals(dataType))) {
			//orgId = pd1.getString("ORG_ID_COMBANK"); // 机构编码
			orgId="79103141005";
			tableName = "QYZXCXMX";
		}
		List<PageData> staList= new ArrayList<PageData>();
		try {
			StringBuffer sf = new StringBuffer();
			if (null != DATA_IDS && !"".equals(DATA_IDS)) {
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				for (int i = 0; i < ArrayDATA_IDS.length; i++) {
					PageData newpd=new PageData();
					queryId = ArrayDATA_IDS[i];
					newpd.put("QUERYID", queryId);
					if ("1".equals(dataType)) {
						xml = iDataSubmissionService.getPersonByte(queryId);
						pd1 = iDataSubmissionService
								.getCifmPersonObject(queryId);
						orgId = pd1.getString("ORG_ID_PERBANK"); // 机构编码
					} else {
						xml = iDataSubmissionService.getCompanyByte(queryId);
						pd1 = iDataSubmissionService
								.getCifmCompanyObject(queryId);
						flag = "2";
						orgId = pd1.getString("ORG_ID_COMBANK"); // 机构编码
						// orgId="79103141005";
						tableName = "QYZXCXMX";
					}
					sf.append(xml);
					sf.append("\\r\\n");
					staList.add(newpd);
				}
				
				String str = "{\"flag\":\""+flag+"\",\"orgId\":\""+orgId+"\",\"tableName\":\""+tableName+"\",\"strxml\":\""+sf.toString()+"\",\"ID\":\""+pd.getString("ID")+"\"}";
				byte[] b = str.getBytes("utf-8");
				URL url = new URL(BaseController.getServerInfo().getString("spideUrl")+"ClawerServer/rest/SyncUploadCreditLog/sendDataBatch");
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
				returnInfo = reader.readLine();// 读取请求结果
				reader.close();
				conn.disconnect();
				// 删除本地文件
				//file.delete();
				if (returnInfo.contains("success")) {
					map.put("result", "success");
					pd.put("SENDSTATUS", "1");
				} else {
					map.put("result", "error");
					pd.put("SENDSTATUS", "0");
				}
			}
		} catch (Exception e) {
			pd.put("SENDSTATUS", "0");
			logger.error(e.getMessage());
			map.put("result", "error");
		}
		try {
			for(int i=0;i<staList.size();i++){
				pd=staList.get(i);
				if (returnInfo.contains("success")) {
					map.put("result", "success");
					pd.put("SENDSTATUS", "1");
				} else {
					map.put("result", "error");
					pd.put("SENDSTATUS", "0");
				}
				iDataSubmissionService.updateStatus(pd);
			}
		} catch (Exception e1) {
			logger.error(e1.getMessage());
		}
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 获取个人信息，以文本形式
	 * 
	 * @param queryId
	 * @return
	 */
	/*
	 * public Map<String, String> getPersonInfo(String queryId){ Map<String,
	 * String> map = new HashMap<String, String>(); PageData pd = null; try { pd
	 * = iDataSubmissionService.getCifmPersonObject(queryId); } catch (Exception
	 * e) { e.printStackTrace(); } //返回内容 StringBuffer sb = new StringBuffer();
	 * //添加头部信息 sb.append("upOrgCode,"); sb.append("queryOrgNo,");
	 * sb.append("queryOrgName,"); sb.append("queryUserSysName,");
	 * sb.append("queryUserName,"); sb.append("queriedUserName,");
	 * sb.append("certType,"); sb.append("certNo,"); sb.append("queryReason,");
	 * sb.append("queryFormatName,"); sb.append("isQueried,");
	 * sb.append("queryAuthTime,"); sb.append("queryComputerIP");
	 * sb.append("\r\n"); //数据 sb.append(pd.getString("ORG_CODE")+",");
	 * sb.append(pd.getString("ORG_NAME")+",");
	 * sb.append(pd.getString("BRANCH_NAME")+",");
	 * sb.append(pd.getString("USER_SYS_NAME")+",");
	 * sb.append(pd.getString("USER_REAL_NAME")+",");
	 * sb.append(pd.getString("CLIENT_NAME")+",");
	 * sb.append(pd.getString("CREDENTIALS_TYPE")+",");
	 * sb.append(pd.getString("CREDENTIALS_NUM")+",");
	 * sb.append(pd.getString("FIND_REASON")+",");
	 * sb.append(pd.getString("FIND_VERSION")+",");
	 * sb.append(pd.getString("IS_GET")+",");
	 * sb.append(pd.getString("CHECK_TIME")+","); sb.append(pd.getString("IP"));
	 * map.put("org_code", pd.getString("ORG_CODE")); map.put("check_time",
	 * pd.getString("CHECK_TIME")); map.put("content", sb.toString()); return
	 * map; }
	 *//**
	 * 获取企业信息，以文本形式
	 * 
	 * @param queryId
	 * @return
	 */
	/*
	 * public Map<String, String> getCompanyInfo(String queryId){ Map<String,
	 * String> map = new HashMap<String, String>(); PageData pd = null; try { pd
	 * = iDataSubmissionService.getCifmCompanyObject(queryId); } catch
	 * (Exception e) { // TODO Auto-generated catch block e.printStackTrace(); }
	 * //返回内容 StringBuffer sb = new StringBuffer(); //添加头部信息
	 * sb.append("upOrgCode,"); sb.append("queryOrgNo,");
	 * sb.append("queryOrgName,"); sb.append("queryUserSysName,");
	 * sb.append("queryUserName,"); sb.append("queriedUserName,");
	 * sb.append("deptName,"); sb.append("queryTime,");
	 * sb.append("companyName,"); sb.append("zzCode,"); sb.append("isQueried,");
	 * sb.append("queryAuthTime,"); sb.append("queryComputerIP");
	 * sb.append("\r\n"); sb.append(pd.getString("ORG_CODE")+",");
	 * sb.append(pd.getString("ORG_NAME")+",");
	 * sb.append(pd.getString("BRANCH_NAME")+",");
	 * sb.append(pd.getString("USER_SYS_NAME")+",");
	 * sb.append(pd.getString("USER_REAL_NAME")+",");
	 * sb.append(pd.getString("CLIENT_NAME")+",");
	 * sb.append(pd.getString("DEPARTMENT_NAME")+",");
	 * sb.append(pd.getString("FIND_TIME")+",");
	 * sb.append(pd.getString("COMPANY_NAME")+",");
	 * sb.append(pd.getString("CHINA_CREDIT_CODE")+",");
	 * sb.append(pd.getString("IS_GET")+",");
	 * sb.append(pd.getString("CHECK_TIME")+","); sb.append(pd.getString("IP"));
	 * map.put("org_code", pd.getString("ORG_CODE")); map.put("check_time",
	 * pd.getString("CHECK_TIME")); map.put("content", sb.toString()); return
	 * map; }
	 */

	/**
	 * 批量上报报文生成及下载
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/downLoadAll")
	@ResponseBody
	public Object downLoadAll() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = this.getPageData();
		String[] ids = pd.getString("DATA_IDS").split(",");
		List<PageData> list = null;
		try {
			map.put("msg", "success");
		} catch (Exception e) {
			logger.info(e.getMessage());
			map.put("msg", "error");
		}
		return AppUtil.returnObject(new PageData(), map);
	}
}
