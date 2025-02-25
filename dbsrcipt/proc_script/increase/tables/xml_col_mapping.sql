create table XML_COL_MAPPING
(
  table_name   VARCHAR2(50),
  column_name  VARCHAR2(50),
  comment_name VARCHAR2(300),
  xml_tag      VARCHAR2(8),
  is_new_tab   VARCHAR2(3),
  is_new_col   VARCHAR2(3)
)
;
comment on table XML_COL_MAPPING
  is '����';
comment on column XML_COL_MAPPING.table_name
  is '����';
comment on column XML_COL_MAPPING.column_name
  is '����';
comment on column XML_COL_MAPPING.comment_name
  is '��������';
comment on column XML_COL_MAPPING.xml_tag
  is '���з��ص�xml��Ӧ�ı�ǩ����';
comment on column XML_COL_MAPPING.is_new_tab
  is '�Ƿ��±�';
comment on column XML_COL_MAPPING.is_new_col
  is '�Ƿ����ֶ�';
create unique index UK_XML_COL on XML_COL_MAPPING (TABLE_NAME, COLUMN_NAME, XML_TAG);

