create table CIFM_NUM_READ
(
  queryorgcode      VARCHAR2(100),
  username          VARCHAR2(100),
  filename_request  VARCHAR2(100),
  id                VARCHAR2(100),
  filename_response VARCHAR2(100),
  resultcode        VARCHAR2(100),
  resultdesc        VARCHAR2(100),
  statecode         VARCHAR2(100),
  statedesc         VARCHAR2(100)
)
;
comment on table CIFM_NUM_READ
  is '数字解读表';
comment on column CIFM_NUM_READ.queryorgcode
  is '查询机构代码';
comment on column CIFM_NUM_READ.username
  is '用户名';
comment on column CIFM_NUM_READ.filename_request
  is '请求批量查询请求文件名称';
comment on column CIFM_NUM_READ.id
  is '编号';
comment on column CIFM_NUM_READ.filename_response
  is '返回批量查询请求文件名称';
comment on column CIFM_NUM_READ.resultcode
  is '查询结果代码';
comment on column CIFM_NUM_READ.resultdesc
  is '查询结果描述';
comment on column CIFM_NUM_READ.statecode
  is '文件处理状态代码';
comment on column CIFM_NUM_READ.statedesc
  is '文件处理状态描述';

