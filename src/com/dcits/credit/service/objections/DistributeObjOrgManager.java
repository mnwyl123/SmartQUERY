package com.dcits.credit.service.objections;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

/**
 * 分配异议处理机构
 * @author lenovo
 *
 */
public interface DistributeObjOrgManager{
	/**
	 * 个人异议处理查询列表
	 * 当为管理员时，查询当前法人下所有用的数据
	 * 否则，查询当前用户所在机构下的所有数据
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findPerObjResutl(Page page) throws Exception;
	/**
	 * 保存异议处理结果
	 * @param pd
	 * @throws Exception
	 */
	public void saveResult(PageData pd) throws Exception;
	/**
	 * 保存异议处理结果附件
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultAtt(PageData pd) throws Exception;
	/**
	 * 通过id查询异议处理结果
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public PageData findResultById(String id) throws Exception;
	/**
	 * 通过id查询异议处理结果附件信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findResultAttById(String id) throws Exception;
	/**
	 * 查询异议处理结果附件信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findResultAtt(PageData pd) throws Exception;
	/**
	 * 修改异议处理结果
	 * @param pd
	 * @throws Exception
	 */
	public void updateResult(PageData pd) throws Exception;
	/**
	 * 删除异议处理结果附件信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public void delAtt(PageData pd) throws Exception;
	/**
	 * 分配异议处理机构
	 * @param pd
	 * @throws Exception
	 */
	public void updateHand_ORG(PageData pd) throws Exception; 
}
