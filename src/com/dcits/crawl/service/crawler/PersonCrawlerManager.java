package com.dcits.crawl.service.crawler;


import java.util.Map;

import com.dcits.platform.util.PageData;


/** 
 * 个人征信报告爬虫
 * 创建人：zhangyy
 */
public interface PersonCrawlerManager{
	/**新增报告信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveReportInfo(PageData pd)throws Exception;
	/**新增个人信息
	 * @param pd
	 * @throws Exception
	 */
	public void savePersonIdentity(PageData pd)throws Exception;
	/**新增电话号码信息20191101
	 * @param pd
	 * @throws Exception
	 */
	public void savePhoneInfo(PageData pd)throws Exception;
	/**新增配偶信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveSpouInfo(PageData pd)throws Exception;
	/**新增居住信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveLiveInfo(PageData pd)throws Exception;
	/**新增职业信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveCareerInfo(PageData pd)throws Exception;
	/**新增信贷概要信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveCreditSumInfo(PageData pd)throws Exception;
	/**新增信贷交易信息提示
	 * @param pd
	 * @throws Exception
	 */
	public void saveCreditTipInfo(PageData pd)throws Exception;
	/**新增逾期信息汇总
	 * @param pd
	 * @throws Exception
	 */
	public void saveInfoOverdue(PageData pd)throws Exception;

	/**新增相关还款责任信息汇总
	 * @param pd
	 * @throws Exception
	 */
	public void saveLoanRepayer(PageData pd)throws Exception;
	/**新增后付费汇总
	 * @param pd
	 * @throws Exception
	 */
	public void saveAfterPay(PageData pd)throws Exception;
	/**新增公共信息概要
	 * @param pd
	 * @throws Exception
	 */
	public void savePublic(PageData pd)throws Exception;
	/**查询记录概要
	 * @param pd
	 * @throws Exception
	 */
	public void saveInfoQuerySummary(PageData pd)throws Exception;
	/**新增贷款交易明细信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveLoanInfo(PageData pd)throws Exception;
	/**新增5年历史表现信息
	 * @param pd
	 * @throws Exception
	 */
	public void save5YearInfo(PageData pd)throws Exception;
	/**新增贷记卡交易明细
	 * @param pd
	 * @throws Exception
	 */
	public void saveCreditInfo(PageData pd)throws Exception;
	/**新增准贷记卡交易明细
	 * @param pd
	 * @throws Exception
	 */
	public void saveQCreditInfo(PageData pd)throws Exception;
	/**新增被追偿信息明细
	 * @param pd
	 * @throws Exception
	 */
	public void saveAssetsDisposal(PageData pd)throws Exception;
	/**新增相关还款责任明细
	 * @param pd
	 * @throws Exception
	 */
	public void savePerRepayer(PageData pd)throws Exception;
	/**新增授信协议
	 * @param pd
	 * @throws Exception
	 */
	public void saveCredBase(PageData pd)throws Exception;
	/**新增后付费信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveAfterPayInfo(PageData pd)throws Exception;
	/**新增欠税记录信息
	 * @param pd
	 * @throws Exception
	 */
	public void savePerOweTaxes(PageData pd)throws Exception;
	/**新增民事判决记录信息
	 * @param pd
	 * @throws Exception
	 */
	public void savePerVerdict(PageData pd)throws Exception;
	/**新增强制执行记录信息
	 * @param pd
	 * @throws Exception
	 */
	public void savePerInforce(PageData pd)throws Exception;
	/**新增行政处罚记录信息
	 * @param pd
	 * @throws Exception
	 */
	public void savePerPenalties(PageData pd)throws Exception;
	/**新增住房公积金信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveAccFundInfo(PageData pd)throws Exception;
	/**新增低保救助记录信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveLowSecurity(PageData pd)throws Exception;
	/**新增执业资格记录信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveQualification(PageData pd)throws Exception;
	/**新增行政奖励记录信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveAdminiReward(PageData pd)throws Exception;
	/**新增养老保险信息
	 * @param pd
	 * @throws Exception
	 */
	public void savePensionInfo(PageData pd)throws Exception;
	/**新增查询汇总信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveQueryInfo(PageData pd)throws Exception;
	/**新增查询汇总明细信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveQueryDetailInfo(PageData pd)throws Exception;
	/**新增资产处置/保证人代偿信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveAssertAsInfo(PageData pd)throws Exception;
	/**新增对外担保信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveGuaranteeInfo(PageData pd)throws Exception;
	/**新增贷款/贷记卡/准贷记卡逾期记录
	 * @param pd
	 * @throws Exception
	 */
	public void saveOverdueInfo(PageData pd)throws Exception;
	/**新增说明/声明/标注信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveDeclareObjectInfo(PageData pd)throws Exception;
	/**新增民事判决/强制执行记录信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveJudgmentExecuteInfo(PageData pd)throws Exception;
	/**新增欠税、行政处罚等信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveOtherDetailInfo(Map<String,String> map)throws Exception;
	/**新增对外担保信用卡信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveCreditGuaranteeInfo(PageData pd)throws Exception;
	/**新增特殊交易
	 * @param pd
	 * @throws Exception
	 */
	public void saveSpecialTrade(PageData pd1)throws Exception;
	/**更新个人信息
	 * @param pd
	 * @throws Exception
	 */
	public void updatePersonIdentity(PageData pd)throws Exception;
	/**异议版报告信息入库
	 * @param pd
	 * @throws Exception
	 */
	public void saveUnCommonInfo(PageData pd)throws Exception;
	/**新增信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveInfo(Map<String,String> map)throws Exception;
	/**更新信息
	 * @param pd
	 * @throws Exception
	 */
	public void updateInfo(Map<String,String> map)throws Exception;
	/**新增被追偿信息汇总
	 * @param pd
	 * @throws Exception
	 */
	public void saveRecover(PageData pd)throws Exception;
}


