create table PER_LOAN_PROMPT_DETAIL
(
  report_id        VARCHAR2(30) not null,
  busi_type        VARCHAR2(100),
  fir_buss_month   VARCHAR2(100),
  busi_major_class VARCHAR2(100),
  acc_sum          VARCHAR2(100)
)
;
comment on table PER_LOAN_PROMPT_DETAIL
  is '信贷交易提示信息';
comment on column PER_LOAN_PROMPT_DETAIL.report_id
  is '报告编号';
comment on column PER_LOAN_PROMPT_DETAIL.busi_type
  is '业务类型';
comment on column PER_LOAN_PROMPT_DETAIL.fir_buss_month
  is '首笔业务发放月份';
comment on column PER_LOAN_PROMPT_DETAIL.busi_major_class
  is '业务大类';
comment on column PER_LOAN_PROMPT_DETAIL.acc_sum
  is '账户数';

