create table COM_IDENT_BASIC
(
  report_id      VARCHAR2(30) not null,
  type_ent_ident VARCHAR2(100),
  num_ent_indent VARCHAR2(100)
)
;
comment on table COM_IDENT_BASIC
  is '企业身份信息';
comment on column COM_IDENT_BASIC.report_id
  is '报告编号';
comment on column COM_IDENT_BASIC.type_ent_ident
  is '企业身份标识类型';
comment on column COM_IDENT_BASIC.num_ent_indent
  is '企业身份标识号码';

