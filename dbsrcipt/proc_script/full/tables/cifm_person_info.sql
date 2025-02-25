create table CIFM_PERSON_INFO
(
  id                    VARCHAR2(64),
  client_name           VARCHAR2(100),
  credentials_type      VARCHAR2(10),
  credentials_no        VARCHAR2(150),
  query_reason          VARCHAR2(2),
  query_version         VARCHAR2(2),
  warrant_maturity_date VARCHAR2(20),
  cust_manager          VARCHAR2(50),
  query_type            VARCHAR2(2),
  auditors              VARCHAR2(50),
  remarks               VARCHAR2(50),
  business_status       VARCHAR2(10),
  queryorgcode          VARCHAR2(100),
  username              VARCHAR2(100),
  originateorgcode      VARCHAR2(100),
  originateusercode     VARCHAR2(100),
  servicecode           VARCHAR2(100),
  reportname            VARCHAR2(100)
)
;
comment on table CIFM_PERSON_INFO
  is '���Ų�ѯ������Ϣ��';
comment on column CIFM_PERSON_INFO.id
  is '��ѯ���';
comment on column CIFM_PERSON_INFO.client_name
  is '����ѯ������';
comment on column CIFM_PERSON_INFO.credentials_type
  is '֤������';
comment on column CIFM_PERSON_INFO.credentials_no
  is '֤������';
comment on column CIFM_PERSON_INFO.query_reason
  is '��ѯԭ��';
comment on column CIFM_PERSON_INFO.query_version
  is '��ѯ�汾';
comment on column CIFM_PERSON_INFO.warrant_maturity_date
  is '��Ȩ�鵽����';
comment on column CIFM_PERSON_INFO.cust_manager
  is '�ͻ�����';
comment on column CIFM_PERSON_INFO.query_type
  is '��ѯ����';
comment on column CIFM_PERSON_INFO.auditors
  is '��Ȩ�����Ա';
comment on column CIFM_PERSON_INFO.remarks
  is '��ע';
comment on column CIFM_PERSON_INFO.business_status
  is 'ҵ�����״̬';
comment on column CIFM_PERSON_INFO.queryorgcode
  is '��ѯ��������';
comment on column CIFM_PERSON_INFO.username
  is 'ϵͳ�û���';
comment on column CIFM_PERSON_INFO.originateorgcode
  is '�����������';
comment on column CIFM_PERSON_INFO.originateusercode
  is '�����û�����';
comment on column CIFM_PERSON_INFO.servicecode
  is '�������';
comment on column CIFM_PERSON_INFO.reportname
  is '���ñ����ļ�����';
create index PERSON_ID on CIFM_PERSON_INFO (ID);

