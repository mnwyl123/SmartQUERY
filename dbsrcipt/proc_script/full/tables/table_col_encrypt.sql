create table TABLE_COL_ENCRYPT
(
  table_name VARCHAR2(50 CHAR),
  col_name   VARCHAR2(50 CHAR)
)
;
comment on table TABLE_COL_ENCRYPT
  is '需要加密的表名和字段名';
comment on column TABLE_COL_ENCRYPT.table_name
  is '需要加密的表名';
comment on column TABLE_COL_ENCRYPT.col_name
  is '需要加密的字段名';
create unique index TABLE_COL_ENCRYPT_INDEX on TABLE_COL_ENCRYPT (TABLE_NAME, COL_NAME);

