create table PER_TEL_PAY
(
  report_id          VARCHAR2(30) not null,
  serial             VARCHAR2(10),
  tel_operators      VARCHAR2(50),
  business_type      VARCHAR2(100),
  business_open_date VARCHAR2(20),
  cur_pay_status     VARCHAR2(20),
  cur_arrear_status  VARCHAR2(20),
  cur_arrear_mon_num VARCHAR2(100),
  account_date       VARCHAR2(20),
  pay_record         VARCHAR2(100)
)
;
comment on table PER_TEL_PAY
  is '���ŽɷѼ�¼';
comment on column PER_TEL_PAY.report_id
  is '������';
comment on column PER_TEL_PAY.serial
  is '���';
comment on column PER_TEL_PAY.tel_operators
  is '������Ӫ��';
comment on column PER_TEL_PAY.business_type
  is 'ҵ������';
comment on column PER_TEL_PAY.business_open_date
  is 'ҵ��ͨ����';
comment on column PER_TEL_PAY.cur_pay_status
  is '��ǰ�ɷ�״̬';
comment on column PER_TEL_PAY.cur_arrear_status
  is '��ǰǷ�ѽ��';
comment on column PER_TEL_PAY.cur_arrear_mon_num
  is '��ǰǷ������';
comment on column PER_TEL_PAY.account_date
  is '��������';
comment on column PER_TEL_PAY.pay_record
  is '���24���½ɷѼ�¼';

