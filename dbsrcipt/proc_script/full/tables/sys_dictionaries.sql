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
  is '�ֵ��';
comment on column SYS_DICTIONARIES.dictionaries_id
  is '�ֵ����';
comment on column SYS_DICTIONARIES.name
  is '����';
comment on column SYS_DICTIONARIES.name_en
  is 'Ӣ��';
comment on column SYS_DICTIONARIES.dict_code
  is '����';
comment on column SYS_DICTIONARIES.order_by
  is '����';
comment on column SYS_DICTIONARIES.parent_id
  is '�ϼ�ID';
comment on column SYS_DICTIONARIES.bz
  is '��ע';
comment on column SYS_DICTIONARIES.tbsname
  is '�Ų��';

