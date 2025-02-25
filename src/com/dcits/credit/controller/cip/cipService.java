//package com.dcits.credit.controller.cip;
//
//import java.util.List;
//
//import javax.annotation.Resource;
//
//import org.springframework.stereotype.Service;
//
//import com.dcits.common.DaoSupportcip;
//import com.dcits.platform.util.PageData;
//
//@Service("cipService")
//public class cipService implements cipManager {
//	@Resource(name="daoSupportcip")
//	private  DaoSupportcip dao;
//	public List<PageData> findID(PageData pd)throws Exception{
//		return (List<PageData>)dao.findForList("cipMapper.findID", pd);
//	}
//}
