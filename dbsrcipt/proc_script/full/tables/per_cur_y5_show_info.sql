create table PER_CUR_Y5_SHOW_INFO
(
  report_id     VARCHAR2(30) not null,
  serial        VARCHAR2(100),
  repay_status  VARCHAR2(100),
  p_month       VARCHAR2(100),
  overdraft_sum VARCHAR2(100)
)
;
comment on table PER_CUR_Y5_SHOW_INFO
  is '最近 5 年内的历史表现';
comment on column PER_CUR_Y5_SHOW_INFO.report_id
  is '报告编号';
comment on column PER_CUR_Y5_SHOW_INFO.serial
  is '账户编号';
comment on column PER_CUR_Y5_SHOW_INFO.repay_status
  is '还款状态';
comment on column PER_CUR_Y5_SHOW_INFO.p_month
  is '月份';
comment on column PER_CUR_Y5_SHOW_INFO.overdraft_sum
  is '逾期（透支） 总额';

