-- Create table
create table CIFM_NUMREADR_BATCH
(
  batch_name VARCHAR2(40),
  request_no INTEGER,
  company    VARCHAR2(10)
);
-- Add comments to the table 
comment on table CIFM_NUMREADR_BATCH
  is '���ֽ�����ͱ�����־';
-- Add comments to the columns 
comment on column CIFM_NUMREADR_BATCH.batch_name
  is '���ͱ��ĵ��ļ���';
comment on column CIFM_NUMREADR_BATCH.request_no
  is '���ͱ��ĵ�������';
