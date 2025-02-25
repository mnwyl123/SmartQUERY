create table COM_VERDICT
(
  report_id     VARCHAR2(30) not null,
  litig_reason  VARCHAR2(100),
  apply_sym     VARCHAR2(200),
  result        VARCHAR2(100),
  settle_style  VARCHAR2(100),
  register_date VARCHAR2(100),
  apply_sym_sum VARCHAR2(100),
  goal_sym_sum  VARCHAR2(100),
  serial        VARCHAR2(100),
  court_name    VARCHAR2(100),
  goal_sym      VARCHAR2(200),
  case_num      VARCHAR2(100)
)
;
comment on table COM_VERDICT
  is 'ǿ��ִ�м�¼��Ϣ��Ԫ';
comment on column COM_VERDICT.report_id
  is '������';
comment on column COM_VERDICT.litig_reason
  is 'ִ�а���';
comment on column COM_VERDICT.apply_sym
  is '����ִ�б��';
comment on column COM_VERDICT.result
  is '����״̬';
comment on column COM_VERDICT.settle_style
  is '�᰸��ʽ';
comment on column COM_VERDICT.register_date
  is '��������';
comment on column COM_VERDICT.apply_sym_sum
  is '����ִ�б�Ľ��';
comment on column COM_VERDICT.goal_sym_sum
  is '��ִ�б�Ľ��';
comment on column COM_VERDICT.serial
  is 'ǿ��ִ�м�¼���';
comment on column COM_VERDICT.court_name
  is 'ִ�з�Ժ����';
comment on column COM_VERDICT.goal_sym
  is '��ִ�б��';
comment on column COM_VERDICT.case_num
  is '����';

