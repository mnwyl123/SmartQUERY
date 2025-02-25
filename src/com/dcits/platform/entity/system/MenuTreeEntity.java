package com.dcits.platform.entity.system;

import java.util.List;

import com.dcits.platform.util.tree.TreeEntity;

public class MenuTreeEntity implements TreeEntity {

	private static final long serialVersionUID = 6881449479856886141L;
	
	private String orgId;

	private String id;

	private String title;

	private String url;

	private String icon;

	private String seqNo;

	private String menuGroupId;

	private List<TreeEntity> childNodeList;

	private String funId;
	private String checked;
	private String isParent;
	private String parentId;

	public MenuTreeEntity(String id, String url, String icon, String title, String seqNo, String menuGroupId, String funId, String checked, String parentId) {
		this.id = id;
		this.url = url;
		this.icon = icon;
		this.title = title;
		this.seqNo = seqNo;
		this.menuGroupId = menuGroupId;
		this.funId = funId;
		this.checked = checked;
		this.parentId = parentId;
	}
	
	public MenuTreeEntity(String id, String title, String parentId) {
		this.id = id;
		this.title = title;
		this.parentId = parentId;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getFunId() {
		return funId;
	}

	public void setFunId(String funId) {
		this.funId = funId;
	}

	public String getChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}
	
	public String getMenuGroupId() {
		return menuGroupId;
	}

	public void setMenuGroupId(String menuGroupId) {
		this.menuGroupId = menuGroupId;
	}
	
	public String getIsParent() {
		return isParent;
	}

	public void setIsParent(String isParent) {
		this.isParent = isParent;
	}

	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSeqNo() {
		if (this.seqNo == null || "".equals(this.seqNo)) {
			return "99";
		}
		return seqNo;
	}

	public void setSeqNo(String seqNo) {
		this.seqNo = seqNo;
	}

	public List<TreeEntity> getChildNodeList() {
		return childNodeList;
	}

	public void setChildNodeList(List<TreeEntity> childNodeList) {
		this.childNodeList = childNodeList;
	}
	
	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

}
