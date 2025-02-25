package com.dcits.credit.service.queryWarn;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

/**
 * 查询预警接口
 * @author wangwenming
 *
 */
public interface QueryWarnService {
	/**
	 * 查询激增情况预警
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> surgeInEarlylistPage(Page page) throws Exception;
	/**
	 * 查询激增情况预警
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> surgeInEarlylistPageHis(Page page) throws Exception;
	/**
	 * 查询失败占比过大情况预警
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> failPercentToLargelistPage(Page page) throws Exception;
	/**
	 * 短时间内对同一客户多次查询情况预警
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> shorttimelistPage(Page page) throws Exception;
	/**
	 * 非工作时段查询预警
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> noWorkTimelistPage(Page page) throws Exception;
	/**
	 * 跨地域查询预警
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> crossRegionlistPage(Page page) throws Exception;
	/**
	 * 选择其他理由查询占比过大预警
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> otherReasonlistPage(Page page) throws Exception;
	
}
