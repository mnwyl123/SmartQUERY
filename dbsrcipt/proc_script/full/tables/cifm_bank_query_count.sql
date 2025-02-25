create table CIFM_BANK_QUERY_COUNT
(
  org_id               VARCHAR2(100),
  application_time     VARCHAR2(20),
  enter_query_count    VARCHAR2(20),
  personal_query_count VARCHAR2(20),
  org_code             VARCHAR2(50),
  org_name             VARCHAR2(30),
  user_id              VARCHAR2(100),
  user_code            VARCHAR2(255),
  user_name            VARCHAR2(255)
)
;
comment on table CIFM_BANK_QUERY_COUNT
  is '人行查询流水统计结果表';
comment on column CIFM_BANK_QUERY_COUNT.application_time
  is '查询时间';
comment on column CIFM_BANK_QUERY_COUNT.enter_query_count
  is '企业查询次数';
comment on column CIFM_BANK_QUERY_COUNT.personal_query_count
  is '个人查询次数';

