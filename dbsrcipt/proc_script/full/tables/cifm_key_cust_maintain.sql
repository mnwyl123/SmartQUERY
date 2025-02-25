create table CIFM_KEY_CUST_MAINTAIN
(
  cust_no        VARCHAR2(50),
  client_type    VARCHAR2(2),
  client_name    VARCHAR2(50),
  credentials_no VARCHAR2(50),
  operation_type VARCHAR2(2),
  org_name       VARCHAR2(50),
  org_code       VARCHAR2(50),
  user_name      VARCHAR2(50),
  user_code      VARCHAR2(50),
  add_date       VARCHAR2(50),
  add_reason     VARCHAR2(255),
  delete_date    VARCHAR2(50),
  delete_reason  VARCHAR2(255),
  company        VARCHAR2(10)
)
;
comment on table CIFM_KEY_CUST_MAINTAIN
  is '重点关注客户维护表';
comment on column CIFM_KEY_CUST_MAINTAIN.cust_no
  is '客户编号';
comment on column CIFM_KEY_CUST_MAINTAIN.client_type
  is '客户类型';
comment on column CIFM_KEY_CUST_MAINTAIN.client_name
  is '客户名称';
comment on column CIFM_KEY_CUST_MAINTAIN.credentials_no
  is '证件号码/中征码';
comment on column CIFM_KEY_CUST_MAINTAIN.org_name
  is '操作用户所属机构名称';
comment on column CIFM_KEY_CUST_MAINTAIN.org_code
  is '操作用户所属机构编号';
comment on column CIFM_KEY_CUST_MAINTAIN.user_name
  is '操作用户名称';
comment on column CIFM_KEY_CUST_MAINTAIN.user_code
  is '操作用户编号';
comment on column CIFM_KEY_CUST_MAINTAIN.add_date
  is '移入日期';
comment on column CIFM_KEY_CUST_MAINTAIN.add_reason
  is '移入原因';
comment on column CIFM_KEY_CUST_MAINTAIN.delete_date
  is '移出日期';
comment on column CIFM_KEY_CUST_MAINTAIN.delete_reason
  is '移出原因';

