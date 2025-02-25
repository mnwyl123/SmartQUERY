package com.dcits.platform.util.tree;

import java.util.List;

public interface TreeEntityFactory {

	public TreeEntity buildTreeListInRoot(List<TreeDetails> tds, TreeEntity root);

	public List<TreeEntity> buildTreeList(List<TreeDetails> tds, String rootId);

	public List<TreeEntity> buildTreeChecked(List<TreeEntity> list);

	public List<TreeEntity> buildOrgTreeList(List<TreeDetails> tds,
			String rootId);

	public TreeEntity buildOrgTreeListInRoot(List<TreeDetails> tds,
			TreeEntity root);
}
