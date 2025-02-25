package com.dcits.platform.entity.system;

import java.util.List;

import com.dcits.platform.util.tree.TreeDetails;
import com.dcits.platform.util.tree.TreeEntity;

/**
 * 
* 类名称：组织机构
* 类描述： 
* @author pengyj
* 作者单位： 
* 联系方式：
* 修改时间：2015年12月16日
* @version 2.0
 */
public class Org implements TreeDetails {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4909401128952621861L;
	private String orgId;
	private String name;			//名称
	private String nameEn;			//英文名称
	private String orgCode;
	private int orgLevel;
	private String orgDesc;
	private String status;
	private String orgOrder;
	private String company;
	private String parentId;		//上级ID
	private String headman;			//负责人
	private String tel;				//电话
	private String functions;		//部门职能
	private	String address;			//地址

	private String target;
	private Org org;
	private List<Org> subDepartment;
	private boolean hasDepartment = false;
	private String treeurl;
	private String ORG_ID_PERBANK; //上报机构编码(企业)
	private String ORG_ID_COMBANK;  //上报机构编码(企业)
	private String SIMPLENAME; //机构简称
	private String REGIONALISM_CODE; //行政区划代码
	private String BRANCH_CODE_PERBANK; //个人查询网点编码(人行)
	private String BRANCH_CODE_COMBANK;  //企业查询网点编码(人行)
	
	public String getSIMPLENAME() {
		return SIMPLENAME;
	}
	public void setSIMPLENAME(String sIMPLENAME) {
		SIMPLENAME = sIMPLENAME;
	}
	public String getREGIONALISM_CODE() {
		return REGIONALISM_CODE;
	}
	public void setREGIONALISM_CODE(String rEGIONALISM_CODE) {
		REGIONALISM_CODE = rEGIONALISM_CODE;
	}
	public String getORG_ID_PERBANK() {
		return ORG_ID_PERBANK;
	}
	public void setORG_ID_PERBANK(String oRG_ID_PERBANK) {
		ORG_ID_PERBANK = oRG_ID_PERBANK;
	}
	public String getOrgName() {
		return name;
	}
	public void setOrgName(String name) {
		this.name = name;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public List<Org> getSubDepartment() {
		return subDepartment;
	}
	public void setSubDepartment(List<Org> subDepartment) {
		this.subDepartment = subDepartment;
	}
	public boolean isHasDepartment() {
		return hasDepartment;
	}
	public void setHasDepartment(boolean hasDepartment) {
		this.hasDepartment = hasDepartment;
	}
	public String getTreeurl() {
		return treeurl;
	}
	public void setTreeurl(String treeurl) {
		this.treeurl = treeurl;
	}

	public Org getOrg() {
		return org;
	}
	public void setOrg(Org org) {
		this.org = org;
	}
	public String getOrgId() {
		return orgId;
	}
	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getOrgCode() {
		return orgCode;
	}
	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}
	public String getOrgDesc() {
		return orgDesc;
	}
	public void setOrgDesc(String orgDesc) {
		this.orgDesc = orgDesc;
	}
	public String getOrgOrder() {
		return orgOrder;
	}
	public void setOrgOrder(String orgOrder) {
		this.orgOrder = orgOrder;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getHeadman() {
		return headman;
	}
	public void setHeadman(String headman) {
		this.headman = headman;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getFunctions() {
		return functions;
	}
	public void setFunctions(String functions) {
		this.functions = functions;
	}
	public String getNameEn() {
		return nameEn;
	}
	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getId() {
		return this.orgId;
	}
	
	public String getParentId() {
		return this.parentId;
	}
	public TreeEntity toTreeEntity() {
		TreeEntity treeEntity = new OrgTreeEntity(this.orgId, this.orgCode, this.name, this.parentId);
		return treeEntity;
	}
	public int getOrgLevel() {
		return orgLevel;
	}
	public void setOrgLevel(int orgLevel) {
		this.orgLevel = orgLevel;
	}
	public String getORG_ID_COMBANK() {
		return ORG_ID_COMBANK;
	}
	public void setORG_ID_COMBANK(String oRG_ID_COMBANK) {
		ORG_ID_COMBANK = oRG_ID_COMBANK;
	}
	public String getBRANCH_CODE_PERBANK() {
		return BRANCH_CODE_PERBANK;
	}
	public void setBRANCH_CODE_PERBANK(String bRANCH_CODE_PERBANK) {
		BRANCH_CODE_PERBANK = bRANCH_CODE_PERBANK;
	}
	public String getBRANCH_CODE_COMBANK() {
		return BRANCH_CODE_COMBANK;
	}
	public void setBRANCH_CODE_COMBANK(String bRANCH_CODE_COMBANK) {
		BRANCH_CODE_COMBANK = bRANCH_CODE_COMBANK;
	}
	
}