package com.dcits.credit.service.numRead.impl;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.dcits.platform.util.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.dcits.credit.service.numRead.NumReadService;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;

/**
 * 数字解读ServiceImpl
 * 
 * @author wangwenming
 *
 */
@Service("numReadService")
public class NumReadServiceImpl implements NumReadService {
	private static Logger logger = Logger.getLogger(NumReadServiceImpl.class);
	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**
	 * 报文生成列表
	 * 
	 * @return
	 */
	@Override
	public List<PageData> getReportList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("NumReadMapper.reportlistPage", page);
	}

	/**
	 * 记录每个报文是由哪些数据生成的
	 * 
	 * @param list
	 * @throws Exception
	 */
	public void saveCreateReportRecord(List<PageData> list) throws Exception {
		dao.save("NumReadMapper.saveCreateReportRecord", list);
	}

	/**
	 * 获取报文记录列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getReportRecordList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("NumReadMapper.getReportRecordlistPage", page);
	}

	/**
	 * 根据文件名删除报文生成的记录
	 * 
	 * @param filename
	 * @throws Exception
	 */
	public void deleteReportByFN(String filename) throws Exception {
		dao.delete("NumReadMapper.delReport", filename);
	}

	/**
	 * 通过唯一标示查找记录
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageData findReportById(PageData pageData) throws Exception {
		return (PageData) dao.findForObject("NumReadMapper.findReportById", pageData);
	}

	/**
	 * 根据查询编号的集合获取报文生成列表
	 * 
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PageData> findReportByIds(String[] ids) throws Exception {
		return (List<PageData>) dao.findForList("NumReadMapper.findReportByIds", ids);
	}

	/**
	 * 新增报文
	 * 
	 * @param pageData
	 * @throws Exception
	 */
	@Override
	public void saveReport(PageData pageData) throws Exception {
		dao.save("NumReadMapper.saveReport", pageData);
	}

	/**
	 * 修改报文
	 * 
	 * @param pageData
	 * @throws Exception
	 */
	@Override
	public void updateReport(PageData pageData) throws Exception {
		dao.update("NumReadMapper.updateReport", pageData);
	}

	/**
	 * 删除报文
	 * 
	 * @param pageData
	 * @throws Exception
	 */
	@Override
	public void deleteReport(PageData pageData) throws Exception {
		dao.delete("NumReadMapper.deleteReport", pageData);
	}

	/**
	 * 批量删除报文
	 * 
	 * @param pageData
	 * @throws Exception
	 */
	@Override
	public void deleteAll(String[] ArrayDATA_IDS) throws Exception {
		dao.delete("NumReadMapper.deleteAll", ArrayDATA_IDS);
	}

	/**
	 * 数字解读查询列表
	 * 
	 * @param page
	 * @return
	 */
	@Override
	public List<PageData> numReadQueryList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("NumReadMapper.numReadlistPage", page);
	}

	/**
	 * 反馈报文查询
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	public void saveNumRead(PageData pd) throws Exception {
		dao.save("NumReadMapper.saveNumRead", pd);
	}

	/**
	 * 反馈报文查询
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PageData> resultReadQueryList(Page page) throws Exception {
		return (List<PageData>) dao.findForList("NumReadMapper.resultlistPage", page);
	}

	/**
	 * 反馈查询保存
	 * 
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void saveResultRead(PageData pd) throws Exception {
		dao.save("NumReadMapper.saveResultRead", pd);
	}

	/**
	 * 根据证件类型获取映射值
	 * 
	 * @param certtype
	 * @return
	 * @throws Exception
	 */
	@Override
	public String getRealCerttype(String certtype) throws Exception {
		return (String) dao.findForObject("NumReadMapper.getRealCerttype", certtype);
	}

	/**
	 * 获取报文最大查询编号
	 * 
	 * @return
	 * @throws Exception
	 */
	@Override
	public int findReportMaxId() throws Exception {
		return (int) dao.findForObject("NumReadMapper.findReportMaxId", "");
	}

	/**
	 * 根据机构id查询顶级在人行信用机构代码
	 * 
	 * @param userid
	 * @return
	 * @throws Exception
	 */
	public String findTopOrgIdInPerBank(String orgId) throws Exception {
		return (String) dao.findForObject("NumReadMapper.findTopOrgIdInPerBank", orgId);
	}

	/**
	 * 根据当前日期查询最大流水号
	 * 
	 * @param nowdate
	 * @return
	 * @throws Exception
	 */
	public String findMaxSerialNum(String nowdate) throws Exception {
		return (String) dao.findForObject("NumReadMapper.findMaxSerialNum", nowdate);
	}

	/**
	 * 报文下载
	 * 
	 * @param body
	 * @param fileName
	 * @return
	 */
	public byte[] downloadFile(String fileName) {
		byte[] res = new byte[0];
		File file = new File(PathUtil.getClasspath() + Const.NUMREAD + fileName);
		if (file.exists() && !file.isDirectory()) {
				try {
					res = FileCopyUtils.copyToByteArray(file);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					logger.error(e.getMessage(),e);
				}
			
		}
		return res;
	}

	/**
	 * 报文下载
	 * 
	 * @param body
	 * @param fileName
	 * @return
	 */
	public ResponseEntity<byte[]> downloadResponse(byte[] body, String fileName) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		String header = request.getHeader("User-Agent").toUpperCase();
		HttpStatus status = HttpStatus.CREATED;
		HttpHeaders headers = new HttpHeaders();
		if (header.contains("MSIE") || header.contains("TRIDENT") || header.contains("EDGE")) {

			try {
				fileName = URLEncoder.encode(fileName, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				logger.error(e.getMessage(),e);
			}
			fileName = fileName.replace("+", "%20"); // 处理IE文件下载空格变+号的问题
			status = HttpStatus.OK;

		} else {

			try {
				fileName = new String(fileName.getBytes("UTF-8"), "ISO8859-1");
			} catch (UnsupportedEncodingException e) {
				logger.error(e.getMessage(),e);
			}
		}
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		headers.setContentDispositionFormData("attachment", fileName);
		headers.setContentLength(body.length);

		return new ResponseEntity<byte[]>(body, headers, status);
	}
	/**
	 * 报文生成列表
	 * 
	 * @return
	 */
	@Override
	public void updateStatus(String[] ids) throws Exception {
		dao.update("NumReadMapper.updateStatus", ids);
	}
	
	/**
	 *根据产品时间查询 
	 * 
	 * @param ids
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<PageData> findReportByDate(PageData pd) throws Exception {
		if("0".equals(pd.getString("flag"))){
			return (List<PageData>) dao.findForList("NumReadMapper.findReportByDate", pd);
		}else{
			return (List<PageData>) dao.findForList("NumReadMapper.findReport", pd);
		}
		
	}
	/**新增信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveInfo(Map<String,String> map)throws Exception{
		dao.save("NumReadMapper.saveInfo", map);
	}

	@Override
	public PageData findReportSumByDate(PageData pd) throws Exception {
		return (PageData) dao.findForObject("NumReadMapper.findReportSumByDate", pd);
	}

	@Override
	public PageData findReportSumByIds(String[] ids) throws Exception {
		if("id".equals(ids[0])){  //默认未生成过的全部
			return (PageData) dao.findForObject("NumReadMapper.findReportSum", ids);
		}else{  //已勾选
			return (PageData) dao.findForObject("NumReadMapper.findReportSumByIds", ids);
		}
	}

	@Override
	public void deleteAllData(PageData pd) throws Exception {
		dao.delete("NumReadMapper.deleteAllData", pd);
	}

	@Override
	public List<PageData> queryNumReadSucessData(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("NumReadMapper.queryNumReadSucessData", pd);
	}

	@Override
	public PageData queryNumReadSucessDataSum(PageData pd) throws Exception {
		return (PageData) dao.findForObject("NumReadMapper.queryNumReadSucessDataSum", pd);
	}
}
