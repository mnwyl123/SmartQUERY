create table CIFM_NUMBER_READ_PARAM
(
  request_user_name VARCHAR2(50),
  request_user_code VARCHAR2(50),
  company           VARCHAR2(10),
  param             VARCHAR2(50)
)
;
comment on table CIFM_NUMBER_READ_PARAM
  is '数字解读上报员参数表';
comment on column CIFM_NUMBER_READ_PARAM.request_user_name
  is '上报员名称';
comment on column CIFM_NUMBER_READ_PARAM.request_user_code
  is '上报员人行用户代码';
comment on column CIFM_NUMBER_READ_PARAM.company
  is '所属法人';

