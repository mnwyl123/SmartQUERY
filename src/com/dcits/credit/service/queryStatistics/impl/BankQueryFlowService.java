package com.dcits.credit.service.queryStatistics.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.DESUtil;
import com.dcits.platform.util.PageData;
import com.dcits.credit.service.queryStatistics.BankQueryFlowManager;

/** 
 * 说明： 人行征信查询流水统计
 * 创建人：  
 * 创建时间：2017-06-30
 * @version
 */
@Service("BankQueryFlowService")
public class BankQueryFlowService implements BankQueryFlowManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd)throws Exception{
		String PRODUCT_DES1 = pd.getString("PRODUCT_DES1");
		String PRODUCT_DES3 = pd.getString("PRODUCT_DES3");
		if(PRODUCT_DES1 != null&&!PRODUCT_DES1.equals("")) {
			PRODUCT_DES1 = DESUtil.encrypt("enhjeA==", PRODUCT_DES1);
			pd.put("PRODUCT_DES1", PRODUCT_DES1);
		}
		if(PRODUCT_DES3 != null&&!PRODUCT_DES3.equals("")) {
			PRODUCT_DES3 = DESUtil.encrypt("enhjeA==", PRODUCT_DES3);
			pd.put("PRODUCT_DES3", PRODUCT_DES3);
		}
		dao.save("BankQueryFlowMapper.save", pd);
	}
	
	/**个人查询流水列表
	 * @param page
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("BankQueryFlowMapper.datalistPage", page);
	}
	/**企业查询流水列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> comQuerylist(Page page)throws Exception{
		return (List<PageData>)dao.findForList("BankQueryFlowMapper.comDatalistPage", page);
	}
	/**企业查询流水列表(总计专用)
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> comDataCountPage(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("BankQueryFlowMapper.comDataCountPage", pd);
	}
	/**列表(详情)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> detailList(Page page)throws Exception{
		List<PageData>varList = (List<PageData>)dao.findForList("BankQueryFlowMapper.detaillistPage", page);
		int size = varList.size();
		for(int i=0;i<size;i++) {
			String COM_CREDENTIALS_NUM = varList.get(i).getString("COM_CREDENTIALS_NUM");
			String CLIENT_NAME = varList.get(i).getString("CLIENT_NAME");
			COM_CREDENTIALS_NUM = DESUtil.decrypt("enhjeA==", COM_CREDENTIALS_NUM);
			CLIENT_NAME = DESUtil.decrypt("enhjeA==", CLIENT_NAME);
			varList.get(i).put("COM_CREDENTIALS_NUM", COM_CREDENTIALS_NUM);
			varList.get(i).put("CLIENT_NAME", CLIENT_NAME);
		}
		return varList;
	}
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> detailListHis(Page page)throws Exception{
		List<PageData>varList = (List<PageData>)dao.findForList("BankQueryFlowMapper.hisDetaillistPage", page);
		int size = varList.size();
		for(int i=0;i<size;i++) {
			String COM_CREDENTIALS_NUM = varList.get(i).getString("COM_CREDENTIALS_NUM");
			String CLIENT_NAME = varList.get(i).getString("CLIENT_NAME");
			COM_CREDENTIALS_NUM = DESUtil.decrypt("enhjeA==", COM_CREDENTIALS_NUM);
			CLIENT_NAME = DESUtil.decrypt("enhjeA==", CLIENT_NAME);
			varList.get(i).put("COM_CREDENTIALS_NUM", COM_CREDENTIALS_NUM);
			varList.get(i).put("CLIENT_NAME", CLIENT_NAME);
		}
		return varList;
	}
	/**列表(详情)
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> comDetailList(Page page)throws Exception{
		List<PageData>varList = (List<PageData>)dao.findForList("BankQueryFlowMapper.comDetaillistPage", page);
		int size = varList.size();
		for(int i=0;i<size;i++) {
			String COM_CREDENTIALS_NUM = varList.get(i).getString("COM_CREDENTIALS_NUM");
			String CLIENT_NAME = varList.get(i).getString("CLIENT_NAME");
			COM_CREDENTIALS_NUM = DESUtil.decrypt("enhjeA==", COM_CREDENTIALS_NUM);
			CLIENT_NAME = DESUtil.decrypt("enhjeA==", CLIENT_NAME);
			varList.get(i).put("COM_CREDENTIALS_NUM", COM_CREDENTIALS_NUM);
			varList.get(i).put("CLIENT_NAME", CLIENT_NAME);
		}
		return varList;
	}
	/**批量新增
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void bachSave(PageData pd)throws Exception{
		dao.save("BankQueryFlowMapper.bachSave", pd);
	}
}

