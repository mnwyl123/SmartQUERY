create table IMPORTINFO_COL_MAPPING
(
  xml_tag        VARCHAR2(10),
  table_name     VARCHAR2(50),
  table_comments VARCHAR2(100),
  column_name    VARCHAR2(50),
  comment_name   VARCHAR2(300)
)
;
comment on table IMPORTINFO_COL_MAPPING
  is '��Ҫ��Ϣ��ʾ�������Ϣ';
comment on column IMPORTINFO_COL_MAPPING.table_name
  is '����';
comment on column IMPORTINFO_COL_MAPPING.table_comments
  is '������������';
comment on column IMPORTINFO_COL_MAPPING.column_name
  is '����';
comment on column IMPORTINFO_COL_MAPPING.comment_name
  is '������������';

