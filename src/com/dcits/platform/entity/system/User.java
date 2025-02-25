package com.dcits.platform.entity.system;

import java.util.Date;

import com.dcits.platform.entity.Page;

/**
 * 
* 类名称：用户
* 类描述： 
* @author pengyj pengyj
* 作者单位： 
* 联系方式：
* 创建时间：2014年6月28日
* @version 1.0
 */
public class User {
	private String USER_ID;		//用户id
	private String USERNAME;	//用户名
	private String PASSWORD; 	//密码
	private String NAME;		//姓名
//	private String RIGHTS;		//权限
//	private String ROLE_ID;		//角色id
	private String LAST_LOGIN;	//最后登录时间
	private String IP;			//用户登录ip地址
//	private String STATUS;		//状态
	private Role role;			//角色对象
	private Page page;			//分页对象
	private String SKIN;		//皮肤
	private String EMAIL;      //email
	private String TELLER_NUMBER;     //柜员号
	private String PHONE;      //电话号码
	private String PWD_ALTER_TIME;    //密码修改日期
	private String DEPT_CODE;     //部门编码
	private String STATE;        //有效状态
	private String ERR_TIMES;    //出错次数
	private String LOCK_STATUS;   //锁定状态
	private String COMPANY;  //法人
	private Org org;; // 机构
	private String MAC;
	private String USERNAME_PERBANK; //人行对应用户名
	private Date UPDATE_TIME;
	
	public String getUSERNAME_PERBANK() {
		return USERNAME_PERBANK;
	}
	public void setUSERNAME_PERBANK(String uSERNAME_PERBANK) {
		USERNAME_PERBANK = uSERNAME_PERBANK;
	}
	public String getSKIN() {
		return SKIN;
	}
	public void setSKIN(String sKIN) {
		SKIN = sKIN;
	}
	
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getUSERNAME() {
		return USERNAME;
	}
	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}
	public String getPASSWORD() {
		return PASSWORD;
	}
	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
//	public String getRIGHTS() {
//		return RIGHTS;
//	}
//	public void setRIGHTS(String rIGHTS) {
//		RIGHTS = rIGHTS;
//	}
//	public String getROLE_ID() {
//		return ROLE_ID;
//	}
//	public void setROLE_ID(String rOLE_ID) {
//		ROLE_ID = rOLE_ID;
//	}
	public String getLAST_LOGIN() {
		return LAST_LOGIN;
	}
	public void setLAST_LOGIN(String lAST_LOGIN) {
		LAST_LOGIN = lAST_LOGIN;
	}
	public String getIP() {
		return IP;
	}
	public void setIP(String iP) {
		IP = iP;
	}
//	public String getSTATUS() {
//		return STATUS;
//	}
//	public void setSTATUS(String sTATUS) {
//		STATUS = sTATUS;
//	}
	
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public Page getPage() {
		if(page==null)
			page = new Page();
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public String getTELLER_NUMBER() {
		return TELLER_NUMBER;
	}
	public void setTELLER_NUMBER(String nUMBER) {
		TELLER_NUMBER = nUMBER;
	}
	public String getPHONE() {
		return PHONE;
	}
	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}
	public String getPWD_ALTER_TIME() {
		return PWD_ALTER_TIME;
	}
	public void setPWD_ALTER_TIME(String pWD_ALTER_TIME) {
		PWD_ALTER_TIME = pWD_ALTER_TIME;
	}
	public String getDEPT_CODE() {
		return DEPT_CODE;
	}
	public void setDEPT_CODE(String dEPT_CODE) {
		DEPT_CODE = dEPT_CODE;
	}
	public String getSTATE() {
		return STATE;
	}
	public void setSTATE(String sTATE) {
		STATE = sTATE;
	}
	public String getERR_TIMES() {
		return ERR_TIMES;
	}
	public void setERR_TIMES(String eRR_TIMES) {
		ERR_TIMES = eRR_TIMES;
	}
	public String getLOCK_STATUS() {
		return LOCK_STATUS;
	}
	public void setLOCK_STATUS(String lOCK_STATUS) {
		LOCK_STATUS = lOCK_STATUS;
	}
	public String getCOMPANY() {
		return COMPANY;
	}
	public void setCOMPANY(String cOMPANY) {
		COMPANY = cOMPANY;
	}
	public Org getOrg() {
		return org;
	}

	public void setOrg(Org org) {
		this.org = org;
	}
	public String getMAC() {
		return MAC;
	}
	public void setMAC(String mAC) {
		MAC = mAC;
	}
	public Date getUPDATE_TIME() {
		return UPDATE_TIME;
	}
	public void setUPDATE_TIME(Date uPDATE_TIME) {
		UPDATE_TIME = uPDATE_TIME;
	}
}
