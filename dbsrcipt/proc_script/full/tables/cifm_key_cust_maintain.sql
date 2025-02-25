create table CIFM_KEY_CUST_MAINTAIN
(
  cust_no        VARCHAR2(50),
  client_type    VARCHAR2(2),
  client_name    VARCHAR2(50),
  credentials_no VARCHAR2(50),
  operation_type VARCHAR2(2),
  org_name       VARCHAR2(50),
  org_code       VARCHAR2(50),
  user_name      VARCHAR2(50),
  user_code      VARCHAR2(50),
  add_date       VARCHAR2(50),
  add_reason     VARCHAR2(255),
  delete_date    VARCHAR2(50),
  delete_reason  VARCHAR2(255),
  company        VARCHAR2(10)
)
;
comment on table CIFM_KEY_CUST_MAINTAIN
  is '�ص��ע�ͻ�ά����';
comment on column CIFM_KEY_CUST_MAINTAIN.cust_no
  is '�ͻ����';
comment on column CIFM_KEY_CUST_MAINTAIN.client_type
  is '�ͻ�����';
comment on column CIFM_KEY_CUST_MAINTAIN.client_name
  is '�ͻ�����';
comment on column CIFM_KEY_CUST_MAINTAIN.credentials_no
  is '֤������/������';
comment on column CIFM_KEY_CUST_MAINTAIN.org_name
  is '�����û�������������';
comment on column CIFM_KEY_CUST_MAINTAIN.org_code
  is '�����û������������';
comment on column CIFM_KEY_CUST_MAINTAIN.user_name
  is '�����û�����';
comment on column CIFM_KEY_CUST_MAINTAIN.user_code
  is '�����û����';
comment on column CIFM_KEY_CUST_MAINTAIN.add_date
  is '��������';
comment on column CIFM_KEY_CUST_MAINTAIN.add_reason
  is '����ԭ��';
comment on column CIFM_KEY_CUST_MAINTAIN.delete_date
  is '�Ƴ�����';
comment on column CIFM_KEY_CUST_MAINTAIN.delete_reason
  is '�Ƴ�ԭ��';

