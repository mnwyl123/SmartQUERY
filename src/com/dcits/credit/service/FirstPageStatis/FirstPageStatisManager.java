package com.dcits.credit.service.FirstPageStatis;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;


/** 
 * 类名称：首页
 * 创建人：zhangyy
 */
public interface FirstPageStatisManager {
	/**当前月总查询次数统计
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> StatisQuerySum(PageData pd);
	/**统计最近15天查询数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryLastCount(PageData pd);
	/**统计本月查询详情
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryDetail(PageData pd);
	/**当前月总审核次数统计
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> checkSum(PageData pd);
	/**统计最近15天审核数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> checkLastCount(PageData pd);
	/**统计本月审核详情
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> checkDetail(PageData pd);
	/**
	 * 查询激增情况预警
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> surgeInEarlylistPage(PageData pd) throws Exception;
	/**
	 * 查询失败占比过大情况预警
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> failPercentToLargelistPage(PageData pd) throws Exception;
	/**
	 * 短时间内对同一客户多次查询情况预警
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> shorttimelistPage(PageData pd) throws Exception;
}
