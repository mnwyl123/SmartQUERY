create table COM_UNCLEAR_CREDIT_TYPE_SUMM
(
  report_id     VARCHAR2(30) not null,
  buss_type     VARCHAR2(5),
  attent_status VARCHAR2(5),
  buss_num      INTEGER,
  buss_balance  VARCHAR2(15),
  settle_status VARCHAR2(2),
  buss_type2    VARCHAR2(5)
)
;
comment on table COM_UNCLEAR_CREDIT_TYPE_SUMM
  is 'δ�����Ŵ�ҵ�������Ϣ��Ҫ';
comment on column COM_UNCLEAR_CREDIT_TYPE_SUMM.report_id
  is '������';
comment on column COM_UNCLEAR_CREDIT_TYPE_SUMM.buss_type
  is 'ҵ������(01:����,02:�����,03:ó������,04:����,05:Ʊ������,06:���гжһ�Ʊ,07:����֤,08:����)';
comment on column COM_UNCLEAR_CREDIT_TYPE_SUMM.attent_status
  is '��ע״̬(01������,02����ע,03������)';
comment on column COM_UNCLEAR_CREDIT_TYPE_SUMM.buss_num
  is '����';
comment on column COM_UNCLEAR_CREDIT_TYPE_SUMM.buss_balance
  is '���';
comment on column COM_UNCLEAR_CREDIT_TYPE_SUMM.settle_status
  is '����״̬';

