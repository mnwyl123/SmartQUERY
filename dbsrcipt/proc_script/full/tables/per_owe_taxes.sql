create table PER_OWE_TAXES
(
  report_id     VARCHAR2(30) not null,
  serial        VARCHAR2(10),
  tax_authority VARCHAR2(80),
  owe_tax_sum   VARCHAR2(10),
  owe_tax_date  VARCHAR2(20),
  label_cnt     VARCHAR2(100)
)
;
comment on table PER_OWE_TAXES
  is '欠税记录信息段';
comment on column PER_OWE_TAXES.report_id
  is '报告编号';
comment on column PER_OWE_TAXES.serial
  is '编号';
comment on column PER_OWE_TAXES.tax_authority
  is '主管税务机关';
comment on column PER_OWE_TAXES.owe_tax_sum
  is '欠税总额';
comment on column PER_OWE_TAXES.owe_tax_date
  is '欠税统计日期';
comment on column PER_OWE_TAXES.label_cnt
  is '标注及声明个数';

