create table PER_OVERDUE_SUMMARY_INFO
(
  report_id               VARCHAR2(30) not null,
  month_cnt               VARCHAR2(100),
  single_month_max_amount VARCHAR2(100),
  account_type            VARCHAR2(100),
  acc_sum                 VARCHAR2(100),
  max_month_cnt           VARCHAR2(100)
)
;
comment on table PER_OVERDUE_SUMMARY_INFO
  is '逾期（透支）汇总信息';
comment on column PER_OVERDUE_SUMMARY_INFO.report_id
  is '报告编号';
comment on column PER_OVERDUE_SUMMARY_INFO.month_cnt
  is '月份数';
comment on column PER_OVERDUE_SUMMARY_INFO.single_month_max_amount
  is '单月最高逾期（透支）总额';
comment on column PER_OVERDUE_SUMMARY_INFO.account_type
  is '账户类型';
comment on column PER_OVERDUE_SUMMARY_INFO.acc_sum
  is '账户数';
comment on column PER_OVERDUE_SUMMARY_INFO.max_month_cnt
  is '最长逾期（透支）月数';

