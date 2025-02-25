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
  is '"数字解读"批量查询反馈报文';
-- Add comments to the columns 
comment on column CIFM_NUMREADR_SUCC_LOG.request_no
  is '请求信息编号(唯一标识该条请求信息)';
comment on column CIFM_NUMREADR_SUCC_LOG.result_type
  is '查询结果类型';
comment on column CIFM_NUMREADR_SUCC_LOG.score
  is '数字解读值';
comment on column CIFM_NUMREADR_SUCC_LOG.factors
  is '影响因素';
comment on column CIFM_NUMREADR_SUCC_LOG.position
  is '相对位置';
comment on column CIFM_NUMREADR_SUCC_LOG.score_date
  is '计算日期';
comment on column CIFM_NUMREADR_SUCC_LOG.re_file_name
  is '反馈报文名称';
comment on column CIFM_NUMREADR_SUCC_LOG.user_code
  is '接收方用户代码';
comment on column CIFM_NUMREADR_SUCC_LOG.org_code
  is '接收方机构代码';
