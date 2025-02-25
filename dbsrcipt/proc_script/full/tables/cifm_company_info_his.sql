create table CIFM_COMPANY_INFO_HIS
(
  id                    VARCHAR2(64),
  query_reason          VARCHAR2(2),
  china_credit_code     VARCHAR2(150),
  warrant_maturity_date VARCHAR2(20),
  query_version         VARCHAR2(2),
  company_name          VARCHAR2(200),
  query_type            VARCHAR2(2),
  cust_manager          VARCHAR2(50),
  auditors              VARCHAR2(50),
  credentials_no_type   VARCHAR2(2),
  remarks               VARCHAR2(50),
  business_status       VARCHAR2(10),
  servicecode           VARCHAR2(30),
  reportname            VARCHAR2(50)
);
comment on table CIFM_COMPANY_INFO_HIS
  is '征信查询企业信息历史表';
comment on column CIFM_COMPANY_INFO_HIS.id
  is '查询编号';
comment on column CIFM_COMPANY_INFO_HIS.query_reason
  is '查询原因';
comment on column CIFM_COMPANY_INFO_HIS.china_credit_code
  is '企业证件号码';
comment on column CIFM_COMPANY_INFO_HIS.warrant_maturity_date
  is '授权书到期日';
comment on column CIFM_COMPANY_INFO_HIS.query_version
  is '查询版本';
comment on column CIFM_COMPANY_INFO_HIS.company_name
  is '客户名称';
comment on column CIFM_COMPANY_INFO_HIS.query_type
  is '查询类型';
comment on column CIFM_COMPANY_INFO_HIS.cust_manager
  is '客户经理';
comment on column CIFM_COMPANY_INFO_HIS.auditors
  is '授权审批人';
comment on column CIFM_COMPANY_INFO_HIS.credentials_no_type
  is '证件号类型';
comment on column CIFM_COMPANY_INFO_HIS.remarks
  is '备注';
comment on column CIFM_COMPANY_INFO_HIS.business_status
  is '业务办理状态';
comment on column CIFM_COMPANY_INFO_HIS.servicecode
  is '服务代码';
comment on column CIFM_COMPANY_INFO_HIS.reportname
  is '信用报告文件名称';

