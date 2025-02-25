create table PER_EXTERNAL_GUARANTEE_DETAIL
(
  report_id           VARCHAR2(30) not null,
  serial              VARCHAR2(10),
  loan_grant_org      VARCHAR2(100),
  loan_contract_sum   VARCHAR2(20),
  loan_grant_date     VARCHAR2(20),
  loan_stop_date      VARCHAR2(20),
  guarantee_sum       VARCHAR2(20),
  guarantee_balance   VARCHAR2(20),
  loan_five_calss     VARCHAR2(20),
  settle_account_date VARCHAR2(20),
  loan_type           VARCHAR2(5),
  loan_type2          VARCHAR2(5),
  loan_five_calss2    VARCHAR2(20)
)
;
comment on table PER_EXTERNAL_GUARANTEE_DETAIL
  is '���ⵣ����Ϣ��ϸ';
comment on column PER_EXTERNAL_GUARANTEE_DETAIL.report_id
  is '������';
comment on column PER_EXTERNAL_GUARANTEE_DETAIL.serial
  is '���';
comment on column PER_EXTERNAL_GUARANTEE_DETAIL.loan_grant_org
  is '��������Ż���';
comment on column PER_EXTERNAL_GUARANTEE_DETAIL.loan_contract_sum
  is '���������ͬ���';
comment on column PER_EXTERNAL_GUARANTEE_DETAIL.loan_grant_date
  is '�������������';
comment on column PER_EXTERNAL_GUARANTEE_DETAIL.loan_stop_date
  is '�������������';
comment on column PER_EXTERNAL_GUARANTEE_DETAIL.guarantee_sum
  is '�������';
comment on column PER_EXTERNAL_GUARANTEE_DETAIL.guarantee_balance
  is '������������';
comment on column PER_EXTERNAL_GUARANTEE_DETAIL.loan_five_calss
  is '���������弶����';
comment on column PER_EXTERNAL_GUARANTEE_DETAIL.settle_account_date
  is '��������';
comment on column PER_EXTERNAL_GUARANTEE_DETAIL.loan_type
  is '��������(0:���1:���ÿ�)';

