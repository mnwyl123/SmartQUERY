create table SYS_USER_ORG
(
  user_id VARCHAR2(32),
  org_id  VARCHAR2(32)
)
;
comment on table SYS_USER_ORG
  is '�û���Ӧ������';
comment on column SYS_USER_ORG.user_id
  is '�û�ID';
comment on column SYS_USER_ORG.org_id
  is '����ID';
create index USER_ORG_ID on SYS_USER_ORG (ORG_ID, USER_ID);

