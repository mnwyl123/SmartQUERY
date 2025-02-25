package com.dcits.platform.util.role;

import java.util.List;
import java.util.Map;

public interface IRoleAuthDict{
	public void init() throws Exception;
	public Map<String, String> getRoleAuth(List<String> roleIds, String menuId);
}