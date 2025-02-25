package com.dcits.platform.entity.system;

import java.util.List;

import com.dcits.platform.util.tree.TreeEntity;

public class OrgTreeEntity implements TreeEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6881449479856886141L;

	/**
	 * 主键
	 */
	private String orgId;

	/**
	 * 机构编码
	 */
	private String id;

	/**
	 * 机构名称
	 */
	private String title;

	/**
	 * 顺序号
	 */
	private String seqNo;

	/**
	 * 子机构
	 */
	private List<TreeEntity> childNodeList;

	/**
	 * 父节点
	 */
	private String parentId;

	private String checked;
	private String isParent;

	public OrgTreeEntity(String id) {
		this.id = id;
	}

	public OrgTreeEntity(String orgId, String id, String title, String parentId) {
		this.orgId = orgId;
		this.id = id;
		this.title = title;
		this.parentId = parentId;
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

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	/**
	 * @return the resoId
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param resoId
	 *            the resoId to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	public String getOrgId() {
		return orgId;
	}

	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param title
	 *            the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @return the seqNo
	 */
	public String getSeqNo() {
		if (this.seqNo == null || "".equals(this.seqNo)) {
			return "99";
		}
		return seqNo;
	}

	/**
	 * @param seqNo
	 *            the seqNo to set
	 */
	public void setSeqNo(String seqNo) {
		this.seqNo = seqNo;
	}

	/**
	 * @return the childNodeList
	 */
	public List<TreeEntity> getChildNodeList() {
		return childNodeList;
	}

	/**
	 * @param childNodeList
	 *            the childNodeList to set
	 */
	public void setChildNodeList(List<TreeEntity> childNodeList) {
		this.childNodeList = childNodeList;
	}

	@Override
	public String getMenuGroupId() {
		return null;
	}

}
