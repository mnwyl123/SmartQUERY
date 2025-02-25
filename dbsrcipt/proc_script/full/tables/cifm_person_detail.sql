create table CIFM_PERSON_DETAIL
(
  id               VARCHAR2(64),
  org_code         VARCHAR2(30),
  branch_code      VARCHAR2(30),
  branch_name      VARCHAR2(100),
  user_sys_name    VARCHAR2(30),
  user_real_name   VARCHAR2(20),
  query_time       DATE,
  client_name      VARCHAR2(100),
  credentials_type VARCHAR2(10),
  credentials_no   VARCHAR2(150),
  query_reason     VARCHAR2(2),
  query_version    VARCHAR2(2),
  is_get           VARCHAR2(2),
  check_time       DATE,
  ip               VARCHAR2(16)
)
;
comment on table CIFM_PERSON_DETAIL
  is '征信查询个人明细表';
comment on column CIFM_PERSON_DETAIL.id
  is '查询编号';
comment on column CIFM_PERSON_DETAIL.org_code
  is '上级机构代码';
comment on column CIFM_PERSON_DETAIL.branch_code
  is '查询网点机构码';
comment on column CIFM_PERSON_DETAIL.branch_name
  is '查询网点名称';
comment on column CIFM_PERSON_DETAIL.user_sys_name
  is '查询用户系统名';
comment on column CIFM_PERSON_DETAIL.user_real_name
  is '查询用户真实姓名';
comment on column CIFM_PERSON_DETAIL.query_time
  is '查询时间';
comment on column CIFM_PERSON_DETAIL.client_name
  is '被查询人姓名';
comment on column CIFM_PERSON_DETAIL.credentials_type
  is '证件类型';
comment on column CIFM_PERSON_DETAIL.credentials_no
  is '证件号码';
comment on column CIFM_PERSON_DETAIL.query_reason
  is '查询原因';
comment on column CIFM_PERSON_DETAIL.query_version
  is '查询版本';
comment on column CIFM_PERSON_DETAIL.is_get
  is '是否查得';
comment on column CIFM_PERSON_DETAIL.check_time
  is '查询授权时间';
comment on column CIFM_PERSON_DETAIL.ip
  is '查询机IP';

