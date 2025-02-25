create table COM_ADVA_PAY_DETAIL
(
  report_id        VARCHAR2(30) not null,
  serial_no        VARCHAR2(64),
  credit_org       VARCHAR2(30),
  currency         VARCHAR2(10),
  adva_pay_sum     VARCHAR2(15),
  adva_pay_balance VARCHAR2(15),
  adva_pay_date    VARCHAR2(20),
  adva_settle_date VARCHAR2(20),
  five_type        VARCHAR2(10),
  orig_buss        VARCHAR2(50),
  settle_status    VARCHAR2(5),
  remarks          VARCHAR2(200)
)
;
comment on table COM_ADVA_PAY_DETAIL
  is '�����ϸ';
comment on column COM_ADVA_PAY_DETAIL.report_id
  is '������';
comment on column COM_ADVA_PAY_DETAIL.serial_no
  is '��ˮ��';
comment on column COM_ADVA_PAY_DETAIL.credit_org
  is '���Ż���';
comment on column COM_ADVA_PAY_DETAIL.currency
  is '����';
comment on column COM_ADVA_PAY_DETAIL.adva_pay_sum
  is '�����';
comment on column COM_ADVA_PAY_DETAIL.adva_pay_balance
  is '������';
comment on column COM_ADVA_PAY_DETAIL.adva_pay_date
  is '�������';
comment on column COM_ADVA_PAY_DETAIL.adva_settle_date
  is '��������';
comment on column COM_ADVA_PAY_DETAIL.five_type
  is '�弶����';
comment on column COM_ADVA_PAY_DETAIL.orig_buss
  is 'ԭҵ��';
comment on column COM_ADVA_PAY_DETAIL.settle_status
  is '����״̬(0��δ����,1���ѽ���)';
comment on column COM_ADVA_PAY_DETAIL.remarks
  is '��ע';

