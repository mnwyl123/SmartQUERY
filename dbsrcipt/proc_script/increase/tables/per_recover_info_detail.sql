create table PER_RECOVER_INFO_DETAIL
(
  report_id VARCHAR2(30) not null,
  balance   VARCHAR2(100),
  buss_type VARCHAR2(100),
  acc_sum   VARCHAR2(100)
)
;
comment on table PER_RECOVER_INFO_DETAIL
  is '��׷��������Ϣ';
comment on column PER_RECOVER_INFO_DETAIL.report_id
  is '������';
comment on column PER_RECOVER_INFO_DETAIL.balance
  is '���';
comment on column PER_RECOVER_INFO_DETAIL.buss_type
  is 'ҵ������';
comment on column PER_RECOVER_INFO_DETAIL.acc_sum
  is '�˻���';

