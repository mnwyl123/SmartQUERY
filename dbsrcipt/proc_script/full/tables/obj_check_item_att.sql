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
  is '��ȡ���˲������������Ϣ';
comment on column OBJ_CHECK_ITEM_ATT.id
  is 'ID';
comment on column OBJ_CHECK_ITEM_ATT.resultcode
  is '����������';
comment on column OBJ_CHECK_ITEM_ATT.resultdesc
  is '����������';
comment on column OBJ_CHECK_ITEM_ATT.objcheckid
  is '���������';
comment on column OBJ_CHECK_ITEM_ATT.enclosureflag
  is '�Ƿ���ڸ���';
comment on column OBJ_CHECK_ITEM_ATT.enclosureinf
  is '������Ϣ';

