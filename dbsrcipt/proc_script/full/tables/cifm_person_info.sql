create table CIFM_PERSON_INFO
(
  id                    VARCHAR2(64),
  client_name           VARCHAR2(100),
  credentials_type      VARCHAR2(10),
  credentials_no        VARCHAR2(150),
  query_reason          VARCHAR2(2),
  query_version         VARCHAR2(2),
  warrant_maturity_date VARCHAR2(20),
  cust_manager          VARCHAR2(50),
  query_type            VARCHAR2(2),
  auditors              VARCHAR2(50),
  remarks               VARCHAR2(50),
  business_status       VARCHAR2(10),
  queryorgcode          VARCHAR2(100),
  username              VARCHAR2(100),
  originateorgcode      VARCHAR2(100),
  originateusercode     VARCHAR2(100),
  servicecode           VARCHAR2(100),
  reportname            VARCHAR2(100)
)
;
comment on table CIFM_PERSON_INFO
  is '征信查询个人信息表';
comment on column CIFM_PERSON_INFO.id
  is '查询编号';
comment on column CIFM_PERSON_INFO.client_name
  is '被查询人姓名';
comment on column CIFM_PERSON_INFO.credentials_type
  is '证件类型';
comment on column CIFM_PERSON_INFO.credentials_no
  is '证件号码';
comment on column CIFM_PERSON_INFO.query_reason
  is '查询原因';
comment on column CIFM_PERSON_INFO.query_version
  is '查询版本';
comment on column CIFM_PERSON_INFO.warrant_maturity_date
  is '授权书到期日';
comment on column CIFM_PERSON_INFO.cust_manager
  is '客户经理';
comment on column CIFM_PERSON_INFO.query_type
  is '查询类型';
comment on column CIFM_PERSON_INFO.auditors
  is '授权审核人员';
comment on column CIFM_PERSON_INFO.remarks
  is '备注';
comment on column CIFM_PERSON_INFO.business_status
  is '业务办理状态';
comment on column CIFM_PERSON_INFO.queryorgcode
  is '查询机构代码';
comment on column CIFM_PERSON_INFO.username
  is '系统用户名';
comment on column CIFM_PERSON_INFO.originateorgcode
  is '发起机构代码';
comment on column CIFM_PERSON_INFO.originateusercode
  is '发起用户代码';
comment on column CIFM_PERSON_INFO.servicecode
  is '服务代码';
comment on column CIFM_PERSON_INFO.reportname
  is '信用报告文件名称';
create index PERSON_ID on CIFM_PERSON_INFO (ID);

