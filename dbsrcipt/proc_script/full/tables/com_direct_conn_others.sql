create table COM_DIRECT_CONN_OTHERS
(
  report_id         VARCHAR2(30) not null,
  com_name          VARCHAR2(300),
  china_credit_code VARCHAR2(200),
  realtion          VARCHAR2(200)
)
;
comment on table COM_DIRECT_CONN_OTHERS
  is '��ֱ�ӹ�����ϵ��������ҵ';
comment on column COM_DIRECT_CONN_OTHERS.report_id
  is '������';
comment on column COM_DIRECT_CONN_OTHERS.com_name
  is '��ҵ����';
comment on column COM_DIRECT_CONN_OTHERS.china_credit_code
  is '������';
comment on column COM_DIRECT_CONN_OTHERS.realtion
  is '��ϵ';

