create table PER_QUERY_DETAIL
(
  report_id         VARCHAR2(30) not null,
  serial            VARCHAR2(10),
  cr_query_time     VARCHAR2(20),
  cr_query_operator VARCHAR2(50),
  cr_query_reason   VARCHAR2(50),
  query_org_type    VARCHAR2(100),
  query_org_code    VARCHAR2(100),
  query_reason      VARCHAR2(100),
  query_time        VARCHAR2(100)
)
;
comment on table PER_QUERY_DETAIL
  is '查询记录信息单元';
comment on column PER_QUERY_DETAIL.report_id
  is '报告编号';
comment on column PER_QUERY_DETAIL.serial
  is '编号';
comment on column PER_QUERY_DETAIL.cr_query_time
  is '查询时间';
comment on column PER_QUERY_DETAIL.cr_query_operator
  is '操作员';
comment on column PER_QUERY_DETAIL.cr_query_reason
  is '查询原因';
comment on column PER_QUERY_DETAIL.query_org_type
  is '查询机构类型';
comment on column PER_QUERY_DETAIL.query_org_code
  is '查询机构';
comment on column PER_QUERY_DETAIL.query_reason
  is '查询原因';
comment on column PER_QUERY_DETAIL.query_time
  is '查询日期';

