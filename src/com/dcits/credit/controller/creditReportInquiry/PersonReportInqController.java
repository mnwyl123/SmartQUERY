package com.dcits.credit.controller.creditReportInquiry;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import com.dcits.platform.util.*;
import net.lingala.zip4j.exception.ZipException;

import org.apache.commons.io.FileUtils;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.xhtmlrenderer.css.style.derived.StringValue;

import com.dcits.credit.entity.FtpUtil;
import com.dcits.credit.service.creditReportInquiry.PersonReportInqManager;
import com.dcits.credit.util.CompressUtils;
import com.dcits.credit.util.ObjectUtil;
import com.dcits.credit.util.PasswordOper;
import com.dcits.credit.util.UserUtil;
import com.dcits.credit.util.XmlToHtml;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Org;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.role.RoleAuthFactory;

/** 
 * 个人征信报告查询
 * 创建人：liyanay
 * 创建时间：2017-06-26
 */
@Controller
@RequestMapping(value="/PersonReportInquiry")
public class PersonReportInqController extends BaseController {
	private static Logger logger = Logger.getLogger(PersonReportInqController.class);
	String menuUrl = "PersonReportInquiry/list.do"; //菜单地址(权限用)
	@Resource(name="PersonReportInqService")
	private PersonReportInqManager PersonReportInqService;
	private RoleAuthFactory roleAtuhFactory;
	public static Map<String,Map<String,String>> allDicName = ObjectUtil.dicMap(null);
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, Jurisdiction.getUsername()+"列表CreditInquiry");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String ORG_ID="";
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String USERNAME = user.getUSERNAME();
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
		if(roleIds.size()>0) {
			pd.put("roleIds", roleIds.get(0).toString());
		}else {
			pd.put("roleIds", "");
		}
		pd.put("CLIENT_TYPE", "1");//个人
		pd.put("USERID", USERID);
		pd.put("USERNAME", USERNAME);
		pd.put("ORG_ID", ORG_ID);
		/*if (!"".equals(pd.get("QUERY_TIME")) && pd.get("QUERY_TIME") !=null) {
			//	and B.QUERY_TIME >=to_date( '#{pd.QUERY_TIME} 00:00:00','yyyy/MM/dd hh24:mi:ss') 
			//	and B.QUERY_TIME <=to_date( '#{pd.QUERY_TIME} 23:59:59','yyyy/MM/dd hh24:mi:ss') 
			pd.put("QUERY_TIME", "B.QUERY_TIME >=to_date('#{pd.QUERY_TIME} 00:00:00','yyyy/MM/dd hh24:mi:ss') and B.QUERY_TIME <=to_date('#{pd.QUERY_TIME} 23:59:59','yyyy/MM/dd hh24:mi:ss')");
		}*/
		
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
		int currentPage;
		if(pd.getString("currentPage") == null) {
			currentPage = 0;
		}else {
			currentPage = Integer.parseInt(pd.getString("currentPage"));
		}
		 
		page.setPd(pd);
		List<PageData>varList=new ArrayList<PageData>();
		try{
			varList = PersonReportInqService.list(page);
			if(varList.size()==0){
				page.setCurrentPage(currentPage);
				varList = PersonReportInqService.listHis(page);
			}
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

		mv.setViewName("credit/creditReportInquiry/personReportInq_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",roleAtuhFactory.getHC(roleIds,menuId));
		return mv;
	}
	/**查看征信报告
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	@ResponseBody
	public Object goEditC() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> map = new HashMap<String,Object>();
		String ID=pd.getString("ID");
		String IS_COM=pd.getString("IS_COM");
		PageData serverInfo=new PageData();
	        try{
	 		serverInfo = BaseController.getServerInfo();
	        }catch(Exception e){
				logger.error(e.getMessage());
		}
	    String fileName = ID+".html";
	    String filePath=Const.FILEPATHIMG+ID+"/"+fileName;
	    //判断文件是否存在
	    File file = new File(com.dcits.crawl.util.PathUtil.getClasspath() + filePath);
	    if(file.exists()){
	    	delFile(com.dcits.crawl.util.PathUtil.getClasspath() + Const.FILEPATHIMG+ID);
	    }
	    String localPath =PathUtil.getClasspath() + Const.FILEPATHIMG;
	    String itemPath = com.dcits.crawl.util.PathUtil.getClasspath() + Const.FILEPATHIMG;
	    String zipFileName=ID+".zip";
		logger.debug("CompressUtils.unZip("+localPath+zipFileName+","+itemPath+","+ID.substring(0,6)+");");
        CompressUtils.unZip(localPath+zipFileName,itemPath,ID.substring(0,6));

        try {
	    	String htmlpath= itemPath+ID+"/"+ID;
	    	 logger.debug("htmlpath"+htmlpath);
        	
        	
    		String xslFileName = PathUtil.getClasspath() + Const.XSL + "XMLtoTHML_P_new.xsl";
    		String htmlFileName = PathUtil.getClasspath() + Const.HTML  + "tmp"+DateUtil.getSdftimes() + ".html";
    		File xmlFile = new File(htmlpath+".xml");
    		File htmlFile = new File(htmlFileName);
    		OutputStreamWriter htmlWriter = new OutputStreamWriter(new FileOutputStream(htmlFile),"UTF-8");
    		InputStreamReader xmlReader=null;
    		if(xmlFile.exists()){
    			xmlReader = new InputStreamReader(new FileInputStream(xmlFile),"UTF-8");
    			TransformerFactory tFac = TransformerFactory.newInstance();
        		Source xslSource = new StreamSource(xslFileName);
        		Transformer t = tFac.newTransformer(xslSource);
        		Source source = new StreamSource(xmlReader);
        		Result result = new StreamResult(htmlWriter);
        		t.transform(source, result);
        		IS_COM = "false";
    		}else{
        		IS_COM = "true";
    		}
    		File fromfile = new File(htmlFileName);
        	File toFile = new File(htmlpath+".html");
        	String content = FileUtils.readFileToString(fromfile,"UTF-8");
        	if(content==null||"".equals(content)){
        		content = FileUtils.readFileToString(toFile,"UTF-8");
        	}
//        	 logger.debug("content"+content);
        	FileUtil.writeFile(htmlpath+".html", "","UTF-8");
        	content = content.replace("张三提供", Jurisdiction.getUsername());
        	String regexp = "<span name=\"\\d{4}\">[a-zA-Z0-9]{1,}</span>";
        	Pattern p = Pattern.compile(regexp);
        	Matcher m = p.matcher(content);
        	while(m.find()){
        		String group = m.group();
        		content = content.replaceAll(group, findDicNumAndCode(group));
        	}
        	content = content.replace("a8b7037f48cf4924a2a62b9e048f7d3ea6d2b0c985a540279085e38db3f05163", ID);
        	OutputStream os = new FileOutputStream(toFile);
        	if(IS_COM.equals("true")){
            	os.write(content.getBytes("UTF-8"));
        	}else{

            	os.write(content.getBytes("GBK"));
        	}
        	os.flush();
        	os.close();
    		
        	delFile(htmlFileName); 
    		try {
    			htmlWriter.flush();
    			if(xmlReader!=null){
    			xmlReader.close();}
    			htmlWriter.close();
    		} catch (Exception e) {
    			logger.error(e.getMessage(),e);
    		}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			logger.debug("eeeeeeeeeeeeee"+e);
		}
        map.put("filePath", filePath); 				//返回结果
        map.put("result", "sucess");				//返回结果
		return AppUtil.returnObject(pd, map);
	}
	
	/**是否打印标记
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/isPrint")
	@ResponseBody
	public String isPrint(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
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
		Map<String, String> str =roleAtuhFactory.getHC(roleIds,menuId);
		logger.debug("str"+str);
		if(!str.containsKey("downLoad")) {
			return "fail";
		}
		pd = this.getPageData();
		Map<String,Object> map = new HashMap<String,Object>();
		String ID=pd.getString("ID");
		String state  = "";
		try {
		PageData pda = PersonReportInqService.findPrintNum();
		PageData pdb = PersonReportInqService.findActualNum(pd);
		int printNum = Integer.parseInt(pda.getString("VALUE"));//先查询系统中设置的打印次数
		int actualNum = Integer.parseInt(pdb.getString("IS_PRINT"));//实际打印次数
			if(actualNum<printNum){//实际打印次数小于设置次数
				actualNum++;
				pd.put("IS_PRINT", String.valueOf(actualNum));
				PersonReportInqService.updateIsPrint(pd);
				state = "success";
			}else{
				state =  "fail";
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return state;
	}
	private int Integer(String findPrintNum) {
		// TODO Auto-generated method stub
		return 0;
	}
	/**
	 * 删除文件
	 * @param path
	 */
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
    private static String findDicNumAndCode(String spanContent){
    	try {
			if(!StringUtil.isEmpty(spanContent) && spanContent.contains("<span name=")){
				if("2019".equals(spanContent.substring(spanContent.indexOf("\"")+1,spanContent.lastIndexOf("\"")))){
//					System.out.println(11);
				}
				String name = findDicName(
						spanContent.substring(spanContent.indexOf("\"")+1,spanContent.lastIndexOf("\"")),
						spanContent.substring(spanContent.indexOf(">")+1,spanContent.lastIndexOf("<"))
						);
				if(name != null){
					return name;
				}else{
					return spanContent.substring(spanContent.indexOf(">")+1,spanContent.lastIndexOf("<"));
				}
			}
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
    	return spanContent.substring(spanContent.indexOf(">")+1,spanContent.lastIndexOf("<"));
    }
    /**
     * 根据字典编号和字典编码获取字典值
     * @param num
     * @param code
     * @return
     * @throws Exception
     */
    private static String findDicName(String num,String code) throws Exception{
    	if(allDicName.get(num) instanceof Map){
    		return allDicName.get(num).get(code);
    	}else{
    		return null;
    	}
    }
}
