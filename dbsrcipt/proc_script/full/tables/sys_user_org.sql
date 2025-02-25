create table SYS_USER_ORG
(
  user_id VARCHAR2(32),
  org_id  VARCHAR2(32)
)
;
comment on table SYS_USER_ORG
  is '用户对应机构表';
comment on column SYS_USER_ORG.user_id
  is '用户ID';
comment on column SYS_USER_ORG.org_id
  is '机构ID';
create index USER_ORG_ID on SYS_USER_ORG (ORG_ID, USER_ID);

