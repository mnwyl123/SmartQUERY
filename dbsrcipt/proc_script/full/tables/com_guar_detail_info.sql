create table COM_GUAR_DETAIL_INFO
(
  report_id      VARCHAR2(30) not null,
  serial_no      VARCHAR2(64),
  guar_type      VARCHAR2(10),
  guarantor      VARCHAR2(200),
  guar_cred_type VARCHAR2(20),
  guar_cred_num  VARCHAR2(30),
  guar_currency  VARCHAR2(10),
  guar_sum       VARCHAR2(15),
  guar_style     VARCHAR2(100),
  main_buss      VARCHAR2(100),
  remarks        VARCHAR2(200),
  guar_type2     VARCHAR2(10),
  guar_currency2 VARCHAR2(10)
)
;
comment on table COM_GUAR_DETAIL_INFO
  is '担保明细';
comment on column COM_GUAR_DETAIL_INFO.report_id
  is '报告编号';
comment on column COM_GUAR_DETAIL_INFO.serial_no
  is '流水号';
comment on column COM_GUAR_DETAIL_INFO.guar_type
  is '类型';
comment on column COM_GUAR_DETAIL_INFO.guarantor
  is '被担保人';
comment on column COM_GUAR_DETAIL_INFO.guar_cred_type
  is '证件类型';
comment on column COM_GUAR_DETAIL_INFO.guar_cred_num
  is '证件号码';
comment on column COM_GUAR_DETAIL_INFO.guar_currency
  is '担保币种';
comment on column COM_GUAR_DETAIL_INFO.guar_sum
  is '担保金额';
comment on column COM_GUAR_DETAIL_INFO.guar_style
  is '担保形式';
comment on column COM_GUAR_DETAIL_INFO.main_buss
  is '主业务';
comment on column COM_GUAR_DETAIL_INFO.remarks
  is '备注';

