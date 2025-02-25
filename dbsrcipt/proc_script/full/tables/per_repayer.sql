create table PER_REPAYER
(
  report_id           VARCHAR2(30) not null,
  buss_category       VARCHAR2(100),
  contract_num        VARCHAR2(100),
  overdraft_month_cnt VARCHAR2(100),
  borrower_category   VARCHAR2(100),
  create_date         VARCHAR2(100),
  balance             VARCHAR2(100),
  buss_org_code       VARCHAR2(100),
  five_type           VARCHAR2(100),
  info_report_date    VARCHAR2(100),
  buss_org_type       VARCHAR2(100),
  repayer_type        VARCHAR2(100),
  repay_sum           VARCHAR2(100),
  acc_type            VARCHAR2(100),
  label_cnt           VARCHAR2(100),
  currency            VARCHAR2(100),
  expi_date           VARCHAR2(100),
  repay_status        VARCHAR2(100),
  serial              VARCHAR2(100)
)
;
comment on table PER_REPAYER
  is '��ػ���������Ϣ��';
comment on column PER_REPAYER.report_id
  is '������';
comment on column PER_REPAYER.buss_category
  is 'ҵ������';
comment on column PER_REPAYER.contract_num
  is '��֤��ͬ���';
comment on column PER_REPAYER.overdraft_month_cnt
  is '��������';
comment on column PER_REPAYER.borrower_category
  is '�������������';
comment on column PER_REPAYER.create_date
  is '��������';
comment on column PER_REPAYER.balance
  is '���';
comment on column PER_REPAYER.buss_org_code
  is 'ҵ��������';
comment on column PER_REPAYER.five_type
  is '�弶����';
comment on column PER_REPAYER.info_report_date
  is '��Ϣ��������';
comment on column PER_REPAYER.buss_org_type
  is 'ҵ������������';
comment on column PER_REPAYER.repayer_type
  is '��ػ�������������';
comment on column PER_REPAYER.repay_sum
  is '��ػ������ν��';
comment on column PER_REPAYER.acc_type
  is '�˻�����';
comment on column PER_REPAYER.label_cnt
  is '��ע����������';
comment on column PER_REPAYER.currency
  is '����';
comment on column PER_REPAYER.expi_date
  is '��������';
comment on column PER_REPAYER.repay_status
  is '����״̬';

