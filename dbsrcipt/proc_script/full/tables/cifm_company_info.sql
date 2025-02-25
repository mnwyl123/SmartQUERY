create table CIFM_COMPANY_INFO
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
)
;
comment on table CIFM_COMPANY_INFO
  is '征信查询企业信息表';
comment on column CIFM_COMPANY_INFO.id
  is '查询编号';
comment on column CIFM_COMPANY_INFO.query_reason
  is '查询原因';
comment on column CIFM_COMPANY_INFO.china_credit_code
  is '企业证件号码';
comment on column CIFM_COMPANY_INFO.warrant_maturity_date
  is '授权书到期日';
comment on column CIFM_COMPANY_INFO.query_version
  is '查询版本';
comment on column CIFM_COMPANY_INFO.company_name
  is '客户名称';
comment on column CIFM_COMPANY_INFO.query_type
  is '查询类型';
comment on column CIFM_COMPANY_INFO.cust_manager
  is '客户经理';
comment on column CIFM_COMPANY_INFO.auditors
  is '授权审批人';
comment on column CIFM_COMPANY_INFO.credentials_no_type
  is '证件号类型';
comment on column CIFM_COMPANY_INFO.remarks
  is '备注';
comment on column CIFM_COMPANY_INFO.business_status
  is '业务办理状态';
comment on column CIFM_COMPANY_INFO.servicecode
  is '服务代码';
comment on column CIFM_COMPANY_INFO.reportname
  is '信用报告文件名称';
create index COMPANY_ID on CIFM_COMPANY_INFO (ID);

