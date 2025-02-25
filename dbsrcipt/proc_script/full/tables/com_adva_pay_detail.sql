create table COM_ADVA_PAY_DETAIL
(
  report_id        VARCHAR2(30) not null,
  serial_no        VARCHAR2(64),
  credit_org       VARCHAR2(30),
  currency         VARCHAR2(10),
  adva_pay_sum     VARCHAR2(15),
  adva_pay_balance VARCHAR2(15),
  adva_pay_date    VARCHAR2(20),
  adva_settle_date VARCHAR2(20),
  five_type        VARCHAR2(10),
  orig_buss        VARCHAR2(50),
  settle_status    VARCHAR2(5),
  remarks          VARCHAR2(200)
)
;
comment on table COM_ADVA_PAY_DETAIL
  is '垫款明细';
comment on column COM_ADVA_PAY_DETAIL.report_id
  is '报告编号';
comment on column COM_ADVA_PAY_DETAIL.serial_no
  is '流水号';
comment on column COM_ADVA_PAY_DETAIL.credit_org
  is '授信机构';
comment on column COM_ADVA_PAY_DETAIL.currency
  is '币种';
comment on column COM_ADVA_PAY_DETAIL.adva_pay_sum
  is '垫款金额';
comment on column COM_ADVA_PAY_DETAIL.adva_pay_balance
  is '垫款余额';
comment on column COM_ADVA_PAY_DETAIL.adva_pay_date
  is '垫款日期';
comment on column COM_ADVA_PAY_DETAIL.adva_settle_date
  is '结清日期';
comment on column COM_ADVA_PAY_DETAIL.five_type
  is '五级分类';
comment on column COM_ADVA_PAY_DETAIL.orig_buss
  is '原业务';
comment on column COM_ADVA_PAY_DETAIL.settle_status
  is '结清状态(0：未结清,1：已结清)';
comment on column COM_ADVA_PAY_DETAIL.remarks
  is '备注';

