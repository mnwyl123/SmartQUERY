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
  is 'Ƿ˰��¼��Ϣ��Ԫ';
comment on column COM_TAX_ARREARS_RECORD.report_id
  is '������';
comment on column COM_TAX_ARREARS_RECORD.tax_authorities
  is '����˰���������';
comment on column COM_TAX_ARREARS_RECORD.tax_arrears_sum
  is 'Ƿ˰�ܶ�';
comment on column COM_TAX_ARREARS_RECORD.tax_arrears_date
  is 'Ƿ˰ͳ��ʱ��';
comment on column COM_TAX_ARREARS_RECORD.tax_arrens_id
  is 'Ƿ˰��¼���';

