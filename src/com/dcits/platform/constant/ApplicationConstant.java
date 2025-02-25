package com.dcits.platform.constant;

/**
 * 系统常量
 * @author chenliangu
 *
 */
public class ApplicationConstant {
	public static String ADMINISTRATOR = "admin";
	public static String ADMIN_ORG_CODE = "10000";
	public static String ADMIN_ORG_NAME = "宜宾市商业银行(汇总)";
	
	public static boolean multiCorpMode = false;
	
	public static String defalutCorp = "0000";

	/**
	 * @return the multiCorpMode
	 */
	public static boolean isMultiCorpMode() {
		return multiCorpMode;
	}

	/**
	 * @param multiCorpMode the multiCorpMode to set
	 */
	public void setMultiCorpMode(boolean multiCorpMode) {
		ApplicationConstant.multiCorpMode = multiCorpMode;
	}

	/**
	 * @return the defalutCorp
	 */
	public static String getDefalutCorp() {
		return defalutCorp;
	}

	/**
	 * @param defalutCorp the defalutCorp to set
	 */
	public void setDefalutCorp(String defalutCorp) {
		ApplicationConstant.defalutCorp = defalutCorp;
	}

	/**
	 * @param defalutCorp the defalutCorp to set
	 */
	public void setOrgCode(String orgCode) {
		ApplicationConstant.ADMIN_ORG_CODE = orgCode;
	}

}
