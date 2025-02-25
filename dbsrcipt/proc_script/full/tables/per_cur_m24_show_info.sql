create table PER_CUR_M24_SHOW_INFO
(
  report_id    VARCHAR2(30) not null,
  serial       VARCHAR2(100),
  repay_status VARCHAR2(100),
  p_month      VARCHAR2(100)
)
;
comment on table PER_CUR_M24_SHOW_INFO
  is '最近 24 个月还款状态信息';
comment on column PER_CUR_M24_SHOW_INFO.report_id
  is '报告编号';
comment on column PER_CUR_M24_SHOW_INFO.serial
  is '账户编号';
comment on column PER_CUR_M24_SHOW_INFO.repay_status
  is '还款状态';
comment on column PER_CUR_M24_SHOW_INFO.p_month
  is '月份';

