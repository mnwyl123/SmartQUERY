create table CIFM_QUERY_DATE_OPERATOR
(
  para_type VARCHAR2(20) not null,
  limt_date VARCHAR2(50),
  company   VARCHAR2(10),
  org_id    VARCHAR2(100)
)
;
comment on table CIFM_QUERY_DATE_OPERATOR
  is '��ѯʱ�����ñ�';
comment on column CIFM_QUERY_DATE_OPERATOR.para_type
  is '��������(1���ˣ�2��ҵ)';
comment on column CIFM_QUERY_DATE_OPERATOR.limt_date
  is 'ʱ��(��λ����)';
comment on column CIFM_QUERY_DATE_OPERATOR.company
  is '����';
comment on column CIFM_QUERY_DATE_OPERATOR.org_id
  is '����ID';

