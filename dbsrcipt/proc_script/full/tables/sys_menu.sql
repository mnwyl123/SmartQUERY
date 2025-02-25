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
  is '�˵���';
comment on column SYS_MENU.menu_id
  is '�˵�����';
comment on column SYS_MENU.menu_name
  is '�˵�����';
comment on column SYS_MENU.menu_url
  is '�˵���ַ';
comment on column SYS_MENU.parent_id
  is '�ϼ��˵�';
comment on column SYS_MENU.order_by
  is '�˵�����';
comment on column SYS_MENU.menu_icon
  is '�˵�ͼƬ';
comment on column SYS_MENU.menu_type
  is '�˵�����';
comment on column SYS_MENU.menu_state
  is '�˵�״̬';
comment on column SYS_MENU.menu_group_id
  is '�˵���';
comment on column SYS_MENU.tran_code
  is '������';
comment on column SYS_MENU.sys_ind
  is '����ϵͳ';
comment on column SYS_MENU.company
  is '���˻�������';
comment on column SYS_MENU.menu_channel
  is '�˵����� PC ,MOBILE��';

