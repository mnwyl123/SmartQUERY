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
  is '������������Ϣû�й����Ĳ�����';
comment on column CIFM_PARAM_LIST_NORELATION.param
  is '����';
comment on column CIFM_PARAM_LIST_NORELATION.param_name
  is '��������';
comment on column CIFM_PARAM_LIST_NORELATION.param_value
  is '����ֵ';
comment on column CIFM_PARAM_LIST_NORELATION.param_format
  is '������ʽ';

