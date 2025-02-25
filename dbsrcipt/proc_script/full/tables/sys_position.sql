create table SYS_POSITION
(
  positi_id      VARCHAR2(32),
  positi_name    VARCHAR2(50),
  positi_name_en VARCHAR2(50),
  positi_desc    VARCHAR2(50)
)
;
comment on table SYS_POSITION
  is '用户职位表';
comment on column SYS_POSITION.positi_id
  is '职位编码';
comment on column SYS_POSITION.positi_name
  is '职位名称';
comment on column SYS_POSITION.positi_desc
  is '职位名称描述';

