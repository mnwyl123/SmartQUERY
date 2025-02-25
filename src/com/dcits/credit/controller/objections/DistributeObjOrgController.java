package com.dcits.credit.controller.objections;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.credit.entity.FileTool;
import com.dcits.credit.entity.FtpUtil;
import com.dcits.credit.service.objections.DistributeObjOrgManager;
import com.dcits.credit.util.CompressUtils;
import com.dcits.credit.util.PasswordOper;
import com.dcits.credit.util.UserUtil;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.FileDownload;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.PathUtil;
import com.dcits.platform.util.StringUtil;

/**
 * 分配异议处理机构
 * @author lenovo
 *
 */
@Controller
@RequestMapping(value="/distributeObjOrg")
public class DistributeObjOrgController extends BaseController{
	
	@Resource(name="distributeObjOrgService")
	private DistributeObjOrgManager service;
	
	/**
	 * 个人异议处理分配查询列表
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/perList")
	public ModelAndView perList(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		List<PageData> list = null;
		try {
			if(UserUtil.CurrUserIsAdmin()){
				pd.put("USERNAME", null);
			}else{
				pd.put("USERNAME", Jurisdiction.getUsername());
			}
			pd.put("COMPANY", UserUtil.getCurrUser().getCOMPANY());
			page.setPd(pd);
			list = service.findPerObjResutl(page);
		} catch (Exception e) {
			logger.error(e.getMessage(),e);
		}
		mv.addObject("pd", pd);
		mv.addObject("perList", list);
		mv.setViewName("/credit/objections/distribute_perList");
		return mv;
	}
	/**
	 * 填写异议处理结果
	 * @param files
	 * @param id
	 * @param result
	 * @return
	 */
	@SuppressWarnings("static-access")
	@RequestMapping(value="/objHandler")
	public Object objHandler(
			@RequestParam(value="multiUploadFiles",required=false) List<MultipartFile> files,
			@RequestParam(value="ID",required=false) String id,
			@RequestParam(value="RESULT_DESC",required=false) String result
			){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			//保存处理结果信息
			pd.put("ID", id);
			pd.put("ATT_CNT", files.size());
			pd.put("RESULT_DESC", result);
			service.saveResult(pd);
			//保存附件信息
			PageData serverInfo = BaseController.getServerInfo();
			//密码解密
			serverInfo.put("LoginPass", PasswordOper.decode(serverInfo.getString("LoginPass")));
			String ftpPath = serverInfo.getString("ftpObjAttPath_upload")+id;
			for(MultipartFile mf : files){
				String mfName = mf.getOriginalFilename();
				if(StringUtil.isEmpty(mfName)) continue;
				//将异议处理相关附件上传至ftp
				new FileTool().uploadFile(serverInfo.getString("IP"), 
						Integer.parseInt(serverInfo.getString("port")), 
						serverInfo.getString("LoginName"), 
						serverInfo.getString("LoginPass"), 
						serverInfo.getString("ftpObjAttPath_upload")+id, 
						mfName, 
						mf.getInputStream() 
						); 
				
				PageData p = new PageData();
				p.put("HR_ID", pd.getString("ID"));
				p.put("ATT_NAME", mfName);
				p.put("ATT_PATH", ftpPath);
				service.saveResultAtt(p);
			}
			mv.addObject("msg","success");
		} catch (Exception e) {
			logger.error("URL=DistributeObjOrgController.objHandler()方法出错",e);
			mv.addObject("msg","success");
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	@RequestMapping(value="/objResultAtt")
	public ModelAndView objResultAtt(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		List attList = null;
		try {
			attList = service.findResultAttById(pd.getString("ID"));
			PageData result = service.findResultById(pd.getString("ID"));
			if(result!=null) pd.putAll(result);
		} catch (Exception e) {
			logger.error("URL=DistributeObjOrgController.objResultAtt()方法出错",e);
		}
		mv.addObject("pd", pd);
		mv.addObject("attList", attList);
		mv.setViewName("/credit/objections/objResultHandler");
		return mv;
	}
	/**
	 * 附件下载
	 * @param response
	 */
	@RequestMapping(value="downloadAtt")
	public void downloadAtt(HttpServletResponse response){
		PageData pd = this.getPageData();
		PageData serverInfo;
		try {
			pd.put("HR_ID", pd.getString("ID"));
			pd = service.findResultAtt(pd);
			serverInfo = getServerInfo();
			String id = pd.getString("HR_ID");
			String att_name = pd.getString("ATT_NAME");
			String filePath=Const.FILEPATHIMG+id+"/"+att_name;
		    //判断文件是否存在
		    File file = new File(PathUtil.getClasspath() + filePath);
		    if(!file.exists()){
		    	String ftpHost =serverInfo.getString("IP");  
		        String ftpUserName =serverInfo.getString("LoginName");  
		        String ftpPassword =  PasswordOper.decode(serverInfo.getString("LoginPass"));  
		        int ftpPort =  Integer.parseInt(serverInfo.getString("port"));  
		        String ftpPath =pd.getString("ATT_PATH");  
		        String localPath =PathUtil.getClasspath() + Const.FILEPATHIMG + id;  
		        List<String> fileList = new ArrayList<String>();
		        fileList.add(att_name);
		        FtpUtil.downloadFtpFile(ftpHost, ftpUserName, ftpPassword, ftpPort, ftpPath, localPath, fileList); 
		    }
		    FileDownload.fileDownload(response, PathUtil.getClasspath() + filePath, att_name);
		} catch (Exception e) {
			logger.error("URL=DistributeObjOrgController.downloadAtt()方法出错",e);
		}
	}
	/**
	 * 删除异议处理附件信息
	 * @return
	 */
	@RequestMapping(value="deleteAtt")
	@ResponseBody
	public Object deleteAtt(){
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = this.getPageData();
		try {
			pd.put("HR_ID", pd.getString("ID"));
			service.delAtt(pd);
			map.put("msg", "success");
		} catch (Exception e) {
			logger.info(e.getMessage());
			map.put("msg", "error");
		}
		return map;
	}

}
