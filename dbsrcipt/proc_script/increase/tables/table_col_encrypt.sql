create table TABLE_COL_ENCRYPT
(
  table_name VARCHAR2(50 CHAR),
  col_name   VARCHAR2(50 CHAR)
)
;
comment on table TABLE_COL_ENCRYPT
  is '��Ҫ���ܵı������ֶ���';
comment on column TABLE_COL_ENCRYPT.table_name
  is '��Ҫ���ܵı���';
comment on column TABLE_COL_ENCRYPT.col_name
  is '��Ҫ���ܵ��ֶ���';
create unique index TABLE_COL_ENCRYPT_INDEX on TABLE_COL_ENCRYPT (TABLE_NAME, COL_NAME);

