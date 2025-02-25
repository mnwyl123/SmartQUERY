create table PER_PUBLIC_SUMMARY_INFO
(
  report_id        VARCHAR2(30) not null,
  public_info_type VARCHAR2(100),
  record_num       VARCHAR2(100),
  involve_sum      VARCHAR2(100)
)
;
comment on table PER_PUBLIC_SUMMARY_INFO
  is '公共信息概要信息';
comment on column PER_PUBLIC_SUMMARY_INFO.report_id
  is '报告编号';
comment on column PER_PUBLIC_SUMMARY_INFO.public_info_type
  is '公共信息类型';
comment on column PER_PUBLIC_SUMMARY_INFO.record_num
  is '记录数';
comment on column PER_PUBLIC_SUMMARY_INFO.involve_sum
  is '涉及金额';

