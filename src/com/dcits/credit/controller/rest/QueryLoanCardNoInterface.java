package com.dcits.credit.controller.rest;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

import com.dcits.credit.service.EnterAppReview.EntAppReManager;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.QueryDateOperatorService.QueryDateOperatorManager;
import com.dcits.credit.service.companyInquiry.CompanyInquiryManager;
import com.dcits.credit.service.personInquiry.PersonInquiryManager;
import com.dcits.credit.service.rest.CompanyInterfaceService;
import com.dcits.credit.service.rest.ReportInterfaceService;
import com.dcits.credit.util.ThreadSaveLoanNo;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.PageData;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/** 
 * 企业中证码查询接口
 * 
 */ 
@Component
@Path("/queryLoanCardNoInterface")
public class QueryLoanCardNoInterface extends BaseController{  
	@Resource(name="PersonInquiryService")
	public PersonInquiryManager personInquiryService;
	@Resource(name="indAppReService")
	private IndAppReManager indAppReService;
	@Resource(name="CompanyInquiryService")
	private CompanyInquiryManager companyInquiryService;
	@Resource(name="entAppReService")
	private EntAppReManager entAppReService;
	@Resource(name="reportInterfaceService")
	private ReportInterfaceService reportService;
	@Resource(name="queryDateService")
	private QueryDateOperatorManager queryDateService;
	@Resource(name="CompanyInterfaceService")
	private CompanyInterfaceService CompanyService ;
	
	//查询接口队列
	ThreadPoolExecutor executor = new ThreadPoolExecutor(Integer.parseInt(BaseController.getPoolInfo().getString("corePoolSize")),Integer.parseInt(BaseController.getPoolInfo().getString("maximumPoolSize")),Integer.parseInt(BaseController.getPoolInfo().getString("keepAliveTime")), TimeUnit.SECONDS,
            new ArrayBlockingQueue<Runnable>(Integer.parseInt(BaseController.getPoolInfo().getString("workQueue"))));
	@SuppressWarnings("unused")
	@POST
	@Path("/queryRequest")
	public JSONObject queryRequest(InputStream is){
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
		List<String> list = new ArrayList<String>();
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf-8"));
			String lines = br.readLine();
			json = JSONObject.fromObject(lines);
			logger.info("查询申请请求报文："+json);
			//System.out.println("查询申请请求报文："+json);
			//提取字段，判断字段
			if(!json.get("USERNAME").equals("")){
				pd.put("USERNAME", json.get("USERNAME"));//查询员
			}else{
				logger.info("USERNAME接口参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
			//提取字段，判断字段
			if(json.get("CREDITCODE")!=null&&!json.get("CREDITCODE").equals("")){
				pd.put("CreditCode", json.get("CREDITCODE"));//机构信用代码
				list.add("decrypt_dec(CREDITCODE)='"+json.getString("CREDITCODE").replace("-", "")+"'");
			}
			if(json.get("LOANCARDNO")!=null&&!json.get("LOANCARDNO").equals("")){
				pd.put("LoanCardNo", json.get("LOANCARDNO"));//中证码
				list.add("decrypt_dec(LOANCARDNO)='"+json.getString("LOANCARDNO").replace("-", "")+"'");
			}
			
			if(json.get("SDEPORGCODE")!=null&&!json.get("SDEPORGCODE").equals("")){
				pd.put("SdepOrgCode", json.get("SDEPORGCODE"));//组织机构代码
				list.add("decrypt_dec(SDEPORGCODE)='"+json.getString("SDEPORGCODE").replace("-", "")+"'");
			}
			if(json.get("REGISTERTYPE")!=null&&json.get("REGISTERCODE")!=null&&!json.get("REGISTERTYPE").equals("")&&!json.get("REGISTERCODE").equals("")){
				pd.put("RegisterType", json.get("REGISTERTYPE"));//登记注册类型
				pd.put("RegisterCode", json.get("REGISTERCODE"));//登记注册号
				list.add("(decrypt_dec(REGISTERTYPE)='"+json.getString("REGISTERTYPE").replace("-", "")
						+"' AND decrypt_dec(REGISTERCODE)='"+json.getString("REGISTERCODE").replace("-", "")+"')");
			}
			if(json.get("SDEPNATIONALTAXCODE")!=null&&!json.get("SDEPNATIONALTAXCODE").equals("")){
				pd.put("SdepNationalTaxCode", json.get("SDEPNATIONALTAXCODE"));//纳税人识别号（国税）
				list.add("decrypt_dec(SDEPNATIONALTAXCODE)='"+json.getString("SDEPNATIONALTAXCODE").replace("-", "")+"'");
			}
			if(json.get("SDEPLANDTAXCODE")!=null&&!json.get("SDEPLANDTAXCODE").equals("")){
				pd.put("SdeplandTaxCode", json.get("SDEPLANDTAXCODE"));//纳税人识别号（地税）
				list.add("decrypt_dec(SDEPLANDTAXCODE)='"+json.getString("SDEPLANDTAXCODE").replace("-", "")+"'");

			}
			if(pd==null||list.size()==0){
				logger.info("接口参数异常");
				returnjson.put("errorcode", "03");
				returnjson.put("errormsg", "接口参数异常");
				return returnjson;
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			returnjson.put("errorcode", "03");
			returnjson.put("errormsg", "参数解析异常");
			return returnjson;
		}	
		
		PageData orgMap=new PageData();
		String ORG_CODE="";
		try{
			orgMap=personInquiryService.findOrg(pd);
			if(orgMap!=null){
				ORG_CODE=orgMap.getString("ORG_CODE");
			}else{
				logger.info("用户无查询权限");
				returnjson.put("errorcode", "07");
				returnjson.put("errormsg", "用户无查询权限");
				return returnjson;
			}
			pd1 = entAppReService.getOrgCode(orgMap);
			if(pd1!=null&&!"".equals(String.valueOf(pd1.get("ORGCODE")))){
				if("0".equals(String.valueOf(pd1.get("PERBANK_STATUS")))){
					logger.info(pd1.getString("USERNAME")+"人行登录密码错误");
					returnjson.put("errorcode", "09");
					returnjson.put("errormsg", "人行登录密码错误");
					return returnjson;
				}else{
					//在本地库中查询是否有该条记录，若无，则去人行查询
					StringBuffer sql = new StringBuffer();
					sql.append("SELECT decrypt_dec(LOANCARDNO) LOANCARDNO FROM CIFM_COMPANY_LOANNO WHERE "+list.get(0));
					for(int i=1;i<list.size();i++){
						sql.append(" OR "+list.get(i));
					}
					sql.append(" ORDER BY CLAWER_TIME DESC");
					PageData query = new PageData();
					query.put("creatSql", sql.toString());
					List<PageData> listPd = CompanyService.queryLoanNo(query);
					if(listPd.size()>0&&!"".equals(listPd.get(0).get("LOANCARDNO"))){
						if(listPd.get(0).get("LOANCARDNO")==null||"".equals(listPd.get(0).get("LOANCARDNO"))){
							returnjson.put("LOANCARDNO", "");
						}else{
							returnjson.put("LOANCARDNO", listPd.get(0).get("LOANCARDNO"));
						}					
					}else{
						//调用人行查询中证码
						String str = "{\"CreditCode\":\""+String.valueOf(pd.get("CreditCode"))+"\",\"SdepOrgCode\":\""+String.valueOf(pd.get("SdepOrgCode"))+"\",\"RegisterType\":\""+String.valueOf(pd.get("RegisterType"))+"\",\"RegisterCode\":\""+String.valueOf(pd.get("RegisterCode"))+"\",\"SdepNationalTaxCode\":\""+String.valueOf(pd.get("SdepNationalTaxCode"))+"\",\"SdeplandTaxCode\":\""+String.valueOf(pd.get("SdeplandTaxCode"))+"\",\"ORGCODE\":\""+String.valueOf(pd1.get("ORGCODE"))+"\",\"USERNAME\":\""+String.valueOf(pd1.get("USERNAME"))+"\",\"PASSWORD\":\""+String.valueOf(pd1.get("PASSWORD"))+"\"}";
				 		//调用爬虫接口
						Map<String,Object> result = AcceptJson(str);
						if("01".equals(result.get("code"))){
							returnjson.put("LOANCARDNO",result.get("LoanCardNo"));
						}else{
							returnjson.put("errorcode", result.get("code"));
							returnjson.put("errormsg", result.get("msg"));
							logger.debug("查询中证码返回结果："+returnjson);
							return returnjson;
						}
					}
				}
			}else{
				logger.info("用户无查询权限");
				returnjson.put("errorcode", "07");
				returnjson.put("errormsg", "用户无查询权限");
				return returnjson;
			}
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			returnjson.put("errorcode", "02");
			returnjson.put("errormsg", "系统异常");
			return returnjson;
		}

        logger.debug("线程池中线程数目："+executor.getPoolSize()+"，队列中等待执行的任务数目："+
        executor.getQueue().size()+"，已执行玩别的任务数目："+executor.getCompletedTaskCount());
        returnjson.put("errorcode", "01");
        returnjson.put("errormsg", "查询成功");
        logger.debug("查询申请返回报文："+returnjson);
		return returnjson;
	}
	
	//接收爬虫返回的json数据
	private Map<String,Object> AcceptJson(String str){
		Map<String,Object> map = new HashMap<String,Object>();
		List<PageData> listPd = new ArrayList<PageData>();
		//存放返回结果值
		JSONObject jsonData = new JSONObject();
		String msg = "";
		String code = "";
		try {
			byte[] b = str.getBytes("utf-8");
			String spideUrl=BaseController.getServerInfo().getString("spideUrl");
			URL url = new URL(spideUrl+"ClawerServer/rest/ClawerServer/queryLoanCardNo");
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
			logger.info("请求爬虫的返回信息："+lines);
			jsonData = JSONObject.fromObject(lines);
			reader.close();
			conn.disconnect();
			//解析返回结果值
			if(jsonData.size()!=0){
				code = String.valueOf(jsonData.get("errorcode"));
				if(!"01".equals(code)){
					msg = String.valueOf(jsonData.get("errormsg"));
				}else{
					JSONArray arr = JSONArray.fromObject(String.valueOf(jsonData.get("resultData")));
					for(int i=0;i<arr.size();i++){
						PageData pd1 = new PageData();							
						pd1.put("OrgName",String.valueOf(arr.getJSONObject(i).get("OrgName")));
						pd1.put("LoanCardNo",String.valueOf(arr.getJSONObject(i).get("LoanCardNo")));
						pd1.put("SocialCredit",String.valueOf(arr.getJSONObject(i).get("SocialCredit")));
						pd1.put("SdepOrgCode",String.valueOf(arr.getJSONObject(i).get("SdepOrgCode")));
						pd1.put("CreditCode",String.valueOf(arr.getJSONObject(i).get("CreditCode")));
						pd1.put("BusinessNum",String.valueOf(arr.getJSONObject(i).get("BusinessNum")));
						pd1.put("SocialGroupNo",String.valueOf(arr.getJSONObject(i).get("SocialGroupNo")));
						pd1.put("PublicNum",String.valueOf(arr.getJSONObject(i).get("PublicNum")));
						pd1.put("CivilNo",String.valueOf(arr.getJSONObject(i).get("CivilNo")));
						pd1.put("FundNo",String.valueOf(arr.getJSONObject(i).get("FundNo")));
						pd1.put("Other",String.valueOf(arr.getJSONObject(i).get("Other")));
						pd1.put("ReligionNo",String.valueOf(arr.getJSONObject(i).get("ReligionNo")));
						pd1.put("SdeplandTaxCode",String.valueOf(arr.getJSONObject(i).get("SdeplandTaxCode")));
						pd1.put("SdepNationalTaxCode",String.valueOf(arr.getJSONObject(i).get("SdepNationalTaxCode")));
						pd1.put("CLAWER_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
						listPd.add(pd1);
					}
				}
			}else{
				code = "04";
				msg = "爬虫应用连接异常";
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
			logger.info("爬虫应用连接异常");
			code = "04";
			msg = "爬虫应用连接异常";
		}
		map.put("code", code);
		map.put("msg", msg);
		if(listPd.size()>0){
			map.put("LoanCardNo", String.valueOf((listPd.get(0).get("LoanCardNo"))));
			//调用线程将数据入库
//			ThreadSaveLoanNo thread = new ThreadSaveLoanNo(listPd,CompanyService);
//			thread.run();
		}
		return map;
	}
	
	@GET
	@Path("/testpath")
	@Produces(MediaType.TEXT_PLAIN)
	public String sayHello() {
		return "Hello queryLoanNo!";
	}
}  
