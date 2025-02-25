create table CIFM_PARAM_LIST_NORELATION
(
  param        VARCHAR2(100),
  param_name   VARCHAR2(100),
  param_value  VARCHAR2(100),
  param_format VARCHAR2(200),
  company      VARCHAR2(10)
)
;
comment on table CIFM_PARAM_LIST_NORELATION
  is '参数和其他信息没有关联的参数表';
comment on column CIFM_PARAM_LIST_NORELATION.param
  is '参数';
comment on column CIFM_PARAM_LIST_NORELATION.param_name
  is '参数名称';
comment on column CIFM_PARAM_LIST_NORELATION.param_value
  is '参数值';
comment on column CIFM_PARAM_LIST_NORELATION.param_format
  is '参数格式';

