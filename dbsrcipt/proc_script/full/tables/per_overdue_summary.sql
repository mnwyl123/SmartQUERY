create table PER_OVERDUE_SUMMARY
(
  report_id      VARCHAR2(30) not null,
  serial         VARCHAR2(10),
  serial_number  VARCHAR2(64),
  cart_type      VARCHAR2(10),
  over_month     VARCHAR2(20),
  over_month_num VARCHAR2(20),
  over_sum       VARCHAR2(20)
)
;
comment on table PER_OVERDUE_SUMMARY
  is '����/���ǿ�/׼���ǿ����ڼ�¼';
comment on column PER_OVERDUE_SUMMARY.report_id
  is '������';
comment on column PER_OVERDUE_SUMMARY.serial
  is '���';
comment on column PER_OVERDUE_SUMMARY.serial_number
  is '��ˮ��';
comment on column PER_OVERDUE_SUMMARY.cart_type
  is '������(0:���1:���ǿ���2:׼���ǿ�)';
comment on column PER_OVERDUE_SUMMARY.over_month
  is '����/͸֧�·�';
comment on column PER_OVERDUE_SUMMARY.over_month_num
  is '����/͸֧��������';
comment on column PER_OVERDUE_SUMMARY.over_sum
  is '����/͸֧���';

