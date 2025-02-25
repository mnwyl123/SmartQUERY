create table COM_ASSET_DISP_DEBT_DETAIL
(
  report_id      VARCHAR2(30) not null,
  serial_no      VARCHAR2(64),
  disp_org       VARCHAR2(30),
  currency       VARCHAR2(10),
  orig_amount    VARCHAR2(15),
  rec_date       VARCHAR2(20),
  balance        VARCHAR2(15),
  last_disp_date VARCHAR2(20),
  settle_status  VARCHAR2(2),
  remarks        VARCHAR2(200),
  currency2      VARCHAR2(10)
)
;
comment on table COM_ASSET_DISP_DEBT_DETAIL
  is '资产公司处置债务明细';
comment on column COM_ASSET_DISP_DEBT_DETAIL.report_id
  is '报告编号';
comment on column COM_ASSET_DISP_DEBT_DETAIL.serial_no
  is '流水号';
comment on column COM_ASSET_DISP_DEBT_DETAIL.disp_org
  is '处置机构';
comment on column COM_ASSET_DISP_DEBT_DETAIL.currency
  is '币种';
comment on column COM_ASSET_DISP_DEBT_DETAIL.orig_amount
  is '原始金额';
comment on column COM_ASSET_DISP_DEBT_DETAIL.rec_date
  is '接收日期';
comment on column COM_ASSET_DISP_DEBT_DETAIL.balance
  is '余额(已结清的余额为0)';
comment on column COM_ASSET_DISP_DEBT_DETAIL.last_disp_date
  is '最近一次处置日期';
comment on column COM_ASSET_DISP_DEBT_DETAIL.settle_status
  is '结清状态(0：未结清,1：已结清)';
comment on column COM_ASSET_DISP_DEBT_DETAIL.remarks
  is '备注';

