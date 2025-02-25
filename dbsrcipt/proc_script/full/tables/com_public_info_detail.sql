create table COM_PUBLIC_INFO_DETAIL
(
  report_id        VARCHAR2(30) not null,
  serial_no        VARCHAR2(64),
  static_date      VARCHAR2(15),
  cur_should_pay   VARCHAR2(15),
  cur_actual_pay   VARCHAR2(15),
  pay_status       VARCHAR2(20),
  total_arrear_sum VARCHAR2(15),
  serial           VARCHAR2(100),
  pay_status2      VARCHAR2(20)
)
;
comment on table COM_PUBLIC_INFO_DETAIL
  is '公共事业缴费情况信息';
comment on column COM_PUBLIC_INFO_DETAIL.report_id
  is '报告编号';
comment on column COM_PUBLIC_INFO_DETAIL.serial_no
  is '流水号';
comment on column COM_PUBLIC_INFO_DETAIL.static_date
  is '统计年月';
comment on column COM_PUBLIC_INFO_DETAIL.cur_should_pay
  is '本月应缴金额';
comment on column COM_PUBLIC_INFO_DETAIL.cur_actual_pay
  is '本月实缴金额';
comment on column COM_PUBLIC_INFO_DETAIL.pay_status
  is '缴费状态';
comment on column COM_PUBLIC_INFO_DETAIL.total_arrear_sum
  is '累计欠费金额';
comment on column COM_PUBLIC_INFO_DETAIL.serial
  is '编号';

