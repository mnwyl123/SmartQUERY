create table CIFM_COMPANY_DETAIL
(
  id                VARCHAR2(64),
  org_code          VARCHAR2(30),
  branch_code       VARCHAR2(30),
  branch_name       VARCHAR2(100),
  user_sys_name     VARCHAR2(30),
  user_real_name    VARCHAR2(20),
  dept_code         VARCHAR2(20),
  query_time        DATE,
  query_reason      VARCHAR2(2),
  china_credit_code VARCHAR2(150),
  is_get            VARCHAR2(2),
  check_time        DATE,
  ip                VARCHAR2(16),
  company_name      VARCHAR2(200),
  query_cost        NUMBER(8,2)
)
;
comment on table CIFM_COMPANY_DETAIL
  is '征信查询企业信息表';
comment on column CIFM_COMPANY_DETAIL.id
  is '查询编号';
comment on column CIFM_COMPANY_DETAIL.org_code
  is '上级机构代码';
comment on column CIFM_COMPANY_DETAIL.branch_code
  is '查询网点机构码';
comment on column CIFM_COMPANY_DETAIL.branch_name
  is '查询网点名称';
comment on column CIFM_COMPANY_DETAIL.user_sys_name
  is '查询用户系统名';
comment on column CIFM_COMPANY_DETAIL.user_real_name
  is '查询用户真实姓名';
comment on column CIFM_COMPANY_DETAIL.dept_code
  is '部门名称';
comment on column CIFM_COMPANY_DETAIL.query_time
  is '查询时间';
comment on column CIFM_COMPANY_DETAIL.query_reason
  is '查询原因';
comment on column CIFM_COMPANY_DETAIL.china_credit_code
  is '中征码';
comment on column CIFM_COMPANY_DETAIL.is_get
  is '是否查得';
comment on column CIFM_COMPANY_DETAIL.check_time
  is '查询授权时间';
comment on column CIFM_COMPANY_DETAIL.ip
  is '查询机IP';
comment on column CIFM_COMPANY_DETAIL.query_cost
  is '查询费用';

