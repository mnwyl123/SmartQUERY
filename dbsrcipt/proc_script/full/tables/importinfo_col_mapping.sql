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
  is '重要信息提示所需表信息';
comment on column IMPORTINFO_COL_MAPPING.table_name
  is '表名';
comment on column IMPORTINFO_COL_MAPPING.table_comments
  is '表名中文名称';
comment on column IMPORTINFO_COL_MAPPING.column_name
  is '列名';
comment on column IMPORTINFO_COL_MAPPING.comment_name
  is '列名中文名称';

