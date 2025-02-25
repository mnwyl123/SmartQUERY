package com.dcits.platform.util.tree;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public class TreeEntityBaseFactory implements TreeEntityFactory {

	private Comparator<TreeEntity> comparator;
	
	/**
	 * 构建菜单树
	 */
	@Override
	public TreeEntity buildTreeListInRoot(List<TreeDetails> tds,
			TreeEntity root) {
		Map<String, List<TreeEntity>> childMap = new HashMap<String, List<TreeEntity>>();
		for (int i = 0; i < tds.size(); i ++) {
			TreeDetails temp = tds.get(i);
			if(temp!=null&&!temp.equals(null)){
				TreeEntity entity = temp.toTreeEntity();
				if (entity.getId().equals(root.getId())) {
					root.setTitle(entity.getTitle());
				} else {
					if (childMap.get(temp.getParentId()) != null) {
						childMap.get(temp.getParentId()).add(entity);
					} else {
						List<TreeEntity> tempList = new ArrayList<TreeEntity>();
						tempList.add(entity);
						childMap.put(temp.getParentId(), tempList);
					}
				}
			}
		}
		root.setChildNodeList(buildTreeListInRootLoop(root, childMap));
		return root;
	}
	
	/**
	 * 构建机构树
	 */
	@Override
	public TreeEntity buildOrgTreeListInRoot(List<TreeDetails> tds,
			TreeEntity root) {
		Map<String, List<TreeEntity>> childMap = new HashMap<String, List<TreeEntity>>();
		for (int i = 0; i < tds.size(); i ++) {
			TreeDetails temp = tds.get(i);
			TreeEntity entity = temp.toTreeEntity();
			if (entity.getId().equals(root.getId())) {
				root.setOrgId(entity.getOrgId());
				root.setTitle(entity.getTitle());
			} else {
				if (childMap.get(temp.getParentId()) != null) {
					childMap.get(temp.getParentId()).add(entity);
				} else {
					List<TreeEntity> tempList = new ArrayList<TreeEntity>();
					tempList.add(entity);
					childMap.put(temp.getParentId(), tempList);
				}
			}
		}
		root.setChildNodeList(buildOrgTreeListInRootLoop(root, childMap));
		return root;
	}
	
	private List<TreeEntity> buildOrgTreeListInRootLoop(
			TreeEntity root, Map<String, List<TreeEntity>> childMap) {
		List<TreeEntity> result = new ArrayList<TreeEntity>();
		result = childMap.get(root.getOrgId());
		if (result == null) {
			return null;
		}
		for (int i = 0; i < result.size(); i ++) {
			TreeEntity temp = result.get(i);
			temp.setChildNodeList(buildOrgTreeListInRootLoop(temp, childMap));
		}
		if (this.comparator != null) {
			Collections.sort(result, this.comparator);
		}
		
		return result.size() > 0 ? result : null;
	}
	
	private List<TreeEntity> buildTreeListInRootLoop(
			TreeEntity root, Map<String, List<TreeEntity>> childMap) {
		List<TreeEntity> result = new ArrayList<TreeEntity>();
		result = childMap.get(root.getId());
		if (result == null) {
			return null;
		}
		for (int i = 0; i < result.size(); i ++) {
			TreeEntity temp = result.get(i);
			temp.setChildNodeList(buildTreeListInRootLoop(temp, childMap));
		}
		if (this.comparator != null) {
			Collections.sort(result, this.comparator);
		}
		
		return result.size() > 0 ? result : null;
	}
	
	public List<TreeEntity> buildTreeChecked(List<TreeEntity> list){
		TreeEntity root = new TreeBaseEntity();
		root.setChildNodeList(list);
		this.buildTreeCheckedLoop(root);
		return root.getChildNodeList();
	}
	
	public boolean buildTreeCheckedLoop(TreeEntity tree){
		if(tree.getMenuGroupId() == null || tree.getMenuGroupId().equals("")){
			tree.setIsParent("true");
		}else{
			tree.setIsParent("false");
		}
		if(tree.getChildNodeList() != null){
			boolean leap = false;
			for(TreeEntity temp : tree.getChildNodeList()){
				if(this.buildTreeCheckedLoop(temp)){
					temp.setChecked("true");
					leap = true;
				}else{
					temp.setChecked("false");
				}
			}
			if(leap){
				return true;
			}else{
				return false;
			}
		}else{
			if(tree.getChecked().equals("true")){
				return true;
			}else{
				return false;
			}
		}
	}
		
	@Override
	public List<TreeEntity> buildTreeList(List<TreeDetails> tds, String rootId) {
		TreeEntity root = new TreeBaseEntity();
		root.setId(rootId);
		return buildTreeListInRoot(tds, root).getChildNodeList();
	}

	public Comparator<TreeEntity> getComparator() {
		return comparator;
	}

	public void setComparator(Comparator<TreeEntity> comparator) {
		this.comparator = comparator;
	}
	@Override
	public List<TreeEntity> buildOrgTreeList(List<TreeDetails> tds, String rootId) {
		TreeEntity root = new TreeBaseEntity();
		root.setId(rootId);
		return buildOrgTreeListInRoot(tds, root).getChildNodeList();
	}
}
