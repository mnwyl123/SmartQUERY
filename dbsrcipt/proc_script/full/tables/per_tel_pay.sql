create table PER_TEL_PAY
(
  report_id          VARCHAR2(30) not null,
  serial             VARCHAR2(10),
  tel_operators      VARCHAR2(50),
  business_type      VARCHAR2(100),
  business_open_date VARCHAR2(20),
  cur_pay_status     VARCHAR2(20),
  cur_arrear_status  VARCHAR2(20),
  cur_arrear_mon_num VARCHAR2(100),
  account_date       VARCHAR2(20),
  pay_record         VARCHAR2(100)
)
;
comment on table PER_TEL_PAY
  is '电信缴费记录';
comment on column PER_TEL_PAY.report_id
  is '报告编号';
comment on column PER_TEL_PAY.serial
  is '编号';
comment on column PER_TEL_PAY.tel_operators
  is '电信运营商';
comment on column PER_TEL_PAY.business_type
  is '业务类型';
comment on column PER_TEL_PAY.business_open_date
  is '业务开通日期';
comment on column PER_TEL_PAY.cur_pay_status
  is '当前缴费状态';
comment on column PER_TEL_PAY.cur_arrear_status
  is '当前欠费金额';
comment on column PER_TEL_PAY.cur_arrear_mon_num
  is '当前欠费月数';
comment on column PER_TEL_PAY.account_date
  is '记账年月';
comment on column PER_TEL_PAY.pay_record
  is '最近24个月缴费记录';

