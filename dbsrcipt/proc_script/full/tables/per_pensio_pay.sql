create table PER_PENSIO_PAY
(
  report_id       VARCHAR2(30) not null,
  serial          VARCHAR2(10),
  insured_place   VARCHAR2(50),
  insured_date    VARCHAR2(20),
  pay_mon_sum     VARCHAR2(20),
  start_work_mon  VARCHAR2(20),
  pay_status      VARCHAR2(20),
  per_pay_base    VARCHAR2(10),
  pay_amout_mon   VARCHAR2(10),
  update_time     VARCHAR2(10),
  pay_com_name    VARCHAR2(200),
  sopt_pay_reason VARCHAR2(100)
)
;
comment on table PER_PENSIO_PAY
  is '���Ͻɷѱ�';
comment on column PER_PENSIO_PAY.report_id
  is '������';
comment on column PER_PENSIO_PAY.serial
  is '���';
comment on column PER_PENSIO_PAY.insured_place
  is '�α���';
comment on column PER_PENSIO_PAY.insured_date
  is '�α�����';
comment on column PER_PENSIO_PAY.pay_mon_sum
  is '�ۼƽɷ�����';
comment on column PER_PENSIO_PAY.start_work_mon
  is '�μӹ����·�';
comment on column PER_PENSIO_PAY.pay_status
  is '�ɷ�״̬';
comment on column PER_PENSIO_PAY.per_pay_base
  is '���˽ɷѻ���';
comment on column PER_PENSIO_PAY.pay_amout_mon
  is '���½ɷѽ��';
comment on column PER_PENSIO_PAY.update_time
  is '��Ϣ��������';
comment on column PER_PENSIO_PAY.pay_com_name
  is '�ɷѵ�λ';
comment on column PER_PENSIO_PAY.sopt_pay_reason
  is '�жϻ���ֹ�ɷ�ԭ��';

