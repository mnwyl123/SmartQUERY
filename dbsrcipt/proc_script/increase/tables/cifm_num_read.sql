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
  is '���ֽ����';
comment on column CIFM_NUM_READ.queryorgcode
  is '��ѯ��������';
comment on column CIFM_NUM_READ.username
  is '�û���';
comment on column CIFM_NUM_READ.filename_request
  is '����������ѯ�����ļ�����';
comment on column CIFM_NUM_READ.id
  is '���';
comment on column CIFM_NUM_READ.filename_response
  is '����������ѯ�����ļ�����';
comment on column CIFM_NUM_READ.resultcode
  is '��ѯ�������';
comment on column CIFM_NUM_READ.resultdesc
  is '��ѯ�������';
comment on column CIFM_NUM_READ.statecode
  is '�ļ�����״̬����';
comment on column CIFM_NUM_READ.statedesc
  is '�ļ�����״̬����';

