create table SYS_USER_ROLE
(
  user_id VARCHAR2(32),
  role_id VARCHAR2(32)
)
;
comment on table SYS_USER_ROLE
  is '用户对应机构表';
comment on column SYS_USER_ROLE.user_id
  is '用户ID';
comment on column SYS_USER_ROLE.role_id
  is '角色ID';

