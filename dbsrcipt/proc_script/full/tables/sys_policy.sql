create table SYS_POLICY
(
  role_id      VARCHAR2(32),
  menu_id      VARCHAR2(10),
  fun_group_id VARCHAR2(32),
  fun_id       VARCHAR2(32)
)
;
comment on table SYS_POLICY
  is '角色对应菜单及操作权限表';
comment on column SYS_POLICY.role_id
  is '角色编码';
comment on column SYS_POLICY.menu_id
  is '菜单编码';
comment on column SYS_POLICY.fun_group_id
  is '功能组编码';
comment on column SYS_POLICY.fun_id
  is '功能编码';

