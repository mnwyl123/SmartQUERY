-- Create table
create table CIFM_NUMREADR_SUCC_LOG
(
  request_no   INTEGER,
  result_type  VARCHAR2(4),
  score        VARCHAR2(50),
  factors      VARCHAR2(50),
  position     VARCHAR2(30),
  score_date   VARCHAR2(40),
  re_file_name VARCHAR2(40),
  user_code    VARCHAR2(40),
  org_code     VARCHAR2(40),
  company      VARCHAR2(10),
  no           INTEGER
);
-- Add comments to the table 
comment on table CIFM_NUMREADR_SUCC_LOG
  is '"���ֽ��"������ѯ��������';
-- Add comments to the columns 
comment on column CIFM_NUMREADR_SUCC_LOG.request_no
  is '������Ϣ���(Ψһ��ʶ����������Ϣ)';
comment on column CIFM_NUMREADR_SUCC_LOG.result_type
  is '��ѯ�������';
comment on column CIFM_NUMREADR_SUCC_LOG.score
  is '���ֽ��ֵ';
comment on column CIFM_NUMREADR_SUCC_LOG.factors
  is 'Ӱ������';
comment on column CIFM_NUMREADR_SUCC_LOG.position
  is '���λ��';
comment on column CIFM_NUMREADR_SUCC_LOG.score_date
  is '��������';
comment on column CIFM_NUMREADR_SUCC_LOG.re_file_name
  is '������������';
comment on column CIFM_NUMREADR_SUCC_LOG.user_code
  is '���շ��û�����';
comment on column CIFM_NUMREADR_SUCC_LOG.org_code
  is '���շ���������';
