package com.dcits.credit.util;

import java.util.List;

import org.apache.shiro.session.Session;

import com.dcits.platform.entity.system.Org;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;

public class UserUtil {
	
	/**
	 * 获取当前用户
	 * @return
	 */
	public static User getCurrUser(){
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		return user;
	}
	/**
	 * 获取当前机构
	 * @return
	 */
	public static Org getCurrOrg(){
		User user = getCurrUser();
		return user.getOrg();
	}
	/**
	 * 获取当前用户的角色
	 * @return
	 */
	public static List<String> getRoleIds(){
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		List<String> roleIds = (List<String>) session.getAttribute(user.getUSER_ID()+Const.SESSION_ROLE_RIGHTS);
		return roleIds;
	}
	/**
	 * 判断当前用户是否为给管理员用户
	 * @return
	 */
	public static boolean CurrUserIsAdmin(){
		String username = Jurisdiction.getUsername();
		if(username.startsWith("admin")) return true;
		else return false;
	}
	
}
