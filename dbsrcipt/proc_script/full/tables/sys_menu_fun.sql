create table SYS_MENU_FUN
(
  fun_group_id VARCHAR2(32),
  fun_id       VARCHAR2(32),
  fun_name     VARCHAR2(50),
  fun_name_en  VARCHAR2(50),
  fun_desc     VARCHAR2(100)
)
;
comment on table SYS_MENU_FUN
  is '菜单功能明细表';
comment on column SYS_MENU_FUN.fun_group_id
  is '功能组编码';
comment on column SYS_MENU_FUN.fun_id
  is '功能编码';
comment on column SYS_MENU_FUN.fun_name
  is '功能名称';
comment on column SYS_MENU_FUN.fun_name_en
  is '功能英文名称';

