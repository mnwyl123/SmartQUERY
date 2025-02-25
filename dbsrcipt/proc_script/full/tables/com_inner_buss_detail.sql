create table COM_INNER_BUSS_DETAIL
(
  report_id     VARCHAR2(30) not null,
  serial_no     VARCHAR2(64),
  credit_org    VARCHAR2(30),
  type          VARCHAR2(30),
  currency      VARCHAR2(10),
  buss_sum      VARCHAR2(15),
  buss_balance  VARCHAR2(15),
  start_date    VARCHAR2(20),
  stop_date     VARCHAR2(20),
  five_type     VARCHAR2(10),
  loan_type     VARCHAR2(100),
  is_guar       VARCHAR2(5),
  extension     VARCHAR2(5),
  his_record    VARCHAR2(100),
  settle_date   VARCHAR2(20),
  settle_style  VARCHAR2(15),
  buss_type     VARCHAR2(5),
  atten_status  VARCHAR2(5),
  settle_status VARCHAR2(5),
  remarks       VARCHAR2(200)
)
;
comment on table COM_INNER_BUSS_DETAIL
  is '表内业务明细';
comment on column COM_INNER_BUSS_DETAIL.report_id
  is '报告编号';
comment on column COM_INNER_BUSS_DETAIL.serial_no
  is '流水号';
comment on column COM_INNER_BUSS_DETAIL.credit_org
  is '授信机构';
comment on column COM_INNER_BUSS_DETAIL.type
  is '种类';
comment on column COM_INNER_BUSS_DETAIL.currency
  is '币种';
comment on column COM_INNER_BUSS_DETAIL.buss_sum
  is '金额';
comment on column COM_INNER_BUSS_DETAIL.buss_balance
  is '余额';
comment on column COM_INNER_BUSS_DETAIL.start_date
  is '起始日期';
comment on column COM_INNER_BUSS_DETAIL.stop_date
  is '到期日期';
comment on column COM_INNER_BUSS_DETAIL.five_type
  is '五级分类';
comment on column COM_INNER_BUSS_DETAIL.loan_type
  is '贷款形式';
comment on column COM_INNER_BUSS_DETAIL.is_guar
  is '担保';
comment on column COM_INNER_BUSS_DETAIL.extension
  is '展期/延期';
comment on column COM_INNER_BUSS_DETAIL.his_record
  is '历史记录';
comment on column COM_INNER_BUSS_DETAIL.settle_date
  is '结清日期';
comment on column COM_INNER_BUSS_DETAIL.settle_style
  is '结清方式';
comment on column COM_INNER_BUSS_DETAIL.buss_type
  is '业务类型(01：贷款,02：类贷款,03：贸易融资)';
comment on column COM_INNER_BUSS_DETAIL.atten_status
  is '关注状态(01：正常,02：关注,03：不良)';
comment on column COM_INNER_BUSS_DETAIL.settle_status
  is '结清状态(0：未结清,1：已结清)';
comment on column COM_INNER_BUSS_DETAIL.remarks
  is '备注';

