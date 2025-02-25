-- Create table
create table CIFM_NUMREADRE_QUEST
(
  id                VARCHAR2(64),
  request_id        VARCHAR2(64),
  client_name       VARCHAR2(64),
  credentials_type  VARCHAR2(4),
  credentials_no    VARCHAR2(64),
  produce_date      DATE,
  company           VARCHAR2(10),
  status            VARCHAR2(20),
  query_reason      VARCHAR2(20),
  filename_request  VARCHAR2(64),
  requestid         VARCHAR2(200),
  resultcode        VARCHAR2(200),
  resultdesc        VARCHAR2(200),
  originateorgcode  VARCHAR2(200),
  originateusercode VARCHAR2(200),
  name              VARCHAR2(200),
  idtype            VARCHAR2(200),
  idnum             VARCHAR2(200),
  queryreason       VARCHAR2(200),
  servicecode       VARCHAR2(200),
  productdate       VARCHAR2(200),
  resulttype        VARCHAR2(200),
  score             VARCHAR2(200),
  factornum         VARCHAR2(200),
  factorrecs        VARCHAR2(200),
  position          VARCHAR2(200),
  scoredate         VARCHAR2(200),
  request_no        INTEGER
);
-- Add comments to the table 
comment on table CIFM_NUMREADRE_QUEST
  is '"���ֽ��"������ѯ������';
-- Add comments to the columns 
comment on column CIFM_NUMREADRE_QUEST.id
  is '���';
comment on column CIFM_NUMREADRE_QUEST.request_id
  is '������Ϣ���(Ψһ��ʶ����������Ϣ)';
comment on column CIFM_NUMREADRE_QUEST.client_name
  is '����ѯ������';
comment on column CIFM_NUMREADRE_QUEST.credentials_type
  is '����ѯ��֤������';
comment on column CIFM_NUMREADRE_QUEST.credentials_no
  is '����ѯ��֤������';
comment on column CIFM_NUMREADRE_QUEST.produce_date
  is '��Ʒʱ��';
comment on column CIFM_NUMREADRE_QUEST.query_reason
  is '��ѯԭ��';
comment on column CIFM_NUMREADRE_QUEST.filename_request
  is '���뱨���ļ���';
comment on column CIFM_NUMREADRE_QUEST.requestid
  is '��Ϣ��¼��';
comment on column CIFM_NUMREADRE_QUEST.resultcode
  is '��ѯ�������';
comment on column CIFM_NUMREADRE_QUEST.resultdesc
  is '��ѯ�������';
comment on column CIFM_NUMREADRE_QUEST.originateorgcode
  is '�����������';
comment on column CIFM_NUMREADRE_QUEST.originateusercode
  is '�����û�����';
comment on column CIFM_NUMREADRE_QUEST.name
  is '��Ϣ��������';
comment on column CIFM_NUMREADRE_QUEST.idtype
  is '��Ϣ����֤������';
comment on column CIFM_NUMREADRE_QUEST.idnum
  is '��Ϣ����֤������';
comment on column CIFM_NUMREADRE_QUEST.queryreason
  is '��ѯԭ��';
comment on column CIFM_NUMREADRE_QUEST.servicecode
  is '�������';
comment on column CIFM_NUMREADRE_QUEST.productdate
  is '��Ʒ����';
comment on column CIFM_NUMREADRE_QUEST.resulttype
  is '��ѯ�������';
comment on column CIFM_NUMREADRE_QUEST.score
  is '���ֽ��ֵ';
comment on column CIFM_NUMREADRE_QUEST.factornum
  is 'Ӱ�����ظ���';
comment on column CIFM_NUMREADRE_QUEST.factorrecs
  is 'Ӱ������';
comment on column CIFM_NUMREADRE_QUEST.position
  is '���λ��';
comment on column CIFM_NUMREADRE_QUEST.scoredate
  is '��������';
comment on column CIFM_NUMREADRE_QUEST.request_no
  is '������Ϣ���(Ψһ��ʶ����������Ϣ)';
