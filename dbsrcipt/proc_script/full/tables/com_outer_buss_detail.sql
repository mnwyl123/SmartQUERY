create table COM_OUTER_BUSS_DETAIL
(
  report_id      VARCHAR2(30) not null,
  serial_no      VARCHAR2(64),
  credit_org     VARCHAR2(100),
  type           VARCHAR2(10),
  currency       VARCHAR2(10),
  buss_sum       VARCHAR2(15),
  buss_balance   VARCHAR2(15),
  start_date     VARCHAR2(20),
  stop_date      VARCHAR2(20),
  five_type      VARCHAR2(10),
  is_guar        VARCHAR2(5),
  is_adva        VARCHAR2(5),
  margin_percent VARCHAR2(10),
  his_record     VARCHAR2(100),
  buss_type      VARCHAR2(5),
  atten_status   VARCHAR2(5),
  settle_status  VARCHAR2(5),
  remarks        VARCHAR2(200),
  acc_num        VARCHAR2(10),
  settle_date    VARCHAR2(20)
)
;
comment on table COM_OUTER_BUSS_DETAIL
  is '����ҵ����ϸ';
comment on column COM_OUTER_BUSS_DETAIL.report_id
  is '������';
comment on column COM_OUTER_BUSS_DETAIL.serial_no
  is '��ˮ��';
comment on column COM_OUTER_BUSS_DETAIL.credit_org
  is '���Ż���';
comment on column COM_OUTER_BUSS_DETAIL.type
  is '����';
comment on column COM_OUTER_BUSS_DETAIL.currency
  is '����';
comment on column COM_OUTER_BUSS_DETAIL.buss_sum
  is '���';
comment on column COM_OUTER_BUSS_DETAIL.buss_balance
  is '���';
comment on column COM_OUTER_BUSS_DETAIL.start_date
  is '��ʼ����';
comment on column COM_OUTER_BUSS_DETAIL.stop_date
  is '��������';
comment on column COM_OUTER_BUSS_DETAIL.five_type
  is '�弶����';
comment on column COM_OUTER_BUSS_DETAIL.is_guar
  is '����';
comment on column COM_OUTER_BUSS_DETAIL.is_adva
  is '���';
comment on column COM_OUTER_BUSS_DETAIL.margin_percent
  is '��֤�����';
comment on column COM_OUTER_BUSS_DETAIL.his_record
  is '��ʷ��¼';
comment on column COM_OUTER_BUSS_DETAIL.buss_type
  is 'ҵ������(04������,05��Ʊ������,06������,07������֤,08������)';
comment on column COM_OUTER_BUSS_DETAIL.atten_status
  is '��ע״̬(01������,02����ע,03������)';
comment on column COM_OUTER_BUSS_DETAIL.settle_status
  is '����״̬(0��δ����,1���ѽ���)';
comment on column COM_OUTER_BUSS_DETAIL.remarks
  is '��ע';
comment on column COM_OUTER_BUSS_DETAIL.acc_num
  is '����';
comment on column COM_OUTER_BUSS_DETAIL.settle_date
  is '��������';

