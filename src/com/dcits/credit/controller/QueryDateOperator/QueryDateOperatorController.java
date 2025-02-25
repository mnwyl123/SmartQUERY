package com.dcits.credit.controller.QueryDateOperator;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.credit.service.QueryDateOperatorService.QueryDateOperatorManager;
import com.dcits.credit.util.UserUtil;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.role.RoleAuthFactory;


/** 
 * 类名称：QueryDateOperatorController
 * 创建人：zhangyy
 * 说明：查询时间时长设置
 * @version
 */
@Controller
@RequestMapping(value="/QuerydDate")
public class QueryDateOperatorController extends BaseController {
	@Resource(name="queryDateService")
	private QueryDateOperatorManager queryDateService;
	private RoleAuthFactory roleAtuhFactory;
	
	/**显示列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listDate")
	public ModelAndView listDate(Page page)throws Exception{
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
			//存放列表数据信息
			List<PageData> listInfo = queryDateService.QuerylistPage(page);
			mv.addObject("pd", pd);
			mv.addObject("listInfo", listInfo);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		mv.setViewName("credit/QueryDateOperator/QueryDate_list");
		mv.addObject("QX",map);
		return mv;
	}
	
	/**新增、修改
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(){
 		ModelAndView mv = this.getModelAndView();
 		PageData pd = this.getPageData();
 		List orgs = null;
 		try{
 			String method = pd.getString("method");
 			if("edit".equals(method)){
 				Session session = Jurisdiction.getSession();
 				User user = (User)session.getAttribute(Const.SESSION_USER);
 				String USERID = user.getUSER_ID();
 				String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
 				pd.put("COMPANY", company); 
 				pd = queryDateService.queryByTypeAndCompany(pd);
 				mv.setViewName("credit/QueryDateOperator/QueryDate_edit");
 			}else{
 				mv.setViewName("credit/QueryDateOperator/QueryDate_add");
 			}
 			//机构
			User user = UserUtil.getCurrUser();
			pd.put("COMPANY", user.getCOMPANY()); //法人
			/*if(UserUtil.CurrUserIsAdmin()){
				mv.addObject("admin","1");
				orgs = queryDateService.getOrgsByCompany(user.getCOMPANY());
				mv.addObject("orgs", orgs);
			}else{
				mv.addObject("admin","0");
				pd.put("ORG_ID", user.getOrg().getOrgId());
				pd.put("NAME", user.getOrg().getName()); //机构名称
			}*/
 			pd.put("method", method);
 			mv.addObject("pd", pd);
 		}catch(Exception e){
 			logger.error(e.getMessage());
 		}
		return mv;
	}
	
	/**保存
	 * @param pd
	 * @return 
	 * @throws Exception
	 */
	@Transactional
	@RequestMapping(value="/save")
	public ModelAndView save(){
		ModelAndView mv = this.getModelAndView();
   		PageData pd = this.getPageData();
   		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		
		pd.put("COMPANY", company); 
 		try{
 			String method = pd.getString("method");
 			if("edit".equals(method)){
 				//更新
 				queryDateService.Update(pd);
 			}else{
 				//新增
 				queryDateService.Save(pd);
 			}
 		}catch(Exception e){
 			logger.error(e.getMessage());
 		}
 		mv.setViewName("save_result");
		return mv;
	}
	/**删除
	 * @param pd
	 * @return 
	 * @throws Exception
	 */
	@Transactional
	@RequestMapping(value="/delete")
	public ModelAndView delete(){
		ModelAndView mv = this.getModelAndView();
   		PageData pd = this.getPageData();
 		try{
 			queryDateService.delete(pd);
 		}catch(Exception e){
 			logger.error(e.getMessage());
 		}
 		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 批量删除
	 * @throws Exception 
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception {
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		
		String errInfo = "success";
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = this.getPageData();
		String list = pd.getString("IDS");
		if(null != list && !"".equals(list)){
			String IDS[] = list.split(",");
			Map<String,Object> mapp = new HashMap<String,Object>();
			mapp.put("COMPANY", company);
			mapp.put("ids", IDS);
			queryDateService.deleteAll(mapp);
		}else{
			errInfo = "error";
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(pd, map);
	}
	
	/**判断渠道编号是否存在
	 * @return
	 */
	@RequestMapping(value="/hasId")
	@ResponseBody
	public Object hasId(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		
		pd.put("COMPANY", company); 
		try{
			if(queryDateService.queryByTypeAndCompany(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
}
