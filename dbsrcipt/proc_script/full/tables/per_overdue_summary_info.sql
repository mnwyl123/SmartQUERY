create table PER_OVERDUE_SUMMARY_INFO
(
  report_id               VARCHAR2(30) not null,
  month_cnt               VARCHAR2(100),
  single_month_max_amount VARCHAR2(100),
  account_type            VARCHAR2(100),
  acc_sum                 VARCHAR2(100),
  max_month_cnt           VARCHAR2(100)
)
;
comment on table PER_OVERDUE_SUMMARY_INFO
  is '���ڣ�͸֧��������Ϣ';
comment on column PER_OVERDUE_SUMMARY_INFO.report_id
  is '������';
comment on column PER_OVERDUE_SUMMARY_INFO.month_cnt
  is '�·���';
comment on column PER_OVERDUE_SUMMARY_INFO.single_month_max_amount
  is '����������ڣ�͸֧���ܶ�';
comment on column PER_OVERDUE_SUMMARY_INFO.account_type
  is '�˻�����';
comment on column PER_OVERDUE_SUMMARY_INFO.acc_sum
  is '�˻���';
comment on column PER_OVERDUE_SUMMARY_INFO.max_month_cnt
  is '����ڣ�͸֧������';

