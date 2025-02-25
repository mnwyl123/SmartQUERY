create table OBJ_CHECK_ITEM_ATT
(
  id            VARCHAR2(64),
  resultcode    VARCHAR2(100),
  resultdesc    VARCHAR2(1000),
  objcheckid    VARCHAR2(100),
  enclosureflag VARCHAR2(100),
  enclosureinf  VARCHAR2(100)
)
;
comment on table OBJ_CHECK_ITEM_ATT
  is '获取待核查异议事项附件信息';
comment on column OBJ_CHECK_ITEM_ATT.id
  is 'ID';
comment on column OBJ_CHECK_ITEM_ATT.resultcode
  is '处理结果代码';
comment on column OBJ_CHECK_ITEM_ATT.resultdesc
  is '处理结果描述';
comment on column OBJ_CHECK_ITEM_ATT.objcheckid
  is '异议事项号';
comment on column OBJ_CHECK_ITEM_ATT.enclosureflag
  is '是否存在附件';
comment on column OBJ_CHECK_ITEM_ATT.enclosureinf
  is '附件信息';

