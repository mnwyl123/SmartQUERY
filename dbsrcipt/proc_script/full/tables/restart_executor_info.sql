create table RESTART_EXECUTOR_INFO
(
  id            VARCHAR2(100),
  executor_type VARCHAR2(50),
  pd_str        VARCHAR2(4000),
  type          VARCHAR2(20)
);
comment on table RESTART_EXECUTOR_INFO
  is '重启系统所需线程池任务信息';
comment on column RESTART_EXECUTOR_INFO.id
  is 'ID';
comment on column RESTART_EXECUTOR_INFO.executor_type
  is '线程池类型';
comment on column RESTART_EXECUTOR_INFO.pd_str
  is '线程传入数据pd';
comment on column RESTART_EXECUTOR_INFO.type
  is '接口类型（1-个人，2-企业，3-个人信贷，4企业信贷）';