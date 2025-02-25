package com.dcits.platform.entity.system;

import java.util.List;
/**
 * 
* 类名称：菜单
* 类描述： 
* @author pengyj pengyj
* 作者单位： 
* 联系方式：
* 创建时间：2015年7月27日
* @version 2.0
 */
public class Menu {
	
	private String MENU_ID;		//菜单ID
	private String MENU_NAME;	//菜单名称
	private String MENU_NAME_EN;	//菜单英文名
	private String MENU_URL;	//链接
	private String PARENT_ID;	//上级菜单ID
	private String ORDER_BY;	//排序
	private String MENU_ICON;	//图标
	private String MENU_TYPE;	//类型
	private String MENU_CHANNEL;
	private String MENU_STATE;	//菜单状态
	private String MENU_GROUP_ID; //菜单所属组
	private String TRAN_CODE;  //交易码
	private String SYS_IND;  //所属系统
	private String COMPANY;  //法人代码机构
	private String target;
	private String MENU_ORDER;
	
	public String getMENU_ORDER() {
		return MENU_ORDER;
	}
	public void setMENU_ORDER(String mENU_ORDER) {
		MENU_ORDER = mENU_ORDER;
	}
	private Menu parentMenu;
	private List<Menu> subMenu;
	private boolean hasMenu = true;
	
	public String getMENU_ID() {
		return MENU_ID;
	}
	public void setMENU_ID(String mENU_ID) {
		MENU_ID = mENU_ID;
	}
	public String getMENU_NAME() {
		return MENU_NAME;
	}
	public void setMENU_NAME(String mENU_NAME) {
		MENU_NAME = mENU_NAME;
	}
	public String getMENU_URL() {
		return MENU_URL;
	}
	public void setMENU_URL(String mENU_URL) {
		MENU_URL = mENU_URL;
	}
	public String getPARENT_ID() {
		return PARENT_ID;
	}
	public void setPARENT_ID(String pARENT_ID) {
		PARENT_ID = pARENT_ID;
	}
	public Menu getParentMenu() {
		return parentMenu;
	}
	public void setParentMenu(Menu parentMenu) {
		this.parentMenu = parentMenu;
	}
	public List<Menu> getSubMenu() {
		return subMenu;
	}
	public void setSubMenu(List<Menu> subMenu) {
		this.subMenu = subMenu;
	}
	public boolean isHasMenu() {
		return hasMenu;
	}
	public void setHasMenu(boolean hasMenu) {
		this.hasMenu = hasMenu;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getMENU_ICON() {
		return MENU_ICON;
	}
	public void setMENU_ICON(String mENU_ICON) {
		MENU_ICON = mENU_ICON;
	}
	public String getMENU_TYPE() {
		return MENU_TYPE;
	}
	public void setMENU_TYPE(String mENU_TYPE) {
		MENU_TYPE = mENU_TYPE;
	}
	public String getMENU_STATE() {
		return MENU_STATE;
	}
	public void setMENU_STATE(String mENU_STATE) {
		MENU_STATE = mENU_STATE;
	}
	public String getMENU_GROUP_ID() {
		return MENU_GROUP_ID;
	}
	public void setMENU_GROUP_ID(String mENU_GROUP_ID) {
		MENU_GROUP_ID = mENU_GROUP_ID;
	}
	public String getTRAN_CODE() {
		return TRAN_CODE;
	}
	public void setTRAN_CODE(String tRAN_CODE) {
		TRAN_CODE = tRAN_CODE;
	}
	public String getSYS_IND() {
		return SYS_IND;
	}
	public void setSYS_IND(String sYS_IND) {
		SYS_IND = sYS_IND;
	}
	public String getMENU_NAME_EN() {
		return MENU_NAME_EN;
	}
	public void setMENU_NAME_EN(String mENU_NAME_EN) {
		MENU_NAME_EN = mENU_NAME_EN;
	}
	public String getORDER_BY() {
		return ORDER_BY;
	}
	public void setORDER_BY(String oRDER_BY) {
		ORDER_BY = oRDER_BY;
	}
	public String getCOMPANY() {
		return COMPANY;
	}
	public void setCOMPANY(String cOMPANY) {
		COMPANY = cOMPANY;
	}
	public String getMENU_CHANNEL() {
		return MENU_CHANNEL;
	}
	public void setMENU_CHANNEL(String mENU_CHANNEL) {
		MENU_CHANNEL = mENU_CHANNEL;
	}
}
