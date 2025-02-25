create table SYS_DICTIONARIES
(
  dictionaries_id VARCHAR2(32),
  name            VARCHAR2(50),
  name_en         VARCHAR2(50),
  dict_code       VARCHAR2(32),
  order_by        INTEGER,
  parent_id       VARCHAR2(32),
  bz              VARCHAR2(100),
  tbsname         VARCHAR2(50)
)
;
comment on table SYS_DICTIONARIES
  is '字典表';
comment on column SYS_DICTIONARIES.dictionaries_id
  is '字典编码';
comment on column SYS_DICTIONARIES.name
  is '名称';
comment on column SYS_DICTIONARIES.name_en
  is '英文';
comment on column SYS_DICTIONARIES.dict_code
  is '编码';
comment on column SYS_DICTIONARIES.order_by
  is '排序';
comment on column SYS_DICTIONARIES.parent_id
  is '上级ID';
comment on column SYS_DICTIONARIES.bz
  is '备注';
comment on column SYS_DICTIONARIES.tbsname
  is '排查表';

