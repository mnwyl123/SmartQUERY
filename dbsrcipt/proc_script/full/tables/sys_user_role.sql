create table SYS_USER_ROLE
(
  user_id VARCHAR2(32),
  role_id VARCHAR2(32)
)
;
comment on table SYS_USER_ROLE
  is '�û���Ӧ������';
comment on column SYS_USER_ROLE.user_id
  is '�û�ID';
comment on column SYS_USER_ROLE.role_id
  is '��ɫID';

