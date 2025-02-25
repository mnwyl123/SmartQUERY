package com.dcits.platform.util;

import com.dcits.platform.service.system.menu.impl.MenuService;
import com.dcits.platform.service.system.role.impl.RoleService;
import com.dcits.platform.service.system.user.UserManager;


/**
 * @author pengyj Administrator
 * 获取Spring容器中的service bean
 */
public final class ServiceHelper {
	
	public static Object getService(String serviceName){
		//WebApplicationContextUtils.
		return Const.WEB_APP_CONTEXT.getBean(serviceName);
	}
	
	public static UserManager getUserService(){
		return (UserManager) getService("userService");
	}
	
	public static RoleService getRoleService(){
		return (RoleService) getService("roleService");
	}
	
	public static MenuService getMenuService(){
		return (MenuService) getService("menuService");
	}
}
