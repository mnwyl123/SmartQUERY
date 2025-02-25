create table ONE_DICTNAME
(
  id             VARCHAR2(100),
  table_name     VARCHAR2(100),
  table_comment  VARCHAR2(100),
  column_name    VARCHAR2(100),
  column_comment VARCHAR2(1000),
  is_one         VARCHAR2(1),
  wheresql       VARCHAR2(500)
)
;
comment on table ONE_DICTNAME
  is '一代字典列';
comment on column ONE_DICTNAME.id
  is '字典编号';
comment on column ONE_DICTNAME.is_one
  is '是否一代专用 1-一代专用，0-一二代通用';

