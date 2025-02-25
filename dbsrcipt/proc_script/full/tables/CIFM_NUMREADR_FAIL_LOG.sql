-- Create table
create table CIFM_NUMREADR_FAIL_LOG
(
  error_code    VARCHAR2(20),
  error_msg     VARCHAR2(1000),
  user_code     VARCHAR2(40),
  org_code      VARCHAR2(40),
  response_time VARCHAR2(50),
  total_num     INTEGER,
  re_file_name  VARCHAR2(40),
  company       VARCHAR2(10)
);
-- Add comments to the table 
comment on table CIFM_NUMREADR_FAIL_LOG
  is '"���ֽ��"������ѯ�쳣��������';
-- Add comments to the columns 
comment on column CIFM_NUMREADR_FAIL_LOG.error_code
  is '������Ϣ����';
comment on column CIFM_NUMREADR_FAIL_LOG.error_msg
  is '������Ϣ����';
comment on column CIFM_NUMREADR_FAIL_LOG.user_code
  is '���շ��û�����';
comment on column CIFM_NUMREADR_FAIL_LOG.org_code
  is '���շ���������';
comment on column CIFM_NUMREADR_FAIL_LOG.response_time
  is '��Ӧʱ��';
comment on column CIFM_NUMREADR_FAIL_LOG.total_num
  is '��������';
comment on column CIFM_NUMREADR_FAIL_LOG.re_file_name
  is '������������';
