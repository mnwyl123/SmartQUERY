create table SYS_MENU_FUN
(
  fun_group_id VARCHAR2(32),
  fun_id       VARCHAR2(32),
  fun_name     VARCHAR2(50),
  fun_name_en  VARCHAR2(50),
  fun_desc     VARCHAR2(100)
)
;
comment on table SYS_MENU_FUN
  is '�˵�������ϸ��';
comment on column SYS_MENU_FUN.fun_group_id
  is '���������';
comment on column SYS_MENU_FUN.fun_id
  is '���ܱ���';
comment on column SYS_MENU_FUN.fun_name
  is '��������';
comment on column SYS_MENU_FUN.fun_name_en
  is '����Ӣ������';

