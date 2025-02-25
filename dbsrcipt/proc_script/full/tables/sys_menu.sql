create table SYS_MENU
(
  menu_id       INTEGER,
  menu_name     VARCHAR2(50),
  menu_name_en  VARCHAR2(50),
  menu_url      VARCHAR2(100),
  parent_id     VARCHAR2(32),
  order_by      VARCHAR2(5),
  menu_icon     VARCHAR2(50),
  menu_type     VARCHAR2(50),
  menu_state    INTEGER,
  menu_group_id VARCHAR2(32),
  tran_code     VARCHAR2(10),
  sys_ind       VARCHAR2(10),
  company       VARCHAR2(10),
  menu_channel  VARCHAR2(10)
)
;
comment on table SYS_MENU
  is '菜单表';
comment on column SYS_MENU.menu_id
  is '菜单编码';
comment on column SYS_MENU.menu_name
  is '菜单名称';
comment on column SYS_MENU.menu_url
  is '菜单地址';
comment on column SYS_MENU.parent_id
  is '上级菜单';
comment on column SYS_MENU.order_by
  is '菜单排序';
comment on column SYS_MENU.menu_icon
  is '菜单图片';
comment on column SYS_MENU.menu_type
  is '菜单类型';
comment on column SYS_MENU.menu_state
  is '菜单状态';
comment on column SYS_MENU.menu_group_id
  is '菜单组';
comment on column SYS_MENU.tran_code
  is '交易码';
comment on column SYS_MENU.sys_ind
  is '所属系统';
comment on column SYS_MENU.company
  is '法人机构代码';
comment on column SYS_MENU.menu_channel
  is '菜单渠道 PC ,MOBILE等';

