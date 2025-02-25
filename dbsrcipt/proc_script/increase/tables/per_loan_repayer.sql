create table PER_LOAN_REPAYER
(
  report_id         VARCHAR2(30) not null,
  repay_type        VARCHAR2(100),
  acc_sum           VARCHAR2(100),
  borrower_category VARCHAR2(100),
  balance           VARCHAR2(100),
  repay_sum         VARCHAR2(100)
)
;
comment on table PER_LOAN_REPAYER
  is '相关还款责任汇总信息';
comment on column PER_LOAN_REPAYER.report_id
  is '报告编号';
comment on column PER_LOAN_REPAYER.repay_type
  is '还款责任类型';
comment on column PER_LOAN_REPAYER.acc_sum
  is '账户数';
comment on column PER_LOAN_REPAYER.borrower_category
  is '借款人身份类别';
comment on column PER_LOAN_REPAYER.balance
  is '余额';
comment on column PER_LOAN_REPAYER.repay_sum
  is '还款责任金额';

