create table REPORT_CHECK_TIME
(
  user_id          VARCHAR2(64),
  username_perbank VARCHAR2(64),
  flow_id          VARCHAR2(64),
  check_time       DATE
)
;
comment on table REPORT_CHECK_TIME
  is '��¼�����Ϣ';
comment on column REPORT_CHECK_TIME.user_id
  is '����û�id';
comment on column REPORT_CHECK_TIME.username_perbank
  is '����û���Ӧ�������û�';
comment on column REPORT_CHECK_TIME.flow_id
  is '����id';
comment on column REPORT_CHECK_TIME.check_time
  is '���ʱ��';

