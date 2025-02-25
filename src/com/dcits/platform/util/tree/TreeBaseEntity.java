package com.dcits.platform.util.tree;

import java.util.List;

public class TreeBaseEntity implements TreeEntity {

	private static final long serialVersionUID = 6881449479856886141L;

	private String orgId;
	private String id;
	private String title;
    private String seqNo;
	private List<TreeEntity> childNodeList;
	
	private String checked;
	private String isParent;

	public String getId() {
		return id;
	}
	
	public TreeBaseEntity() {
		
	}

	public TreeBaseEntity(String id, String title,
			String seqNo) {
		this.id = id;
		this.title = title;
        this.seqNo = seqNo;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

    public String getSeqNo() {
		if (this.seqNo == null || "".equals(this.seqNo)) {
			return "999";
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
	
	public String getChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}

	public String getIsParent() {
		return isParent;
	}

	public void setIsParent(String isParent) {
		this.isParent = isParent;
	}

	@Override
	public String getMenuGroupId() {
		return null;
	}

	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}
}
