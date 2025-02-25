create table SYS_OPERATION_LOG
(
  log_id         VARCHAR2(50),
  user_id        VARCHAR2(100),
  username       VARCHAR2(20),
  name           VARCHAR2(50),
  org            VARCHAR2(50),
  ip             VARCHAR2(20),
  mac            VARCHAR2(50),
  operation_url  VARCHAR2(200),
  operation_time VARCHAR2(20),
  operation_desc VARCHAR2(500)
)
;
comment on table SYS_OPERATION_LOG
  is 'ƽ̨������־����¼����ƽ̨�����ܵ���Ϣ';
comment on column SYS_OPERATION_LOG.log_id
  is '��־��ˮ��';
comment on column SYS_OPERATION_LOG.user_id
  is '�������û�Key';
comment on column SYS_OPERATION_LOG.username
  is '�������û�����';
comment on column SYS_OPERATION_LOG.name
  is '�������û�����';
comment on column SYS_OPERATION_LOG.org
  is '��������������';
comment on column SYS_OPERATION_LOG.ip
  is '������IP��ַ';
comment on column SYS_OPERATION_LOG.mac
  is '������MAC��ַ';
comment on column SYS_OPERATION_LOG.operation_url
  is '����URL';
comment on column SYS_OPERATION_LOG.operation_time
  is '����ʱ�䣬������ ʱ����';
comment on column SYS_OPERATION_LOG.operation_desc
  is '�������������';

