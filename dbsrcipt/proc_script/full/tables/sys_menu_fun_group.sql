create table SYS_MENU_FUN_GROUP
(
  fun_group_id      VARCHAR2(32),
  fun_group_name    VARCHAR2(50),
  fun_group_name_en VARCHAR2(50),
  fun_group_desc    VARCHAR2(100)
)
;
comment on table SYS_MENU_FUN_GROUP
  is '�˵��������';
comment on column SYS_MENU_FUN_GROUP.fun_group_id
  is '���������';
comment on column SYS_MENU_FUN_GROUP.fun_group_desc
  is '����������';

