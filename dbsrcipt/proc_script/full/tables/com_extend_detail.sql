create table COM_EXTEND_DETAIL
(
  report_id         VARCHAR2(30) not null,
  serial_no         VARCHAR2(64),
  extend_start_date VARCHAR2(20),
  extend_end_date   VARCHAR2(20),
  extend_sum        VARCHAR2(15)
)
;
comment on table COM_EXTEND_DETAIL
  is 'չ����ϸ';
comment on column COM_EXTEND_DETAIL.report_id
  is '������';
comment on column COM_EXTEND_DETAIL.serial_no
  is '��ˮ��';
comment on column COM_EXTEND_DETAIL.extend_start_date
  is 'չ����ʼ����';
comment on column COM_EXTEND_DETAIL.extend_end_date
  is 'չ�ڵ�������';
comment on column COM_EXTEND_DETAIL.extend_sum
  is 'չ�ڽ��';

