package com.dcits.credit.controller.test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.credit.controller.rest.util.RequestReportUtil;
import com.dcits.credit.service.EnterAppReview.EntAppReManager;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.creditAcctManage.PwdExpireRemindManager;
import com.dcits.credit.service.personInquiry.PersonInquiryManager;
import com.dcits.credit.service.rest.PerCreditInterfaceManage;
import com.dcits.credit.service.rest.PersonInterfaceService;
import com.dcits.credit.util.CompressUtils;
import com.dcits.credit.util.ObjectUtil;
import com.dcits.credit.util.XmlParseUtil;
import com.dcits.credit.util.XmlToHtml;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Org;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.DESUtil;
import com.dcits.platform.util.FileUtil;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;
import com.dcits.platform.util.StringUtil;
import com.dcits.platform.util.UuidUtil;
import com.dcits.platform.util.ZipStrUtil;

import net.lingala.zip4j.exception.ZipException;
import net.sf.json.JSONObject;


@Controller
@RequestMapping(value="/test")
public class test extends BaseController{
	private static Logger logger = Logger.getLogger(test.class);
	
	@Resource(name="indAppReService")
	private IndAppReManager indAppReService;
	@Resource(name="entAppReService")
	private EntAppReManager entAppReService;
	@Resource(name="PersonInquiryService")
	public PersonInquiryManager personInquiryService;
	@Resource(name="personInterfaceService")
	private PersonInterfaceService personInterfaceService;
	@Resource(name="testService")
	private testManager testService;
	private static String encoding = "UTF-8";
	@Resource(name="PwdExpireRemindService")
	private PwdExpireRemindManager pwdExpireRemindService;
	@Autowired
    private PerCreditInterfaceManage perCreditInterfaceManage;

	
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String ORG_ID="";
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		try{
			Org org=(Org)session.getAttribute(USERID+Const.SESSION_ORG);
			ORG_ID=org.getOrgId();
			}catch(Exception e){
				logger.error(e.getMessage());
		}
		String company = (String) session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("COMPANY", company);
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		if(menuId!=null&&!menuId.equals(null)){
			session.setAttribute(USERID+"menuFunGroup", menuId);
		}else{
			menuId = (String) session.getAttribute(USERID+"menuFunGroup");
		}
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("CLIENT_TYPE", "1");//个人
		pd.put("USERID", USERID);
		pd.put("ORG_ID", ORG_ID);
		String CLIENT_NAME = pd.getString("CLIENT_NAME");
		String CREDENTIALS_NO = pd.getString("CREDENTIALS_NO");
		if(CLIENT_NAME != null&&!CLIENT_NAME.equals("")) {
			CLIENT_NAME = DESUtil.encrypt("enhjeA==", CLIENT_NAME);
			pd.put("CLIENT_NAME", CLIENT_NAME);
		}
		if(CREDENTIALS_NO != null&&!CREDENTIALS_NO.equals("")) {
			CREDENTIALS_NO = DESUtil.encrypt("enhjeA==", CREDENTIALS_NO);
			pd.put("CREDENTIALS_NO", CREDENTIALS_NO);
		}
		page.setPd(pd);
		List<PageData>varList=new ArrayList<PageData>();
		try{
			varList = testService.list(page);
			}catch(Exception e){
				logger.error(e.getMessage());
			}	
		if(CLIENT_NAME != null&&!CLIENT_NAME.equals("")) {
			CLIENT_NAME = DESUtil.decrypt("enhjeA==", CLIENT_NAME);
			pd.put("CLIENT_NAME", CLIENT_NAME);
		}
		if(CREDENTIALS_NO != null&&!CREDENTIALS_NO.equals("")) {
			CREDENTIALS_NO = DESUtil.decrypt("enhjeA==", CREDENTIALS_NO);
			pd.put("CREDENTIALS_NO", CREDENTIALS_NO);
		}
		int size = varList.size();
		for(int i=0;i<size;i++) {
			CLIENT_NAME = varList.get(i).getString("CLIENT_NAME");
			CREDENTIALS_NO = varList.get(i).getString("CREDENTIALS_NO");
			CLIENT_NAME = DESUtil.decrypt("enhjeA==", CLIENT_NAME);
			CREDENTIALS_NO = DESUtil.decrypt("enhjeA==", CREDENTIALS_NO);
			varList.get(i).put("CLIENT_NAME", CLIENT_NAME);
			varList.get(i).put("CREDENTIALS_NO", CREDENTIALS_NO);
		}
		mv.setViewName("credit/creditReportInquiry/test_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		return mv;
	}
	
	@RequestMapping(value="/old_list")
	public ModelAndView old_list(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String ORG_ID="";
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		try{
			Org org=(Org)session.getAttribute(USERID+Const.SESSION_ORG);
			ORG_ID=org.getOrgId();
			}catch(Exception e){
				logger.error(e.getMessage());
		}
		String company = (String) session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("COMPANY", company);
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		if(menuId!=null&&!menuId.equals(null)){
			session.setAttribute(USERID+"menuFunGroup", menuId);
		}else{
			menuId = (String) session.getAttribute(USERID+"menuFunGroup");
		}
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("CLIENT_TYPE", "1");//个人
		pd.put("USERID", USERID);
		pd.put("ORG_ID", ORG_ID);	
		page.setPd(pd);
		List<PageData>varList=new ArrayList<PageData>();
		try{
			varList = testService.oldlist(page);
			}catch(Exception e){
				logger.error(e.getMessage());
			}	

		mv.setViewName("credit/creditReportInquiry/old_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		return mv;
	}
	@RequestMapping(value="/goEdit")
	@ResponseBody
	public Object goEditC() throws ZipException{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> map = new HashMap<String,Object>();
		String ID=pd.getString("ID");
		String id=pd.getString("ID");
		String REPORT_ID=pd.getString("REPORT_ID");
		String USER_SYS_ID=pd.getString("USER_SYS_ID");
		String NAME=pd.getString("NAME");
	    String fileName = ID+".xml";
	    String filePath=Const.FILEPATHIMG+ID+"/"+fileName;
	    String localPath =PathUtil.getClasspath() + Const.FILEPATHIMG;
	    String zipFileName=ID+".zip";
	    String xml = "";
	    logger.debug("CompressUtils.unZip("+localPath+zipFileName+","+localPath+","+ID.substring(0,6)+");");
        CompressUtils.unZip(localPath+zipFileName,localPath,ID.substring(0,6));
        
        
	    //判断文件是否存在
	    File file = new File(PathUtil.getClasspath() + filePath);
	    FileReader fileReader;
		try {
			fileReader = new FileReader(file);
			BufferedReader br = new BufferedReader(fileReader);
		    StringBuilder sb = new StringBuilder();
		    String str = "";
		    try {
				while((str = br.readLine()) != null){
					sb.append(str+"\n");
				}
				br.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		   
		    xml = sb.toString();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			testService.deletePER_BASIC(pd);
			testService.deletePER_OTHER_IDENTITY(pd);
			testService.deletePER_PHONE_INFO(pd);
			testService.deletePER_SPOU(pd);
			testService.deletePER_LIVE(pd);
			testService.PER_CAREER(pd);
			testService.PER_LOAN_SUMMARY(pd);
			testService.PER_LOAN_PROMPT_DETAIL(pd);
			testService.PER_RECOVER_INFO_DETAIL(pd);
			testService.PER_OVERDUE_SUMMARY_INFO(pd);
			testService.PER_LOAN_REPAYER(pd);
			testService.PER_AFTER_PAY_OWE_INFO(pd);
			testService.PER_PUBLIC_SUMMARY_INFO(pd);
			testService.PER_QUERY_SUMMARY(pd);
			testService.PER_LOAN_DETAIL(pd);
			testService.PER_CUR_M24_SHOW_INFO(pd);
			testService.PER_CUR_Y5_SHOW_INFO(pd);
			testService.PER_SPECIAL_TRADE(pd);
			testService.PER_SPECIAL_CASE_INFO(pd);
			testService.PER_LARGE_DIVIDE_INFO(pd);
			testService.PER_LABEL_INFO(pd);
			testService.PER_CRED_BASE_INFO(pd);
			testService.PER_REPAYER(pd);
			testService.PER_AFTER_PAY_INFO(pd);
			testService.PER_OWE_TAXES(pd);
			testService.PER_VERDICT(pd);
			testService.PER_INFORCE(pd);
			testService.PER_PENALTIES(pd);
			testService.PER_PROVIDENT_FUND_PAY(pd);
			testService.PER_LOW_SECURITY(pd);
			testService.PER_QUALIFICATION(pd);
			testService.PER_ADMINI_REWARD(pd);
			testService.PER_WHOLE_LABEL_INFO(pd);
			testService.PER_QUERY_DETAIL(pd);
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
		String path = PathUtil.getClasspath() + Const.FILEPATHIMG ;
		String xmlPath = path + id + "/"+ id + ".xml";; //xml报告路径
		String htmlPath = path + id + "/"+ id + ".html"; //html报告路径
		String ftpFileName = id + ".zip"; //ftp服务器存放报告的文件名
		String localFilePath = path + ftpFileName; //压缩文件路径
		String tmpPath = null; //临时文件

		try {
			List<PageData> reportTabAndCol = indAppReService.findReportTabAndCol();
			XmlParseUtil.allCol = ObjectUtil.listToMap(reportTabAndCol, "XML_TAG", "COLUMN_NAME");
			XmlParseUtil.allTab = ObjectUtil.listToMap(reportTabAndCol, "XML_TAG", "TABLE_NAME");
			PageData pd2 = XmlParseUtil.xmlToPd(xml,"1");
			//数据单独入库方法 返回report_id后面要用到
			String report_id = data_save(pd2,"1",indAppReService);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		List<String> dicList = indAppReService.queryXmlDic();
		XmlToHtml.allDicName = ObjectUtil.dicMap(dicList);
		XmlToHtml.encoding = encoding;
		//生成xml报告
		FileUtil.writeFile(xmlPath,xml,encoding); 
		//转换成html报告
		try {
			tmpPath = XmlToHtml.convertXmlToHtml(xmlPath,"1"); 
			XmlToHtml.dictHtml(htmlPath, tmpPath,id,USER_SYS_ID+NAME);
			XmlToHtml.encoding = encoding;
			//生成xml报告
 			FileUtil.writeFile(xmlPath,xml,encoding);
			delFile(tmpPath); //删除替换数据字典前的html页面
			//报告存放本地，将本地报告加密加压保存
			String zipPasswd=id.substring(0,6);
			CompressUtils.zip(path  + id +"/",localFilePath, true, zipPasswd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		JSONObject returnJson = null;
		try {
			returnJson = personInterfaceService.getJsonByReportidInInter(REPORT_ID,"0");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String Str = returnJson.toString();
		logger.debug("+++++++++++++++++++++++++++++++++++"+ Str );
		
        map.put("filePath", filePath); 				//返回结果
        map.put("result", "sucess");				//返回结果
		return AppUtil.returnObject(pd, map);
	}
	@RequestMapping(value="/add")
	@ResponseBody
	public Object add() throws ZipException{
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		List<PageData> list = new ArrayList<>();
		try {
            //查询过期剩余天数下所有账号
            list = pwdExpireRemindService.queryhistAccount(map);
            if(!CollectionUtils.isEmpty(list)){
                for (PageData pageData:list) {
                    String REPORT_ID = String.valueOf(pageData.get("REPORT_ID"));
                    map.put("REPORT_ID",REPORT_ID);
                    pwdExpireRemindService.saveY5(map);
                    pwdExpireRemindService.saveM24(map);
                    pwdExpireRemindService.savepld(map);
                    pwdExpireRemindService.delY5(map);
                    pwdExpireRemindService.delM24(map);
                    pwdExpireRemindService.delpld(map);
                }
            }
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
        }
        map.put("result", "sucess");				//返回结果
		return AppUtil.returnObject(pd, map);
	}
	
	@RequestMapping(value="/enquiry")
	@ResponseBody
	public Object enquiry() throws ZipException{
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		logger.debug("++++++++++++++++++++++++++影像信息补充开始++++++++++++++++++++++++++++");
		try {
            //读取共享目录下的txt文件
        	String path = PathUtil.getClasspathurl();
        	//String path = "C:\\Users\\Administrator\\Desktop\\zdc";
        	String[] pathStr = path.split(";");
        	for (int i = 0; i < pathStr.length; i++) {
        		logger.debug("++++++++++++++++++++++++++开始扫描路径"+pathStr[i]+"下的所有文件");
	            File file = new File(pathStr[i]);
	            if (file.exists()) {
	                if(!getTxt(file)) {
	                	map.put("result", "fail");				//返回结果
	            		return AppUtil.returnObject(pd, map);
	                }
	            }else{
	                logger.debug("共享目录不存在");
	            }
        	}
        }catch (Exception e){
            e.printStackTrace();
            logger.debug("!!!!!!!!!更新失败!!!!!!!!!"+e);
            map.put("result", "fail");				//返回结果
    		return AppUtil.returnObject(pd, map);
        }
		logger.debug("++++++++++++++++++++++++++影像信息补充结束++++++++++++++++++++++++++++");
        map.put("result", "success");				//返回结果
		return AppUtil.returnObject(pd, map);
	}
	public boolean getTxt(File all) throws FileNotFoundException {
        //将全部txt存到list中
        List allPath = getFile(all);
        List<PageData> list = new ArrayList<>();
        // 读取txt内容 并转换成List
        for(int i = 0 ;i <allPath.size();i++){
            File file = new File(""+allPath.get(i));
            return txt2String(file,list);
        }
		return true;
    }
	public static List getFile(File file) {
        List listLocal = new ArrayList<>();
            File[] fileArray = file.listFiles();
            if (fileArray != null) {
                for(File name : fileArray) {
                    String s = name.toString();
                    if(s.endsWith("HIST.txt")) {
                        if(name.isFile()) {
                            listLocal.add(name);
                        }
                    }
                }
            }
        logger.debug("++++++++++++++++++++++++++此路径下所有文件名"+listLocal);
        return listLocal;
    }
	public boolean txt2String(File file,List<PageData> list){
		int i = 0;
    	String FILENAME = file.getName();
    	PageData pd = new PageData();
    	pd.put("FILENAME",FILENAME);
        try{
        	List<PageData> urllist = perCreditInterfaceManage.findByFile(pd);
        	if(urllist.size()>0) {
        		perCreditInterfaceManage.deleteIdUrl(pd);
        	}
        	List<PageData> urlDtalist = perCreditInterfaceManage.findByFileHistData(pd);
        	if(urlDtalist.size()>0) {
        		perCreditInterfaceManage.deleteUrlHistData(pd);
        	}
        }catch(Exception e){
            e.printStackTrace();
            logger.debug("!!!!!!!!!对比历史记录报错!!!!!!!!!报错信息："+e);
            return false;
        }
        try{
            BufferedReader br=new BufferedReader(new InputStreamReader(new FileInputStream(file),"utf-8"));
            String s = null;
            while((s = br.readLine())!=null){//使用readLine方法，一次读一行
            	i++;
            	
                String[] str = s.split("\\|");
                PageData data = new PageData();
                if(str.length>=6) {
                	//被查询人姓名
                    data.put("CLIENT_NAME",DESUtil.encrypt("enhjeA==", str[0]));
                    //证件类型
                    data.put("CREDENTIALS_TYPE",str[1]);
                    //证件号码
                    data.put("CREDENTIALS_NO",DESUtil.encrypt("enhjeA==", str[2]));
                    //申请时间
                    data.put("APPLICATION_TIME",str[3]);
                    //类型
                    data.put("TYPE_NO",str[4]);
                    //地址
                    data.put("ADDRESS_INFO",str[5]);
                    //来源文件名
                    data.put("FILENAME",FILENAME);
                    list.add(data);
                }
            	
                if(list.size()>=50000) {
                	try{
	                	if(!CollectionUtils.isEmpty(list)){
	        	        	logger.debug("++++++++++++++++++++++++++开始更新");
	        	            //通过流水号更新流程状态表
	        	            for (PageData pd1:list ) {
	        	            	List<PageData> URLlist = perCreditInterfaceManage.findByDATE(pd1);
	        	            	if(URLlist.size()>0) {
	        	            		for (PageData pg:URLlist ) {
	        	            			pd1.put("ID", pg.get("id"));
	        	                		perCreditInterfaceManage.updateURLHISTDATA(pd1);
	        	                        perCreditInterfaceManage.updateByDate(pd1);
	        	                        logger.debug("++++++++++++++++++++++++++更新成功");
	        	            		}
	        	            	}else {
	        	            		perCreditInterfaceManage.updateURLHISTDATA(pd1);
	        	            	}
	        	            }
	        	        }else {
	        	        	logger.debug("++++++++++++++++++++++++++无更新内容");
	        	        }
	                	list.clear();
	                }catch(Exception e){
	    	            e.printStackTrace();
	    	            logger.debug("!!!!!!!!!文件的内容如入库报错!!!!!!!!!报错信息："+FILENAME+"++++"+e);
	    	            return false;
	    	        }
                }
            }
            logger.debug("++++++++++++++++++++++++++文件"+FILENAME+"共读取数据"+i+"条");
            try{
	            if(!CollectionUtils.isEmpty(list)){
		        	logger.debug("++++++++++++++++++++++++++开始更新");
		            //通过流水号更新流程状态表
		            for (PageData pd1:list ) {
		            	List<PageData> URLlist = perCreditInterfaceManage.findByDATE(pd1);
		            	if(URLlist.size()>0) {
		            		for (PageData pg:URLlist ) {
		            			pd1.put("ID", pg.get("id"));
		                		perCreditInterfaceManage.updateURLHISTDATA(pd1);
		                        perCreditInterfaceManage.updateByDate(pd1);
		                        logger.debug("++++++++++++++++++++++++++更新成功");
		            		}
		            	}else {
		            		perCreditInterfaceManage.updateURLHISTDATA(pd1);
		            	}
		            }
		        }else {
		        	logger.debug("++++++++++++++++++++++++++无更新内容");
		        }
	            list.clear();
	        }catch(Exception e){
	            e.printStackTrace();
	            logger.debug("!!!!!!!!!文件的内容如入库报错!!!!!!!!!报错信息："+FILENAME+"++++"+e);
	            return false;
	        }
            
            br.close();
        }catch(Exception e){
            e.printStackTrace();
            logger.debug("!!!!!!!!!读取txt文件的内容!!!!!!!!!报错信息："+FILENAME+"第"+i+"行出现错误"+e);
            return false;
        }
        String newpath = null;
        try{
            logger.debug("++++++++++++++++++++++++转存开始+++++++++++++++++++++++++");
            newpath = PathUtil.getClasspathurlhist();
            logger.debug("++++++++++++++++++++++++++将文件"+FILENAME+"转存至"+newpath);
            FileInputStream fis = null;
            FileOutputStream fos = null;
            fis = new FileInputStream(file);
            fos = new FileOutputStream(new File(newpath+file.getName()));
            byte[] bs = new byte[50];
            int count=0;
            while((count=fis.read(bs))!=-1) {
            	fos.write(bs,0,count);
            	fos.flush();
            }
            fis.close();
            fos.close();
            file.delete();
            logger.debug("++++++++++++++++++++++++++++转存结束++++++++++++++++++++++++++++");
        }catch(Exception e){
            e.printStackTrace();
            logger.debug("!!!!!!!!!将文件"+FILENAME+"转存至"+newpath+"报错!!!!!!!!!报错信息："+e);
            return false;
        }
        return true;
    }
	public void updatedata(List<PageData> Datalist){
		try {
			if(!CollectionUtils.isEmpty(Datalist)){
	        	logger.debug("++++++++++++++++++++++++++开始更新");
	            //通过流水号更新流程状态表
	            for (PageData pd1:Datalist ) {
	            	List<PageData> URLlist = perCreditInterfaceManage.findByDATE(pd1);
	            	if(URLlist.size()>0) {
	            		for (PageData pg:URLlist ) {
	            			pd1.put("ID", pg.get("id"));
	                		perCreditInterfaceManage.updateURLHISTDATA(pd1);
	                        perCreditInterfaceManage.updateByDate(pd1);
	                        logger.debug("++++++++++++++++++++++++++更新成功");
	            		}
	            	}else {
	            		perCreditInterfaceManage.updateURLHISTDATA(pd1);
	            	}
	            }
	        }else {
	        	logger.debug("++++++++++++++++++++++++++无更新内容");
	        }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			logger.debug("!!!!!!!!!插入数据报错!!!!!!!!!报错信息："+e);
		}
	}
	private static void delFile(String path){
		try {
			if(!StringUtil.isEmpty(path)){
				File file = new File(path);
				if(file.exists()){
					if(file.isFile()){
						file.delete();
					}else if(file.isDirectory()){
						File[] arrFile = file.listFiles();
						for(File fi : arrFile){
							delFile(fi.getAbsolutePath());
						}
						file.delete();
					}
				}
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
	}
	
	public static String data_save(PageData pd,String authType,IndAppReManager indAppReService) {
		String report_id = null;
		//落库
		try {
			List<String> tabNameList = new ArrayList<String>();
			for(Object obj : pd.keySet()){
				tabNameList.add((String) obj);
			}
			List<PageData> tabColList = indAppReService.queryColOfTab(tabNameList);
			Map<String,String> colOfTab  = ObjectUtil.listToMap(tabColList, "TAB", "COL");
			Map<String, List<String>> colList_map = initList(indAppReService);
			StringBuffer sql = new StringBuffer();
			for(Object obj : pd.keySet()){
				sql.setLength(0); //将sql清空
				String tab_name = (String) obj;
				Object tab_val = pd.get(tab_name);
				if(tab_val instanceof PageData){
					PageData data = (PageData) tab_val;
					if(report_id==null) report_id = data.getString("REPORT_ID");
					sql.append(dataToSQL(colList_map, colOfTab,data,tab_name));
				}else if(tab_val instanceof List){
					List<PageData> data = (List) tab_val;
					try {
						sql.append(dataToSQL(colList_map,colOfTab, data,tab_name));
					} catch (Exception e) {
						// TODO: handle exception
						logger.info(e);	
						logger.error(e);	
					}
					
				}else{
					logger.error("解析人行返回的xml文件得到的数据，表名为【"+tab_name+"】的数据类型不是PageData或者List的形式，请检查！！");
					logger.info("解析人行返回的xml文件得到的数据，表名为【"+tab_name+"】的数据类型不是PageData或者List的形式，请检查！！");
					//System.out.println("解析人行返回的xml文件得到的数据，表名为【"+tab_name+"】的数据类型不是PageData或者List的形式，请检查！！");
				}
				indAppReService.publicSave(sql.toString());
			}
		} catch (Exception e) {
			logger.info("数据落库出错，",e);
			logger.error("数据落库出错，",e);
		}
		//将数据库中存入的本次报告中的数据字典列由中文转为CODE存到列2中（一二代通用）
		oneDictToTwo(indAppReService,report_id,authType);	
		return report_id;
	}
	private static String dataToSQL(Map<String, List<String>> colList_map,Map<String,String> colOfTab,List<PageData> data,String tab_name){
		String cols = colOfTab.get(tab_name);
		StringBuffer sql = new StringBuffer("insert into "+tab_name+"("+cols+") ");
		String[] arrCols = cols.split(",");
		int n=0;
		if(colList_map.containsKey(tab_name)){
			for(PageData pd : data){
				if(n>0) sql.append(" union all ");
				sql.append(" select ");
				for(int i=0;i<arrCols.length;i++){
					if(colList_map.get(tab_name).contains(arrCols[i])){
						if(i>0) sql.append(",");
						String str = String.valueOf(pd.get(arrCols[i])).replace("null", "");
						str = DESUtil.encrypt("enhjeA==", str);
						sql.append("'"+str+"'");
					}else{
						if(i>0) sql.append(",");
						sql.append("'"+String.valueOf(pd.get(arrCols[i])).replace("null", "").replace("\\", "\\\\").replace("'", "\\'")+"'");
					}
				}
				sql.append(" from dual ");
				n++;
			}
		}else{
			for(PageData pd : data){
				if(n>0) sql.append(" union all ");
				sql.append(" select ");
				for(int i=0;i<arrCols.length;i++){
					if(i>0) sql.append(",");
					sql.append("'"+String.valueOf(pd.get(arrCols[i])).replace("null", "").replace("\\", "\\\\").replace("'", "\\'")+"'");
				}
				sql.append(" from dual ");
				n++;
			}
		}
		return sql.toString();       
	}
	public static Map<String,List<String>> initList(IndAppReManager indAppReService){
		Map<String,List<String>> retMap = new HashMap<String,List<String>>();		
		List<PageData> tableCol = indAppReService.queryTableColData(); //查询出需要加密的表名和字段名
		Map<String, String> map =new HashMap<>();
		try {
			map=ObjectUtil.listToMap(tableCol, "TABLE_NAME", "COL_NAME");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(Object object : map.keySet()){
			String key = (String) object;
			String val = String.valueOf(map.get(key));
		    String[] col= val.split(",");
		    List<String> col_string=java.util.Arrays.asList(col);
		    retMap.put(key, col_string);
		}
		return retMap;
	}
	public static void oneDictToTwo(IndAppReManager indAppReService,String report_id,String authType){
		PageData pd = new PageData();
		if(authType.equals("1")){
			pd.put("type", "PER");
		}else{
			pd.put("type", "COM");
		}		
		try {
			List<PageData> tabColList = new ArrayList<PageData>();
			tabColList = indAppReService.findAllTabName2(pd);
			String updateSql = null;
			PageData sqlPd = new PageData();
			for(PageData tabCol:tabColList){
				updateSql="update "+tabCol.getString("TABLE_NAME")+" set "
			               +tabCol.getString("COLUMN_NAME")+"2"
				           +"='"+tabCol.getString("COLUMN_NAME")+"'"
				           +" where report_id = '"+report_id+"'";														
				sqlPd.put("updateSql", updateSql);
				indAppReService.updateInfo(sqlPd);					
			}	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			
	}
private static String dataToSQL(Map<String, List<String>> colList_map,Map<String,String> colOfTab,PageData data,String tab_name){
		
		String cols = colOfTab.get(tab_name);
		StringBuffer sql = new StringBuffer("insert into "+tab_name+"("+cols+") values (");
		String[] arrCols = cols.split(",");
	    Map<String,String> tableColMap = new HashMap<String,String>();		    
//	    try {
//			tableColMap=ObjectUtil.listToMap(tableCol, "TABLE_NAME", "COL_NAME");
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	     Map<String, List<String>> colList_map=new HashMap<String, List<String>>();
//	   for(String key:tableColMap.keySet()){
//		   String colList=tableColMap.get(key);
//		   String[] col= colList.split(",");
//		   List<String> col_string=java.util.Arrays.asList(col);
//		   colList_map.put(key, col_string);	   
//	   }
	   
	   if(colList_map.containsKey(tab_name)){
		   for(int i=0;i<arrCols.length;i++){
			   if(colList_map.get(tab_name).contains(arrCols[i])){
				   if(i>0) 
					   sql.append(",");
				   String str = String.valueOf(data.get(arrCols[i])).replace("null", "");
					str = DESUtil.encrypt("enhjeA==", str);
				   sql.append("'"+str+"'");
			   }else{
				if(i>0)
					sql.append(",");
				sql.append("'"+String.valueOf(data.get(arrCols[i])).replace("null", "").replace("\\", "\\\\").replace("'", "\\'")+"'");
			}
		   }
	   }else{	  
		for(int i=0;i<arrCols.length;i++){
			if(i>0) sql.append(",");
			sql.append("'"+String.valueOf(data.get(arrCols[i])).replace("null", "").replace("\\", "\\\\").replace("'", "\\'")+"'");
		}
		}
		sql.append(")");
		return sql.toString();       
	}
}
