create table COM_PROVID_PAY_RECORD_YEAR
(
  report_id        VARCHAR2(30) not null,
  last_pay_date    VARCHAR2(100),
  static_date      VARCHAR2(100),
  cur_should_pay   VARCHAR2(100),
  total_arrear_sum VARCHAR2(100),
  serial           VARCHAR2(100),
  cur_actual_pay   VARCHAR2(100)
)
;
comment on table COM_PROVID_PAY_RECORD_YEAR
  is 'ס��������ɷ������Ϣ';
comment on column COM_PROVID_PAY_RECORD_YEAR.report_id
  is '������';
comment on column COM_PROVID_PAY_RECORD_YEAR.last_pay_date
  is '�ɷ�״̬';
comment on column COM_PROVID_PAY_RECORD_YEAR.static_date
  is 'ͳ������';
comment on column COM_PROVID_PAY_RECORD_YEAR.cur_should_pay
  is '����Ӧ�ɽ��';
comment on column COM_PROVID_PAY_RECORD_YEAR.total_arrear_sum
  is '�ۼ�Ƿ�ѽ��';
comment on column COM_PROVID_PAY_RECORD_YEAR.serial
  is '���';
comment on column COM_PROVID_PAY_RECORD_YEAR.cur_actual_pay
  is '����ʵ�ɽ��';

