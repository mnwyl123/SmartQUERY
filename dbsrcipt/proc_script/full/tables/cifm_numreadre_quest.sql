-- Create table
create table CIFM_NUMREADRE_QUEST
(
  id                VARCHAR2(64),
  request_id        VARCHAR2(64),
  client_name       VARCHAR2(64),
  credentials_type  VARCHAR2(4),
  credentials_no    VARCHAR2(64),
  produce_date      DATE,
  company           VARCHAR2(10),
  status            VARCHAR2(20),
  query_reason      VARCHAR2(20),
  filename_request  VARCHAR2(64),
  requestid         VARCHAR2(200),
  resultcode        VARCHAR2(200),
  resultdesc        VARCHAR2(200),
  originateorgcode  VARCHAR2(200),
  originateusercode VARCHAR2(200),
  name              VARCHAR2(200),
  idtype            VARCHAR2(200),
  idnum             VARCHAR2(200),
  queryreason       VARCHAR2(200),
  servicecode       VARCHAR2(200),
  productdate       VARCHAR2(200),
  resulttype        VARCHAR2(200),
  score             VARCHAR2(200),
  factornum         VARCHAR2(200),
  factorrecs        VARCHAR2(200),
  position          VARCHAR2(200),
  scoredate         VARCHAR2(200),
  request_no        INTEGER
);
-- Add comments to the table 
comment on table CIFM_NUMREADRE_QUEST
  is '"数字解读"批量查询请求报文';
-- Add comments to the columns 
comment on column CIFM_NUMREADRE_QUEST.id
  is '编号';
comment on column CIFM_NUMREADRE_QUEST.request_id
  is '请求信息编号(唯一标识该条请求信息)';
comment on column CIFM_NUMREADRE_QUEST.client_name
  is '被查询人姓名';
comment on column CIFM_NUMREADRE_QUEST.credentials_type
  is '被查询人证件类型';
comment on column CIFM_NUMREADRE_QUEST.credentials_no
  is '被查询人证件号码';
comment on column CIFM_NUMREADRE_QUEST.produce_date
  is '产品时间';
comment on column CIFM_NUMREADRE_QUEST.query_reason
  is '查询原因';
comment on column CIFM_NUMREADRE_QUEST.filename_request
  is '申请报文文件名';
comment on column CIFM_NUMREADRE_QUEST.requestid
  is '信息记录号';
comment on column CIFM_NUMREADRE_QUEST.resultcode
  is '查询结果代码';
comment on column CIFM_NUMREADRE_QUEST.resultdesc
  is '查询结果描述';
comment on column CIFM_NUMREADRE_QUEST.originateorgcode
  is '发起机构代码';
comment on column CIFM_NUMREADRE_QUEST.originateusercode
  is '发起用户代码';
comment on column CIFM_NUMREADRE_QUEST.name
  is '信息主体姓名';
comment on column CIFM_NUMREADRE_QUEST.idtype
  is '信息主体证件类型';
comment on column CIFM_NUMREADRE_QUEST.idnum
  is '信息主体证件号码';
comment on column CIFM_NUMREADRE_QUEST.queryreason
  is '查询原因';
comment on column CIFM_NUMREADRE_QUEST.servicecode
  is '服务代码';
comment on column CIFM_NUMREADRE_QUEST.productdate
  is '产品日期';
comment on column CIFM_NUMREADRE_QUEST.resulttype
  is '查询结果类型';
comment on column CIFM_NUMREADRE_QUEST.score
  is '数字解读值';
comment on column CIFM_NUMREADRE_QUEST.factornum
  is '影响因素个数';
comment on column CIFM_NUMREADRE_QUEST.factorrecs
  is '影响因素';
comment on column CIFM_NUMREADRE_QUEST.position
  is '相对位置';
comment on column CIFM_NUMREADRE_QUEST.scoredate
  is '计算日期';
comment on column CIFM_NUMREADRE_QUEST.request_no
  is '请求信息编号(唯一标识该条请求信息)';
