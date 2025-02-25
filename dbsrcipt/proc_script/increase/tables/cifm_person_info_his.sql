create table CIFM_PERSON_INFO_HIS
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
comment on table CIFM_PERSON_INFO_HIS
  is '���Ų�ѯ������Ϣ��ʷ��';
comment on column CIFM_PERSON_INFO_HIS.id
  is '��ѯ���';
comment on column CIFM_PERSON_INFO_HIS.client_name
  is '����ѯ������';
comment on column CIFM_PERSON_INFO_HIS.credentials_type
  is '֤������';
comment on column CIFM_PERSON_INFO_HIS.credentials_no
  is '֤������';
comment on column CIFM_PERSON_INFO_HIS.query_reason
  is '��ѯԭ��';
comment on column CIFM_PERSON_INFO_HIS.query_version
  is '��ѯ�汾';
comment on column CIFM_PERSON_INFO_HIS.warrant_maturity_date
  is '��Ȩ�鵽����';
comment on column CIFM_PERSON_INFO_HIS.cust_manager
  is '�ͻ�����';
comment on column CIFM_PERSON_INFO_HIS.query_type
  is '��ѯ����';
comment on column CIFM_PERSON_INFO_HIS.auditors
  is '��Ȩ�����Ա';
comment on column CIFM_PERSON_INFO_HIS.remarks
  is '��ע';
comment on column CIFM_PERSON_INFO_HIS.business_status
  is 'ҵ�����״̬';
comment on column CIFM_PERSON_INFO_HIS.queryorgcode
  is '��ѯ��������';
comment on column CIFM_PERSON_INFO_HIS.username
  is 'ϵͳ�û���';
comment on column CIFM_PERSON_INFO_HIS.originateorgcode
  is '�����������';
comment on column CIFM_PERSON_INFO_HIS.originateusercode
  is '�����û�����';
comment on column CIFM_PERSON_INFO_HIS.servicecode
  is '�������';
comment on column CIFM_PERSON_INFO_HIS.reportname
  is '���ñ����ļ�����';

