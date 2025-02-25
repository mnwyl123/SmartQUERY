package com.dcits.credit.controller.QueryFrequerySet;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.credit.service.QuerySet.QuerySetManager;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.role.RoleAuthFactory;


/** 
 * 类名称：QueryFrequerySet
 * 创建人：zhangyy
 * 说明：用户查询次数设置
 * @version
 */
@Controller
@RequestMapping(value="/qeurySet")
public class QuerySetController extends BaseController {
	private RoleAuthFactory roleAtuhFactory;
	@Resource(name="querySetService")
	private QuerySetManager querySetService;
	
	/**用户查询次数列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listQuerySet")
	public ModelAndView listQuerySet(Page page){
 		ModelAndView mv = this.getModelAndView();
 		PageData pd = this.getPageData();
 		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		//权限查询
		String menuId = pd.getString("menuId");
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		Map<String,String> map = roleAtuhFactory.getHC(roleIds,menuId);
		
		pd.put("COMPANY", user.getCOMPANY());
		try{
			//存放列表数据信息
			List<PageData> listInfo = new ArrayList<PageData>();
			page.setPd(pd);
			//查询待审核信息
			listInfo = querySetService.listQuery(page);
			mv.addObject("pd", pd);
			mv.addObject("listInfo", listInfo);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		mv.setViewName("credit/QueryFrequerySet/QueryFrequery_list");
		mv.addObject("QX",map);
		return mv;
	}
	
	/**去新增用户页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddQ")
	public ModelAndView goAddQ(){
		ModelAndView mv = this.getModelAndView();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		PageData pd = this.getPageData();
		pd.put("QUERY_MONTH", new SimpleDateFormat("yyyyMM").format(new Date()));
		pd.put("QUERY_COUNT", "0");
		pd.put("AVG_QUERY_COUNT", "0");
		pd.put("COMPANY", company);
		mv.setViewName("credit/QueryFrequerySet/QueryFrequeryAdd");
		mv.addObject("msg", "saveQ");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**保存用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveQ")
	public ModelAndView saveQ(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		try{
			pd.put("AVG_QUERY_COUNT", pd.getString("QUERY_MIN_COUNT"));
			//查询用户ID
			PageData data = querySetService.queryUserName(pd);
			pd.putAll(data);
			querySetService.SaveInfo(pd);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**去修改用户页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/EditQ")
	public ModelAndView EditQ(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		pd.put("COMPANY", company);
		//读取信息
		try{
			pd = querySetService.queryUserInfo(pd);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		mv.setViewName("credit/QueryFrequerySet/QueryFrequeryEdit");
		mv.addObject("msg", "UpdateQ");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**保存用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/UpdateQ")
	public ModelAndView UpdateQ(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		pd.put("COMPANY", company);
		try{
			pd.put("USER_TYPE", pd.getString("type"));
			int minValue = Integer.parseInt(pd.getString("QUERY_MIN_COUNT"));
			int avgValue = Integer.parseInt(pd.getString("AVG_QUERY_COUNT"));
			if(avgValue<minValue){
				pd.put("AVG_QUERY_COUNT", pd.getString("QUERY_MIN_COUNT"));
			}
			querySetService.updateUser(pd);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**判断用户是否存在
	 * @return
	 */
	@RequestMapping(value="/hasU")
	@ResponseBody
	public Object hasU(){
		Map<String,String> map = new HashMap<String,String>();
		
		String errInfo = "success";
		PageData pd = this.getPageData();
		try{
			//判断用户表中该用户是否存在
			PageData data = querySetService.queryUserName(pd);
			if(data!=null){
				if(!data.getString("COMPANY").equals(pd.getString("COMPANY"))){
					errInfo = "errCom";
				}
			}else{
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.getMessage());
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**判断该用户类型 下用户是否存在
	 * @return
	 */
	@RequestMapping(value="/queryU")
	@ResponseBody
	public Object queryU(){
		Map<String,String> map = new HashMap<String,String>();
		
		String errInfo = "success";
		PageData pd = this.getPageData();
		try{
			//判断查询次数设置表中该用户是否已经存在
			pd = querySetService.queryUser(pd);
			if(pd!=null){
				errInfo = "errName";
			}
		} catch(Exception e){
			logger.error(e.getMessage());
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**删除用户
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/deleteQ")
	public void deleteU(PrintWriter out){
		PageData pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String company = user.getCOMPANY();
		pd.put("COMPANY", company);
		try{
			querySetService.deleteUser(pd);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		out.write("success");
		out.close();
	}
}
