create table RESTART_EXECUTOR_INFO
(
  id            VARCHAR2(100),
  executor_type VARCHAR2(50),
  pd_str        VARCHAR2(4000),
  type          VARCHAR2(20)
);
comment on table RESTART_EXECUTOR_INFO
  is '����ϵͳ�����̳߳�������Ϣ';
comment on column RESTART_EXECUTOR_INFO.id
  is 'ID';
comment on column RESTART_EXECUTOR_INFO.executor_type
  is '�̳߳�����';
comment on column RESTART_EXECUTOR_INFO.pd_str
  is '�̴߳�������pd';
comment on column RESTART_EXECUTOR_INFO.type
  is '�ӿ����ͣ�1-���ˣ�2-��ҵ��3-�����Ŵ���4��ҵ�Ŵ���';