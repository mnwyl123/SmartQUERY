create table PER_LOAN_PROMPT_DETAIL
(
  report_id        VARCHAR2(30) not null,
  busi_type        VARCHAR2(100),
  fir_buss_month   VARCHAR2(100),
  busi_major_class VARCHAR2(100),
  acc_sum          VARCHAR2(100)
)
;
comment on table PER_LOAN_PROMPT_DETAIL
  is '�Ŵ�������ʾ��Ϣ';
comment on column PER_LOAN_PROMPT_DETAIL.report_id
  is '������';
comment on column PER_LOAN_PROMPT_DETAIL.busi_type
  is 'ҵ������';
comment on column PER_LOAN_PROMPT_DETAIL.fir_buss_month
  is '�ױ�ҵ�񷢷��·�';
comment on column PER_LOAN_PROMPT_DETAIL.busi_major_class
  is 'ҵ�����';
comment on column PER_LOAN_PROMPT_DETAIL.acc_sum
  is '�˻���';

