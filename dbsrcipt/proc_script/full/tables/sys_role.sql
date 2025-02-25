create table SYS_ROLE
(
  role_id      VARCHAR2(32),
  role_name    VARCHAR2(50),
  role_name_en VARCHAR2(50),
  role_desc    VARCHAR2(100),
  company      VARCHAR2(32),
  isvalid      VARCHAR2(30)
)
;
comment on table SYS_ROLE
  is '角色定义表';
comment on column SYS_ROLE.role_id
  is '角色编码';
comment on column SYS_ROLE.role_name
  is '角色名称';
comment on column SYS_ROLE.role_desc
  is '角色描述';
comment on column SYS_ROLE.company
  is '法人代码';
comment on column SYS_ROLE.isvalid
  is '是否有效';

