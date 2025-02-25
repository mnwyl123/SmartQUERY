package com.dcits.platform.util.tree;

import java.util.Comparator;

public class TreeComparator implements Comparator<TreeEntity> {

	@Override
	public int compare(TreeEntity entity1, TreeEntity entity2) {
		int value1 = Integer.parseInt(entity1.getSeqNo());
		int value2 = Integer.parseInt(entity2.getSeqNo());
		if (value1 == value2) {
			return 0;
		} else if (value1 > value2) {
			return 1;
		} else {
			return -1;
		}
	}

}
