create table SYS_INFO
(
  sys_no     VARCHAR2(3),
  sys_status VARCHAR2(3),
  sys_name   VARCHAR2(20)
)
;
comment on table SYS_INFO
  is '系统信息表';
comment on column SYS_INFO.sys_no
  is '系统编号';
comment on column SYS_INFO.sys_status
  is '系统状态(0维护中，1正常)';
comment on column SYS_INFO.sys_name
  is '系统名称';

