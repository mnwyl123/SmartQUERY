create table ONE_DICTNAME
(
  id             VARCHAR2(100),
  table_name     VARCHAR2(100),
  table_comment  VARCHAR2(100),
  column_name    VARCHAR2(100),
  column_comment VARCHAR2(1000),
  is_one         VARCHAR2(1),
  wheresql       VARCHAR2(500)
)
;
comment on table ONE_DICTNAME
  is 'һ���ֵ���';
comment on column ONE_DICTNAME.id
  is '�ֵ���';
comment on column ONE_DICTNAME.is_one
  is '�Ƿ�һ��ר�� 1-һ��ר�ã�0-һ����ͨ��';

