package com.dcits.platform.util.tree;

import java.io.Serializable;
import java.util.List;

public interface TreeEntity extends Serializable {
	
	public String getId();
	
	public void setId(String id);
	
	public String getOrgId();
	
	public void setOrgId(String orgId);
	
	public String getTitle();
	
	public void setTitle(String title);

	public void setChildNodeList(List<TreeEntity> te);

	public List<TreeEntity> getChildNodeList();
	
	public String getChecked();

	public void setChecked(String checked);
	
	public String getIsParent();

	public void setIsParent(String isParent);
	
	public String getSeqNo();
	
	public String getMenuGroupId();
}
