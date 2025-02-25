package com.dcits.platform.util;

import java.io.File;

import org.springframework.context.ApplicationContext;
/**
 * 项目名称：
 * @author pengyj:pengyj
 * 修改日期：2015/11/2
*/
public class Const {
	public static final String SESSION_SECURITY_CODE = "sessionSecCode";//验证码
	public static final String SESSION_LoginInfo = "sessionLoginInfo";//当前操作日志信息
	public static final String SESSION_COMPANY = "sessionComp";			//当前法人
	public static final String SESSION_USER = "sessionUser";			//session用的用户
	public static final String SESSION_ORGS = "sessionOrgList";			//用户机构列表
	public static final String SESSION_ORG = "sessionOrg";			//当前机构
	public static final String SESSION_ROLE_RIGHTS = "sessionRoleRights";
	public static final String sSESSION_ROLE_RIGHTS = "sessionRoleRights";
	public static final String SESSION_menuList = "menuList";			//当前菜单
	public static final String SESSION_allmenuList = "allmenuList";		//全部菜单
	public static final String SESSION_QX = "QX";
	public static final String SESSION_userpds = "userpds";			
	public static final String SESSION_USERROL = "USERROL";				//用户对象
	public static final String SESSION_USERNAME = "USERNAME";			//用户名
	public static final String SESSION_USER_ID = "USER_ID";             //用户ID
	public static final String TRUE = "T";
	public static final String FALSE = "F";
	public static final String LOGIN = "/login_toLogin.do";				//登录地址
	public static final String SYSNAME = "admin/config/SYSNAME.txt";	//系统名称路径
	public static final String PAGE	= "admin/config/PAGE.txt";			//分页条数配置路径
	public static final String EMAIL = "admin/config/EMAIL.txt";		//邮箱服务器配置路径
	public static final String SMS1 = "admin/config/SMS1.txt";			//短信账户配置路径1
	public static final String SMS2 = "admin/config/SMS2.txt";			//短信账户配置路径2
	public static final String FWATERM = "admin/config/FWATERM.txt";	//文字水印配置路径
	public static final String IWATERM = "admin/config/IWATERM.txt";	//图片水印配置路径
	public static final String WEIXIN	= "admin/config/WEIXIN.txt";	//微信配置路径
	public static final String WEBSOCKET = "admin/config/WEBSOCKET.txt";//WEBSOCKET配置路径
	public static final String FILEPATHIMG = "uploadFiles"+File.separator+"uploadImgs"+File.separator;	//图片上传路径
	public static final String FILEPATHFILE = "uploadFiles/file/";		//文件上传路径
	public static final String NUMREAD = "uploadFiles/numRead/"; 		//数字解读文件下载路径
	public static final String IMPOR = "uploadFiles/impor/"; 		//重要信息提示下载路径	
	public static final String XSL = "uploadFiles/xsl/"; 		//xsl文件存放位置
	public static final String XML = "uploadFiles/xml/"; 		//xml文件存放位置
	public static final String HTML = "uploadFiles/html/"; 		//xml转成HTML文件存放位置
	public static final String PDF = "uploadFiles/pdf/"; 		//xml转成pdf文件存放位置
	public static final String FOP = "uploadFiles/fop/"; 		//xml转成pdf的fop文件存放位置
	public static final String tx = "uploadFiles/tx/"; 		//批量接口生成txt文件存放位置
	public static final String OBJ_ENCLOSURE = "uploadFiles/objections/enclosure/"; 		//xml转成pdf的fop文件存放位置
	public static final String FILEPATHTWODIMENSIONCODE = "uploadFiles/twoDimensionCode/"; //二维码存放路径
	public static final String NO_INTERCEPTOR_PATH = ".*/((login)|(logout)|(code)|(app)|(weixin)|(static)|(main)|(websocket)|(rest/company)).*";	//不对匹配该值的访问路径拦截（正则）
	public static ApplicationContext WEB_APP_CONTEXT = null; //该值会在web容器启动时由WebAppContextListener初始化
	
	/**
	 * APP Constants
	 */
	//app注册接口_请求协议参数)
	public static final String[] APP_REGISTERED_PARAM_ARRAY = new String[]{"countries","uname","passwd","title","full_name","company_name","countries_code","area_code","telephone","mobile"};
	public static final String[] APP_REGISTERED_VALUE_ARRAY = new String[]{"国籍","邮箱帐号","密码","称谓","名称","公司名称","国家编号","区号","电话","手机号"};
	
	//app根据用户名获取会员信息接口_请求协议中的参数
	public static final String[] APP_GETAPPUSER_PARAM_ARRAY = new String[]{"USERNAME"};
	public static final String[] APP_GETAPPUSER_VALUE_ARRAY = new String[]{"用户名"};
	
	
}
