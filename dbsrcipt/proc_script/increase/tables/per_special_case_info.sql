create table PER_SPECIAL_CASE_INFO
(
  report_id    VARCHAR2(30) not null,
  case_type    VARCHAR2(100),
  s_hepp_month VARCHAR2(100),
  serial       VARCHAR2(100)
)
;
comment on table PER_SPECIAL_CASE_INFO
  is '特殊事件说明信息';
comment on column PER_SPECIAL_CASE_INFO.report_id
  is '报告编号';
comment on column PER_SPECIAL_CASE_INFO.case_type
  is '特殊事件类型';
comment on column PER_SPECIAL_CASE_INFO.s_hepp_month
  is '特殊事件发生月份';
comment on column PER_SPECIAL_CASE_INFO.serial
  is '账户编号';

