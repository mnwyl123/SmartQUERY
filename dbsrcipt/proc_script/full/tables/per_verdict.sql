create table PER_VERDICT
(
  report_id       VARCHAR2(30) not null,
  serial          VARCHAR2(10),
  type            VARCHAR2(10),
  court_name      VARCHAR2(100),
  cause           VARCHAR2(200),
  register_date   VARCHAR2(20),
  settle_style    VARCHAR2(50),
  result          VARCHAR2(200),
  settle_date     VARCHAR2(20),
  apply_sym       VARCHAR2(50),
  apply_sym_value VARCHAR2(20),
  goal_sym        VARCHAR2(200),
  goal_sym_sum    VARCHAR2(20),
  label_cnt       VARCHAR2(100),
  settle_style2   VARCHAR2(50),
  settle_style3   VARCHAR2(50)
)
;
comment on table PER_VERDICT
  is '�����о���Ϣ��';
comment on column PER_VERDICT.report_id
  is '������';
comment on column PER_VERDICT.serial
  is '���';
comment on column PER_VERDICT.type
  is '����(0:�����о���1:ǿ��ִ��)';
comment on column PER_VERDICT.court_name
  is '������Ժ';
comment on column PER_VERDICT.cause
  is '����';
comment on column PER_VERDICT.register_date
  is '��������';
comment on column PER_VERDICT.settle_style
  is '�᰸��ʽ';
comment on column PER_VERDICT.result
  is '�о�/������';
comment on column PER_VERDICT.settle_date
  is '�о�/������Ч����';
comment on column PER_VERDICT.apply_sym
  is '����ִ�б��';
comment on column PER_VERDICT.apply_sym_value
  is '����ִ�б�ļ�ֵ';
comment on column PER_VERDICT.goal_sym
  is '���ϱ��';
comment on column PER_VERDICT.goal_sym_sum
  is '���ϱ�Ľ��';
comment on column PER_VERDICT.label_cnt
  is '��ע����������';
comment on column PER_VERDICT.settle_style2
  is '�᰸��ʽ2';

