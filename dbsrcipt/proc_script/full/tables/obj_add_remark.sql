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
  is '添加标注';
comment on column OBJ_ADD_REMARK.id
  is 'ID';
comment on column OBJ_ADD_REMARK.resultcode
  is '处理结果代码';
comment on column OBJ_ADD_REMARK.resultdesc
  is '处理结果描述';
comment on column OBJ_ADD_REMARK.servicereturncode
  is '业务回执代码';
comment on column OBJ_ADD_REMARK.user_id
  is '用户id';

