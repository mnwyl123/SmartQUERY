create table CIFM_OBJ_COM_INFO
(
  id                  VARCHAR2(64),
  dataproviderorgcode VARCHAR2(100),
  usercode            VARCHAR2(100),
  password            VARCHAR2(100),
  originateorgcode    VARCHAR2(100),
  originateusercode   VARCHAR2(100),
  begindate           VARCHAR2(100),
  enddate             VARCHAR2(100),
  objcheckid          VARCHAR2(100),
  phonenum            VARCHAR2(100),
  objchecknum         VARCHAR2(100),
  checkresult         VARCHAR2(100),
  checkresultdesc     VARCHAR2(100),
  correctresult       VARCHAR2(100),
  enclosureinf        VARCHAR2(100),
  correctdesc         VARCHAR2(100),
  entname             VARCHAR2(100),
  entidtype           VARCHAR2(100),
  entidnum            VARCHAR2(100),
  businesscode        VARCHAR2(100),
  locateinfnm         VARCHAR2(100),
  locateinftype       VARCHAR2(100),
  dataoccurorgcode    VARCHAR2(100),
  objdesc             VARCHAR2(100),
  servicereturncode   VARCHAR2(100),
  username            VARCHAR2(255),
  report_type         VARCHAR2(1),
  objcorrectid        VARCHAR2(100),
  del_resultcode      VARCHAR2(10),
  del_resultdesc      VARCHAR2(30)
)
;
comment on table CIFM_OBJ_COM_INFO
  is '异议个人信息';
comment on column CIFM_OBJ_COM_INFO.dataproviderorgcode
  is '数据提供机构代码';
comment on column CIFM_OBJ_COM_INFO.usercode
  is '用户代码';
comment on column CIFM_OBJ_COM_INFO.password
  is '用户密码';
comment on column CIFM_OBJ_COM_INFO.originateorgcode
  is '发起机构代码';
comment on column CIFM_OBJ_COM_INFO.originateusercode
  is '发起用户代码';
comment on column CIFM_OBJ_COM_INFO.begindate
  is '开始日期';
comment on column CIFM_OBJ_COM_INFO.enddate
  is '结束日期';
comment on column CIFM_OBJ_COM_INFO.objcheckid
  is '异议事项号';
comment on column CIFM_OBJ_COM_INFO.phonenum
  is '有效联系电话';
comment on column CIFM_OBJ_COM_INFO.objchecknum
  is '异议事项流水号';
comment on column CIFM_OBJ_COM_INFO.checkresult
  is '核查结果';
comment on column CIFM_OBJ_COM_INFO.checkresultdesc
  is '异议核查结果描述';
comment on column CIFM_OBJ_COM_INFO.correctresult
  is '异议更正结果';
comment on column CIFM_OBJ_COM_INFO.enclosureinf
  is '附件信息';
comment on column CIFM_OBJ_COM_INFO.correctdesc
  is '异议更正结果描述';
comment on column CIFM_OBJ_COM_INFO.entname
  is '企业名称';
comment on column CIFM_OBJ_COM_INFO.entidtype
  is '企业身份标识类型';
comment on column CIFM_OBJ_COM_INFO.entidnum
  is '企业身份标识号码';
comment on column CIFM_OBJ_COM_INFO.businesscode
  is '业务标识号';
comment on column CIFM_OBJ_COM_INFO.locateinfnm
  is '定位信息个数';
comment on column CIFM_OBJ_COM_INFO.locateinftype
  is '定位信息类别';
comment on column CIFM_OBJ_COM_INFO.dataoccurorgcode
  is '数据发生机构代码';
comment on column CIFM_OBJ_COM_INFO.objdesc
  is '异议说明';
comment on column CIFM_OBJ_COM_INFO.servicereturncode
  is '业务回执代码';
comment on column CIFM_OBJ_COM_INFO.report_type
  is '报告类型（1-获取企业待核查异议事项 2-获取企业待核查异议事项附件信息 3-反馈企业异议事项核查结果 4-反馈企业异议事项更正结果 5-查询企业异议事项更正结果接受情况 6-添加企业标注 7-删除企业标注）';
comment on column CIFM_OBJ_COM_INFO.objcorrectid
  is '异议事项更正号';
comment on column CIFM_OBJ_COM_INFO.del_resultcode
  is '删除企业标志处理结果代码';
comment on column CIFM_OBJ_COM_INFO.del_resultdesc
  is '删除个人标志处理结果描述';

