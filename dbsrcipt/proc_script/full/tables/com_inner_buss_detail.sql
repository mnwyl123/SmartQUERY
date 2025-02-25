create table COM_INNER_BUSS_DETAIL
(
  report_id     VARCHAR2(30) not null,
  serial_no     VARCHAR2(64),
  credit_org    VARCHAR2(30),
  type          VARCHAR2(30),
  currency      VARCHAR2(10),
  buss_sum      VARCHAR2(15),
  buss_balance  VARCHAR2(15),
  start_date    VARCHAR2(20),
  stop_date     VARCHAR2(20),
  five_type     VARCHAR2(10),
  loan_type     VARCHAR2(100),
  is_guar       VARCHAR2(5),
  extension     VARCHAR2(5),
  his_record    VARCHAR2(100),
  settle_date   VARCHAR2(20),
  settle_style  VARCHAR2(15),
  buss_type     VARCHAR2(5),
  atten_status  VARCHAR2(5),
  settle_status VARCHAR2(5),
  remarks       VARCHAR2(200)
)
;
comment on table COM_INNER_BUSS_DETAIL
  is '����ҵ����ϸ';
comment on column COM_INNER_BUSS_DETAIL.report_id
  is '������';
comment on column COM_INNER_BUSS_DETAIL.serial_no
  is '��ˮ��';
comment on column COM_INNER_BUSS_DETAIL.credit_org
  is '���Ż���';
comment on column COM_INNER_BUSS_DETAIL.type
  is '����';
comment on column COM_INNER_BUSS_DETAIL.currency
  is '����';
comment on column COM_INNER_BUSS_DETAIL.buss_sum
  is '���';
comment on column COM_INNER_BUSS_DETAIL.buss_balance
  is '���';
comment on column COM_INNER_BUSS_DETAIL.start_date
  is '��ʼ����';
comment on column COM_INNER_BUSS_DETAIL.stop_date
  is '��������';
comment on column COM_INNER_BUSS_DETAIL.five_type
  is '�弶����';
comment on column COM_INNER_BUSS_DETAIL.loan_type
  is '������ʽ';
comment on column COM_INNER_BUSS_DETAIL.is_guar
  is '����';
comment on column COM_INNER_BUSS_DETAIL.extension
  is 'չ��/����';
comment on column COM_INNER_BUSS_DETAIL.his_record
  is '��ʷ��¼';
comment on column COM_INNER_BUSS_DETAIL.settle_date
  is '��������';
comment on column COM_INNER_BUSS_DETAIL.settle_style
  is '���巽ʽ';
comment on column COM_INNER_BUSS_DETAIL.buss_type
  is 'ҵ������(01������,02�������,03��ó������)';
comment on column COM_INNER_BUSS_DETAIL.atten_status
  is '��ע״̬(01������,02����ע,03������)';
comment on column COM_INNER_BUSS_DETAIL.settle_status
  is '����״̬(0��δ����,1���ѽ���)';
comment on column COM_INNER_BUSS_DETAIL.remarks
  is '��ע';

