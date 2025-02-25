package com.dcits.platform.util.role;

import java.util.List;
import java.util.Map;

public class RoleAuthFactory {
	private static IRoleAuthDict iRoleAuthDict;
	
	public static IRoleAuthDict getiRoleAuthDict() {
		return iRoleAuthDict;
	}

	public static void setiRoleAuthDict(IRoleAuthDict iRoleAuthDict) {
		RoleAuthFactory.iRoleAuthDict = iRoleAuthDict;
	}

	public static void refresh() throws Exception{
		iRoleAuthDict.init();
	}
	
	public static Map<String, String> getHC(List<String> roleIds, String menuId){
		Map<String, String> map = iRoleAuthDict.getRoleAuth(roleIds, menuId);
		return map;
	}
}
