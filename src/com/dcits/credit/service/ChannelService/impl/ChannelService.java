package com.dcits.credit.service.ChannelService.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.dcits.credit.service.ChannelService.ChannelManager;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.ServerUtil.impl.ServerUtilService;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.PageData;


/** 

 */
@Service("channelService")
public class ChannelService implements ChannelManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	private static Logger logger = Logger.getLogger(ChannelService.class);
	@Override
	public List<PageData> QuerylistPage(Page page){
		try {
			return (List<PageData>) dao.findForList("ChannelMapper.QuerylistPage", page);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	@Override
	public void SaveChannel(PageData pd) {
		try {
			dao.save("ChannelMapper.SaveChannel", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	@Override
	public PageData queryChannelById(PageData pd) {
		try {
			return (PageData) dao.findForObject("ChannelMapper.queryChannelById", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	@Override
	public void UpdateChannelById(PageData pd) {
		try {
			dao.update("ChannelMapper.UpdateChannelById", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	@Override
	public void deleteChannelById(PageData pd) {
		try {
			dao.delete("ChannelMapper.deleteChannelById", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	@Override
	public void deleteAllChannelById(Map<String,Object> map) {
		try {
			dao.delete("ChannelMapper.deleteAllChannelById", map);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	@Override
	public void UpdateUser(Map<String,Object> map) {
		try {
			dao.update("ChannelMapper.UpdateUser", map);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	@Override
	public List<PageData> queryChannel(PageData pd) {
		try {
			return (List<PageData>) dao.findForList("ChannelMapper.queryChannel", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	@Override
	public PageData queryByUserName(PageData pd) {
		try {
			return (PageData) dao.findForObject("ChannelMapper.queryByUserName", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
}
