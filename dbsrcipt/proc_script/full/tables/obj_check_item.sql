create table OBJ_CHECK_ITEM
(
  id               VARCHAR2(64),
  resultcode       VARCHAR2(100),
  resultdesc       VARCHAR2(1000),
  begindate        VARCHAR2(30),
  enddate          VARCHAR2(30),
  tochecknm        VARCHAR2(100),
  org_id           VARCHAR2(100),
  relative_enddate VARCHAR2(30)
)
;
comment on table OBJ_CHECK_ITEM
  is '��ȡ���˲���������';
comment on column OBJ_CHECK_ITEM.id
  is 'ID';
comment on column OBJ_CHECK_ITEM.resultcode
  is '����������';
comment on column OBJ_CHECK_ITEM.resultdesc
  is '����������';
comment on column OBJ_CHECK_ITEM.begindate
  is '��ʼ����';
comment on column OBJ_CHECK_ITEM.enddate
  is '��������';
comment on column OBJ_CHECK_ITEM.tochecknm
  is '�����������';
comment on column OBJ_CHECK_ITEM.org_id
  is '���鴦�����';
comment on column OBJ_CHECK_ITEM.relative_enddate
  is '��Խ������ڣ�=��ʼ����+5�죩';

