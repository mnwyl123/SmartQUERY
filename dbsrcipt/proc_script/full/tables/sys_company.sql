create table SYS_COMPANY
(
  comp_code  VARCHAR2(10) not null,
  comp_short VARCHAR2(20),
  comp_name  VARCHAR2(50),
  user_code  VARCHAR2(20),
  logo_path  VARCHAR2(100)
)
;
comment on table SYS_COMPANY
  is '法人机构表';
comment on column SYS_COMPANY.comp_code
  is '法人代码';
comment on column SYS_COMPANY.comp_short
  is '法人简称';
comment on column SYS_COMPANY.comp_name
  is '法人名称';
comment on column SYS_COMPANY.user_code
  is '法人管理员';
comment on column SYS_COMPANY.logo_path
  is '法人logo';
alter table SYS_COMPANY
  add primary key (COMP_CODE);

