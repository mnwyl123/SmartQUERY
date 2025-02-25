create table COM_PROVID_FUND_PAY_RECORD
(
  report_id            VARCHAR2(30) not null,
  serial_no            VARCHAR2(64),
  statistic_date       VARCHAR2(10),
  first_pay_date       VARCHAR2(10),
  employ_num           VARCHAR2(10),
  base_pay             VARCHAR2(15),
  last_pay_date        VARCHAR2(20),
  pay_to_date          VARCHAR2(10),
  pay_status           VARCHAR2(15),
  total_arrear_sum     VARCHAR2(15),
  date_pay_recent      VARCHAR2(100),
  pay_recod_num_provid VARCHAR2(100),
  static_date          VARCHAR2(100),
  serial               VARCHAR2(100),
  num_pep              VARCHAR2(100),
  ser_no               VARCHAR2(100),
  pay_status2          VARCHAR2(15)
)
;
comment on table COM_PROVID_FUND_PAY_RECORD
  is '住房公积金缴费记录信息单元';
comment on column COM_PROVID_FUND_PAY_RECORD.report_id
  is '报告编号';
comment on column COM_PROVID_FUND_PAY_RECORD.serial_no
  is '流水号';
comment on column COM_PROVID_FUND_PAY_RECORD.statistic_date
  is '保险类别';
comment on column COM_PROVID_FUND_PAY_RECORD.first_pay_date
  is '初缴年月';
comment on column COM_PROVID_FUND_PAY_RECORD.employ_num
  is '缴费基数';
comment on column COM_PROVID_FUND_PAY_RECORD.base_pay
  is '缴费基数';
comment on column COM_PROVID_FUND_PAY_RECORD.last_pay_date
  is '缴费状态';
comment on column COM_PROVID_FUND_PAY_RECORD.pay_to_date
  is '缴至年月';
comment on column COM_PROVID_FUND_PAY_RECORD.pay_status
  is '缴费状态';
comment on column COM_PROVID_FUND_PAY_RECORD.total_arrear_sum
  is '累计欠费金额';
comment on column COM_PROVID_FUND_PAY_RECORD.date_pay_recent
  is '最近一次缴费日期';
comment on column COM_PROVID_FUND_PAY_RECORD.pay_recod_num_provid
  is '缴费记录条数';
comment on column COM_PROVID_FUND_PAY_RECORD.static_date
  is '统计年月';
comment on column COM_PROVID_FUND_PAY_RECORD.serial
  is '编号';
comment on column COM_PROVID_FUND_PAY_RECORD.num_pep
  is '职工人数';
comment on column COM_PROVID_FUND_PAY_RECORD.ser_no
  is '账户编号';
comment on column COM_PROVID_FUND_PAY_RECORD.pay_status2
  is '缴费状态2';

