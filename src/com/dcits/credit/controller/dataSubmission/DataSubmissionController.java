package com.dcits.credit.controller.dataSubmission;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import com.dcits.credit.service.dataSubmission.IDataSubmissionService;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.AppUtil;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;
import com.dcits.platform.util.PageData;
import com.dcits.platform.util.role.RoleAuthFactory;
import com.dcits.platform.util.DESUtil;
/**
 * 数据报送
 * @author wang.wenming
 *
 */
@Controller
@RequestMapping(value="/dataSubmission")
public class DataSubmissionController extends BaseController {
	
	@Resource(name="dataSubmissionService")
	private IDataSubmissionService iDataSubmissionService;
	private RoleAuthFactory roleAtuhFactory;
	
	/**
	 * 获取个人明细列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/dataSubmissionPersonlist")
	public ModelAndView personlist(Page page){
		ModelAndView mv = getModelAndView();
		PageData pd = getPageData();
		//添加权限
		Session session = Jurisdiction.getSession();
		User userInfo = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = userInfo.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("COMPANY", company);
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		pd.put("USERCODE", userInfo.getUSERNAME());
		page.setPd(pd);
		List<PageData> dataSubmissionList = new ArrayList<PageData>();
		try {
			dataSubmissionList = iDataSubmissionService.getCifmPersonList(page);
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date ;		
			int size = dataSubmissionList.size();
			for(int i=0;i<size;i++) {
				dataSubmissionList.get(i).put("CLIENT_NAME", DESUtil.decrypt("enhjeA==",dataSubmissionList.get(i).get("CLIENT_NAME").toString()));
				String cred=DESUtil.decrypt("enhjeA==",dataSubmissionList.get(i).get("CREDENTIALS_NO").toString());
				if(dataSubmissionList.get(i).get("CREDENTIALS_TYPE").equals("10")) {
					if(cred.length()==18) {
						dataSubmissionList.get(i).put("CREDENTIALS_NO", cred.substring(0,6)+"********"+cred.substring(16));
					}
					if(cred.length()==15) {
						dataSubmissionList.get(i).put("CREDENTIALS_NO", cred.substring(0,6)+"******"+cred.substring(17));
					}
				}else {
					dataSubmissionList.get(i).put("CREDENTIALS_NO", cred.substring(0,cred.length()-6)+"******");
				}
			}
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		mv.setViewName("credit/dataSubmission/dataSubmissionPerson_list");
		mv.addObject("dataSubmissionPersonList", dataSubmissionList);
		mv.addObject("pd", pd);
		mv.addObject("QX",roleAtuhFactory.getHC(roleIds,menuId));
		return mv;
	}
	
	/**
	 * 获取企业明细列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/dataSubmissionCompanylist")
	public ModelAndView companylist(Page page){
		ModelAndView mv = getModelAndView();
		PageData pd = getPageData();
		//添加权限
		Session session = Jurisdiction.getSession();
		User userInfo = (User)session.getAttribute(Const.SESSION_USER);
		String USERID = userInfo.getUSER_ID();
		String company = (String)session.getAttribute(USERID+Const.SESSION_COMPANY);
		pd.put("COMPANY", company);
		List<String> roleIds = (List<String>) session.getAttribute(USERID+Const.SESSION_ROLE_RIGHTS);
		String menuId = pd.getString("menuId");
		pd.put("USERCODE", userInfo.getUSERNAME());
		page.setPd(pd);
		List<PageData> dataSubmissionList = new ArrayList<PageData>();;
		try {
			dataSubmissionList = iDataSubmissionService.getCifmCompanyList(page);
			int size = dataSubmissionList.size();
			for(int i=0;i<size;i++) {
				dataSubmissionList.get(i).put("COMPANY_NAME", DESUtil.decrypt("enhjeA==",dataSubmissionList.get(i).get("COMPANY_NAME").toString()));
				dataSubmissionList.get(i).put("CHINA_CREDIT_CODE", DESUtil.decrypt("enhjeA==",dataSubmissionList.get(i).get("CHINA_CREDIT_CODE").toString()));
			}
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		mv.setViewName("credit/dataSubmission/dataSubmissionCompany_list");
		mv.addObject("dataSubmissionCompanyList", dataSubmissionList);
		mv.addObject("pd", pd);
		mv.addObject("QX",roleAtuhFactory.getHC(roleIds,menuId));
		return mv;
	}
	 
	/**
	 * 生成Document
	 * @return
	 */
	/*public Document init() {
		Document document = null;
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory
                    .newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            document = builder.newDocument();
        } catch (ParserConfigurationException e) {
            System.out.println(e.getMessage());
        }
        return document;
    }
    
	*//**
	 * 给父节点生成一个子节点
	 * @param nodeName  子节点名称
	 * @param nodeText  节点内容
	 * @param superNode 父节点
	 *//*
	public void addNode(String childNodeName,String childNodeText,Element superNode,Document doc){
		if(childNodeText != null && childNodeText != ""){
			Element el = doc.createElement(childNodeName);
			el.appendChild(doc.createTextNode(childNodeText));
			superNode.appendChild(el);
		}else{
			Element el = doc.createElement(childNodeName);
			el.appendChild(doc.createTextNode(" "));
			superNode.appendChild(el);
		}
	}
	*//**
	 * 生成个人明细的Xml报文
	 * @param page
	 * @throws Exception
	 *//*
	@RequestMapping(value="/createXmlOfPerson")
	@ResponseBody
	public Object createXmlOfPerson(Page page) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		PageData pageData = getPageData();
		String queryId = pageData.getString("id");
		//生成xml文件的路径
		String filepath = "D:/test/grade.txt";
		Document document = init();
		PageData pd = iDataSubmissionService.getCifmPersonObject(queryId);
		//添加根节点
        Element root = document.createElement("DataBody"); 
        document.appendChild(root);
        //添加子节点
        addNode("upOrgCode",pd.getString("ORG_CODE"),root,document);
        addNode("queryOrgNo",pd.getString("ORG_NAME"),root,document);
        addNode("queryOrgName",pd.getString("BRANCH_NAME"),root,document);
        addNode("queryUserSysName",pd.getString("USER_SYS_NAME"),root,document);
        addNode("queryUserName",pd.getString("USER_REAL_NAME"),root,document);
        addNode("queriedUserName",pd.getString("CLIENT_NAME"),root,document);
        addNode("certType",pd.getString("CREDENTIALS_TYPE"),root,document);
        addNode("certNo",pd.getString("CREDENTIALS_NUM"),root,document);
        addNode("queryReason",pd.getString("FIND_REASON"),root,document);
        addNode("queryFormatName",pd.getString("FIND_VERSION"),root,document);
        addNode("isQueried",pd.getString("IS_GET"),root,document);
        addNode("queryAuthTime",pd.getString("CHECK_TIME"),root,document);
        addNode("queryComputerIP",pd.getString("IP"),root,document);
        TransformerFactory tf = TransformerFactory.newInstance();
        try {
            Transformer transformer = tf.newTransformer();
            //设置输出结果
            DOMSource source = new DOMSource(document);
            //设置xml文件的头部信息为gb2312
            transformer.setOutputProperty(OutputKeys.ENCODING, "gb2312");
            //美化缩进
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "2");
            //文件流输出
            PrintWriter pw = new PrintWriter(new FileOutputStream(filepath));
            byte[] b = new FileOutputStream(filepath).toString().getBytes();
            //设置输入源
            StreamResult result = new StreamResult(pw);
            //输出xml文件
            transformer.transform(source, result);
            System.out.println("生成XML文件成功!");
            map.put("result","success");
        } catch (TransformerConfigurationException e) {
            System.out.println(e.getMessage());
            map.put("result","error");
        } catch (IllegalArgumentException e) {
            System.out.println(e.getMessage());
            map.put("result","error");
        } catch (FileNotFoundException e) {
            System.out.println(e.getMessage());
            map.put("result","error");
        } catch (TransformerException e) {
            System.out.println(e.getMessage());
            map.put("result","error");
        }
        return AppUtil.returnObject(new PageData(), map);
    }
	
	//person_test
	@RequestMapping(value="/createTxtOfPerson")
	@ResponseBody
	public Object createTxtOfPerson(Page page) throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		PageData pageData = getPageData();
		String queryId = pageData.getString("id");
		PageData pd = iDataSubmissionService.getCifmPersonObject(queryId);
		//文件路径
		String path = "D:/test/1234.txt";
		FileOutputStream fos = null;	
		StringBuffer sb = new StringBuffer();
		//添加头部信息		
        sb.append("upOrgCode,");
		sb.append("queryOrgNo,");
		sb.append("queryOrgName,");
		sb.append("queryUserSysName,");
		sb.append("queryUserName,");
		sb.append("queriedUserName,");
		sb.append("certType,");
		sb.append("certNo,");
		sb.append("queryReason,");
		sb.append("queryFormatName,");
		sb.append("isQueried,");
		sb.append("queryAuthTime,");
		sb.append("queryComputerIP");
		sb.append("\r\n");
		sb.append(pd.getString("ORG_CODE")+",");
		sb.append(pd.getString("ORG_NAME")+",");
		sb.append(pd.getString("BRANCH_NAME")+",");
		sb.append(pd.getString("USER_SYS_NAME")+",");
		sb.append(pd.getString("USER_REAL_NAME")+",");
		sb.append(pd.getString("CLIENT_NAME")+",");
		sb.append(pd.getString("CREDENTIALS_TYPE")+",");
		sb.append(pd.getString("CREDENTIALS_NUM")+",");
		sb.append(pd.getString("FIND_REASON")+",");
		sb.append(pd.getString("FIND_VERSION")+",");
		sb.append(pd.getString("IS_GET")+",");
		sb.append(pd.getString("CHECK_TIME")+",");
		sb.append(pd.getString("IP"));
		try {
			fos = new FileOutputStream(path);
			fos.write(sb.toString().getBytes());
			map.put("result","success");
		} catch (Exception e) {
			map.put("result","error");
		}finally{
			fos.close();
		}
        return AppUtil.returnObject(new PageData(), map);
    }
	
	
	*//**
	 * 生成企业明细的Xml报文
	 * @param page
	 * @throws Exception
	 *//*
	@RequestMapping(value="/createXmlOfCompany")
	@ResponseBody
	public Object createXmlOfCompany(Page page) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		PageData pageData = getPageData();
		String queryId = pageData.getString("id");
		//生成xml文件的路径
		String filepath = "D:/test/grade2.xml";
		Document document = init();
		PageData pd = iDataSubmissionService.getCifmCompanyObject(queryId);
		//生成根节点
        Element root = document.createElement("DataBody"); 
        document.appendChild(root);
        //添加子节点
        addNode("upOrgCode",pd.getString("ORG_CODE"),root,document);
        addNode("queryOrgNo",pd.getString("ORG_NAME"),root,document);
        addNode("queryOrgName",pd.getString("BRANCH_NAME"),root,document);
        addNode("queryUserSysName",pd.getString("USER_SYS_NAME"),root,document);
        addNode("queryUserName",pd.getString("USER_REAL_NAME"),root,document);
        addNode("queriedUserName",pd.getString("CLIENT_NAME"),root,document);
        addNode("deptName",pd.getString("DEPARTMENT_NAME"),root,document);
        addNode("queryTime",pd.getString("FIND_TIME"),root,document);
        addNode("companyName",pd.getString("COMPANY_NAME"),root,document);
        addNode("zzCode",pd.getString("CHINA_CREDIT_CODE"),root,document);
        addNode("isQueried",pd.getString("IS_GET"),root,document);
        addNode("queryAuthTime",pd.getString("CHECK_TIME"),root,document);
        addNode("queryComputerIP",pd.getString("IP"),root,document);
        TransformerFactory tf = TransformerFactory.newInstance();
        try {
            Transformer transformer = tf.newTransformer();
            //设置输出结果
            DOMSource source = new DOMSource(document);
            //设置xml文件的头部信息为gb2312
            transformer.setOutputProperty(OutputKeys.ENCODING, "gb2312");
            //美化缩进
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "2");
            //文件流输出
            PrintWriter pw = new PrintWriter(new FileOutputStream(filepath));
            //设置输入源
            StreamResult result = new StreamResult(pw);
            //输出xml文件
            transformer.transform(source, result);
            System.out.println("生成XML文件成功!");
            map.put("result","success");
        } catch (TransformerConfigurationException e) {
            System.out.println(e.getMessage());
            map.put("result","error");
        } catch (IllegalArgumentException e) {
            System.out.println(e.getMessage());
            map.put("result","error");
        } catch (FileNotFoundException e) {
            System.out.println(e.getMessage());
            map.put("result","error");
        } catch (TransformerException e) {
            System.out.println(e.getMessage());
            map.put("result","error");
        }
        return AppUtil.returnObject(new PageData(), map);
    }
	
	//Company_test
	@RequestMapping(value="/createTxtOfCompany")
	@ResponseBody
	public Object createTxtOfCompany(Page page) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		PageData pageData = getPageData();
		String queryId = pageData.getString("id");
		PageData pd = iDataSubmissionService.getCifmCompanyObject(queryId);
		//生成xml文件的路径
		String path = "D:/test/5678.txt";
		FileOutputStream fos = null;
		StringBuffer sb = new StringBuffer();
        sb.append("upOrgCode,");
        sb.append("queryOrgNo,");
        sb.append("queryOrgName,");
        sb.append("queryUserSysName,");
        sb.append("queryUserName,");
        sb.append("queriedUserName,");
        sb.append("deptName,");
        sb.append("queryTime,");
        sb.append("companyName,");
        sb.append("zzCode,");
        sb.append("isQueried,");
        sb.append("queryAuthTime,");
        sb.append("queryComputerIP");
        sb.append("\r\n");
        sb.append(pd.getString("ORG_CODE")+",");
        sb.append(pd.getString("ORG_NAME")+",");
        sb.append(pd.getString("BRANCH_NAME")+",");
        sb.append(pd.getString("USER_SYS_NAME")+",");
        sb.append(pd.getString("USER_REAL_NAME")+",");
        sb.append(pd.getString("CLIENT_NAME")+",");
        sb.append(pd.getString("DEPARTMENT_NAME")+",");
        sb.append(pd.getString("FIND_TIME")+",");
        sb.append(pd.getString("COMPANY_NAME")+",");
        sb.append(pd.getString("CHINA_CREDIT_CODE")+",");
        sb.append(pd.getString("IS_GET")+",");
        sb.append(pd.getString("CHECK_TIME")+",");
        sb.append(pd.getString("IP"));
        try {
			fos = new FileOutputStream(path);
			fos.write(sb.toString().getBytes());
			map.put("result","success");
		} catch (Exception e) {
			map.put("result","error");
		}finally{
			fos.close();
		}            
        return AppUtil.returnObject(new PageData(), map);
    }*/
	
}
