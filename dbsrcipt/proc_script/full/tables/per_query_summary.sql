create table PER_QUERY_SUMMARY
(
  report_id                 VARCHAR2(30) not null,
  mon_loan_query_org_num    INTEGER,
  mon_credit_query_org_num  INTEGER,
  mon_loan_query_num        INTEGER,
  mon_credit_query_num      INTEGER,
  mon_own_query_num         INTEGER,
  year_loan_query_num       INTEGER,
  year_own_query_num        INTEGER,
  year_special_query_num    INTEGER,
  year_after_loan_query_num VARCHAR2(100),
  lr_query_org_reason       VARCHAR2(100),
  lr_query_org_code         VARCHAR2(100),
  year_assure_query_num     VARCHAR2(100),
  lr_query_time             VARCHAR2(100),
  lr_query_org_type         VARCHAR2(100)
)
;
comment on table PER_QUERY_SUMMARY
  is '��ѯ��¼��Ҫ��Ϣ��';
comment on column PER_QUERY_SUMMARY.report_id
  is '������';
comment on column PER_QUERY_SUMMARY.mon_loan_query_org_num
  is '��� 1 �����ڵĲ�ѯ������(��������)';
comment on column PER_QUERY_SUMMARY.mon_credit_query_org_num
  is '��� 1 �����ڵĲ�ѯ������(���ÿ�����)';
comment on column PER_QUERY_SUMMARY.mon_loan_query_num
  is '��� 1 �����ڵĲ�ѯ����(��������)';
comment on column PER_QUERY_SUMMARY.mon_credit_query_num
  is '��� 1 �����ڵĲ�ѯ����(���ÿ�����)';
comment on column PER_QUERY_SUMMARY.mon_own_query_num
  is '��� 1 �����ڵĲ�ѯ����(���˲�ѯ)';
comment on column PER_QUERY_SUMMARY.year_loan_query_num
  is '��������ڲ�ѯ���������';
comment on column PER_QUERY_SUMMARY.year_own_query_num
  is '��������ڲ�ѯ���������ÿ���';
comment on column PER_QUERY_SUMMARY.year_special_query_num
  is '��� 2 ���ڵĲ�ѯ����(��Լ�̻�ʵ�����)';
comment on column PER_QUERY_SUMMARY.year_after_loan_query_num
  is '��� 2 ���ڵĲ�ѯ����(�������)';
comment on column PER_QUERY_SUMMARY.lr_query_org_reason
  is '��һ�β�ѯԭ��';
comment on column PER_QUERY_SUMMARY.lr_query_org_code
  is '��һ�β�ѯ��������';
comment on column PER_QUERY_SUMMARY.year_assure_query_num
  is '��� 2 ���ڵĲ�ѯ����(�����ʸ����)';
comment on column PER_QUERY_SUMMARY.lr_query_time
  is '��һ�β�ѯ����';
comment on column PER_QUERY_SUMMARY.lr_query_org_type
  is '��һ�β�ѯ������������';

