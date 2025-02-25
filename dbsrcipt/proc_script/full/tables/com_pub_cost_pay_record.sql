create table COM_PUB_COST_PAY_RECORD
(
  report_id             VARCHAR2(30) not null,
  serial_no             VARCHAR2(64),
  pub_com_name          VARCHAR2(200),
  info_type             VARCHAR2(20),
  static_date           VARCHAR2(15),
  pay_status            VARCHAR2(20),
  last_pay_date         VARCHAR2(20),
  total_arrear_sum      VARCHAR2(20),
  max_arrear_occur_date VARCHAR2(20),
  max_arrear_sum        VARCHAR2(20),
  type_business         VARCHAR2(100),
  serial                VARCHAR2(100),
  pub_pay_id            VARCHAR2(100),
  pay_recod_num_pub     VARCHAR2(100),
  pay_status2           VARCHAR2(20)
)
;
comment on table COM_PUB_COST_PAY_RECORD
  is '������ҵ�ɷ���Ϣ��ϸ��Ԫ';
comment on column COM_PUB_COST_PAY_RECORD.report_id
  is '������';
comment on column COM_PUB_COST_PAY_RECORD.serial_no
  is '��ˮ��';
comment on column COM_PUB_COST_PAY_RECORD.pub_com_name
  is '������ҵ��λ����';
comment on column COM_PUB_COST_PAY_RECORD.info_type
  is '��Ϣ����';
comment on column COM_PUB_COST_PAY_RECORD.static_date
  is 'ͳ������';
comment on column COM_PUB_COST_PAY_RECORD.pay_status
  is '�ɷ�״̬';
comment on column COM_PUB_COST_PAY_RECORD.last_pay_date
  is '���һ�νɷ�����';
comment on column COM_PUB_COST_PAY_RECORD.total_arrear_sum
  is '�ۼ�Ƿ�ѽ��';
comment on column COM_PUB_COST_PAY_RECORD.max_arrear_occur_date
  is '���Ƿ�ѷ�������';
comment on column COM_PUB_COST_PAY_RECORD.max_arrear_sum
  is '���Ƿ�ѽ��';
comment on column COM_PUB_COST_PAY_RECORD.type_business
  is 'ҵ������';
comment on column COM_PUB_COST_PAY_RECORD.serial
  is '���';
comment on column COM_PUB_COST_PAY_RECORD.pub_pay_id
  is '������ҵ�ɷ��˻����';
comment on column COM_PUB_COST_PAY_RECORD.pay_recod_num_pub
  is '�ɷѼ�¼����';
comment on column COM_PUB_COST_PAY_RECORD.pay_status2
  is '�ɷ�״̬2';

