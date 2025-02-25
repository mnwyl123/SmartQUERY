package com.dcits.platform.language;

import javax.servlet.http.HttpServletRequest;

/**
 * 
 * 获取国际化标准
 * @author chenliangu
 *
 */
public class LingualResourceUtil {

	/**
	 * 国际化标准文件路径
	 */
	private static final String PRE_FILE_NAME = "resource.i18n.";
	
	/**
	 * 国际化SESSION存储名称
	 */
	public static final String SESSION_NAME_I18n = "language";
	
	/**
	 * 通过编码获取国际化标准
	 * @param code
	 * @param local
	 * @return
	 */
	public static String getLocalMessage(String code, String local) {
		if (local == null || "".equals(local)) {
			local = "zh_CN";
		}
		String localCode = "";
		String fileName = PRE_FILE_NAME + code.substring(0, code.indexOf("."));
		String los[] = local.split("_");
		localCode = LingualResource.getInstance(fileName, los[0], los[1]).getLocaleString(code);
		return localCode;
	}
	
	/**
	 * 通过编码获取国际化标准
	 * @param code
	 * @param request
	 * @return
	 */
	public static String getLocalMessage(String code, HttpServletRequest request) {
		String local = (String)request.getSession().getAttribute(SESSION_NAME_I18n);
		return getLocalMessage(code, local);
	}
	
	/**
	 * 通过编码获取国际化标准带参数
	 * @param code
	 * @param local
	 * @param args
	 * @return
	 */
	public static String getLocalMessage(String code, String local, String ... args) {
		String localCode = getLocalMessage(code, local);
		
		for (int i=0; i < args.length; i++) {
			localCode = localCode.replace("{" + i + "}", args[i]);
		}
		
		return localCode;
	}
	
	/**
	 * 通过编码获取国际化标准带参数
	 * @param code
	 * @param local
	 * @param args
	 * @return
	 */
	public static String getLocalMessage(String code, HttpServletRequest request, String ... args) {
		String localCode = getLocalMessage(code, request);
		
		for (int i=0; i < args.length; i++) {
			localCode = localCode.replace("{" + i + "}", args[i]);
		}
		
		return localCode;
	}
}
