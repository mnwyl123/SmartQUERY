create table COM_SECUR_PAY_RECORD
(
  report_id        VARCHAR2(30) not null,
  serial_no        VARCHAR2(64),
  secur_type       VARCHAR2(10),
  insure_date      VARCHAR2(20),
  statistic_date   VARCHAR2(10),
  base_pay         VARCHAR2(15),
  pay_status       VARCHAR2(15),
  total_arrear_sum VARCHAR2(15)
)
;
comment on table COM_SECUR_PAY_RECORD
  is '社保缴费记录';
comment on column COM_SECUR_PAY_RECORD.report_id
  is '报告编号';
comment on column COM_SECUR_PAY_RECORD.serial_no
  is '流水号';
comment on column COM_SECUR_PAY_RECORD.secur_type
  is '保险类别';
comment on column COM_SECUR_PAY_RECORD.insure_date
  is '参保日期';
comment on column COM_SECUR_PAY_RECORD.statistic_date
  is '缴费基数';
comment on column COM_SECUR_PAY_RECORD.base_pay
  is '缴费基数';
comment on column COM_SECUR_PAY_RECORD.pay_status
  is '缴费状态';
comment on column COM_SECUR_PAY_RECORD.total_arrear_sum
  is '累计欠费金额';

