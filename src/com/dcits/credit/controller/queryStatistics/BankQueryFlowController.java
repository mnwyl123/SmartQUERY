package com.dcits.credit.controller.queryStatistics;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.credit.entity.ReadAccess;
import com.dcits.credit.service.queryStatistics.BankQueryFlowManager;
import com.dcits.credit.util.ReadExcel;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Org;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.org.OrgManager;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.DESUtil;
import com.dcits.platform.util.FileUpload;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.ObjectExcelRead;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;
import com.dcits.platform.util.role.RoleAuthFactory;

/** 
 * 说明：人行查询流水统计
 * 创建人：  
 * 创建时间：2017-06-30
 */
@Controller
@RequestMapping(value="/BankQueryFlow")
public class BankQueryFlowController extends BaseController {
	
	String menuUrl = "BankQueryFlow/list.do"; //菜单地址(权限用)
	
	@Resource(name="BankQueryFlowService")
	private BankQueryFlowManager BankQueryFlowService;
	@Resource(name="orgService")
	private OrgManager orgService;
	private RoleAuthFactory roleAtuhFactory;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, Jurisdiction.getUsername()+"列表BankQueryFlow");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		/*String DATA_DATE=(String) pd.get("DATA_DATE");
		if(pd.get("DATA_DATE")==null){
			pd.put("DATA_DATE", " ");
		}*/
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		Org curOrg = (Org) session.getAttribute(USERID+Const.SESSION_ORG);
		String menuId = pd.getString("menuId");
		pd.put("COMPANY", company);
		if(pd.get("REPORT_TYPE")==null){
			pd.put("REPORT_TYPE", "企业信用报告银行标准版");
		}
		page.setPd(pd);
		List<Org> orgList=new ArrayList<Org>();
		try {
			orgList = orgService.listAllOrgByCompany(company);
		} catch (Exception e1) {
			logger.error(e1.getMessage(),e1);
		}
		List<PageData> varList=new ArrayList<PageData>();
		List<PageData> varCount=new ArrayList<PageData>();
//		if(pd.get("REPORT_TYPE").equals("企业信用报告银行标准版")){
		    try{
			     varList = BankQueryFlowService.comQuerylist(page);	//
			     varCount = BankQueryFlowService.comDataCountPage(pd);
			}catch(Exception e){
				logger.error(e.getMessage(),e);
			}
//		}
//		if(pd.get("REPORT_TYPE").equals("个人信用报告银行标准版")){
//		    try{
//			     varList = BankQueryFlowService.list(page);	//
//			}catch(Exception e){
//				logger.error(e.getMessage(),e);
//			}
//		}
		int count=0;
		for(PageData var:varCount){
			Integer i= Integer.parseInt(String.valueOf(var.get("QUERY_COUNT")));
			count=count+i;
		}
		mv.setViewName("credit/queryStatistic/bankQueryFlow_list");
		pd.put("ORG_ID", pd.get("ORG_ID"));
		mv.addObject("varList", varList);
		mv.addObject("orgList", orgList);
		mv.addObject("pd", pd);
		mv.addObject("count", count);
		mv.addObject("QX",roleAtuhFactory.getHC(roleIds,menuId));	//按钮权限
		return mv;
	}
	 /**去详情页面
		 * @param
		 * @throws Exception
		 */
		@RequestMapping(value="/goDetail")
		public ModelAndView goEdit(Page page)throws Exception{
			ModelAndView mv = this.getModelAndView();
			PageData pd = new PageData();
			pd = this.getPageData();
			
			Session session = Jurisdiction.getSession();
			User user = (User)session.getAttribute(Const.SESSION_USER);
			String USERID = user.getUSER_ID();
			String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
			pd.put("COMPANY", company);
			
			page.setPd(pd);
			List<PageData>varList=new ArrayList<PageData>();
			if(pd.get("REPORT_TYPE")!=null){
				if(pd.get("REPORT_TYPE").equals("企业信用报告银行标准版")){
				    try{
					     varList = BankQueryFlowService.comDetailList(page);	//
					}catch(Exception e){
						logger.error(e.getMessage());
					}
				}
				if(pd.get("REPORT_TYPE").equals("个人信用报告银行标准版")){
					try{
						varList=BankQueryFlowService.detailList(page);	//
						/*if(varList.size()==0){
							varList=BankQueryFlowService.detailListHis(page);
						}*/
					}catch(Exception e){
							logger.error(e.getMessage());
					}
				}
			}
			mv.setViewName("credit/queryStatistic/bankQueryFlowDetail_list");
			mv.addObject("varList", varList);
			mv.addObject("msg", "edit");
			mv.addObject("pd", pd);
			return mv;
		}	
	
	/**打开上传EXCEL页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goUploadExcel")
	public ModelAndView goUploadExcel(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("credit/queryStatistic/uploadAccess");
		return mv;
	}
	/**从EXCEL导入到数据库
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/readExcel")
	@ResponseBody
	public Object readExcel(
			@RequestParam(value="excel",required=false) MultipartFile file
			){
		Map<String,Object> map = new HashMap<String,Object>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String COMPANY = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		String msg = "success";
		PageData pd = new PageData();
		pd.put("COMPANY", COMPANY);
		try{
			if (null != file && !file.isEmpty()) {
				String fileName1 = file.getOriginalFilename().substring(0,file.getOriginalFilename().lastIndexOf("."));
				String filePath = PathUtil.getClasspath() + Const.FILEPATHFILE;								//文件上传路径
				String fileName =  FileUpload.fileUp(file, filePath, fileName1);
				filePath=filePath+fileName;
				List<PageData> listPd=(List)ReadAccess.readFileACCESS(filePath,fileName1);
				logger.debug("导入的数据量大小："+listPd.size()+"行------------------------");
				//存入数据库操作======================================
				
				if(listPd.size()>0){
					StringBuffer sql = new StringBuffer();
					sql.append("insert into CIFM_BANK_QUERY_FLOW (TRADE_NO,TRADE_TIME,HQ_INSTITUTION_CODE,HQ_INSTITUTION_NAME,BRANCH_CODE,BRANCH_NAME,BRANCH_LOCATION,USER_NAME,REPORT_TYPE,CONSUMPTION_NUM,PRODUCT_DES1,PRODUCT_DES2,PRODUCT_DES3,PRODUCT_DES4,FRI_ORG_NAME,SEC_ORG_NAME,THR_ORG_NAME,FOUR_ORG_NAME,FIV_ORG_NAME,SIX_ORG_NAME,COMPANY)");
					int num = listPd.size()%1000;
					//重复次数
					int count = listPd.size()/1000;
					for(int i=0;i<count;i++){
						StringBuffer sqlV = new StringBuffer();
						for(int j=i*1000;j<(i+1)*1000;j++){
							StringBuffer values = new StringBuffer();
							for(int t=1;t<21;t++){
								if(t==11||t==13){
									values.append("'"+DESUtil.encrypt("enhjeA==", String.valueOf(listPd.get(j).get("var"+t)))+"',");
								}else{
									values.append("'"+String.valueOf(listPd.get(j).get("var"+t))+"',");
								}		
							}
							values.append("'"+COMPANY+"'");
							sqlV.append(" SELECT "+ values+" FROM DUAL UNION ALL");
						}
						//数据入库
						String insertSql = sql.toString()+sqlV.toString().substring(0, sqlV.length()-9);
						pd.put("insertSql", insertSql);
						try {
							BankQueryFlowService.bachSave(pd);
						} catch (Exception e) {
							msg= "error";
							logger.error(e.getMessage(),e);
							logger.info("数据入库失败！");
							break;
						}
					}
					if(num>0){
						StringBuffer sqlV = new StringBuffer();
						for(int i=count*1000;i<count*1000+num;i++){
							StringBuffer values = new StringBuffer();
							for(int t=1;t<21;t++){
								if(t==11||t==13){
									values.append("'"+DESUtil.encrypt("enhjeA==", String.valueOf(listPd.get(i).get("var"+t)))+"',");
								}else{
									values.append("'"+String.valueOf(listPd.get(i).get("var"+t))+"',");
								}
								
							}
							values.append("'"+COMPANY+"'");
							sqlV.append(" SELECT "+ values+" FROM DUAL UNION ALL");
						}
						//数据入库
						String insertSql = sql.toString()+sqlV.toString().substring(0, sqlV.length()-9);
						pd.put("insertSql", insertSql);
						try {
							BankQueryFlowService.bachSave(pd);
						} catch (Exception e) {
							msg= "error";
							logger.error(e.getMessage(),e);
							logger.info("数据入库失败！");
						}
					}
				}
				/*for(int i=0;i<listPd.size();i++){
					pd.put("TRADE_NO", );
					pd.put("TRADE_TIME", listPd.get(i).getString("var2"));
					pd.put("HQ_INSTITUTION_CODE", listPd.get(i).getString("var3"));
					pd.put("HQ_INSTITUTION_NAME", listPd.get(i).getString("var4"));
					pd.put("BRANCH_CODE", listPd.get(i).getString("var5"));
					pd.put("BRANCH_NAME", listPd.get(i).getString("var6"));
					pd.put("BRANCH_LOCATION", listPd.get(i).getString("var7"));
					pd.put("USER_NAME", listPd.get(i).getString("var8"));
					pd.put("REPORT_TYPE", listPd.get(i).getString("var9"));
					pd.put("CONSUMPTION_NUM", listPd.get(i).getString("var10"));
					pd.put("PRODUCT_DES1", listPd.get(i).getString("var11"));
					pd.put("PRODUCT_DES2", listPd.get(i).getString("var12"));
					pd.put("PRODUCT_DES3", listPd.get(i).getString("var13"));
					pd.put("PRODUCT_DES4", listPd.get(i).getString("var14"));
					pd.put("FRI_ORG_NAME", listPd.get(i).getString("var15"));
					pd.put("SEC_ORG_NAME", listPd.get(i).getString("var16"));
					pd.put("THR_ORG_NAME", listPd.get(i).getString("var17"));
					pd.put("FOUR_ORG_NAME", listPd.get(i).getString("var18"));
					pd.put("FIV_ORG_NAME", listPd.get(i).getString("var19"));
					pd.put("SIX_ORG_NAME", listPd.get(i).getString("var20"));
					try{
					BankQueryFlowService.save(pd);
					}catch(Exception e){
						logger.error(e.getMessage());
					}
				}*/
			}
		}catch(Exception e){
			logger.error(e.getMessage(), e);
			msg="error";
		}

		map.put("msg",msg);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	
	public static void main(String[] args){
		//System.out.println(1000/1000);
	}
}
