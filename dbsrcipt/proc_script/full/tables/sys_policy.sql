create table SYS_POLICY
(
  role_id      VARCHAR2(32),
  menu_id      VARCHAR2(10),
  fun_group_id VARCHAR2(32),
  fun_id       VARCHAR2(32)
)
;
comment on table SYS_POLICY
  is '��ɫ��Ӧ�˵�������Ȩ�ޱ�';
comment on column SYS_POLICY.role_id
  is '��ɫ����';
comment on column SYS_POLICY.menu_id
  is '�˵�����';
comment on column SYS_POLICY.fun_group_id
  is '���������';
comment on column SYS_POLICY.fun_id
  is '���ܱ���';

