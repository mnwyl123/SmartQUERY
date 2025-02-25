package com.dcits.platform.entity.system;

import java.util.List;

import com.dcits.platform.util.tree.TreeDetails;
import com.dcits.platform.util.tree.TreeEntity;

public class MenuInfo implements TreeDetails {

	private static final long serialVersionUID = 1L;

	private String menuId; // 菜单ID
	private String menuName; // 菜单名称
	private String menuNameEN; // 菜单英文名称
	private String menuUrl; // 链接
	private String parentId; // 上级菜单ID
	private String orderBy; // 排序
	private String menuIcon; // 图标
	private String menuType; // 类型
	private String menuChannel;  //菜单渠道
	private String menuState; // 菜单状态
	private String menuGroupId; // 菜单功能组ID
	private String tranCode; // 交易码
	private String sysInd; // 所属系统
	private String company; // 法人
	private List<MenuInfo> subMenu;
	private boolean hasMenu = true;
	private String target;

	private String funId; // FUN_ID
	private String checked;// 是否被勾选，菜单权限需要

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuNameEN() {
		return menuNameEN;
	}

	public void setMenuNameEN(String menuNameEN) {
		this.menuNameEN = menuNameEN;
	}

	public String getMenuUrl() {
		return menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}

	public String getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	public String getMenuIcon() {
		return menuIcon;
	}

	public void setMenuIcon(String menuIcon) {
		this.menuIcon = menuIcon;
	}

	public String getMenuType() {
		return menuType;
	}

	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}

	public String getMenuState() {
		return menuState;
	}

	public void setMenuState(String menuState) {
		this.menuState = menuState;
	}

	public String getMenuGroupId() {
		return menuGroupId;
	}

	public void setMenuGroupId(String menuGroupId) {
		this.menuGroupId = menuGroupId;
	}

	public String getTranCode() {
		return tranCode;
	}

	public void setTranCode(String tranCode) {
		this.tranCode = tranCode;
	}

	public String getSysInd() {
		return sysInd;
	}

	public void setSysInd(String sysInd) {
		this.sysInd = sysInd;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}

	public String getChecked() {
		return checked;
	}

	public void setFunId(String funId) {
		this.funId = funId;
	}

	public String getFunId() {
		return funId;
	}

	@Override
	public String getId() {
		return this.menuId;
	}

	@Override
	public TreeEntity toTreeEntity() {
		TreeEntity treeEntity = new MenuTreeEntity(this.menuId, this.menuUrl,
				this.menuIcon, this.menuName, this.orderBy, this.menuGroupId,
				this.funId, this.checked, this.parentId);
		return treeEntity;
	}

	@Override
	public String getParentId() {
		return this.parentId;
	}

	public List<MenuInfo> getSubMenu() {
		return subMenu;
	}

	public void setSubMenu(List<MenuInfo> subMenu) {
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

	public String getMenuChannel() {
		return menuChannel;
	}

	public void setMenuChannel(String menuChannel) {
		this.menuChannel = menuChannel;
	}

}
