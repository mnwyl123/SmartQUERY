package com.dcits.credit.controller.test;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

@Service("testService")
public class testService implements testManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PersonReportInqMapper.testlistPage", page);
	}
	@SuppressWarnings("unchecked")
	public List<PageData> oldlist(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PersonReportInqMapper.oldlistPage", page);
	}
	public void deletePER_BASIC(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.deletePER_BASIC", pd);
	}
	public void deletePER_OTHER_IDENTITY(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.deletePER_OTHER_IDENTITY", pd);
	}
	public void deletePER_PHONE_INFO(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.deletePER_PHONE_INFO", pd);
	}
	public void deletePER_SPOU(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.deletePER_SPOU", pd);
	}
	public void deletePER_LIVE(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.deletePER_LIVE", pd);
	}
	public void PER_CAREER(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_CAREER", pd);
	}
	public void PER_LOAN_SUMMARY(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_LOAN_SUMMARY", pd);
	}
	public void PER_LOAN_PROMPT_DETAIL(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_LOAN_PROMPT_DETAIL", pd);
	}
	public void PER_RECOVER_INFO_DETAIL(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_RECOVER_INFO_DETAIL", pd);
	}
	public void PER_OVERDUE_SUMMARY_INFO(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_OVERDUE_SUMMARY_INFO", pd);
	}
	public void PER_LOAN_REPAYER(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_LOAN_REPAYER", pd);
	}
	public void PER_AFTER_PAY_OWE_INFO(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_AFTER_PAY_OWE_INFO", pd);
	}
	public void PER_PUBLIC_SUMMARY_INFO(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_PUBLIC_SUMMARY_INFO", pd);
	}
	public void PER_QUERY_SUMMARY(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_QUERY_SUMMARY", pd);
	}
	public void PER_LOAN_DETAIL(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_LOAN_DETAIL", pd);
	}
	public void PER_CUR_M24_SHOW_INFO(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_CUR_M24_SHOW_INFO", pd);
	}
	public void PER_CUR_Y5_SHOW_INFO(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_CUR_Y5_SHOW_INFO", pd);
	}
	public void PER_SPECIAL_TRADE(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_SPECIAL_TRADE", pd);
	}
	public void PER_SPECIAL_CASE_INFO(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_SPECIAL_CASE_INFO", pd);
	}
	public void PER_LARGE_DIVIDE_INFO(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_LARGE_DIVIDE_INFO", pd);
	}
	public void PER_LABEL_INFO(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_LABEL_INFO", pd);
	}
	public void PER_CRED_BASE_INFO(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_CRED_BASE_INFO", pd);
	}
	public void PER_REPAYER(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_REPAYER", pd);
	}
	public void PER_AFTER_PAY_INFO(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_AFTER_PAY_INFO", pd);
	}
	public void PER_OWE_TAXES(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_OWE_TAXES", pd);
	}
	public void PER_VERDICT(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_VERDICT", pd);
	}
	public void PER_INFORCE(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_INFORCE", pd);
	}
	public void PER_PENALTIES(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_PENALTIES", pd);
	}
	public void PER_PROVIDENT_FUND_PAY(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_PROVIDENT_FUND_PAY", pd);
	}
	public void PER_LOW_SECURITY(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_LOW_SECURITY", pd);
	}
	public void PER_QUALIFICATION(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_QUALIFICATION", pd);
	}
	public void PER_ADMINI_REWARD(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_ADMINI_REWARD", pd);
	}
	public void PER_WHOLE_LABEL_INFO(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_WHOLE_LABEL_INFO", pd);
	}
	public void PER_QUERY_DETAIL(PageData pd)throws Exception{
		dao.delete("PersonReportInqMapper.PER_QUERY_DETAIL", pd);
	}
}
