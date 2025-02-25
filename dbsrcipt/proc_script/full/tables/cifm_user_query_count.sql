create table CIFM_USER_QUERY_COUNT
(
  org_id               VARCHAR2(50),
  user_id              VARCHAR2(255),
  application_time     DATE,
  enter_query_count    VARCHAR2(32),
  personal_query_count VARCHAR2(32),
  total                VARCHAR2(32),
  org_code             VARCHAR2(50),
  org_name             VARCHAR2(50),
  user_code            VARCHAR2(50),
  user_name            VARCHAR2(50)
)
;
comment on table CIFM_USER_QUERY_COUNT
  is '用户查询量统计表';
comment on column CIFM_USER_QUERY_COUNT.org_id
  is '机构号';
comment on column CIFM_USER_QUERY_COUNT.user_id
  is '用户名称';
comment on column CIFM_USER_QUERY_COUNT.application_time
  is '申请日期';
comment on column CIFM_USER_QUERY_COUNT.enter_query_count
  is '企业查询次数';
comment on column CIFM_USER_QUERY_COUNT.personal_query_count
  is '个人查询次数';
comment on column CIFM_USER_QUERY_COUNT.total
  is '总计';

