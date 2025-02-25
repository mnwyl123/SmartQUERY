package com.dcits.platform.util.role;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;

import com.dcits.platform.entity.system.PolicyInfo;
import com.dcits.platform.entity.system.User;
import com.dcits.platform.service.system.role.RoleManager;
import com.dcits.platform.util.Const;
import com.dcits.platform.util.Jurisdiction;

public class RoleAuthImpl implements IRoleAuthDict {

	@Resource(name = "roleService")
	private RoleManager roleService;
	private List<PolicyInfo> roleAuthDict;

	public void init() throws Exception {
		roleAuthDict = roleService.getAllRolePolicy();
	}

	public Map<String, String> getRoleAuth(List<String> roleIds, String menuId) {
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);				//读取session中的用户信息(单独用户信息)
		String USERID = user.getUSER_ID();
		Map<String, String> roleMap = new HashMap<String, String>();

		if ((Boolean) session.getAttribute(USERID+"isCompany")) {
			try {
				List<String> authList = roleService.queryAllFunId();
				for (String policyInfo : authList) {
					roleMap.put(policyInfo, "1");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			for (PolicyInfo policyInfo : roleAuthDict) {
				if (roleIds.contains(policyInfo.getRoleId()) && policyInfo.getMenuId().equals(menuId)) {
					String funId = policyInfo.getFunId();
					if (roleMap.get(funId) == null) {
						//添加对睡眠用户的处理：睡眠用户只有查询权限
						String lockStatus = user.getLOCK_STATUS();
						if(lockStatus.equals("2")){
							if(funId.toUpperCase().contains("QUERY")){
								roleMap.put(funId, "1");
							}
						}else{
							roleMap.put(funId, "1");
						}
					}
				}
			}
		}

		return roleMap;
	}
}