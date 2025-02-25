package com.dcits.credit.serviceaccept;

import com.dcits.credit.serviceaccept.IServiceAcceptWSPwdProxy;
//import com.dcits.credit.serviceaccept.IServiceAcceptWSQueryProxy;
import com.dcits.platform.util.StringUtil;


public class IServiceUtil {

//	/**
//	 * 调用人行接口，查询征信报告
//	 * @param queryMessage 请求报文
//	 * @param reportType 报文类型
//	 * D101 个人信用报告单笔查询
//	 * D103 企业信用报告单笔查询
//	 * D201 查询文件处理状态
//	 * D501 个人信用报告批量查询
//	 * D503 企业信用报告批量查询
//	 * 目前只支持D101,D103
//	 * @return
//	 */
//	public static String queryReport(String querymessage,String reportType) throws Exception{
//		if(StringUtil.isEmpty(querymessage) || StringUtil.isEmpty(reportType)){
//			throw new Exception("调用人行接口传入参数不正确，请查证！");
//		}
//		String responsemessage = null;
//		try {
//			IServiceAcceptWSQueryProxy serviceAcceptWSQuery = new IServiceAcceptWSQueryProxy();
//			if("D101".equals(reportType)){
//				responsemessage = serviceAcceptWSQuery.psCreditReportQueryReq(querymessage);
//			}else if("D103".equals(reportType)){
//				responsemessage = serviceAcceptWSQuery.bsCreditReportQueryReq(querymessage);
//			}else{
//				throw new Exception("暂时不支持此类型查询！");
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return responsemessage;
//	}
	//密码修改
	public static String queryReport_UpdatePwd(String querymessage) throws Exception{
		String reportType="L101";
		if(StringUtil.isEmpty(querymessage)){
			throw new Exception("调用人行接口传入参数不正确，请查证！");
		}
		String responsemessage = null;
		try {
			IServiceAcceptWSPwdProxy serviceAcceptWSQuery = new IServiceAcceptWSPwdProxy();			
			responsemessage = serviceAcceptWSQuery.passwordModifReq(querymessage);		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return responsemessage;
	}
	
}
