create table CIFM_ORG_QUERY_COUNT
(
  org_id               VARCHAR2(50),
  application_time     DATE,
  enter_query_count    VARCHAR2(32),
  personal_query_count VARCHAR2(32),
  total                VARCHAR2(32),
  org_code             VARCHAR2(50),
  org_name             VARCHAR2(50)
)
;
comment on table CIFM_ORG_QUERY_COUNT
  is '机构查询量统计表';
comment on column CIFM_ORG_QUERY_COUNT.org_id
  is '机构号';
comment on column CIFM_ORG_QUERY_COUNT.application_time
  is '申请日期';
comment on column CIFM_ORG_QUERY_COUNT.enter_query_count
  is '企业查询次数';
comment on column CIFM_ORG_QUERY_COUNT.personal_query_count
  is '个人查询次数';
comment on column CIFM_ORG_QUERY_COUNT.total
  is '总计';

