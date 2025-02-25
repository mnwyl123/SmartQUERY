create table COM_SECUR_PAY_RECORD
(
  report_id        VARCHAR2(30) not null,
  serial_no        VARCHAR2(64),
  secur_type       VARCHAR2(10),
  insure_date      VARCHAR2(20),
  statistic_date   VARCHAR2(10),
  base_pay         VARCHAR2(15),
  pay_status       VARCHAR2(15),
  total_arrear_sum VARCHAR2(15)
)
;
comment on table COM_SECUR_PAY_RECORD
  is '�籣�ɷѼ�¼';
comment on column COM_SECUR_PAY_RECORD.report_id
  is '������';
comment on column COM_SECUR_PAY_RECORD.serial_no
  is '��ˮ��';
comment on column COM_SECUR_PAY_RECORD.secur_type
  is '�������';
comment on column COM_SECUR_PAY_RECORD.insure_date
  is '�α�����';
comment on column COM_SECUR_PAY_RECORD.statistic_date
  is '�ɷѻ���';
comment on column COM_SECUR_PAY_RECORD.base_pay
  is '�ɷѻ���';
comment on column COM_SECUR_PAY_RECORD.pay_status
  is '�ɷ�״̬';
comment on column COM_SECUR_PAY_RECORD.total_arrear_sum
  is '�ۼ�Ƿ�ѽ��';

