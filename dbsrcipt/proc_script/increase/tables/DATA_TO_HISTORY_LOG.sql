create table DATA_TO_HISTORY_LOG
(
  execute_time   DATE,
  proc_name      VARCHAR2(20),
  step           NUMBER(3),
  status         NUMBER(1),
  execute_result VARCHAR2(500)
);
comment on table DATA_TO_HISTORY_LOG is '����������ʷ����־';
comment on column DATA_TO_HISTORY_LOG.execute_time is 'ִ��ʱ��';
comment on column DATA_TO_HISTORY_LOG.proc_name is '�洢��������';
comment on column DATA_TO_HISTORY_LOG.step is 'ִ�в���';
comment on column DATA_TO_HISTORY_LOG.status is 'ִ��״̬��0-ʧ�� 1-�ɹ���';
comment on column DATA_TO_HISTORY_LOG.execute_result is 'ִ�н��';
