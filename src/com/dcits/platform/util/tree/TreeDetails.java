package com.dcits.platform.util.tree;

import java.io.Serializable;

public interface TreeDetails extends Serializable {

	public String getId();

	public String getParentId();

	public TreeEntity toTreeEntity();
}
