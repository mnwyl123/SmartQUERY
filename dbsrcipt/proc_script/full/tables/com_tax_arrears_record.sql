create table COM_TAX_ARREARS_RECORD
(
  report_id        VARCHAR2(30) not null,
  tax_authorities  VARCHAR2(200),
  tax_arrears_sum  VARCHAR2(50),
  tax_arrears_date VARCHAR2(20),
  tax_arrens_id    VARCHAR2(100)
)
;
comment on table COM_TAX_ARREARS_RECORD
  is '欠税记录信息单元';
comment on column COM_TAX_ARREARS_RECORD.report_id
  is '报告编号';
comment on column COM_TAX_ARREARS_RECORD.tax_authorities
  is '主管税务机关名称';
comment on column COM_TAX_ARREARS_RECORD.tax_arrears_sum
  is '欠税总额';
comment on column COM_TAX_ARREARS_RECORD.tax_arrears_date
  is '欠税统计时间';
comment on column COM_TAX_ARREARS_RECORD.tax_arrens_id
  is '欠税记录编号';

