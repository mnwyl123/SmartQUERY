create table COM_DECL_INFO
(
  report_id VARCHAR2(30) not null,
  contents  VARCHAR2(500),
  decl_obj  VARCHAR2(100),
  add_date  VARCHAR2(20)
)
;
comment on table COM_DECL_INFO
  is '������Ϣ';
comment on column COM_DECL_INFO.report_id
  is '������';
comment on column COM_DECL_INFO.contents
  is '����';
comment on column COM_DECL_INFO.decl_obj
  is '��������';
comment on column COM_DECL_INFO.add_date
  is '�������';

