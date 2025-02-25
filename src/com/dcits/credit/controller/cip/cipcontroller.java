//package com.dcits.credit.controller.cip;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.dcits.credit.service.rest.PerCreditInterfaceManage;
//import com.dcits.platform.controller.base.BaseController;
//import com.dcits.platform.util.AppUtil;
//import com.dcits.platform.util.DESUtil;
//import com.dcits.platform.util.PageData;
//
//import net.lingala.zip4j.exception.ZipException;
//
//@Controller
//@RequestMapping(value="/cip")
//public class cipcontroller extends BaseController{
//	@Autowired
//    private cipManager cipManager;
//	@Autowired
//    private PerCreditInterfaceManage perCreditInterfaceManage;
//	
//	@RequestMapping(value="/cip")
//	@ResponseBody
//	public Object cip() throws ZipException{
//		Map<String,Object> map = new HashMap<String,Object>();
//		PageData pd = new PageData();
//		try {
//			List<PageData> list = cipManager.findID(pd);
//			for (PageData pageData:list) {
//				String CLIENT_NAME = String.valueOf(pageData.get("NAME"));
//				String CREDENTIALS_NO = String.valueOf(pageData.get("ID_NO"));
//				pageData.put("CLIENT_NAME", DESUtil.encrypt("enhjeA==",CLIENT_NAME));
//				pageData.put("CREDENTIALS_NO", DESUtil.encrypt("enhjeA==",CREDENTIALS_NO));
//				List<PageData> listReportID = perCreditInterfaceManage.findByCIP(pageData);
//				if(listReportID.size()>0) {
//					String REPORT_ID = listReportID.get(0).getString("REPORT_ID");
//					pageData.put("REPORT_ID", REPORT_ID);
//				}
//				perCreditInterfaceManage.updateCIP(pageData);
//	        }
//        }catch (Exception e){
//            e.printStackTrace();
//            logger.debug("更新失败");
//        }
//        map.put("result", "sucess");				//返回结果
//		return AppUtil.returnObject(pd, map);
//	}
//}
