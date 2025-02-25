package com.dcits.credit.service.ProductService.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Service;

import com.dcits.credit.service.ChannelService.impl.ChannelService;
import com.dcits.credit.service.ProductService.ProductManager;
import com.dcits.platform.dao.DaoSupport;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.Role;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;

@Service("productService")
public class ProductService implements ProductManager{
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	private static Logger logger = Logger.getLogger(ChannelService.class);
	
	@Override
	public List<PageData> ProductlistPage(Page page){
		try {
			return (List<PageData>) dao.findForList("ProductMapper.ProductlistPage", page);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	@Override
	public List<PageData> Productlist(PageData pd){
		try {
			return (List<PageData>) dao.findForList("ProductMapper.Productlist", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	@Override
	public PageData productChannelById(PageData pd) {
		try {
			return (PageData) dao.findForObject("ProductMapper.productChannelById", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return null;
		}
	}
	@Override
	public void UpdateChannelById(PageData pd) {
		try {
			dao.update("ProductMapper.UpdateChannelById", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	@Override
	public void SaveChannel(PageData pd) {
		try {
			dao.save("ProductMapper.SaveChannel", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	@Override
	public void deleteChannelById(PageData pd) {
		try {
			dao.delete("ProductMapper.deleteChannelById", pd);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	@Override
	public void deleteAllChannelById(Map<String,Object> map) {
		try {
			dao.delete("ProductMapper.deleteAllChannelById", map);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
}
