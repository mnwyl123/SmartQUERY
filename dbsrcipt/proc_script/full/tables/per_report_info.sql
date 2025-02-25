create table PER_REPORT_INFO
(
  report_id      VARCHAR2(30) not null,
  query_time     VARCHAR2(20),
  report_time    VARCHAR2(20),
  query_operator VARCHAR2(50),
  query_reason   VARCHAR2(50),
  check_code     VARCHAR2(64)
)
;
comment on table PER_REPORT_INFO
  is '报告信息表';
comment on column PER_REPORT_INFO.report_id
  is '报告编号';
comment on column PER_REPORT_INFO.query_time
  is '查询时间';
comment on column PER_REPORT_INFO.report_time
  is '报告时间';
comment on column PER_REPORT_INFO.query_operator
  is '查询操作员';
comment on column PER_REPORT_INFO.query_reason
  is '查询原因';
comment on column PER_REPORT_INFO.check_code
  is '校验列';

