create table PER_AFTER_PAY_OWE_INFO
(
  report_id    VARCHAR2(30) not null,
  arre_acc_num VARCHAR2(100),
  buss_type    VARCHAR2(100),
  arre_sum     VARCHAR2(100)
)
;
comment on table PER_AFTER_PAY_OWE_INFO
  is '�󸶷�ҵ��Ƿ����Ϣ';
comment on column PER_AFTER_PAY_OWE_INFO.report_id
  is '������';
comment on column PER_AFTER_PAY_OWE_INFO.arre_acc_num
  is 'Ƿ���˻���';
comment on column PER_AFTER_PAY_OWE_INFO.buss_type
  is '�󸶷�ҵ������';
comment on column PER_AFTER_PAY_OWE_INFO.arre_sum
  is 'Ƿ�ѽ��';

