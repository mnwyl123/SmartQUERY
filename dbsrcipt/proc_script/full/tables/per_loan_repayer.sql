create table PER_LOAN_REPAYER
(
  report_id         VARCHAR2(30) not null,
  repay_type        VARCHAR2(100),
  acc_sum           VARCHAR2(100),
  borrower_category VARCHAR2(100),
  balance           VARCHAR2(100),
  repay_sum         VARCHAR2(100)
)
;
comment on table PER_LOAN_REPAYER
  is '��ػ������λ�����Ϣ';
comment on column PER_LOAN_REPAYER.report_id
  is '������';
comment on column PER_LOAN_REPAYER.repay_type
  is '������������';
comment on column PER_LOAN_REPAYER.acc_sum
  is '�˻���';
comment on column PER_LOAN_REPAYER.borrower_category
  is '�����������';
comment on column PER_LOAN_REPAYER.balance
  is '���';
comment on column PER_LOAN_REPAYER.repay_sum
  is '�������ν��';

