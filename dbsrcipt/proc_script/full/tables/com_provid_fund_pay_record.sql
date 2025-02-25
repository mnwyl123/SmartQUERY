create table COM_PROVID_FUND_PAY_RECORD
(
  report_id            VARCHAR2(30) not null,
  serial_no            VARCHAR2(64),
  statistic_date       VARCHAR2(10),
  first_pay_date       VARCHAR2(10),
  employ_num           VARCHAR2(10),
  base_pay             VARCHAR2(15),
  last_pay_date        VARCHAR2(20),
  pay_to_date          VARCHAR2(10),
  pay_status           VARCHAR2(15),
  total_arrear_sum     VARCHAR2(15),
  date_pay_recent      VARCHAR2(100),
  pay_recod_num_provid VARCHAR2(100),
  static_date          VARCHAR2(100),
  serial               VARCHAR2(100),
  num_pep              VARCHAR2(100),
  ser_no               VARCHAR2(100),
  pay_status2          VARCHAR2(15)
)
;
comment on table COM_PROVID_FUND_PAY_RECORD
  is 'ס��������ɷѼ�¼��Ϣ��Ԫ';
comment on column COM_PROVID_FUND_PAY_RECORD.report_id
  is '������';
comment on column COM_PROVID_FUND_PAY_RECORD.serial_no
  is '��ˮ��';
comment on column COM_PROVID_FUND_PAY_RECORD.statistic_date
  is '�������';
comment on column COM_PROVID_FUND_PAY_RECORD.first_pay_date
  is '��������';
comment on column COM_PROVID_FUND_PAY_RECORD.employ_num
  is '�ɷѻ���';
comment on column COM_PROVID_FUND_PAY_RECORD.base_pay
  is '�ɷѻ���';
comment on column COM_PROVID_FUND_PAY_RECORD.last_pay_date
  is '�ɷ�״̬';
comment on column COM_PROVID_FUND_PAY_RECORD.pay_to_date
  is '��������';
comment on column COM_PROVID_FUND_PAY_RECORD.pay_status
  is '�ɷ�״̬';
comment on column COM_PROVID_FUND_PAY_RECORD.total_arrear_sum
  is '�ۼ�Ƿ�ѽ��';
comment on column COM_PROVID_FUND_PAY_RECORD.date_pay_recent
  is '���һ�νɷ�����';
comment on column COM_PROVID_FUND_PAY_RECORD.pay_recod_num_provid
  is '�ɷѼ�¼����';
comment on column COM_PROVID_FUND_PAY_RECORD.static_date
  is 'ͳ������';
comment on column COM_PROVID_FUND_PAY_RECORD.serial
  is '���';
comment on column COM_PROVID_FUND_PAY_RECORD.num_pep
  is 'ְ������';
comment on column COM_PROVID_FUND_PAY_RECORD.ser_no
  is '�˻����';
comment on column COM_PROVID_FUND_PAY_RECORD.pay_status2
  is '�ɷ�״̬2';

