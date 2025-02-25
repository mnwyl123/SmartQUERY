package com.dcits.credit.service.ServerUtil.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.ServerUtil.ServerUtilManager;
import com.dcits.credit.service.crawler.PersonCrawlerManager;
import com.dcits.credit.service.dataSubmission.IDataSubmissionService;
import com.dcits.credit.service.personInquiry.PersonInquiryManager;
import com.dcits.credit.util.ClawerInterfaceServer;
import com.dcits.credit.util.PasswordOper;
import com.dcits.credit.util.ThreadCrawler;
import com.dcits.credit.util.crawler.personCredit.WebCrawler;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.service.system.operation.OperationManager;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.UuidUtil;


/** 
 * 类名称：IndAppReService20170712
 * 创建人：zhangyy
 * 说明：个人查询申请审核
 * //向流程状态表添加数据(审核状态是已经审核通过)---向个人信息表添加数据---向明细表添加数据---网页爬虫----生成json数据
 */
@Service("serverUtil")
public class ServerUtilService extends BaseController implements ServerUtilManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Resource(name="PersonInquiryService")
	private PersonInquiryManager PersonInquiryService;
	@Resource(name="indAppReService")
	private IndAppReManager indAppReService;
	@Resource(name="personCrawlerService")
	private PersonCrawlerManager personCrawlerService;
	@Resource(name="operationService")
	private OperationManager operationService;
	@Resource(name="dataSubmissionService")
	private IDataSubmissionService iDataSubmissionService;
	
	private static Logger logger = Logger.getLogger(ServerUtilService.class);

	@Override
	public JSONObject returnCrawlerInfo(PageData pd){
		try{
			PageData interfaceInfo = (PageData) dao.findForObject("ServerUtilMapper.getUserID", pd);
			pd.put("USER_SYS_ID", interfaceInfo.getString("USER_SYS_ID"));//用户系统ID
			pd.put("ORG_ID", interfaceInfo.getString("ORG_ID"));//用户系统ID
			
			//生成查询编号
			String ORG_CODE=interfaceInfo.getString("ORG_CODE");
			String date =new SimpleDateFormat("yyyyMMdd").format(new Date());
			pd.put("DATA_DATE",date);
			pd.put("IP", interfaceInfo.get("IP"));
			pd.put("MAC", interfaceInfo.get("MAC"));
			
//			interfaceInfo = PersonInquiryService.findId(pd);
//			
//			String maxId="";
//			if(interfaceInfo!=null&&!interfaceInfo.equals("")){
//				maxId=(interfaceInfo.getString("FIND_ID")).toString();
//				maxId="00000000"+maxId.toString();
//				maxId=maxId.substring(maxId.length()-8,maxId.length());
//			}else{
//				maxId="00000001";
//			}
			String ID=UuidUtil.get64UUID();
			pd.put("ID", ID);
			/*----根据获取的参数数据向流程状态表中添加数据--------*/
			InsertFlowInfo(pd);
			
			/*----根据获取的参数数据向个人信息表中添加数据-------*/
			InsertPerInfo(pd);
			
			/*--------向个人明细表中添加数据-------*/
			//查询明细表需要的
			PageData detail = indAppReService.QueryDetail(pd.getString("ID"));
			if(detail!=null){
				//向明细表中插入数据
				indAppReService.saveDetail(detail);
			}
			try{
				/*----调用线程，启动爬虫-------*/
				//调用线程，启动爬虫
 	 			Thread crawStart = new ThreadCrawler(pd,true,indAppReService);
 	 			crawStart.start();
			}catch(Exception e){
				logger.error(e.getMessage());
			}
			/*----生成json数据-------*/
			JSONObject jsonData = new JSONObject();
			jsonData = CreateJsonData(pd);
			return jsonData;
		}catch(Exception e){
			logger.error(e.getMessage());
			Map<String,Object> map = new HashMap<String,Object>();
			map = getResult(pd);
			map.put("code", "-1");
			map.put("message", "交易失败!");
			map.put("reportid", "");
			map.put("root", "null");
			map.put("success", "false");
			map.put("total", "0");
			return JSONObject.fromObject(map);
		}
	}
	
	//向个人信息表中添加数据
	private void InsertPerInfo(PageData pd){
		try {
			pd.put("QUERY_TYPE", "0");
			pd.put("QUERY_VERSION", "30");
			PersonInquiryService.save(pd);
		} catch (Exception e) {
			logger.info("向个人信息表中插入数据失败!");
			logger.error(e.getMessage());
		}
	}
	
	//向流程状态表中添加数据
	private void InsertFlowInfo(PageData pd){
		try {
			pd.put("APPLICATION_TIME",new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date()));//申请时间
			pd.put("QUERY_TIME",new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date()));//申请时间
			pd.put("CHECK_TIME",new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(new Date()));//申请时间
			pd.put("CHECK_SYS_ID", "0");//审核人ID默认为0
			pd.put("STATUS", "02");//状态 01待审核
			pd.put("INTERNAL", "2");//
			pd.put("CHANNEL_ID", "02");//
			pd.put("CLIENT_TYPE", '1');//客户类型(1:个人2:企业)
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		try {
			PersonInquiryService.saveToFs(pd);
		} catch (Exception e) {
			logger.info("向流程表中插入数据失败!");
			logger.error(e.getMessage());
		}
	}

	
	//查询爬取的数据，形成json格式数据
	@Override
	public JSONObject CreateJsonData(PageData pd){
		String status = "";
		try {
			PageData IDS = (PageData) dao.findForObject("ServerUtilMapper.getReportId", pd);
			status = IDS.getString("STATUS");
			pd.put("STATUS", status);
			pd.put("REPORT_ID", IDS.getString("REPORT_ID"));
		} catch (Exception e) {
			logger.info("报告ID获取失败!");
			logger.error(e.getMessage());
		}
		
		//存放所有表数据
		Map<String,Object> map = new HashMap<String,Object>();
		//存放表中各个字段数据
		List<JSONObject> jsonObjects = new ArrayList<JSONObject>();
		
		map = getResult(pd);
		
		if(status=="06"||status.equals("06")){
			//查询各个表中数据
			jsonObjects = getRJsonData(pd);
			//报告生成
			map.put("code", "0000");
			map.put("message", "交易成功!");
			map.put("reportid", pd.getString("REPORT_ID"));
			map.put("root", jsonObjects);
			map.put("success", "true");
			map.put("total", "1");
		}else{
			//爬虫失败
			map.put("code", "-1");
			map.put("message", "交易失败!");
			map.put("reportid", "");
			map.put("root", "null");
			map.put("success", "false");
			map.put("total", "0");
		}
		
		return JSONObject.fromObject(map);
	}
	
	//返回结果信息
	private Map<String,Object> getResult(PageData pd){
		//存放所有表数据
		Map<String,Object> map = new HashMap<String,Object>();
		/*-以下字段为调用时传递的参数-*/
		map.put("idType", pd.getString("CREDENTIALS_TYPE"));
		map.put("idNbr", pd.getString("CREDENTIALS_NO"));
		map.put("name", pd.getString("CLIENT_NAME"));
		map.put("queryReason", pd.getString("QUERY_REASON"));
		map.put("querytime", new SimpleDateFormat("yyyy.MM.dd HH:mm:ss").format(new Date()));
		map.put("raw", "null");
		return map;
	}
	
	//生成各个表对应的json格式数据
	private List<JSONObject> getRJsonData(PageData pd){
		List<JSONObject> jsonObjects = new ArrayList<JSONObject>();
		try {
			JSONObject allTableData = getJsonData(pd);
			jsonObjects.add(allTableData);
		} catch (Exception e) {
			logger.info("生成json数据失败!");
			logger.error(e.getMessage());
		}
		return jsonObjects;
	}

	//查询数据
	@SuppressWarnings("unchecked")
	@Override
	public JSONObject getJsonData(PageData pd){
		Map<String,Object> map = new HashMap<String,Object>();
		//存放表名
		List<String> listTableName = addTableName();
		try{
			//逐个表查询数据
			for(String tableName:listTableName){
				boolean flag = true;
				if(tableName=="ApPbcLoanListBean"||tableName.equals("ApPbcLoanListBean")||tableName=="ApPbcCreditListBean"||tableName.equals("ApPbcCreditListBean")){
					flag = false;
				}
				List<PageData> listPd = (List<PageData>) dao.findForList("ServerUtilMapper.get"+tableName, pd);
				if(listPd.size()==0){   //没有查到符合该表的数据
					map.put(tableName, new JSONObject());
				}else if(listPd.size()==1){   //查到一条符合该表的数据
					JSONObject jsonObject = new JSONObject();
					Iterator<String> iter = listPd.get(0).keySet().iterator();
					if(flag){
						while(iter.hasNext()){
							String key =iter.next();
							if(listPd.get(0).get(key)==null){
								jsonObject.put(key, "");
							}else{
								jsonObject.put(key, listPd.get(0).get(key).toString());
							}
						}
					}else{  
						while(iter.hasNext()){
							String key =iter.next();
							if(key!="LISTRECORD"&&!key.equals("LISTRECORD")){
								if(listPd.get(0).get(key)==null){
									jsonObject.put(key, "");
								}else{
									jsonObject.put(key, listPd.get(0).get(key).toString());
								}
							}else{//拆分还款记录
								if(listPd.get(0).get(key)!=null){
									PageData detail = spiltString(listPd.get(0).get(key).toString());
									Iterator<String> it = detail.keySet().iterator();
									while(it.hasNext()){
										String str =it.next();
										jsonObject.put(str, detail.get(str).toString());
									}
								}
							}
						}
					}
					map.put(tableName, jsonObject);
				}else{   //查到多条符合该表的数据
					List<JSONObject> jsonObjects = new ArrayList<JSONObject>();
					if(flag){
						for(int i=0;i<listPd.size();i++){
							JSONObject jsonObject = new JSONObject();
							Iterator<String> iter = listPd.get(i).keySet().iterator();
							while(iter.hasNext()){
								String key =iter.next();
								if(listPd.get(i).get(key)==null){
									jsonObject.put(key, "");
								}else{
									jsonObject.put(key, listPd.get(i).get(key).toString());
								}
							}
							jsonObjects.add(jsonObject);
						}
					}else{
						for(int i=0;i<listPd.size();i++){
							JSONObject jsonObject = new JSONObject();
							Iterator<String> iter = listPd.get(i).keySet().iterator();
							while(iter.hasNext()){
								String key =iter.next();
								if(key!="LISTRECORD"&&!key.equals("LISTRECORD")){
									if(listPd.get(i).get(key)==null){
										jsonObject.put(key, "");
									}else{
										jsonObject.put(key, listPd.get(i).get(key).toString());
									}
								}else{//拆分还款记录
									if(listPd.get(i).get(key)!=null){
										PageData detail = spiltString(listPd.get(i).get(key).toString());
										Iterator<String> it = detail.keySet().iterator();
										while(it.hasNext()){
											String str =it.next();
											jsonObject.put(str, detail.get(str).toString());
										}
									}
								}
							}
							jsonObjects.add(jsonObject);
						}
					}
					map.put(tableName, jsonObjects);
				}
			}
		}catch(Exception e){
			logger.info("生成jsonObjects失败!");
			logger.error(e.getMessage());
		}
		return JSONObject.fromObject(map);
	}

	//对贷款表和贷记卡表中还款记录进行单独处理
	private PageData spiltString(String str){
		PageData pd = new PageData();
		for(int i=0;i<str.length();i++){
			String name = "retst"+(1+i);
			pd.put(name, str.charAt(i));
		}
		return pd;
	}
	
	//添加需要查询数据的表名
	private List<String> addTableName(){
		List<String> listTableName = new ArrayList<String>();
		listTableName.add("ApPbcMain");
		listTableName.add("ApPbcPerriside");
		listTableName.add("ApPbcPeroccup");
		listTableName.add("ApPbcCreditSummar");
		listTableName.add("ApPbcMaligantInfo");
		listTableName.add("ApPbcCreditLoanInfoBean");
		listTableName.add("ApPbcLoanListBean");
		listTableName.add("ApPbcCreditListBean");
		listTableName.add("ApPbcEspecialDetailBean");
		listTableName.add("ApPbcMaligantDetailBean");
		listTableName.add("ApPbcHouseFundBean");
		listTableName.add("ApPbcqueriedgeneralBean");
		listTableName.add("ApPbcQueriedRecordBean");
		listTableName.add("ApPbcWarrantDetailBean");
		listTableName.add("ApPbcPensioninsuranceBean");
		listTableName.add("ApPbcWarrantDetailCredit");
		return listTableName;
	}
		
}
