package com.dcits.platform.controller.base;


import java.io.IOException;
import java.util.Properties;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.Logger;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.UuidUtil;

/**
 * @author pengyj   
 * 修改时间：2015、12、11
 */
public class BaseController {
	
	protected Logger logger = Logger.getLogger(this.getClass());

	private static final long serialVersionUID = 6357869213649815390L;
	/**
     * 配置文件名称
     */
	private static String CONFIG_PROP_NAME = "appConfig.properties";
	
	/**
	 * 服务器配置文件
	 * 
	 */
	private static String SERVER_IFNO="Server-LoginInfo.properties";
	/**
	 * 查看报文接口配置文件
	 */
	private static String REPORT_INTEFACE = "Find-Report.properties";
	/**
	 * 爬虫线程池配置文件
	 * 
	 */
	private static String wbqqSpider="wbqqSpider.properties";
	
	/** new PageData对象
	 * @return
	 */
	public PageData getPageData(){
		return new PageData(this.getRequest());
	}
	
	/**得到ModelAndView
	 * @return
	 */
	public ModelAndView getModelAndView(){
		return new ModelAndView();
	}
	
	/**得到request对象
	 * @return
	 */
	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		return request;
	}

	/**得到32位的uuid
	 * @return
	 */
	public String get32UUID(){
		return UuidUtil.get32UUID();
	}
	
	/**得到分页列表的信息
	 * @return
	 */
	public Page getPage(){
		return new Page();
	}
	
	public static void logBefore(Logger logger, String interfaceName){
		logger.info("");
		logger.info("start");
		logger.info(interfaceName);
	}
	
	public static void logAfter(Logger logger){
		logger.info("end");
		logger.info("");
	}
	
	//单用户登录配置文件读取
	public static String getPropertiesValue(String key) throws IOException {
		Properties properties = new Properties();

		properties.load(BaseController.class.getClassLoader()
				.getResourceAsStream(CONFIG_PROP_NAME));

		String value = (String) properties.get(key);

		return value;
	}
	
	//读取服务器配置信息
	public static PageData getServerInfo() throws IOException{
		PageData pd = new PageData();
		Properties properties = new Properties();

		properties.load(BaseController.class.getClassLoader()
				.getResourceAsStream(SERVER_IFNO));
		Set<Object> keys = properties.keySet();
		for(Object obj : keys){
			String key = (String)obj;
			String value = (String)properties.get(key);
			pd.put(key, value);
		}
		return pd;
	}
	//读取服务器配置信息
	public static PageData getPoolInfo(){
		PageData pd = new PageData();
		Properties properties = new Properties();
		try {
			properties.load(BaseController.class.getClassLoader()
					.getResourceAsStream(wbqqSpider));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Set<Object> keys = properties.keySet();
		for(Object obj : keys){
			String key = (String)obj;
			String value = (String)properties.get(key);
			pd.put(key, value);
		}
		return pd;
	}
	/**
	 * 读取配置信息(传入配置文件的文件名，返回一个PageData)
	 * @param filename
	 * @return
	 */
	public static PageData getPropertiesByFileName(String filename){
		PageData pd = new PageData();
		Properties properties = new Properties();
		try {
			properties.load(BaseController.class.getClassLoader()
					.getResourceAsStream(filename));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Set<Object> keys = properties.keySet();
		for(Object obj : keys){
			String key = (String)obj;
			String value = (String)properties.get(key);
			pd.put(key, value);
		}
		return pd;
	}
		
}
