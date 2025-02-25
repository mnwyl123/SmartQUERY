package com.dcits.platform.controller.system.createcode;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.DbBackUtil;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;

/** 
 * 类名称： 反向生成
 * 创建人：huangzwf
 * 修改时间：2016年11月29日
 * @version
 */
@Controller
@RequestMapping(value="/recreateCode")
public class ReverseCreateCodeController extends BaseController {
	
	
	
	/**列表
	 * @return
	 */
	@RequestMapping(value="/list")
	public ModelAndView list() throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/createcode/recreatecode_list");
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	 /**列出所有表
	 * @param
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/listAllTable")
	@ResponseBody
	public Object listAllTable(){
		PageData pd = new PageData();		
		pd = this.getPageData();
		Map<String,Object> map = new HashMap<String,Object>();
		List<PageData> pdList = new ArrayList<PageData>();
		List<String> tblist = new ArrayList<String>();
		try {
			Object[] arrOb = DbBackUtil.getTables(pd);
			tblist = (List<String>)arrOb[1];
			pd.put("msg", "ok");
		} catch (ClassNotFoundException e) {
			pd.put("msg", "no");
			e.printStackTrace();
		} catch (SQLException e) {
			pd.put("msg", "no");
			e.printStackTrace();
		}
		pdList.add(pd);
		map.put("tblist", tblist);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	/**去代码生成器页面(进入弹窗)
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goProductCode")
	public ModelAndView goProductCode() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String fieldType = "";
		StringBuffer sb = new StringBuffer("");
		List<Map<String,String>> columnList = DbBackUtil.getFieldParameterLsit(DbBackUtil.getFHCon(pd),pd.getString("table")); //读取字段信息
		for(int i=0;i<columnList.size();i++){
			Map<String,String> fmap = columnList.get(i);
			sb.append(fmap.get("fieldNanme").toString().toUpperCase());					//字段名称
			sb.append(",fh,");
			fieldType = fmap.get("fieldType").toString().toLowerCase();					//字段类型
			if(fieldType.contains("int")){
				sb.append("Integer");
			}else if(fieldType.contains("NUMBER")){
				if(Integer.parseInt(fmap.get("fieldSccle")) > 0){
					sb.append("Double");
				}else{
					sb.append("Integer");
				}
			}else if(fieldType.contains("double") || fieldType.contains("numeric")){
				sb.append("Double");
			}else if(fieldType.contains("date")){
				sb.append("Date");
			}else{
				sb.append("String");
			}
			sb.append(",fh,");
			sb.append("备注"+(i+1));														//备注
			sb.append(",fh,");
			sb.append("是");																//是否前台录入
			sb.append(",fh,");
			sb.append("无");																//默认值
			sb.append(",fh,");
			sb.append(fmap.get("fieldLength").toString());								//长度
			sb.append("Dcits");
		}
		pd.put("FIELDLIST", sb.toString());
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		mv.addObject("type", "反向生成");
		mv.setViewName("system/createcode/productCode");
		return mv;
	}
	
}