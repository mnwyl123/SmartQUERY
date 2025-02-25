create table PER_AFTER_PAY_OWE_INFO
(
  report_id    VARCHAR2(30) not null,
  arre_acc_num VARCHAR2(100),
  buss_type    VARCHAR2(100),
  arre_sum     VARCHAR2(100)
)
;
comment on table PER_AFTER_PAY_OWE_INFO
  is '后付费业务欠费信息';
comment on column PER_AFTER_PAY_OWE_INFO.report_id
  is '报告编号';
comment on column PER_AFTER_PAY_OWE_INFO.arre_acc_num
  is '欠费账户数';
comment on column PER_AFTER_PAY_OWE_INFO.buss_type
  is '后付费业务类型';
comment on column PER_AFTER_PAY_OWE_INFO.arre_sum
  is '欠费金额';

