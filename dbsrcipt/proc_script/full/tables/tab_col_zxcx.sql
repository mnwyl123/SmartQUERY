create table TAB_COL_ZXCX
(
  table_name      VARCHAR2(100),
  table_comments  VARCHAR2(500),
  column_name     VARCHAR2(100),
  column_comments VARCHAR2(500)
)
;
comment on table TAB_COL_ZXCX
  is 'һ�����ű�ṹ';
comment on column TAB_COL_ZXCX.table_name
  is '����';
comment on column TAB_COL_ZXCX.table_comments
  is '��ע��';
comment on column TAB_COL_ZXCX.column_name
  is '�ֶ���';
comment on column TAB_COL_ZXCX.column_comments
  is '�ֶ�ע��';

