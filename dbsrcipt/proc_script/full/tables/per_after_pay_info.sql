create table PER_AFTER_PAY_INFO
(
  report_id       VARCHAR2(30) not null,
  pay_cost_status VARCHAR2(100),
  pay_cost_record VARCHAR2(100),
  org_type        VARCHAR2(100),
  owe_sum         VARCHAR2(100),
  org_name        VARCHAR2(100),
  chg_acc_ym      VARCHAR2(100),
  acc_type        VARCHAR2(100),
  open_date       VARCHAR2(100),
  label_cnt       VARCHAR2(100),
  serial          VARCHAR2(100)
)
;
comment on table PER_AFTER_PAY_INFO
  is '后付费业务信息段';
comment on column PER_AFTER_PAY_INFO.report_id
  is '报告编号';
comment on column PER_AFTER_PAY_INFO.pay_cost_status
  is '当前缴费状态';
comment on column PER_AFTER_PAY_INFO.pay_cost_record
  is '最近 24 个月缴费记录';
comment on column PER_AFTER_PAY_INFO.org_type
  is '业务类型';
comment on column PER_AFTER_PAY_INFO.owe_sum
  is '当前欠费金额';
comment on column PER_AFTER_PAY_INFO.org_name
  is '机构名称';
comment on column PER_AFTER_PAY_INFO.chg_acc_ym
  is '记账年月';
comment on column PER_AFTER_PAY_INFO.acc_type
  is '后付费账户类型';
comment on column PER_AFTER_PAY_INFO.open_date
  is '业务开通日期';
comment on column PER_AFTER_PAY_INFO.label_cnt
  is '标注及声明个数';

