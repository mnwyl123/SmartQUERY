create table PER_CUR_Y5_SHOW_INFO
(
  report_id     VARCHAR2(30) not null,
  serial        VARCHAR2(100),
  repay_status  VARCHAR2(100),
  p_month       VARCHAR2(100),
  overdraft_sum VARCHAR2(100)
)
;
comment on table PER_CUR_Y5_SHOW_INFO
  is '��� 5 ���ڵ���ʷ����';
comment on column PER_CUR_Y5_SHOW_INFO.report_id
  is '������';
comment on column PER_CUR_Y5_SHOW_INFO.serial
  is '�˻����';
comment on column PER_CUR_Y5_SHOW_INFO.repay_status
  is '����״̬';
comment on column PER_CUR_Y5_SHOW_INFO.p_month
  is '�·�';
comment on column PER_CUR_Y5_SHOW_INFO.overdraft_sum
  is '���ڣ�͸֧�� �ܶ�';

