package com.dcits.credit.controller.MacheChange;

import java.io.File;
import java.io.PrintWriter;
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

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.credit.entity.FileTool;
import com.dcits.credit.entity.FtpUtil;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.MacheChange.MacheChangeManager;
import com.dcits.credit.service.crawler.PersonCrawlerManager;
import com.dcits.credit.service.dataSubmission.IDataSubmissionService;
import com.dcits.credit.util.PasswordOper;
import com.dcits.credit.util.crawler.personCredit.CrawlerInfo;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;
import com.dcits.platform.util.role.RoleAuthFactory;


/** 
 * 类名称：MacheChangeController
 * 创建人：zhangyy
 * 说明：机器变更审核页面
 * @version
 */
@Controller
@RequestMapping(value="/macheChange")
public class MacheChangeController extends BaseController {
	private RoleAuthFactory roleAtuhFactory;
	@Resource(name="macheService")
	private MacheChangeManager macheService;
	
	/**待审核信息列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listMache")
	public ModelAndView listMache(Page page){
 		ModelAndView mv = this.getModelAndView();
 		PageData pd = this.getPageData();
 		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("COMPANY", company); 
		//权限查询
		String menuId = pd.getString("menuId");
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		Map<String,String> map = roleAtuhFactory.getHC(roleIds,menuId);
		
		try{
			page.setPd(pd);
			List<PageData> listInfo = macheService.queryAllRecord(page);
			mv.addObject("listInfo", listInfo);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		mv.addObject("pd", pd);
		mv.setViewName("credit/MacheChange/MacheChange_list");
		mv.addObject("QX",map);
		return mv;
	}
	
	/**审核
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goCheck")
	public ModelAndView goCheck(){
 		ModelAndView mv = this.getModelAndView();
 		PageData pd = this.getPageData();
 		try{
 			pd = macheService.queryById(pd);
 			mv.addObject("pd", pd);
 		}catch(Exception e){
 			logger.error(e.getMessage());
 		}
 		mv.setViewName("credit/MacheChange/MacheChange_Info");
		return mv;
	}
	
	
	/**保存审核信息
	 * @param pd
	 * @return 
	 * @throws Exception
	 */
	@Transactional
	@RequestMapping(value="/saveCheck")
	public ModelAndView saveCheck(){
		ModelAndView mv = this.getModelAndView();
   		PageData pd = this.getPageData();
   		//获取审核时间
 		pd.put("UPDATE_TIME", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
 		try{
 			macheService.updateRecord(pd);
 			if("1".equals(pd.getString("STATUS"))){
 				macheService.updateUser(pd);
 			}
 		}catch(Exception e){
 			logger.error(e.getMessage());
 		}
 		mv.setViewName("save_result");
		return mv;
	}
	
	
	/**删除审核信息
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public ModelAndView delete(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			macheService.delete(pd);
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage(),e);
		}
		mv.setViewName("save_result");
		return mv;
		
	}
}
