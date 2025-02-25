package com.dcits.credit.controller.creditAcctManage;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.credit.controller.rest.util.RequestReportUtil;
import com.dcits.credit.entity.UpdatePWD;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.creditAcctManage.PwdExpireRemindManager;
import com.dcits.credit.util.PasswordOper;
import com.dcits.credit.util.ReportUtil;
import com.dcits.credit.util.sm3.SM3Digest;
import com.dcits.credit.wsimport.IServiceUtil;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Org;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.role.RoleAuthFactory;
/** 
 * 类名称：密码到期提醒
 * 创建人：LY 
 * 创建时间：
 * @version
 */
@Controller
@RequestMapping(value="/PwdExpireRemind")
public class PwdExpireRemindController extends BaseController {

	String menuUrl = "PwdExpireRemind/list.do"; //菜单地址(权限用)
	@Resource(name="PwdExpireRemindService")
	private PwdExpireRemindManager PwdExpireRemindService;
	@Resource(name="indAppReService")
	private IndAppReManager indAppReService;
	private RoleAuthFactory roleAtuhFactory;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表PwdExpireRemind");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("COMPANY", company);
		Org curOrg = (Org) session.getAttribute(USERID+Const.SESSION_ORG);
		String menuId = pd.getString("menuId");
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		pd.put("DATA_DATE", new SimpleDateFormat("yyyyMMdd").format(new Date()));
		page.setPd(pd);
		List<PageData>	varList = PwdExpireRemindService.list(page);	//
		mv.setViewName("credit/creditAcctManage/pwdExpireRemind_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",roleAtuhFactory.getHC(roleIds,menuId));	//按钮权限
		return mv;
	}
	
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	@ResponseBody
	public Object edit(){
		logBefore(logger, Jurisdiction.getUsername()+"修改密码");
		ModelAndView mv = this.getModelAndView();
		Map<String, String> map = new HashMap<>();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		PageData pd = this.getPageData();
		pd.put("COMPANY", company);	
		String CREDIT_CODE=(String) pd.get("CREDIT_CODE");
		String flag = updatePwd(CREDIT_CODE);
		
		//pd.put("PREVIOUS_PASSWORD", pd.getString("PREVIOUS_PASSWORD"));
		//pd.put("CURRENT_PASSWORD",PasswordOper.encode(CURRENT_PASSWORD));
		String startDate=new SimpleDateFormat("yyyyMMdd").format(new Date()); 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		//Date dt = sdf.parse(startDate);
		Calendar rightNow = Calendar.getInstance();
		//rightNow.setTime(dt);
		rightNow.add(Calendar.DAY_OF_YEAR,58);//日期加58天 
		Date dt1 = rightNow.getTime();
		String reStr = sdf.format(dt1);
		pd.put("CURRENT_TIME",new SimpleDateFormat("yyyyMMdd").format(new Date())); 
		pd.put("PWD_EXPIRES_DATE", reStr);
		pd.put("PERBANK_STATUS", "1");
		/*if("0".equals(pd.getString("IS_WEB"))){
			indAppReService.updatePerbankPwd(pd);
		}*/
		//PwdExpireRemindService.update(pd);
		//	mv.addObject("msg",flag);
		//	mv.setViewName("save_result");
			map.put("msg", flag);
			return AppUtil.returnObject(new PageData(), map);
	}
	
	/**去修改密码页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditPwd")
	public ModelAndView goEditPwd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = user.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		PageData pd = this.getPageData();
		pd.put("COMPANY", company);
		pd = PwdExpireRemindService.findById(pd);	//根据ID读取
		mv.addObject("pd",pd);
		mv.setViewName("credit/creditAcctManage/pwdExpireRemind_edit");
		mv.addObject("msg", "edit");
		return mv;
	}	 
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	
	public String updatePwd(String CREDIT_CODE){
		PageData pd =new PageData();
		String Str= "密码修改失败";
		pd.put("USERNAME", CREDIT_CODE);//用户名
		pd.put("NEW_PASSWORD", randomPWD());//新密码
		PageData pwdInfo;
		try {
			pwdInfo = indAppReService.findPerbankInfo(pd);
			pd.put("CURRENT_PASSWORD", PasswordOper.decode(pwdInfo.getString("CURRENT_PASSWORD")));
			PageData sqlPd = new PageData();
			String sql = "SELECT VALUE from SERVER_MESSAGE_INFO  WHERE CODE = 'PER_QueryOrgCode'";
			sqlPd.put("selectSql", sql);
			PageData QUERY_ORG_CODE =indAppReService.selectPdInfo(sqlPd);
			sql = "SELECT VALUE from SERVER_MESSAGE_INFO  WHERE CODE = 'RECE_ORG_CODE'";
			sqlPd.put("selectSql", sql);
			PageData RECE_ORG_CODE = (PageData) indAppReService.selectPdInfo(sqlPd);
			
			//拼接修改密码请求报文
			StringBuffer strBuf = new StringBuffer();
			strBuf.append(ReportUtil.headInfo(QUERY_ORG_CODE.getString("VALUE"),RECE_ORG_CODE.getString("VALUE"),"L101"));
			strBuf.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
			strBuf.append("<Document>");
			strBuf.append("<Head>");
			strBuf.append("<QueryOrgCode>"+QUERY_ORG_CODE.getString("VALUE")+"</QueryOrgCode>");
			strBuf.append("<UserCode>"+pd.getString("USERNAME")+"</UserCode>");
			strBuf.append("<Password>"+SM3Digest.SM3OfUpper(pd.getString("CURRENT_PASSWORD"))+"</Password>");
			strBuf.append("</Head>");
			strBuf.append("<Msg>");
			strBuf.append("<UserCode>"+pd.getString("USERNAME")+"</UserCode>");//用户账号
			strBuf.append("<OPassword>"+pd.getString("CURRENT_PASSWORD")+"</OPassword>");//旧密码
			strBuf.append("<NPassword>"+pd.getString("NEW_PASSWORD")+"</NPassword>");//新密码		
			strBuf.append("</Msg>");
			strBuf.append("</Document>");	
			strBuf.append("{S:"+ReportUtil.numSignature(strBuf.toString())+":S}"); //数字签名
			logger.info("***********修改密码请求报文***********");
			logger.info(strBuf.toString());
			String reponseXml = IServiceUtil.queryReport_UpdatePwd(strBuf.toString());
			logger.info("***********密码修改完成返回报文***********");
			logger.info(reponseXml);
			PageData reponsePd = RequestReportUtil.parseXml_updPwd(reponseXml);
			if(reponsePd!=null){
				PageData resultPd = new PageData();						
				String date =new SimpleDateFormat("yyyyMMdd").format(new Date());
				resultPd.put("UPDATE_TIME",date);//修改时间	
				resultPd.put("USERNAME", pd.getString("USERNAME"));		
				resultPd.put("RESULTCODE", reponsePd.getString("ResultCode"));
				resultPd.put("RESULTDESC", reponsePd.getString("ResultDesc"));
				Str = reponsePd.getString("ResultDesc");
				if(reponsePd.getString("ModifResultCode")!=null){					
					resultPd.put("MODIFRESULTCODE", reponsePd.getString("ModifResultCode"));									
					if(("0").equals(reponsePd.getString("ModifResultCode"))){
						resultPd.put("PREVIOUS_PASSWORD", PasswordOper.encode(pd.getString("CURRENT_PASSWORD")));//之前的密码
						resultPd.put("CURRENT_PASSWORD", PasswordOper.encode(pd.getString("NEW_PASSWORD")));//新密码
						resultPd.put("ERRDESC", null);	
						indAppReService.updatePerbankInfo(resultPd);//更新perbank表信息
						//更新CIFM_CREDIT_ACCT_MANAGE表密码信息
						SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
						Calendar rightNow = Calendar.getInstance();
						rightNow.add(Calendar.DAY_OF_YEAR,30);//日期加58天 
						Date dt1 = rightNow.getTime();
						sql="update CIFM_CREDIT_ACCT_MANAGE set CURRENT_PASSWORD = '"
						    +resultPd.getString("CURRENT_PASSWORD")+"',PREVIOUS_PASSWORD = '"
						    +resultPd.getString("PREVIOUS_PASSWORD")+"',PWD_EXPIRES_DATE = '" 
						    +sdf.format(dt1)
						    +"' where CREDIT_CODE = '"+resultPd.getString("USERNAME")+"'";
						sqlPd.put("updateSql", sql);
						indAppReService.updateInfo(sqlPd);							
						logger.info("***********"+pd.getString("USERNAME")+"密码修改完成***********");
						//System.out.println("***********"+pd.getString("USERNAME")+"密码修改完成***********");
						logger.info("旧密码："+pd.getString("CURRENT_PASSWORD")+"   新密码："+pd.getString("NEW_PASSWORD"));
						//System.out.println("旧密码："+pd.getString("CURRENT_PASSWORD")+"   新密码："+pd.getString("NEW_PASSWORD"));
						
						return Str;
					}else if(reponsePd.getString("ErrDesc")!=null){
						resultPd.put("ERRDESC", reponsePd.getString("ErrDesc"));						
					}else{
						resultPd.put("ERRDESC", null);
					}					
				}else{
					resultPd.put("ModifResultCode", null);
					resultPd.put("ERRDESC", null);
				}
				//修改失败 还是之前的密码
				resultPd.put("PREVIOUS_PASSWORD", pwdInfo.getString("PREVIOUS_PASSWORD"));//旧密码不变未解密
				resultPd.put("CURRENT_PASSWORD", PasswordOper.encode(pd.getString("CURRENT_PASSWORD")));//新密码为之前的密码
				indAppReService.updatePerbankInfo(resultPd);	
				logger.info("*********"+resultPd.getString("RESULTDESC")+"**********");
				//System.out.println("*********"+resultPd.getString("RESULTDESC")+"**********");
			}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.error(e.getMessage(),e);
		}
		
		
		return Str;
	}  
	
	//生成8-16位随机密码
		public static String randomPWD(){
			String password = "";
			//按规则生成新密码8~16个字符，至少包含‘0至9’、‘A至Z’、‘a至z’、‘-_@#’字符中,两种或两种以上的字符	
			int pwdLength = (int)(Math.random()*8+8); 
			//规则字符
			String[] connection1 = {"0","1","2","3","4","5","6","7","8","9"};
			String[] connection2 = {"q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h","j","k","l","z","x","c","v","b","n","m"};
			String[] connection3 = {"Q","W","E","R","T","Y","U","I","O","P","A","S","D","F","G","H","J","K","L","Z","X","C","V","B","N","M"};
			String[] connection4 = {"-","_","@","#"};
			
			int flag = 0;
			for(int i=0; i<pwdLength; i++){
				//1-4的随机整数
				int random1234 = (int)(Math.random()*4+1);
				while(random1234 == flag){
					random1234 = (int)(Math.random()*4+1);
				}
				flag = random1234;
				if(random1234 == 1){
					int randomN = (int)(Math.random()*10);
					password += connection1[randomN];
				}
				if(random1234 == 2){
					int randomN = (int)(Math.random()*26);
					password += connection2[randomN];
				}
				if(random1234 == 3){
					int randomN = (int)(Math.random()*26);
					password += connection3[randomN];
				}
				if(random1234 == 4){
					int randomN = (int)(Math.random()*4);
					password += connection4[randomN];
				}
			}
			return password;
		}	
}
