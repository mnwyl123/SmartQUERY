create table OBJ_ADD_REMARK
(
  id                VARCHAR2(64),
  resultcode        VARCHAR2(100),
  resultdesc        VARCHAR2(1000),
  servicereturncode VARCHAR2(100),
  user_id           VARCHAR2(64)
)
;
comment on table OBJ_ADD_REMARK
  is '��ӱ�ע';
comment on column OBJ_ADD_REMARK.id
  is 'ID';
comment on column OBJ_ADD_REMARK.resultcode
  is '����������';
comment on column OBJ_ADD_REMARK.resultdesc
  is '����������';
comment on column OBJ_ADD_REMARK.servicereturncode
  is 'ҵ���ִ����';
comment on column OBJ_ADD_REMARK.user_id
  is '�û�id';

