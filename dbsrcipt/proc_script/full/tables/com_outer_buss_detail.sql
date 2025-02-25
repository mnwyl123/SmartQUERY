create table COM_OUTER_BUSS_DETAIL
(
  report_id      VARCHAR2(30) not null,
  serial_no      VARCHAR2(64),
  credit_org     VARCHAR2(100),
  type           VARCHAR2(10),
  currency       VARCHAR2(10),
  buss_sum       VARCHAR2(15),
  buss_balance   VARCHAR2(15),
  start_date     VARCHAR2(20),
  stop_date      VARCHAR2(20),
  five_type      VARCHAR2(10),
  is_guar        VARCHAR2(5),
  is_adva        VARCHAR2(5),
  margin_percent VARCHAR2(10),
  his_record     VARCHAR2(100),
  buss_type      VARCHAR2(5),
  atten_status   VARCHAR2(5),
  settle_status  VARCHAR2(5),
  remarks        VARCHAR2(200),
  acc_num        VARCHAR2(10),
  settle_date    VARCHAR2(20)
)
;
comment on table COM_OUTER_BUSS_DETAIL
  is '表外业务明细';
comment on column COM_OUTER_BUSS_DETAIL.report_id
  is '报告编号';
comment on column COM_OUTER_BUSS_DETAIL.serial_no
  is '流水号';
comment on column COM_OUTER_BUSS_DETAIL.credit_org
  is '授信机构';
comment on column COM_OUTER_BUSS_DETAIL.type
  is '种类';
comment on column COM_OUTER_BUSS_DETAIL.currency
  is '币种';
comment on column COM_OUTER_BUSS_DETAIL.buss_sum
  is '金额';
comment on column COM_OUTER_BUSS_DETAIL.buss_balance
  is '余额';
comment on column COM_OUTER_BUSS_DETAIL.start_date
  is '起始日期';
comment on column COM_OUTER_BUSS_DETAIL.stop_date
  is '到期日期';
comment on column COM_OUTER_BUSS_DETAIL.five_type
  is '五级分类';
comment on column COM_OUTER_BUSS_DETAIL.is_guar
  is '担保';
comment on column COM_OUTER_BUSS_DETAIL.is_adva
  is '垫款';
comment on column COM_OUTER_BUSS_DETAIL.margin_percent
  is '保证金比例';
comment on column COM_OUTER_BUSS_DETAIL.his_record
  is '历史记录';
comment on column COM_OUTER_BUSS_DETAIL.buss_type
  is '业务类型(04：保理,05：票据贴现,06：银承,07：信用证,08：包含)';
comment on column COM_OUTER_BUSS_DETAIL.atten_status
  is '关注状态(01：正常,02：关注,03：不良)';
comment on column COM_OUTER_BUSS_DETAIL.settle_status
  is '结清状态(0：未结清,1：已结清)';
comment on column COM_OUTER_BUSS_DETAIL.remarks
  is '备注';
comment on column COM_OUTER_BUSS_DETAIL.acc_num
  is '笔数';
comment on column COM_OUTER_BUSS_DETAIL.settle_date
  is '结清日期';

