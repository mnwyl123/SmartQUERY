create table PER_INFORCE
(
  report_id       VARCHAR2(30) not null,
  settle_style    VARCHAR2(100),
  apply_sym_value VARCHAR2(100),
  label_cnt       VARCHAR2(100),
  register_date   VARCHAR2(100),
  cause           VARCHAR2(100),
  apply_sym       VARCHAR2(200),
  goal_sym        VARCHAR2(200),
  result          VARCHAR2(100),
  goal_sym_sum    VARCHAR2(100),
  settle_date     VARCHAR2(100),
  serial          VARCHAR2(100),
  exec_court      VARCHAR2(100)
)
;
comment on table PER_INFORCE
  is 'ǿ��ִ�м�¼��Ϣ��';
comment on column PER_INFORCE.report_id
  is '������';
comment on column PER_INFORCE.settle_style
  is '�᰸��ʽ';
comment on column PER_INFORCE.apply_sym_value
  is '����ִ�б�Ľ��';
comment on column PER_INFORCE.label_cnt
  is '��ע����������';
comment on column PER_INFORCE.register_date
  is '��������';
comment on column PER_INFORCE.cause
  is 'ִ�а���';
comment on column PER_INFORCE.apply_sym
  is '����ִ�б��';
comment on column PER_INFORCE.goal_sym
  is '��ִ�б��';
comment on column PER_INFORCE.result
  is '����״̬';
comment on column PER_INFORCE.goal_sym_sum
  is '��ִ�б�Ľ��';
comment on column PER_INFORCE.settle_date
  is '�᰸����';

