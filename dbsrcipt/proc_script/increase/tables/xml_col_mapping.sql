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
  is '表名';
comment on column XML_COL_MAPPING.table_name
  is '表名';
comment on column XML_COL_MAPPING.column_name
  is '列名';
comment on column XML_COL_MAPPING.comment_name
  is '中文名称';
comment on column XML_COL_MAPPING.xml_tag
  is '人行返回的xml对应的标签名称';
comment on column XML_COL_MAPPING.is_new_tab
  is '是否新表';
comment on column XML_COL_MAPPING.is_new_col
  is '是否新字段';
create unique index UK_XML_COL on XML_COL_MAPPING (TABLE_NAME, COLUMN_NAME, XML_TAG);

