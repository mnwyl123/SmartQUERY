create table CIFM_PERSON_INFO_HIS
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
comment on table CIFM_PERSON_INFO_HIS
  is '征信查询个人信息历史表';
comment on column CIFM_PERSON_INFO_HIS.id
  is '查询编号';
comment on column CIFM_PERSON_INFO_HIS.client_name
  is '被查询人姓名';
comment on column CIFM_PERSON_INFO_HIS.credentials_type
  is '证件类型';
comment on column CIFM_PERSON_INFO_HIS.credentials_no
  is '证件号码';
comment on column CIFM_PERSON_INFO_HIS.query_reason
  is '查询原因';
comment on column CIFM_PERSON_INFO_HIS.query_version
  is '查询版本';
comment on column CIFM_PERSON_INFO_HIS.warrant_maturity_date
  is '授权书到期日';
comment on column CIFM_PERSON_INFO_HIS.cust_manager
  is '客户经理';
comment on column CIFM_PERSON_INFO_HIS.query_type
  is '查询类型';
comment on column CIFM_PERSON_INFO_HIS.auditors
  is '授权审核人员';
comment on column CIFM_PERSON_INFO_HIS.remarks
  is '备注';
comment on column CIFM_PERSON_INFO_HIS.business_status
  is '业务办理状态';
comment on column CIFM_PERSON_INFO_HIS.queryorgcode
  is '查询机构代码';
comment on column CIFM_PERSON_INFO_HIS.username
  is '系统用户名';
comment on column CIFM_PERSON_INFO_HIS.originateorgcode
  is '发起机构代码';
comment on column CIFM_PERSON_INFO_HIS.originateusercode
  is '发起用户代码';
comment on column CIFM_PERSON_INFO_HIS.servicecode
  is '服务代码';
comment on column CIFM_PERSON_INFO_HIS.reportname
  is '信用报告文件名称';

