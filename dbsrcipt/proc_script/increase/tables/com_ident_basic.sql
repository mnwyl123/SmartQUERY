create table COM_IDENT_BASIC
(
  report_id      VARCHAR2(30) not null,
  type_ent_ident VARCHAR2(100),
  num_ent_indent VARCHAR2(100)
)
;
comment on table COM_IDENT_BASIC
  is '��ҵ�����Ϣ';
comment on column COM_IDENT_BASIC.report_id
  is '������';
comment on column COM_IDENT_BASIC.type_ent_ident
  is '��ҵ��ݱ�ʶ����';
comment on column COM_IDENT_BASIC.num_ent_indent
  is '��ҵ��ݱ�ʶ����';

