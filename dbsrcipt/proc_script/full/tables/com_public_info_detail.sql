create table COM_PUBLIC_INFO_DETAIL
(
  report_id        VARCHAR2(30) not null,
  serial_no        VARCHAR2(64),
  static_date      VARCHAR2(15),
  cur_should_pay   VARCHAR2(15),
  cur_actual_pay   VARCHAR2(15),
  pay_status       VARCHAR2(20),
  total_arrear_sum VARCHAR2(15),
  serial           VARCHAR2(100),
  pay_status2      VARCHAR2(20)
)
;
comment on table COM_PUBLIC_INFO_DETAIL
  is '������ҵ�ɷ������Ϣ';
comment on column COM_PUBLIC_INFO_DETAIL.report_id
  is '������';
comment on column COM_PUBLIC_INFO_DETAIL.serial_no
  is '��ˮ��';
comment on column COM_PUBLIC_INFO_DETAIL.static_date
  is 'ͳ������';
comment on column COM_PUBLIC_INFO_DETAIL.cur_should_pay
  is '����Ӧ�ɽ��';
comment on column COM_PUBLIC_INFO_DETAIL.cur_actual_pay
  is '����ʵ�ɽ��';
comment on column COM_PUBLIC_INFO_DETAIL.pay_status
  is '�ɷ�״̬';
comment on column COM_PUBLIC_INFO_DETAIL.total_arrear_sum
  is '�ۼ�Ƿ�ѽ��';
comment on column COM_PUBLIC_INFO_DETAIL.serial
  is '���';

