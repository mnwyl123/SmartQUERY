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
  is '"数字解读"批量查询异常反馈报文';
-- Add comments to the columns 
comment on column CIFM_NUMREADR_FAIL_LOG.error_code
  is '错误信息编码';
comment on column CIFM_NUMREADR_FAIL_LOG.error_msg
  is '错误信息内容';
comment on column CIFM_NUMREADR_FAIL_LOG.user_code
  is '接收方用户代码';
comment on column CIFM_NUMREADR_FAIL_LOG.org_code
  is '接收方机构代码';
comment on column CIFM_NUMREADR_FAIL_LOG.response_time
  is '响应时间';
comment on column CIFM_NUMREADR_FAIL_LOG.total_num
  is '报文总数';
comment on column CIFM_NUMREADR_FAIL_LOG.re_file_name
  is '反馈报文名称';
