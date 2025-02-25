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
  is '历史核查信息';
comment on column OBJ_HISTORICALCHECKINF.t_objcheckid
  is '异议事项单信息ObjCheckID(关联OBJ_TOCHECKINF的ObjCheckID)';
comment on column OBJ_HISTORICALCHECKINF.checktime
  is '处理核查时间';
comment on column OBJ_HISTORICALCHECKINF.checkresult
  is '核查结果';
comment on column OBJ_HISTORICALCHECKINF.checkresultdesc
  is '核查结果描述';
comment on column OBJ_HISTORICALCHECKINF.checkorgcode
  is '核查机构代码';
comment on column OBJ_HISTORICALCHECKINF.checkusercode
  is '核查用户代码';
comment on column OBJ_HISTORICALCHECKINF.phonenum
  is '有效联系电话';
comment on column OBJ_HISTORICALCHECKINF.checkacceptflag
  is '是否接受核查结果';
comment on column OBJ_HISTORICALCHECKINF.checkopinion
  is '核查处理意见';

