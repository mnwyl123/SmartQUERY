create table CIFM_COMPANY_DETAIL_HIS
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
);
comment on table CIFM_COMPANY_DETAIL_HIS
  is '征信查询企业信息历史表';
comment on column CIFM_COMPANY_DETAIL_HIS.id
  is '查询编号';
comment on column CIFM_COMPANY_DETAIL_HIS.org_code
  is '上级机构代码';
comment on column CIFM_COMPANY_DETAIL_HIS.branch_code
  is '查询网点机构码';
comment on column CIFM_COMPANY_DETAIL_HIS.branch_name
  is '查询网点名称';
comment on column CIFM_COMPANY_DETAIL_HIS.user_sys_name
  is '查询用户系统名';
comment on column CIFM_COMPANY_DETAIL_HIS.user_real_name
  is '查询用户真实姓名';
comment on column CIFM_COMPANY_DETAIL_HIS.dept_code
  is '部门名称';
comment on column CIFM_COMPANY_DETAIL_HIS.query_time
  is '查询时间';
comment on column CIFM_COMPANY_DETAIL_HIS.query_reason
  is '查询原因';
comment on column CIFM_COMPANY_DETAIL_HIS.china_credit_code
  is '中征码';
comment on column CIFM_COMPANY_DETAIL_HIS.is_get
  is '是否查得';
comment on column CIFM_COMPANY_DETAIL_HIS.check_time
  is '查询授权时间';
comment on column CIFM_COMPANY_DETAIL_HIS.ip
  is '查询机IP';
comment on column CIFM_COMPANY_DETAIL_HIS.query_cost
  is '查询费用';

