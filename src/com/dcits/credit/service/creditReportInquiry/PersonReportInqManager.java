package com.dcits.credit.service.creditReportInquiry;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

/** 
 * 个人征信报告查询
 * 创建人：liyanay
 * 创建时间：2017-06-26
 */
public interface PersonReportInqManager{
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	public List<PageData> listHis(Page page)throws Exception;
	/**记录是否打印
	 * @param pd
	 * @throws Exception
	 */
	public void updateIsPrint(PageData pd)throws Exception;
	//查询系统配置的打印参数
	public PageData findPrintNum()throws Exception;
	//查询打印次数
	public PageData findActualNum(PageData pd)throws Exception;
	
	
	
}


