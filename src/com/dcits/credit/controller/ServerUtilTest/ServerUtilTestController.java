package com.dcits.credit.controller.ServerUtilTest;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.dcits.credit.service.ServerUtil.ServerUtilManager;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.PageData;

/** 
 * 个人征信信用卡中心接口
 * 创建人：zhangyy
 * 创建时间：2017-06-26
 */
@Component
@Path("/ServerUtil")
public class ServerUtilTestController extends BaseController {
	private static Logger logger = Logger.getLogger(ServerUtilTestController.class);
	
	@Resource(name="serverUtil")
	private ServerUtilManager serverUtil;
	
	@Transactional
	@POST
	@Path("/query")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public JSONObject goClawerPerson(InputStream is)throws Exception{
		BufferedReader reader = new BufferedReader(new InputStreamReader(
				is, "utf-8"));
		String lines = reader.readLine();// 读取请求结果
		JSONObject jsonData = new JSONObject();
		PageData pd = new PageData();
		try{
			jsonData = JSONObject.fromObject(lines);
			pd.put("CLIENT_NAME", jsonData.getString("CLIENT_NAME"));
			pd.put("CREDENTIALS_TYPE", jsonData.getString("CREDENTIALS_TYPE"));
			pd.put("CREDENTIALS_NO", jsonData.getString("CREDENTIALS_NO"));
			pd.put("QUERY_REASON", jsonData.getString("QUERY_REASON"));
			pd.put("USERNAME", jsonData.getString("USERNAME"));
			pd.put("CHANNEL_ID", jsonData.getString("CHANNEL_ID"));
		}catch(Exception e){
			logger.error(e.getMessage());
			//返回结果
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("code", "-1");
			map.put("message", "交易失败!");
			map.put("reportid", "");
			map.put("root", "null");
			map.put("success", "false");
			map.put("idType", "null");
			map.put("idNbr", "null");
			map.put("name", "null");
			map.put("queryReason", "null");
			map.put("querytime", new SimpleDateFormat("yyyy.MM.dd HH:mm:ss").format(new Date()));
			map.put("raw", "null");
			map.put("total", "0");
			return JSONObject.fromObject(map);
		}
		try{
			jsonData = serverUtil.returnCrawlerInfo(pd);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
 		return jsonData;
	}
}
