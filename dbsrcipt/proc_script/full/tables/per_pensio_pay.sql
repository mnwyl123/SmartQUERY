create table PER_PENSIO_PAY
(
  report_id       VARCHAR2(30) not null,
  serial          VARCHAR2(10),
  insured_place   VARCHAR2(50),
  insured_date    VARCHAR2(20),
  pay_mon_sum     VARCHAR2(20),
  start_work_mon  VARCHAR2(20),
  pay_status      VARCHAR2(20),
  per_pay_base    VARCHAR2(10),
  pay_amout_mon   VARCHAR2(10),
  update_time     VARCHAR2(10),
  pay_com_name    VARCHAR2(200),
  sopt_pay_reason VARCHAR2(100)
)
;
comment on table PER_PENSIO_PAY
  is '养老缴费表';
comment on column PER_PENSIO_PAY.report_id
  is '报告编号';
comment on column PER_PENSIO_PAY.serial
  is '编号';
comment on column PER_PENSIO_PAY.insured_place
  is '参保地';
comment on column PER_PENSIO_PAY.insured_date
  is '参保日期';
comment on column PER_PENSIO_PAY.pay_mon_sum
  is '累计缴费月数';
comment on column PER_PENSIO_PAY.start_work_mon
  is '参加工作月份';
comment on column PER_PENSIO_PAY.pay_status
  is '缴费状态';
comment on column PER_PENSIO_PAY.per_pay_base
  is '个人缴费基数';
comment on column PER_PENSIO_PAY.pay_amout_mon
  is '本月缴费金额';
comment on column PER_PENSIO_PAY.update_time
  is '信息更新日期';
comment on column PER_PENSIO_PAY.pay_com_name
  is '缴费单位';
comment on column PER_PENSIO_PAY.sopt_pay_reason
  is '中断或终止缴费原因';

