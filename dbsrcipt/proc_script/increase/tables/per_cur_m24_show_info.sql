create table PER_CUR_M24_SHOW_INFO
(
  report_id    VARCHAR2(30) not null,
  serial       VARCHAR2(100),
  repay_status VARCHAR2(100),
  p_month      VARCHAR2(100)
)
;
comment on table PER_CUR_M24_SHOW_INFO
  is '��� 24 ���»���״̬��Ϣ';
comment on column PER_CUR_M24_SHOW_INFO.report_id
  is '������';
comment on column PER_CUR_M24_SHOW_INFO.serial
  is '�˻����';
comment on column PER_CUR_M24_SHOW_INFO.repay_status
  is '����״̬';
comment on column PER_CUR_M24_SHOW_INFO.p_month
  is '�·�';

