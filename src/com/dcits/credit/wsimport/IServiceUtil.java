package com.dcits.credit.wsimport;

import com.dcits.credit.wsimport.password.IServiceAcceptWSPwd;
import com.dcits.credit.wsimport.password.IServiceAcceptWSPwd_Service;
import com.dcits.platform.util.StringUtil;

public class IServiceUtil {

	/**
	 * 调用人行接口，查询征信报告
	 * @param querymessage 请求报文
	 * @param reportType 报文类型
	 * D101 个人信用报告单笔查询
	 * D103 企业信用报告单笔查询
	 * D201 查询文件处理状态
	 * D501 个人信用报告批量查询
	 * D503 企业信用报告批量查询
	 * 目前只支持D101,D103
	 * @return
	 */
	public static String queryReport(String querymessage,String reportType) throws Exception{
		if(StringUtil.isEmpty(querymessage) || StringUtil.isEmpty(reportType)){
			throw new Exception("调用人行接口传入参数不正确，请查证！");
		}
		String responsemessage = null;
		try {
			IServiceAcceptWSQuery serviceAcceptWSQuery = new IServiceAcceptWSQuery_Service().getServiceAcceptWSQueryImplPort();
			System.out.println("reportType"+reportType);
			if("D101".equals(reportType)){
				responsemessage = serviceAcceptWSQuery.psCreditReportQueryReq(querymessage);
				System.out.println("querymessage"+querymessage);
				System.out.println("BAOWEN1"+responsemessage);
			}else if("D103".equals(reportType)){
				responsemessage = serviceAcceptWSQuery.bsCreditReportQueryReq(querymessage);
				System.out.println("BAOWEN2"+responsemessage);
			}else{
				throw new Exception("暂时不支持此类型查询！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return responsemessage;
	}
	
	public static String queryReport_UpdatePwd(String querymessage) throws Exception{
		String reportType="L101";
		if(StringUtil.isEmpty(querymessage)){
			throw new Exception("调用人行接口传入参数不正确，请查证！");
		}
		String responsemessage = null;
		try {
			IServiceAcceptWSPwd serviceAcceptWSQuery = new IServiceAcceptWSPwd_Service().getServiceAcceptWSPwdImplPort();			
			responsemessage = serviceAcceptWSQuery.passwordModifReq(querymessage);		
			//西安银行方式
//			IServiceAcceptWSPwdProxy serviceAcceptWSQuery = new IServiceAcceptWSPwdProxy();			
//			responsemessage = serviceAcceptWSQuery.passwordModifReq(querymessage);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return responsemessage;
	}
	
}
