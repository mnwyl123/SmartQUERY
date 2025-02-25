package com.dcits.credit.service.numRead;

import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;

import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;

/**
 * 数字解读Service
 * @author wangwenming
 *
 */
public interface NumReadService {
	/**
	 * 报文生成列表
	 * @return
	 */
	public List<PageData> getReportList(Page page) throws Exception;
	/**
	 * 记录每个报文是由哪些数据生成的
	 * @param list
	 * @throws Exception
	 */
	public void saveCreateReportRecord(List<PageData> list) throws Exception;
	/**
	 * 获取报文记录列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getReportRecordList(Page page) throws Exception;
	/**
	 * 根据文件名删除报文生成的记录
	 * @param filename
	 * @throws Exception
	 */
	public void deleteReportByFN(String filename) throws Exception;
	/**
	 * 通过唯一标示查找记录
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public PageData findReportById(PageData pageData) throws Exception;
	/**
	 * 根据查询编号的集合获取报文生成列表
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findReportByIds(String[] ids) throws Exception;
	/**
	 * 新增报文
	 * @param pageData
	 * @throws Exception
	 */
	public void saveReport(PageData pageData) throws Exception;	
	/**
	 * 修改报文
	 * @param pageData
	 * @throws Exception
	 */
	public void updateReport(PageData pageData) throws Exception;
	/**
	 * 删除报文
	 * @param pageData
	 * @throws Exception
	 */
	public void deleteReport(PageData pageData) throws Exception;
	/**
	 * 批量删除报文
	 * @param pageData
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	/**
	 * 数字解读查询列表
	 * @param page
	 * @return
	 */
	public List<PageData> numReadQueryList(Page page) throws Exception;
	/**
	 * 数字解读保存
	 * @param pd
	 * @throws Exception
	 */
	public void saveNumRead(PageData pd) throws Exception;
	/**
	 * 反馈报文查询
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> resultReadQueryList(Page page) throws Exception;
	/**
	 * 反馈查询保存
	 * @param pd
	 * @throws Exception
	 */
	public void saveResultRead(PageData pd) throws Exception;
	/**
	 * 根据证件类型获取映射值
	 * @param certtype
	 * @return
	 */
	public String getRealCerttype(String certtype) throws Exception;
	/**
	 * 获取报文最大查询编号
	 * @return
	 * @throws Exception
	 */
	public int findReportMaxId() throws Exception;
	/**
	 * 根据机构id查询顶级在人行信用机构代码
	 * @param userid
	 * @return
	 * @throws Exception
	 */
	public String findTopOrgIdInPerBank(String orgId) throws Exception;
	/**
	 * 根据当前日期查询最大流水号
	 * @param nowdate
	 * @return
	 * @throws Exception
	 */
	public String findMaxSerialNum(String nowdate) throws Exception;
	/**
	 * 报文下载，从服务器下载到客户端
	 * @param fileName
	 * @return
	 */
	public byte[] downloadFile(String fileName);
	/**
	 * 报文下载
	 * @param body
	 * @param fileName
	 * @return
	 */
	public ResponseEntity<byte[]> downloadResponse(byte[] body,String fileName);
	/**
	 * 更新状态
	 * @param pd
	 * @throws Exception
	 */
	public void updateStatus(String[] ids) throws Exception;
	
	/**
	 * 根据产品时间查询 
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	public List<PageData> findReportByDate(PageData pd) throws Exception;
	
	/**新增信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveInfo(Map<String,String> map)throws Exception;
	/**
	 * 查询记录数
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	public PageData findReportSumByDate(PageData pd) throws Exception;
	/**
	 * 根据id查询记录数
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	public PageData findReportSumByIds(String[] ids) throws Exception;
	/**
	 * 删除所有数据
	 * @param pageData
	 * @throws Exception
	 */
	public void deleteAllData(PageData pd) throws Exception;
	/**
	 * 数字解读查询数据导出
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	public PageData queryNumReadSucessDataSum(PageData pd) throws Exception;
	/**
	 * 数字解读查询数据导出
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	public List<PageData> queryNumReadSucessData(PageData pd) throws Exception;
}
