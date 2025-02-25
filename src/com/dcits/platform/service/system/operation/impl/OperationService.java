package com.dcits.platform.service.system.operation.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Formatter;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Service;

import com.dcits.credit.util.crawler.personCredit.CrawlerInfo;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.operation.OperationManager;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.UuidUtil;

@Service("operationService")
public class OperationService implements OperationManager{
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	private static Logger logger = Logger.getLogger(OperationService.class);
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("OperationMapper.listPage", page);
	}
	
	// 获取MAC地址
	public String getMac(String ip){ 
		String sMAC = ""; 
//		if(!"127.0.0.1".equals(ip)){
//			try {
//				Process p = Runtime.getRuntime().exec("nbtstat -a 10.202.17.154");
//				InputStreamReader ir = new InputStreamReader(p.getInputStream());
//				BufferedReader reader = new BufferedReader(ir);
//				String nextLine;
//				for(String line = reader.readLine();line!=null;line = nextLine){
//					System.out.println(line);
//					nextLine = reader.readLine();
//					if(line.indexOf("MAC")<=0){
//						continue;
//					}
//					int i=line.indexOf("=")+2;
//					sMAC = line.substring(i);
//				}
//				reader.close();
//				p.waitFor();
////				LineNumberReader input = new LineNumberReader(ir);
////				for(int i=0;i<100;i++){
////					String str = input.readLine();
////					if(str!=null){
////						if(str.indexOf("MAC")>1){
////							sMAC = str.substring(str.indexOf("=")+2,str.length());
////							break;
////						}
////					}
////				}
//			} catch (Exception e) {
//				logger.error(e.getMessage());
//			}
//		}else{
			Formatter formatter = new Formatter(); 
			  try{ 
			      InetAddress address = InetAddress.getLocalHost(); 
			      NetworkInterface ni = NetworkInterface.getByInetAddress(address); 
			      byte[] mac = ni.getHardwareAddress(); 
			      
			      for (int i = 0; i < mac.length; i++) { 
			          sMAC = formatter.format(Locale.getDefault(), "%02X%s", mac[i], 
			                  (i < mac.length - 1) ? "-" : "").toString(); 
			      } 
			  }catch(Exception e){ 
				  logger.error(e.getMessage());
			  }finally{
				  formatter.close();
			  }
//		}
		return sMAC;
	} 
	
	//添加日志
	public void operationLog(String url,String operation){
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		PageData oper = (PageData) session.getAttribute(USERID+Const.SESSION_LoginInfo);
		oper.put("OPERATION_TIME",  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		oper.put("OPERATION_DESC", operation);
		oper.put("LOG_ID", UuidUtil.get32UUID());
		oper.put("OPERATION_URL", url);
		try {
			addLog(oper);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//向数据库中插入数据
	@Override
	public void addLog(PageData pd)throws Exception{
		dao.save("OperationMapper.addLog", pd);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, String>> excelExport(Map<String, String> map) throws Exception {
		return (List<Map<String, String>>)dao.findForList("OperationMapper.excelExport", map);
	}
}
