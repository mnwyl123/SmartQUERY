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
  is 'Ƿ˰��¼��Ϣ��';
comment on column PER_OWE_TAXES.report_id
  is '������';
comment on column PER_OWE_TAXES.serial
  is '���';
comment on column PER_OWE_TAXES.tax_authority
  is '����˰�����';
comment on column PER_OWE_TAXES.owe_tax_sum
  is 'Ƿ˰�ܶ�';
comment on column PER_OWE_TAXES.owe_tax_date
  is 'Ƿ˰ͳ������';
comment on column PER_OWE_TAXES.label_cnt
  is '��ע����������';

