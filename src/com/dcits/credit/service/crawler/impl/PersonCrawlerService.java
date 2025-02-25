package com.dcits.credit.service.crawler.impl;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.credit.service.crawler.PersonCrawlerManager;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.util.PageData;

/** 
 * 个人征信报告爬虫
 * 创建人：zhangyy
 */
@Service("personCrawlerService")
public class PersonCrawlerService implements PersonCrawlerManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增报告信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveReportInfo(PageData pd)throws Exception{
		dao.save("PersonCrawlerMapper.saveReportInfo", pd);
	}
	/**新增个人信息
	 * @param pd
	 * @throws Exception
	 */
	public void savePersonIdentity(PageData pd)throws Exception{
		dao.save("PersonCrawlerMapper.savePersonIdentity", pd);
	}
	/**新增配偶信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveSpouInfo(PageData pd)throws Exception{
		dao.save("PersonCrawlerMapper.saveSpouInfo", pd);
	}
	/**新增居住信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveLiveInfo(PageData pd)throws Exception{
		dao.save("PersonCrawlerMapper.saveLiveInfo", pd);
	}
	/**新增职业信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveCareerInfo(PageData pd)throws Exception{
		dao.save("PersonCrawlerMapper.saveCareerInfo", pd);
	}
	/**新增信贷概要信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveCreditSumInfo(PageData pd)throws Exception{
		dao.save("PersonCrawlerMapper.saveCreditSumInfo", pd);
	}
	/**新增贷款交易明细信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveLoanInfo(PageData pd)throws Exception{
		dao.save("PersonCrawlerMapper.saveLoanInfo", pd);
	}
	/**新增贷记卡交易明细
	 * @param pd
	 * @throws Exception
	 */
	public void saveCreditInfo(PageData pd)throws Exception{
		dao.save("PersonCrawlerMapper.saveCreditInfo", pd);
	}
	/**新增准贷记卡交易明细
	 * @param pd
	 * @throws Exception
	 */
	public void saveQCreditInfo(PageData pd)throws Exception{
		dao.save("PersonCrawlerMapper.saveQCreditInfo", pd);
	}
	/**新增住房公积金信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveAccFundInfo(PageData pd)throws Exception{
		dao.save("PersonCrawlerMapper.saveAccFundInfo", pd);
	}
	/**新增养老保险信息
	 * @param pd
	 * @throws Exception
	 */
	public void savePensionInfo(PageData pd)throws Exception{
		dao.save("PersonCrawlerMapper.savePensionInfo", pd);
	}
	/**新增查询汇总信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveQueryInfo(PageData pd)throws Exception{
		dao.save("PersonCrawlerMapper.saveQueryInfo", pd);
	}
	/**新增查询汇总明细信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveQueryDetailInfo(PageData pd)throws Exception{
		dao.save("PersonCrawlerMapper.saveQueryDetailInfo", pd);
	}
	/**新增资产处置/保证人代偿信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveAssertAsInfo(PageData pd)throws Exception{
		dao.save("PersonCrawlerMapper.saveAssertAsInfo", pd);
	}
	/**新增对外担保信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveGuaranteeInfo(PageData pd)throws Exception{
		dao.save("PersonCrawlerMapper.saveGuaranteeInfo", pd);
	}
	/**新增贷款/贷记卡/准贷记卡逾期记录
	 * @param pd
	 * @throws Exception
	 */
	public void saveOverdueInfo(PageData pd)throws Exception{
		dao.save("PersonCrawlerMapper.saveOverdueInfo", pd);
	}
	/**新增说明/声明/标注信息表
	 * @param pd
	 * @throws Exception
	 */
	public void saveDeclareObjectInfo(PageData pd)throws Exception{
		dao.save("PersonCrawlerMapper.saveDeclareObjectInfo", pd);
	}
	/**新增民事判决/强制执行记录信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveJudgmentExecuteInfo(PageData pd)throws Exception{
		dao.save("PersonCrawlerMapper.saveJudgmentExecuteInfo", pd);
	}
	/**新增欠税、行政处罚等信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveOtherDetailInfo(Map<String,String> map)throws Exception{
		dao.save("PersonCrawlerMapper.saveOtherDetailInfo", map);
	}
	/**新增对外担保信用卡信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveCreditGuaranteeInfo(PageData pd)throws Exception{
		dao.save("PersonCrawlerMapper.saveCreditGuaranteeInfo", pd);
	}
}

