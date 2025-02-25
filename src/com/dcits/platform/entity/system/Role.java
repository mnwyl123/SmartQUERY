package com.dcits.platform.entity.system;
/**
 * 
* 类名称：角色
* 类描述： 
* @author pengyj pengyj
* 作者单位： 
* 联系方式：
* 创建时间：2014年3月10日
* @version 1.0
 */
public class Role {

	private String ROLE_ID;
	private String ROLE_NAME;
	private String ROLE_NAME_EN;
	private String ROLE_DESC;
	private String COMPANY;
	private String target;
	
	public String getROLE_ID() {
		return ROLE_ID;
	}
	public void setROLE_ID(String rOLE_ID) {
		ROLE_ID = rOLE_ID;
	}
	public String getROLE_NAME() {
		return ROLE_NAME;
	}
	public void setROLE_NAME(String rOLE_NAME) {
		ROLE_NAME = rOLE_NAME;
	}
	public String getROLE_NAME_EN() {
		return ROLE_NAME_EN;
	}
	public void setROLE_NAME_EN(String rOLE_NAME_EN) {
		ROLE_NAME_EN = rOLE_NAME_EN;
	}
	public String getROLE_DESC() {
		return ROLE_DESC;
	}
	public void setROLE_DESC(String rOLE_DESC) {
		ROLE_DESC = rOLE_DESC;
	}
	public String getCOMPANY() {
		return COMPANY;
	}
	public void setCOMPANY(String cOMPANY) {
		COMPANY = cOMPANY;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}

}
