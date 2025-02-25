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
  is '查询异议事项更正结果接受情况';
comment on column OBJ_UPDATE_RESULT_ACCEPT.resultcode
  is '处理结果代码';
comment on column OBJ_UPDATE_RESULT_ACCEPT.resultdesc
  is '处理结果描述';
comment on column OBJ_UPDATE_RESULT_ACCEPT.correctacceptflag
  is '是否接受更正结果';
comment on column OBJ_UPDATE_RESULT_ACCEPT.correctopinion
  is '更正处理意见';
comment on column OBJ_UPDATE_RESULT_ACCEPT.user_id
  is '用户id';

