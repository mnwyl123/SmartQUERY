package com.dcits.credit.controller.QueryLoanCardNo;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.credit.service.EnterAppReview.EntAppReManager;
import com.dcits.credit.service.rest.CompanyInterfaceService;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.role.RoleAuthFactory;
import com.hxtt.b.k;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


/** 
 * 类名称：QueryLoanCardController
 * 创建人：zhangyy
 * 说明：查询中证码
 * @version
 */
@Controller
@RequestMapping(value="/queryLoanCard")
public class QueryLoanCardNoController extends BaseController {
	@Resource(name="entAppReService")
	private EntAppReManager entAppReService;
	@Resource(name="CompanyInterfaceService")
	private CompanyInterfaceService CompanyService ;
	private RoleAuthFactory roleAtuhFactory;
	
	/**显示查询页面
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/queryPage")
	public ModelAndView listChannel(Page page)throws Exception{
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
		List<PageData> listPd = new ArrayList<PageData>();
		String msg = "无人行账号";
		String code = "01";
		//去人行爬取
		if(pd.get("flag")!=null){
			//查询对应的人行用户名和密码
			PageData pd1 = new PageData();
			pd1.put("USER_ID", USERID);
			pd1 = entAppReService.getOrgCode(pd1);
			
			if(pd1!=null){
				if("0".equals(String.valueOf(pd1.get("PERBANK_STATUS")))){
					code = "02";
					msg = "人行账户密码错误!";
				}else{
					List<String> list = new ArrayList<String>();
					PageData pData = new PageData();
					//提取字段，判断字段
					if(pd.get("CreditCode")!=null&&!pd.get("CreditCode").equals("")){
						pData.put("CreditCode", pd.get("CreditCode"));//机构信用代码
						list.add("decrypt_dec(CreditCode)='"+pd.getString("CreditCode").replace("-", "")+"'");
					}
					if(pd.get("LoanCardNo")!=null&&!pd.get("LoanCardNo").equals("")){
						pData.put("LoanCardNo", pd.get("LoanCardNo"));//中证码
						list.add("decrypt_dec(LoanCardNo)='"+pd.getString("LoanCardNo").replace("-", "")+"'");
					}
					
					if(pd.get("SdepOrgCode")!=null&&!pd.get("SdepOrgCode").equals("")){
						pData.put("SdepOrgCode", pd.get("SdepOrgCode"));//组织机构代码
						list.add("decrypt_dec(SdepOrgCode)='"+pd.getString("SdepOrgCode").replace("-", "")+"'");
					}
					if(pd.get("RegisterType")!=null&&pd.get("RegisterCode")!=null
							&&!pd.get("RegisterType").equals("")&&!pd.get("RegisterCode").equals("")){
						pData.put("RegisterType", pd.get("RegisterType"));//登记注册类型
						pData.put("RegisterCode", pd.get("RegisterCode"));//登记注册号
						list.add("(decrypt_dec(RegisterType)='"+pd.getString("RegisterType").replace("-", "")
								+"' AND decrypt_dec(RegisterCode)='"+pd.getString("RegisterCode").replace("-", "")+"')");
					}
					if(pd.get("SdepNationalTaxCode")!=null&&!pd.get("SdepNationalTaxCode").equals("")){
						pData.put("SdepNationalTaxCode", pd.get("SdepNationalTaxCode"));//纳税人识别号（国税）
						list.add("decrypt_dec(SdepNationalTaxCode)='"+pd.getString("SdepNationalTaxCode").replace("-", "")+"'");
					}
					if(pd.get("SdeplandTaxCode")!=null&&!pd.get("SdeplandTaxCode").equals("")){
						pData.put("SdeplandTaxCode", pd.get("SdeplandTaxCode"));//纳税人识别号（地税）
						list.add("decrypt_dec(SdeplandTaxCode)='"+pd.getString("SdeplandTaxCode").replace("-", "")+"'");
					}
					StringBuffer sql = new StringBuffer();
					sql.append("SELECT replace(decrypt_dec(COM_NAME),null,'') COM_NAME, "
							+ "replace(decrypt_dec(LoanCardNo),null,'') LoanCardNo,"
							+ "replace(decrypt_dec(SocialCredit),null,'') SocialCredit, "
							+ "replace(decrypt_dec(SdepOrgCode),null,'') SdepOrgCode, "
							+ "replace(decrypt_dec(CreditCode),null,'') CreditCode, "
							+ "replace(decrypt_dec(BusinessNum),null,'') BusinessNum, "
							+ "replace(decrypt_dec(SocialGroupNo),null,'') SocialGroupNo, "
							+ "replace(decrypt_dec(PublicNum),null,'') PublicNum, "
							+ "replace(decrypt_dec(CivilNo),null,'') CivilNo, "
							+ "replace(decrypt_dec(FundNo),null,'') FundNo, "
							+ "replace(decrypt_dec(Other),null,'') Other, "
							+ "replace(decrypt_dec(ReligionNo),null,'') ReligionNo, "
							+ "replace(decrypt_dec(SdeplandTaxCode),null,'') SdeplandTaxCode, "
							+ "replace(decrypt_dec(SdepNationalTaxCode),null,'') SdepNationalTaxCode"
							+ " FROM CIFM_COMPANY_LOANNO WHERE "+list.get(0));
					for(int i=1;i<list.size();i++){
						sql.append(" OR "+list.get(i));
					}
					sql.append(" ORDER BY CLAWER_TIME DESC");
					PageData query = new PageData();
					query.put("creatSql", sql.toString());
					List<PageData> pdList = CompanyService.queryLoanNo(query);
					if(pdList.size()>0&&!"".equals(pdList.get(0).get("LOANCARDNO"))){						
						listPd = pdList;
					}else{
						String str = "{\"CreditCode\":\""+String.valueOf(pd.get("CreditCode"))+"\",\"SdepOrgCode\":\""+String.valueOf(pd.get("SdepOrgCode"))+"\",\"RegisterType\":\""+String.valueOf(pd.get("RegisterType"))+"\",\"RegisterCode\":\""+String.valueOf(pd.get("RegisterCode"))+"\",\"SdepNationalTaxCode\":\""+String.valueOf(pd.get("SdepNationalTaxCode"))+"\",\"SdeplandTaxCode\":\""+String.valueOf(pd.get("SdeplandTaxCode"))+"\",\"ORGCODE\":\""+String.valueOf(pd1.get("ORGCODE"))+"\",\"USERNAME\":\""+String.valueOf(pd1.get("USERNAME"))+"\",\"PASSWORD\":\""+String.valueOf(pd1.get("PASSWORD"))+"\"}";
				 		//调用爬虫接口
						Map<String,Object> result = AcceptJson(str);
						listPd = (List<PageData>) result.get("listPd");
						code = (String) result.get("code");
						msg = (String) result.get("msg");
					}
				}
			}else{
				code = "02";
			}
		}
		pd.put("code", code);
		pd.put("msg", msg);
		mv.addObject("listPd", listPd);
		mv.addObject("pd", pd);
		mv.setViewName("credit/QueryLoanCardNo/Query_list");
		mv.addObject("QX",map);
		return mv;
	}
	
	//接收爬虫返回的json数据
	private Map<String,Object> AcceptJson(String str){
		Map<String,Object> map = new HashMap<String,Object>();
		List<PageData> listPd = new ArrayList<PageData>();
		//存放返回结果值
		JSONObject jsonData = new JSONObject();
		String msg = "";
		String code = "";
		try {
			byte[] b = str.getBytes("utf-8");
			String spideUrl=BaseController.getServerInfo().getString("spideUrl");
			//spideUrl = "http://127.0.0.1:7008/";
			URL url = new URL(spideUrl+"ClawerServer/rest/ClawerServer/queryLoanCardNo");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");// 提交模式
			// 是否允许输入输出
			conn.setDoInput(true);
			conn.setDoOutput(true);
			conn.setConnectTimeout(60000);// 连接超时 单位毫秒
			conn.setReadTimeout(60000);// 读取超时 单位毫秒
			// 设置请求头里面的数据，以下设置用于解决http请求code415的问题
			conn.setRequestProperty("Content-Type",
					"application/json;charset=UTF-8");
			// 链接地址
			conn.connect();
			// 发送参数
			OutputStream writer = conn.getOutputStream();
			writer.write(b);

			// 清理当前编辑器的左右缓冲区，并使缓冲区数据写入基础流
			writer.flush();
			writer.close();
			if (conn.getResponseCode() != 200) {
				throw new RuntimeException("Failed : HTTP error code : "
						+ conn.getResponseCode());
			}
			BufferedReader reader = new BufferedReader(new InputStreamReader(
					conn.getInputStream(), "utf-8"));
			String lines = reader.readLine();// 读取请求结果
			logger.info("请求爬虫的返回信息："+lines);
			jsonData = JSONObject.fromObject(lines);
			reader.close();
			conn.disconnect();
			//解析返回结果值
			if(jsonData.size()!=0){
				code = String.valueOf(jsonData.get("errorcode"));
				if(!"01".equals(code)){
					msg = String.valueOf(jsonData.get("errormsg"));
				}else{
					JSONArray arr = JSONArray.fromObject(String.valueOf(jsonData.get("resultData")));
					for(int i=0;i<arr.size();i++){
						PageData pd1 = new PageData();
						pd1.put("COM_NAME", String.valueOf(arr.getJSONObject(i).get("OrgName")));
						pd1.put("LOANCARDNO", String.valueOf(arr.getJSONObject(i).get("LoanCardNo")));
						pd1.put("SOCIALCREDIT", String.valueOf(arr.getJSONObject(i).get("SocialCredit")));
						pd1.put("SDEPORGCODE", String.valueOf(arr.getJSONObject(i).get("SdepOrgCode")));
						pd1.put("CREDITCODE", String.valueOf(arr.getJSONObject(i).get("CreditCode")));
						pd1.put("BUSINESSNUM", String.valueOf(arr.getJSONObject(i).get("BusinessNum")));
						pd1.put("SOCIALGROUPNO", String.valueOf(arr.getJSONObject(i).get("SocialGroupNo")));
						pd1.put("PUBLICNUM", String.valueOf(arr.getJSONObject(i).get("PublicNum")));
						pd1.put("CIVILNO", String.valueOf(arr.getJSONObject(i).get("CivilNo")));
						pd1.put("FUNDNO", String.valueOf(arr.getJSONObject(i).get("FundNo")));
						pd1.put("OTHER", String.valueOf(arr.getJSONObject(i).get("Other")));
						pd1.put("RELIGIONNO", String.valueOf(arr.getJSONObject(i).get("ReligionNo")));
						pd1.put("SDEPLANDTAXCODE", String.valueOf(arr.getJSONObject(i).get("SdeplandTaxCode")));
						pd1.put("SDEPNATIONALTAXCODE", String.valueOf(arr.getJSONObject(i).get("SdepNationalTaxCode")));
						listPd.add(pd1);
					}
				}
			}else{
				code = "02";
				msg = "爬虫应用连接异常";
			}
		} catch (Exception e) {
			logger.error(e);
			logger.info("爬虫应用连接异常");
			code = "02";
			msg = "爬虫应用连接异常";
		}
		map.put("code", code);
		map.put("msg", msg);
		map.put("listPd", listPd);
		return map;
	}
}
