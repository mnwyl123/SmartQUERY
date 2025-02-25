create table COM_PROVID_PAY_RECORD_YEAR
(
  report_id        VARCHAR2(30) not null,
  last_pay_date    VARCHAR2(100),
  static_date      VARCHAR2(100),
  cur_should_pay   VARCHAR2(100),
  total_arrear_sum VARCHAR2(100),
  serial           VARCHAR2(100),
  cur_actual_pay   VARCHAR2(100)
)
;
comment on table COM_PROVID_PAY_RECORD_YEAR
  is '住房公积金缴费情况信息';
comment on column COM_PROVID_PAY_RECORD_YEAR.report_id
  is '报告编号';
comment on column COM_PROVID_PAY_RECORD_YEAR.last_pay_date
  is '缴费状态';
comment on column COM_PROVID_PAY_RECORD_YEAR.static_date
  is '统计年月';
comment on column COM_PROVID_PAY_RECORD_YEAR.cur_should_pay
  is '本月应缴金额';
comment on column COM_PROVID_PAY_RECORD_YEAR.total_arrear_sum
  is '累计欠费金额';
comment on column COM_PROVID_PAY_RECORD_YEAR.serial
  is '编号';
comment on column COM_PROVID_PAY_RECORD_YEAR.cur_actual_pay
  is '本月实缴金额';

