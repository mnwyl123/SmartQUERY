create table OBJ_HISTORICALCHECKINF
(
  t_objcheckid    VARCHAR2(64),
  checktime       VARCHAR2(100),
  checkresult     VARCHAR2(1000),
  checkresultdesc VARCHAR2(100),
  checkorgcode    VARCHAR2(100),
  checkusercode   VARCHAR2(100),
  phonenum        VARCHAR2(100),
  checkacceptflag VARCHAR2(100),
  checkopinion    VARCHAR2(100)
)
;
comment on table OBJ_HISTORICALCHECKINF
  is '��ʷ�˲���Ϣ';
comment on column OBJ_HISTORICALCHECKINF.t_objcheckid
  is '���������ϢObjCheckID(����OBJ_TOCHECKINF��ObjCheckID)';
comment on column OBJ_HISTORICALCHECKINF.checktime
  is '����˲�ʱ��';
comment on column OBJ_HISTORICALCHECKINF.checkresult
  is '�˲���';
comment on column OBJ_HISTORICALCHECKINF.checkresultdesc
  is '�˲�������';
comment on column OBJ_HISTORICALCHECKINF.checkorgcode
  is '�˲��������';
comment on column OBJ_HISTORICALCHECKINF.checkusercode
  is '�˲��û�����';
comment on column OBJ_HISTORICALCHECKINF.phonenum
  is '��Ч��ϵ�绰';
comment on column OBJ_HISTORICALCHECKINF.checkacceptflag
  is '�Ƿ���ܺ˲���';
comment on column OBJ_HISTORICALCHECKINF.checkopinion
  is '�˲鴦�����';

