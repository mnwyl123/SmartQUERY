
create table CIFM_CREDIT_ACCT_MANAGE
(
  credit_code       VARCHAR2(32),
  credit_name       VARCHAR2(50),
  credentials_type  VARCHAR2(2),
  credentials_no    VARCHAR2(50),
  start_date        VARCHAR2(32),
  end_date          VARCHAR2(32),
  previous_password VARCHAR2(50),
  current_password  VARCHAR2(50),
  current_time      VARCHAR2(32),
  pwd_expires_date  VARCHAR2(32),
  credit_acct_type  VARCHAR2(2),
  company           VARCHAR2(10),
  perbank_status    VARCHAR2(10),
  pwd_code          VARCHAR2(10),
  is_web            VARCHAR2(5)
);
-- Add comments to the table 
comment on table CIFM_CREDIT_ACCT_MANAGE
  is '�����˻�������Ϣ��';
-- Add comments to the columns 
comment on column CIFM_CREDIT_ACCT_MANAGE.credit_code
  is '���ŵ�¼��';
comment on column CIFM_CREDIT_ACCT_MANAGE.credit_name
  is '�����û�����';
comment on column CIFM_CREDIT_ACCT_MANAGE.credentials_type
  is '֤������';
comment on column CIFM_CREDIT_ACCT_MANAGE.credentials_no
  is '֤������';
comment on column CIFM_CREDIT_ACCT_MANAGE.start_date
  is '��������';
comment on column CIFM_CREDIT_ACCT_MANAGE.end_date
  is 'ͣ������';
comment on column CIFM_CREDIT_ACCT_MANAGE.previous_password
  is 'ԭ����';
comment on column CIFM_CREDIT_ACCT_MANAGE.current_password
  is '������';
comment on column CIFM_CREDIT_ACCT_MANAGE.current_time
  is '�����޸�ʱ��';
comment on column CIFM_CREDIT_ACCT_MANAGE.pwd_expires_date
  is '���뵽����';
comment on column CIFM_CREDIT_ACCT_MANAGE.credit_acct_type
  is '�˺����ͣ�1���ˣ�2��ҵ��';
comment on column CIFM_CREDIT_ACCT_MANAGE.perbank_status
  is '�����˻�״̬(1:������0������)';
comment on column CIFM_CREDIT_ACCT_MANAGE.pwd_code
  is '������';
comment on column CIFM_CREDIT_ACCT_MANAGE.is_web
  is '�Ƿ������û���0-��1-�ǣ�';
