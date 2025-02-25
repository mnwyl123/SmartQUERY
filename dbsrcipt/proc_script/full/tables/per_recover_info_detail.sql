create table PER_RECOVER_INFO_DETAIL
(
  report_id VARCHAR2(30) not null,
  balance   VARCHAR2(100),
  buss_type VARCHAR2(100),
  acc_sum   VARCHAR2(100)
)
;
comment on table PER_RECOVER_INFO_DETAIL
  is '被追偿汇总信息';
comment on column PER_RECOVER_INFO_DETAIL.report_id
  is '报告编号';
comment on column PER_RECOVER_INFO_DETAIL.balance
  is '余额';
comment on column PER_RECOVER_INFO_DETAIL.buss_type
  is '业务类型';
comment on column PER_RECOVER_INFO_DETAIL.acc_sum
  is '账户数';

