create table ONE_DICTIONARIES
(
  d_num  VARCHAR2(5),
  code   VARCHAR2(10),
  name   VARCHAR2(100),
  d_desc VARCHAR2(300),
  note   VARCHAR2(200)
)
;
comment on table ONE_DICTIONARIES
  is '一代标签字典表';
comment on column ONE_DICTIONARIES.d_num
  is '编号';
comment on column ONE_DICTIONARIES.code
  is '编码';
comment on column ONE_DICTIONARIES.name
  is '名称';
comment on column ONE_DICTIONARIES.d_desc
  is '字典描述';
comment on column ONE_DICTIONARIES.note
  is '备注';

