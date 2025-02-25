create table COM_REPORT_INFO
(
  report_id         VARCHAR2(30) not null,
  org_code          VARCHAR2(200),
  china_credit_code VARCHAR2(200),
  report_date       VARCHAR2(150),
  query_reason      VARCHAR2(150),
  query_operator    VARCHAR2(200),
  report_time       VARCHAR2(100),
  sum_ent_ident     VARCHAR2(100),
  rate_exchange     VARCHAR2(100),
  effe_date_rate    VARCHAR2(100),
  ent_name          VARCHAR2(150),
  obj_lab_item      VARCHAR2(100)
)
;
comment on table COM_REPORT_INFO
  is '����ͷ��Ϣ��Ԫ';
comment on column COM_REPORT_INFO.report_id
  is '������';
comment on column COM_REPORT_INFO.org_code
  is '�������ô��루��ѯ�������룩';
comment on column COM_REPORT_INFO.china_credit_code
  is '������';
comment on column COM_REPORT_INFO.report_date
  is '��������';
comment on column COM_REPORT_INFO.query_reason
  is '��ѯԭ��';
comment on column COM_REPORT_INFO.query_operator
  is '��ѯ����Ա';
comment on column COM_REPORT_INFO.report_time
  is '��������ʱ��';
comment on column COM_REPORT_INFO.sum_ent_ident
  is '��ҵ��ݱ�ʶ����';
comment on column COM_REPORT_INFO.rate_exchange
  is '��Ԫ������һ���';
comment on column COM_REPORT_INFO.effe_date_rate
  is '������Ч����';
comment on column COM_REPORT_INFO.ent_name
  is '��ҵ����';
comment on column COM_REPORT_INFO.obj_lab_item
  is '�����ע��Ŀ';

