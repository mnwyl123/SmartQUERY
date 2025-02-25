package com.dcits.credit.controller.test;

import java.util.List;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

public interface testManager {

	public List<PageData> list(Page page)throws Exception;
	public List<PageData> oldlist(Page page)throws Exception;
	
	public void deletePER_BASIC(PageData pd)throws Exception;
	public void deletePER_OTHER_IDENTITY(PageData pd)throws Exception;
	public void deletePER_PHONE_INFO(PageData pd)throws Exception;
	public void deletePER_SPOU(PageData pd)throws Exception;
	public void deletePER_LIVE(PageData pd)throws Exception;
	public void PER_CAREER(PageData pd)throws Exception;
	public void PER_LOAN_SUMMARY(PageData pd)throws Exception;
	public void PER_LOAN_PROMPT_DETAIL(PageData pd)throws Exception;
	public void PER_RECOVER_INFO_DETAIL(PageData pd)throws Exception;
	public void PER_OVERDUE_SUMMARY_INFO(PageData pd)throws Exception;
	public void PER_LOAN_REPAYER(PageData pd)throws Exception;
	public void PER_AFTER_PAY_OWE_INFO(PageData pd)throws Exception;
	public void PER_PUBLIC_SUMMARY_INFO(PageData pd)throws Exception;
	public void PER_QUERY_SUMMARY(PageData pd)throws Exception;
	public void PER_LOAN_DETAIL(PageData pd)throws Exception;
	public void PER_CUR_M24_SHOW_INFO(PageData pd)throws Exception;
	public void PER_CUR_Y5_SHOW_INFO(PageData pd)throws Exception;
	public void PER_SPECIAL_TRADE(PageData pd)throws Exception;
	public void PER_SPECIAL_CASE_INFO(PageData pd)throws Exception;
	public void PER_LARGE_DIVIDE_INFO(PageData pd)throws Exception;
	public void PER_LABEL_INFO(PageData pd)throws Exception;
	public void PER_CRED_BASE_INFO(PageData pd)throws Exception;
	public void PER_REPAYER(PageData pd)throws Exception;
	public void PER_AFTER_PAY_INFO(PageData pd)throws Exception;
	public void PER_OWE_TAXES(PageData pd)throws Exception;
	public void PER_VERDICT(PageData pd)throws Exception;
	public void PER_INFORCE(PageData pd)throws Exception;
	public void PER_PENALTIES(PageData pd)throws Exception;
	public void PER_PROVIDENT_FUND_PAY(PageData pd)throws Exception;
	public void PER_LOW_SECURITY(PageData pd)throws Exception;
	public void PER_QUALIFICATION(PageData pd)throws Exception;
	public void PER_ADMINI_REWARD(PageData pd)throws Exception;
	public void PER_WHOLE_LABEL_INFO(PageData pd)throws Exception;
	public void PER_QUERY_DETAIL(PageData pd)throws Exception;
}

