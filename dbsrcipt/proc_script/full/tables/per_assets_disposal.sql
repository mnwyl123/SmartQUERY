create table PER_ASSETS_DISPOSAL
(
  report_id        VARCHAR2(30) not null,
  serial           VARCHAR2(10),
  info_type        VARCHAR2(5),
  company_name     VARCHAR2(200),
  receive_date     VARCHAR2(20),
  aggregate_amount VARCHAR2(20),
  last_repay_date  VARCHAR2(20),
  balance          VARCHAR2(20),
  info_type2       VARCHAR2(5)
)
;
comment on table PER_ASSETS_DISPOSAL
  is '资产处置/保证人代偿信息';
comment on column PER_ASSETS_DISPOSAL.report_id
  is '报告编号';
comment on column PER_ASSETS_DISPOSAL.serial
  is '编号';
comment on column PER_ASSETS_DISPOSAL.info_type
  is '类型(0:资产处置；1:保证人代偿)';
comment on column PER_ASSETS_DISPOSAL.company_name
  is '机构名称';
comment on column PER_ASSETS_DISPOSAL.receive_date
  is '接收/代偿日期';
comment on column PER_ASSETS_DISPOSAL.aggregate_amount
  is '金额';
comment on column PER_ASSETS_DISPOSAL.last_repay_date
  is '最近一次还款日期';
comment on column PER_ASSETS_DISPOSAL.balance
  is '余额';

