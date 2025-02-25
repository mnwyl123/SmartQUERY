-- Create table
create table CIFM_NUMREADR_BATCH
(
  batch_name VARCHAR2(40),
  request_no INTEGER,
  company    VARCHAR2(10)
);
-- Add comments to the table 
comment on table CIFM_NUMREADR_BATCH
  is '数字解读发送报文日志';
-- Add comments to the columns 
comment on column CIFM_NUMREADR_BATCH.batch_name
  is '发送报文的文件名';
comment on column CIFM_NUMREADR_BATCH.request_no
  is '发送报文的请求编号';
