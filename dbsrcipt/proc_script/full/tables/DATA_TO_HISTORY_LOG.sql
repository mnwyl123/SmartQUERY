create table DATA_TO_HISTORY_LOG
(
  execute_time   DATE,
  proc_name      VARCHAR2(20),
  step           NUMBER(3),
  status         NUMBER(1),
  execute_result VARCHAR2(500)
);
comment on table DATA_TO_HISTORY_LOG is '数据移至历史表日志';
comment on column DATA_TO_HISTORY_LOG.execute_time is '执行时间';
comment on column DATA_TO_HISTORY_LOG.proc_name is '存储过程名称';
comment on column DATA_TO_HISTORY_LOG.step is '执行步骤';
comment on column DATA_TO_HISTORY_LOG.status is '执行状态（0-失败 1-成功）';
comment on column DATA_TO_HISTORY_LOG.execute_result is '执行结果';
