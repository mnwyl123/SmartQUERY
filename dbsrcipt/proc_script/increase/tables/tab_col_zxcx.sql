create table TAB_COL_ZXCX
(
  table_name      VARCHAR2(100),
  table_comments  VARCHAR2(500),
  column_name     VARCHAR2(100),
  column_comments VARCHAR2(500)
)
;
comment on table TAB_COL_ZXCX
  is '一代征信表结构';
comment on column TAB_COL_ZXCX.table_name
  is '表名';
comment on column TAB_COL_ZXCX.table_comments
  is '表注释';
comment on column TAB_COL_ZXCX.column_name
  is '字段名';
comment on column TAB_COL_ZXCX.column_comments
  is '字段注释';

