package com.dcits.credit.service.creditReportInquiry;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

/** 
 * 企业征信报告查询
 * 创建人：liyanay
 * 创建时间：2017-06-26
 */
public interface EnterReportInqManager{
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	public List<PageData> listHis(Page page)throws Exception;

}


