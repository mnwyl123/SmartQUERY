create table COM_WAS_GUAR
(
  report_id  VARCHAR2(30) not null,
  serial_no  VARCHAR2(64),
  guarantor  VARCHAR2(200),
  guar_date  VARCHAR2(20),
  currency   VARCHAR2(15),
  guar_sum   VARCHAR2(15),
  guar_style VARCHAR2(100),
  currency2  VARCHAR2(15)
)
;
comment on table COM_WAS_GUAR
  is '被担保';
comment on column COM_WAS_GUAR.report_id
  is '报告编号';
comment on column COM_WAS_GUAR.serial_no
  is '流水号';
comment on column COM_WAS_GUAR.guarantor
  is '担保人';
comment on column COM_WAS_GUAR.guar_date
  is '担保日期';
comment on column COM_WAS_GUAR.currency
  is '币种';
comment on column COM_WAS_GUAR.guar_sum
  is '担保金额';
comment on column COM_WAS_GUAR.guar_style
  is '担保形式';

