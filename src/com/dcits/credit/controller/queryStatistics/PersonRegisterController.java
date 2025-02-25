package com.dcits.credit.controller.queryStatistics;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.credit.controller.creditReportInquiry.PersonReportInqController;
import com.dcits.credit.service.queryStatistics.PersonRegisterManager;
import com.dcits.credit.util.CompressUtils;
import com.dcits.credit.util.PasswordOper;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Org;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.org.OrgManager;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.DESUtil;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.Logger;
import com.dcits.platform.util.ObjectExcelView;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;
import com.dcits.platform.util.StringUtil;
import com.dcits.platform.util.role.RoleAuthFactory;

import net.lingala.zip4j.exception.ZipException;

/** 
 * 说明：个人征信登记簿
 * 创建人：  
 * 创建时间：2017-06-30
 */
@Controller
@RequestMapping(value="/PersonRegister")
public class PersonRegisterController extends BaseController {
	private static Logger logger = Logger.getLogger(PersonRegisterController.class);
	String menuUrl = "PersonRegister/list.do"; //菜单地址(权限用)
	
	@Resource(name="PersonRegisterService")
	private PersonRegisterManager PersonRegisterService;
	@Resource(name="orgService")
	private OrgManager orgService;
	private RoleAuthFactory roleAtuhFactory;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表PersonRegister");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		String menuId = pd.getString("menuId");
		String username = user.getUSERNAME();
		if(username.startsWith("admin")){
			pd.put("USERID", null);
		}else{
			pd.put("USERID", USERID);
		}
		pd.put("company", company);
		if(pd.getString("sign")==null){
			pd.put("sign", "1");		
		}
		if(pd.getString("APPLICATION_TIME")==null){
			String systime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			pd.put("APPLICATION_TIME", systime);
		}
		String CLIENT_NAME = pd.getString("CLIENT_NAME");
		String CREDENTIALS_NO = pd.getString("CREDENTIALS_NO");
		if(CLIENT_NAME != null&&!CLIENT_NAME.equals("")) {
			CLIENT_NAME = DESUtil.encrypt("enhjeA==", CLIENT_NAME);
			pd.put("CLIENT_NAME", CLIENT_NAME);
		}
		if(CREDENTIALS_NO != null&&!CREDENTIALS_NO.equals("")) {
			pd.put("CREDENTIALSNO", CREDENTIALS_NO);
			CREDENTIALS_NO = DESUtil.encrypt("enhjeA==", CREDENTIALS_NO);
			pd.put("CREDENTIALS_NO", CREDENTIALS_NO);
		}
		page.setPd(pd);		
		List<PageData>	varList = PersonRegisterService.list(page);	//
		/*if(varList.size()==0){
			varList = PersonRegisterService.listHis(page);
		}*/
		if(CLIENT_NAME != null&&!CLIENT_NAME.equals("")) {
			CLIENT_NAME = DESUtil.decrypt("enhjeA==", CLIENT_NAME);
			pd.put("CLIENT_NAME", CLIENT_NAME);
		}
		if(CREDENTIALS_NO != null&&!CREDENTIALS_NO.equals("")) {
			CREDENTIALS_NO = DESUtil.decrypt("enhjeA==", CREDENTIALS_NO);
			pd.put("CREDENTIALS_NO", CREDENTIALS_NO);
		}
		mv.setViewName("credit/queryStatistic/personRegister_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",roleAtuhFactory.getHC(roleIds,menuId));	//按钮权限
		return mv;
	}
	/**查看影像资料
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/view")
	public ModelAndView getPerHistoryInfo(){
 		PageData appInfo = new PageData();
 		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData>	varList = null;
		String URL ;
		String dUrl  ;
		String ID = pd.getString("ID");
		String fileName = "WARRANT"+".pdf";
	    String filePath=Const.FILEPATHIMG+ID+"/"+fileName;
	    //判断文件是否存在
	    File file = new File(com.dcits.crawl.util.PathUtil.getClasspath() + filePath);
	    if(file.exists()){
	    	delFile(com.dcits.crawl.util.PathUtil.getClasspath() + Const.FILEPATHIMG+ID);
	    }
	    String localPath ="/private1/SGC/" + Const.FILEPATHIMG;
	    String itemPath = com.dcits.crawl.util.PathUtil.getClasspath() + Const.FILEPATHIMG;
	    String zipFileName=ID+".zip";
		logger.debug("CompressUtils.unZip("+localPath+zipFileName+","+itemPath+","+ID.substring(0,6)+");");
        try {
			CompressUtils.unZip(localPath+zipFileName,itemPath,ID.substring(0,6));
		} catch (ZipException e1) {
			logger.error(e1.getMessage());
		}

		try{
			varList = PersonRegisterService.findViewById(pd);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		if(varList != null) {
			int size = varList.size();
			for(int i=0;i<size;i++) {
				URL = varList.get(i).getString("APPLICATION_URL");
				if(!URL.startsWith("https%")) {
					try {
						dUrl = URLDecoder.decode(URL, "utf-8");
						varList.get(i).put("APPLICATION_URL", dUrl);
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						logger.error(e.getMessage());
					}
				}
			}
		}
		
		mv.setViewName("credit/queryStatistic/view_Info");
		mv.addObject("pd", pd);
		mv.addObject("varList", varList);
		mv.addObject("appInfo", appInfo);
		return mv;
	}
	/**导出用户信息到EXCEL
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel(){
		ModelAndView mv = this.getModelAndView();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		Page page = new Page();
		PageData pd = this.getPageData();
		String username = user.getUSERNAME();
		if(username.startsWith("admin")){
			pd.put("USERID", null);
		}else{
			pd.put("USERID", USERID);
		}
		pd.put("company", company);
		if(pd.getString("sign")==null){
			pd.put("sign", "1");
		}
		if(pd.getString("APPLICATION_TIME")==null){
			String systime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			pd.put("APPLICATION_TIME", systime);
		}
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

		try{
		//	if(Jurisdiction.buttonJurisdiction(menuUrl, "cha")){
				String keywords = pd.getString("keywords");				//关键词检索条件
				if(null != keywords && !"".equals(keywords)){
					pd.put("keywords", keywords.trim());
				}
				Map<String,Object> dataMap = new HashMap<String,Object>();
				List<String> titles = new ArrayList<String>();
				titles.add("序号");
				titles.add("被查询人姓名"); 		//1
				titles.add("证件类型");			//2
				titles.add("证件号码");  //3
				titles.add("查询原因");			//4
				titles.add("查询申请人");			//5
				titles.add("内部授权人");			//6
				titles.add("查询员");		//7
				titles.add("是否打印信用报告");
				titles.add("查询时间");	//8
				titles.add("查询方式");		//9
				titles.add("是否查得");	//10
				titles.add("备注");	//10
				dataMap.put("titles", titles);

				PageData pd1=new PageData();
				pd1.put("DIC_CODE", "CRED_TYPE");
				//证件类型转码
				List<PageData> credTypeList= PersonRegisterService.findcredType(pd1);
				Map<Object, Object> credTypeMap= new HashMap<Object,Object>();
				for (int i = 0; i < credTypeList.size(); i++) {
					Map<String,Object> credTypeMap1 = credTypeList.get(i);
					credTypeMap.put(credTypeMap1.get("DICT_CODE"), credTypeMap1.get("NAME"));
				}
				//查询原因转码
				pd1.put("DIC_CODE", "FIND_REASON");
				List<PageData> findReasonList= PersonRegisterService.findcredType(pd1);
				Map<Object, Object> findReasonMap= new HashMap<Object,Object>();
				for (int i = 0; i < findReasonList.size(); i++) {
					Map<String,Object> findReasonMap1 = findReasonList.get(i);
					findReasonMap.put(findReasonMap1.get("DICT_CODE"), findReasonMap1.get("NAME"));
				}

				List<PageData> registerList = PersonRegisterService.listAll(page);
				List<PageData> varList = new ArrayList<PageData>();
				for(int i=0;i<registerList.size();i++){
					String NO=i+1+"";
					PageData vpd = new PageData();
					vpd.put("var1", NO);		//0
					vpd.put("var2", registerList.get(i).get("CLIENT_NAME"));		//1
					 String credType=(String)credTypeMap.get(registerList.get(i).get("CREDENTIALS_TYPE"));
					vpd.put("var3", credType);			//2
					//vpd.put("var3", registerList.get(i).get("CREDENTIALS_TYPE"));			//2
					vpd.put("var4", registerList.get(i).get("CREDENTIALS_NO"));			//3
					//vpd.put("var5", registerList.get(i).get("QUERY_REASON"));			//3
					vpd.put("var5", (String)findReasonMap.get(registerList.get(i).get("QUERY_REASON")));			//3
					vpd.put("var6", registerList.get(i).get("CUST_MANAGER"));		//4
					vpd.put("var7", registerList.get(i).get("CHECK_SYS_NAME"));		//5
					vpd.put("var8",registerList.get(i).get("USER_NAME"));	//6
					vpd.put("var9", registerList.get(i).get("IS_PRINT"));
					vpd.put("var10", registerList.get(i).get("APPLICATION_TIME"));	 		//7
					vpd.put("var11",registerList.get(i).get("STATUS"));	//8
					vpd.put("var12", registerList.get(i).get("IS_GET"));	 		//9
					vpd.put("var13", registerList.get(i).get("REMARKS"));	 		//9
					varList.add(vpd);
				}
				dataMap.put("varList", varList);
				ObjectExcelView erv = new ObjectExcelView();					//执行excel操作
				mv = new ModelAndView(erv,dataMap);
		//	}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	/**去添加备注
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goRemark")
	public ModelAndView goEditC() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("credit/queryStatistic/personRegister_edit");
		mv.addObject("msg", "PersonRegister");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 保存备注
	 */
	@RequestMapping(value="/editC")
	public ModelAndView editU() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PersonRegisterService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
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
}
