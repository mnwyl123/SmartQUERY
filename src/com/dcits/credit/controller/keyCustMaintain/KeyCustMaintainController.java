package com.dcits.credit.controller.keyCustMaintain;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.credit.service.keyCustMaintain.KeyCustMaintainManager;
import com.dcits.credit.util.PasswordOper;
import com.dcits.credit.util.ReadExcel;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Org;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.FileDownload;
import com.dcits.platform.util.FileUpload;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.ObjectExcelRead;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;
import com.dcits.platform.util.role.RoleAuthFactory;
/** 
 * 类名称：重点关注客户维护
 * 创建人：FH 
 * 创建时间：
 * @version
 */
@Controller
@RequestMapping(value="/KeyCustMaintain")
public class KeyCustMaintainController extends BaseController {

	String menuUrl = "KeyCustMaintain/list.do"; //菜单地址(权限用)
	@Resource(name="KeyCustMaintainService")
	private KeyCustMaintainManager KeyCustMaintainService;
	private RoleAuthFactory roleAtuhFactory;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表KeyCustMaintain");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		Org curOrg = (Org) session.getAttribute(USERID+Const.SESSION_ORG);
		String menuId = pd.getString("menuId");
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("COMPANY", company); 
		page.setPd(pd);
		List<PageData>	varList = KeyCustMaintainService.list(page);	//
		mv.setViewName("credit/keyCustMaintain/keyCustMaintain_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",roleAtuhFactory.getHC(roleIds,menuId));	//按钮权限
		return mv;
	}
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增重点关注客户");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String date =new SimpleDateFormat("yyyyMMdd").format(new Date());
		pd.put("DATA_DATE",date);
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String USER_NAME=user.getNAME();
		Org org=(Org)session.getAttribute(USERID+Const.SESSION_ORG);
		String ORG_CODE=org.getOrgCode();
		String ORG_NAME=org.getName();
		String ORG_ID=org.getOrgId();
		PageData map = KeyCustMaintainService.findId(pd);
		String maxId="";
		String a = map.getString("FIND_ID");
		if(map.getString("FIND_ID") != null){
			maxId=(map.getString("FIND_ID")).toString();
			maxId="00000000"+maxId.toString();
			maxId=maxId.substring(maxId.length()-8,maxId.length());
		}else{
			maxId="00000001";
		}
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("COMPANY", company); 
		String CUST_NO=date+ORG_CODE+maxId;
		pd.put("CUST_NO",CUST_NO );
		pd.put("USER_NAME",USER_NAME );
		pd.put("ORG_NAME", ORG_NAME);
		KeyCustMaintainService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 * @param ORG_ID
	 * @param
	 * @throws Exception 
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object delete(@RequestParam String CUST_NO) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除重点关注客户");
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String) session.getAttribute(USERID+"sessionComp");
		String errInfo = "success";
		KeyCustMaintainService.delete(pd);	//执行删除账户表
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改重点关注客户");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();	
		KeyCustMaintainService.update(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@SuppressWarnings("null")
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String) session.getAttribute(USERID+"sessionComp");
		pd.put("COMPANY", company);
		//mv.addObject("pd",pd);
		mv.setViewName("credit/keyCustMaintain/keyCustMaintain_add");
		mv.addObject("msg", "save");
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		pd = KeyCustMaintainService.findById(pd);	//根据ID读取
		mv.addObject("pd",pd);
		mv.setViewName("credit/keyCustMaintain/keyCustMaintain_add");
		mv.addObject("msg", "edit");
		return mv;
	}	
	
	 /**去详情页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goDetail")
	public ModelAndView goDetail()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		pd = KeyCustMaintainService.findById(pd);	//根据ID读取
		mv.addObject("pd",pd);
		mv.setViewName("credit/keyCustMaintain/keyCustMaintain_detail");
		mv.addObject("msg", "edit");
		return mv;
	}	
	
	/**打开上传EXCEL页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goUploadExcel")
	public ModelAndView goUploadExcel()throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("credit/keyCustMaintain/uploadexcel");
		return mv;
	}
	
	/**下载模版
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/downExcel")
	public void downExcel(HttpServletResponse response)throws Exception{
		FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.FILEPATHFILE + "keyCust.xls", "keyCust.xls");
	}
	
	/**从EXCEL导入到数据库
	 * @param file
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping(value="/readExcel")
	@ResponseBody
	public Object readExcel(
			@RequestParam(value="excel",required=false) MultipartFile file
			) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String COMPANY = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		PageData pd = new PageData();
		pd.put("COMPANY", COMPANY);
		String RuserName="";
		String CuserName="";
		String msg = "error";
	//	if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;}
		if (null != file && !file.isEmpty()) {
			String filePath = PathUtil.getClasspath() + Const.FILEPATHFILE;								//文件上传路径
			String fileName =  FileUpload.fileUp(file, filePath, "userexcel");							//执行上传
			List<PageData> listPd = (List)ObjectExcelRead.readExcel(filePath, fileName, 2, 0, 0);		//执行读EXCEL操作,读出的数据导入List 2:从第3行开始；0:从第A列开始；0:第0个sheet
			存入数据库操作======================================
			pd.put("LAST_LOGIN", "");
			pd.put("IP", "");
			pd.put("SKIN", "default");
			pd.put("PWD_ALTER_TIME", "");
			pd.put("STATE", "0");
			pd.put("LOCK_STATUS", "0");
			for(int i=0;i<listPd.size();i++){
				pd.put("USER_ID", this.get32UUID());
				pd.put("USERNAME", listPd.get(i).getString("var0"));
				pd.put("NAME", listPd.get(i).getString("var1"));
				pd.put("PHONE", listPd.get(i).getString("var2"));
				pd.put("EMAIL", listPd.get(i).getString("var3"));
				pd.put("TELLER_NUMBER", listPd.get(i).getString("var4"));
				pd.put("DEPT_CODE", listPd.get(i).getString("var5"));				
				KeyCustMaintainService.save(pd);
			}
			msg= "success";
		}
		map.put("msg",msg);
		return AppUtil.returnObject(new PageData(), map);
	}*/
	/**
	 * /**从EXCEL导入到数据库
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/readExcel")
	@ResponseBody
	public Object readExcel(
			@RequestParam(value="excel",required=false) MultipartFile file
			){
		Map<String,Object> map1 = new HashMap<String,Object>();
		//Page page = new Page();
		PageData pd =pd = this.getPageData();
		String msg = null;
		String date =new SimpleDateFormat("yyyyMMdd").format(new Date());
		pd.put("DATA_DATE",date);
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String USER_NAME=user.getNAME();
		Org org=(Org)session.getAttribute(USERID+Const.SESSION_ORG);
		String ORG_CODE=org.getOrgCode();
		String ORG_NAME=org.getName();
		String ORG_ID=org.getOrgId();
		String company = (String) session.getAttribute(USERID+"sessionComp");
		pd.put("COMPANY", company);
		//StringBuffer sb = new StringBuffer();
		//int cnt = 0; //读取的excel的记录是否已经存在
		try {
			List<Map<String, String>> list = ReadExcel.getExcelContent(file.getInputStream(),file.getOriginalFilename());
			Map<String, String> pdMap = null;
			for(int i=0; i<list.size(); i++){
				PageData map = KeyCustMaintainService.findId(pd);
				String maxId="";
				if(map.size() != 0){
					maxId=(map.getString("FIND_ID")).toString();
					maxId="00000000"+maxId.toString();
					maxId=maxId.substring(maxId.length()-8,maxId.length());
				}else{
					maxId="00000001";
				}
				String CUST_NO=date+ORG_CODE+maxId;
				pd.put("CUST_NO",CUST_NO );
				pd.put("USER_NAME",USER_NAME );
				pd.put("ORG_NAME", ORG_NAME);
				pdMap = list.get(i);
				for(String key : pdMap.keySet()){
					pd.put(key, pdMap.get(key));
				}
				pd.put("CLIENT_TYPE",map.get("CLIENT_TYPE")=="个人"?"1":"2");
				KeyCustMaintainService.save(pd);
			}
			msg = "success";
		} catch (IOException e1) {
			msg = "error";
		} catch (Exception e1) {
			msg = "error";
		}
		map1.put("msg", msg);
		return AppUtil.returnObject(new PageData(), map1);		
	}
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	
	
	
}
