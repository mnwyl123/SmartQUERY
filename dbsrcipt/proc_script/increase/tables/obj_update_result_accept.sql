create table OBJ_UPDATE_RESULT_ACCEPT
(
  id                VARCHAR2(64),
  resultcode        VARCHAR2(100),
  resultdesc        VARCHAR2(1000),
  correctacceptflag VARCHAR2(100),
  correctopinion    VARCHAR2(100),
  user_id           VARCHAR2(64),
  objcheckid        VARCHAR2(20)
)
;
comment on table OBJ_UPDATE_RESULT_ACCEPT
  is '��ѯ���������������������';
comment on column OBJ_UPDATE_RESULT_ACCEPT.resultcode
  is '����������';
comment on column OBJ_UPDATE_RESULT_ACCEPT.resultdesc
  is '����������';
comment on column OBJ_UPDATE_RESULT_ACCEPT.correctacceptflag
  is '�Ƿ���ܸ������';
comment on column OBJ_UPDATE_RESULT_ACCEPT.correctopinion
  is '�����������';
comment on column OBJ_UPDATE_RESULT_ACCEPT.user_id
  is '�û�id';

