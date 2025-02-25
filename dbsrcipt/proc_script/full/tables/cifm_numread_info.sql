create table CIFM_NUMREAD_INFO
(
  id                VARCHAR2(100),
  requestid         VARCHAR2(100),
  resultcode        VARCHAR2(100),
  resultdesc        VARCHAR2(100),
  originateorgcode  VARCHAR2(100),
  originateusercode VARCHAR2(100),
  name              VARCHAR2(100),
  idtype            VARCHAR2(100),
  idnum             VARCHAR2(100),
  queryreason       VARCHAR2(100),
  servicecode       VARCHAR2(100),
  productdate       VARCHAR2(100),
  resulttype        VARCHAR2(100),
  score             VARCHAR2(100),
  factornum         VARCHAR2(100),
  factorrecs        VARCHAR2(100),
  position          VARCHAR2(100),
  scoredate         VARCHAR2(100)
)
;
comment on table CIFM_NUMREAD_INFO
  is '个人数字解读报告信息表';
comment on column CIFM_NUMREAD_INFO.id
  is '编号';
comment on column CIFM_NUMREAD_INFO.requestid
  is '信息记录号';
comment on column CIFM_NUMREAD_INFO.resultcode
  is '查询结果代码 ';
comment on column CIFM_NUMREAD_INFO.resultdesc
  is '查询结果描述';
comment on column CIFM_NUMREAD_INFO.originateorgcode
  is '发起机构代码';
comment on column CIFM_NUMREAD_INFO.originateusercode
  is '发起用户代码';
comment on column CIFM_NUMREAD_INFO.name
  is '信息主体姓名';
comment on column CIFM_NUMREAD_INFO.idtype
  is '信息主体证件类型';
comment on column CIFM_NUMREAD_INFO.idnum
  is '信息主体证件号码';
comment on column CIFM_NUMREAD_INFO.queryreason
  is '查询原因';
comment on column CIFM_NUMREAD_INFO.servicecode
  is '服务代码';
comment on column CIFM_NUMREAD_INFO.productdate
  is '产品日期';
comment on column CIFM_NUMREAD_INFO.resulttype
  is '查询结果类型';
comment on column CIFM_NUMREAD_INFO.score
  is '数字解读值';
comment on column CIFM_NUMREAD_INFO.factornum
  is '影响因素个数';
comment on column CIFM_NUMREAD_INFO.factorrecs
  is '影响因素集合';
comment on column CIFM_NUMREAD_INFO.position
  is '相对位置';
comment on column CIFM_NUMREAD_INFO.scoredate
  is '计算日期';

