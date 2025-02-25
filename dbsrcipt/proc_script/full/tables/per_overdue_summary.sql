create table PER_OVERDUE_SUMMARY
(
  report_id      VARCHAR2(30) not null,
  serial         VARCHAR2(10),
  serial_number  VARCHAR2(64),
  cart_type      VARCHAR2(10),
  over_month     VARCHAR2(20),
  over_month_num VARCHAR2(20),
  over_sum       VARCHAR2(20)
)
;
comment on table PER_OVERDUE_SUMMARY
  is '贷款/贷记卡/准贷记卡逾期记录';
comment on column PER_OVERDUE_SUMMARY.report_id
  is '报告编号';
comment on column PER_OVERDUE_SUMMARY.serial
  is '编号';
comment on column PER_OVERDUE_SUMMARY.serial_number
  is '流水号';
comment on column PER_OVERDUE_SUMMARY.cart_type
  is '卡类型(0:贷款，1:贷记卡，2:准贷记卡)';
comment on column PER_OVERDUE_SUMMARY.over_month
  is '逾期/透支月份';
comment on column PER_OVERDUE_SUMMARY.over_month_num
  is '逾期/透支持续月数';
comment on column PER_OVERDUE_SUMMARY.over_sum
  is '逾期/透支金额';

