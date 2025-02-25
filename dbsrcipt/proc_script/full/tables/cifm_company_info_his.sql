create table CIFM_COMPANY_INFO_HIS
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
);
comment on table CIFM_COMPANY_INFO_HIS
  is '���Ų�ѯ��ҵ��Ϣ��ʷ��';
comment on column CIFM_COMPANY_INFO_HIS.id
  is '��ѯ���';
comment on column CIFM_COMPANY_INFO_HIS.query_reason
  is '��ѯԭ��';
comment on column CIFM_COMPANY_INFO_HIS.china_credit_code
  is '��ҵ֤������';
comment on column CIFM_COMPANY_INFO_HIS.warrant_maturity_date
  is '��Ȩ�鵽����';
comment on column CIFM_COMPANY_INFO_HIS.query_version
  is '��ѯ�汾';
comment on column CIFM_COMPANY_INFO_HIS.company_name
  is '�ͻ�����';
comment on column CIFM_COMPANY_INFO_HIS.query_type
  is '��ѯ����';
comment on column CIFM_COMPANY_INFO_HIS.cust_manager
  is '�ͻ�����';
comment on column CIFM_COMPANY_INFO_HIS.auditors
  is '��Ȩ������';
comment on column CIFM_COMPANY_INFO_HIS.credentials_no_type
  is '֤��������';
comment on column CIFM_COMPANY_INFO_HIS.remarks
  is '��ע';
comment on column CIFM_COMPANY_INFO_HIS.business_status
  is 'ҵ�����״̬';
comment on column CIFM_COMPANY_INFO_HIS.servicecode
  is '�������';
comment on column CIFM_COMPANY_INFO_HIS.reportname
  is '���ñ����ļ�����';

