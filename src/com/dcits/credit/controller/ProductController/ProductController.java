package com.dcits.credit.controller.ProductController;

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

import com.dcits.credit.service.ChannelService.ChannelManager;
import com.dcits.credit.service.ProductService.ProductManager;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Org;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.org.OrgManager;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.role.RoleAuthFactory;

@Controller
@RequestMapping(value="/Product")
public class ProductController extends BaseController {

	@Resource(name="productService")
	private ProductManager productService ;
	private RoleAuthFactory roleAtuhFactory;
	@Resource(name="orgService")
	private OrgManager orgService;
	
	/**显示列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listProduct")
	public ModelAndView listProduct(Page page)throws Exception{
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
		List<Org> orgList = orgService.listAllOrgByCompany(company);
		Map<String,String> map = roleAtuhFactory.getHC(roleIds,menuId);
		try{
			page.setPd(pd);
			//存放列表数据信息
			List<PageData> listInfo = productService.ProductlistPage(page);
			mv.addObject("pd", pd);
			mv.addObject("listInfo", listInfo);
			mv.addObject("orgList",orgList);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		mv.setViewName("credit/Product/Product_list");
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
 		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
 		
 		try{
 			List<Org> orgList = orgService.listAllOrgByCompany(company);
 			String method = pd.getString("method");
 			if("edit".equals(method)){
 				pd.put("COMPANY", company); 
 				pd = productService.productChannelById(pd); 				
 				mv.setViewName("credit/Product/Product_add");
 			}else{
 				mv.setViewName("credit/Product/Product_add");
 			}
 			mv.addObject("orgList",orgList);
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
	@RequestMapping(value="/saveProduct")
	public ModelAndView saveProduct(){
		ModelAndView mv = this.getModelAndView();
   		PageData pd = this.getPageData();
 		try{
 			String method = pd.getString("method");
 			if("edit".equals(method)){
 				//更新
 				productService.UpdateChannelById(pd);
 			}else{
 				//新增
 				productService.SaveChannel(pd);
 			}
 		}catch(Exception e){
 			logger.error(e.getMessage());
 		}
 		mv.setViewName("save_result");
		return mv;
	}
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
			if(productService.productChannelById(pd) != null){
				errInfo = "error";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}
	@Transactional
	@RequestMapping(value="/delete")
	public ModelAndView delete(){
		ModelAndView mv = this.getModelAndView();
   		PageData pd = this.getPageData();
   		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		
		pd.put("COMPANY", company); 
 		try{
 			productService.deleteChannelById(pd);
 			String[] ids = {pd.getString("CHANNEL_ID")};
 			Map<String,Object> map = new HashMap<String,Object>();
 			map.put("COMPANY", company);
 			map.put("ids", ids);
 		}catch(Exception e){
 			logger.error(e.getMessage());
 		}
 		mv.setViewName("save_result");
		return mv;
	}
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
			productService.deleteAllChannelById(mapp);
		}else{
			errInfo = "error";
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(pd, map);
	}
}
