create table CIFM_COMPANY_INFO
(
  id                    VARCHAR2(64),
  query_reason          VARCHAR2(2),
  china_credit_code     VARCHAR2(150),
  warrant_maturity_date VARCHAR2(20),
  query_version         VARCHAR2(2),
  company_name          VARCHAR2(200),
  query_type            VARCHAR2(2),
  cust_manager          VARCHAR2(50),
  auditors              VARCHAR2(50),
  credentials_no_type   VARCHAR2(2),
  remarks               VARCHAR2(50),
  business_status       VARCHAR2(10),
  servicecode           VARCHAR2(30),
  reportname            VARCHAR2(50)
)
;
comment on table CIFM_COMPANY_INFO
  is '���Ų�ѯ��ҵ��Ϣ��';
comment on column CIFM_COMPANY_INFO.id
  is '��ѯ���';
comment on column CIFM_COMPANY_INFO.query_reason
  is '��ѯԭ��';
comment on column CIFM_COMPANY_INFO.china_credit_code
  is '��ҵ֤������';
comment on column CIFM_COMPANY_INFO.warrant_maturity_date
  is '��Ȩ�鵽����';
comment on column CIFM_COMPANY_INFO.query_version
  is '��ѯ�汾';
comment on column CIFM_COMPANY_INFO.company_name
  is '�ͻ�����';
comment on column CIFM_COMPANY_INFO.query_type
  is '��ѯ����';
comment on column CIFM_COMPANY_INFO.cust_manager
  is '�ͻ�����';
comment on column CIFM_COMPANY_INFO.auditors
  is '��Ȩ������';
comment on column CIFM_COMPANY_INFO.credentials_no_type
  is '֤��������';
comment on column CIFM_COMPANY_INFO.remarks
  is '��ע';
comment on column CIFM_COMPANY_INFO.business_status
  is 'ҵ�����״̬';
comment on column CIFM_COMPANY_INFO.servicecode
  is '�������';
comment on column CIFM_COMPANY_INFO.reportname
  is '���ñ����ļ�����';
create index COMPANY_ID on CIFM_COMPANY_INFO (ID);

