create table OBJ_TOCHECKINF
(
  ci_id                  VARCHAR2(64),
  objcheckid             VARCHAR2(100),
  objchecknum            VARCHAR2(100),
  checkbegindate         VARCHAR2(100),
  name                   VARCHAR2(100),
  idtype                 VARCHAR2(100),
  idnum                  VARCHAR2(100),
  phonenum               VARCHAR2(100),
  objiteminf             VARCHAR2(100),
  objitemdesc            VARCHAR2(1000),
  dataproviderorgcode    VARCHAR2(100),
  dataoccurorgcode       VARCHAR2(100),
  businesscode           VARCHAR2(100),
  businesstype           VARCHAR2(100),
  checkfinaldate         VARCHAR2(100),
  dataoccurdate          VARCHAR2(100),
  dataoccuramount        VARCHAR2(100),
  enclosureflag          VARCHAR2(100),
  historicalcheckinf     VARCHAR2(100),
  org_id                 VARCHAR2(64),
  result_phonenum        VARCHAR2(100),
  result_checkresult     VARCHAR2(100),
  result_checkresultdesc VARCHAR2(100),
  correctresult          VARCHAR2(100),
  correctdesc            VARCHAR2(100),
  correct_enclosureinf   VARCHAR2(100),
  relative_enddate       VARCHAR2(100)
)
;
comment on table OBJ_TOCHECKINF
  is '异议事项单信息';
comment on column OBJ_TOCHECKINF.ci_id
  is '待核查异议事项id(关联OBJ_CHECK_ITEM的id)';
comment on column OBJ_TOCHECKINF.objcheckid
  is '异议事项号';
comment on column OBJ_TOCHECKINF.objchecknum
  is '异议事项流水号';
comment on column OBJ_TOCHECKINF.checkbegindate
  is '核查开始日期';
comment on column OBJ_TOCHECKINF.name
  is '姓名(企业名称)';
comment on column OBJ_TOCHECKINF.idtype
  is '证件类型(企业身份标识类型)';
comment on column OBJ_TOCHECKINF.idnum
  is '证件号码(企业身份标识号码)';
comment on column OBJ_TOCHECKINF.phonenum
  is '有效联系电话';
comment on column OBJ_TOCHECKINF.objiteminf
  is '异议事项信息';
comment on column OBJ_TOCHECKINF.objitemdesc
  is '异议说明';
comment on column OBJ_TOCHECKINF.dataproviderorgcode
  is '数据提供机构代码';
comment on column OBJ_TOCHECKINF.dataoccurorgcode
  is '数据发生机构代码';
comment on column OBJ_TOCHECKINF.businesscode
  is '业务标识号';
comment on column OBJ_TOCHECKINF.businesstype
  is '业务种类';
comment on column OBJ_TOCHECKINF.checkfinaldate
  is '核查到期日期';
comment on column OBJ_TOCHECKINF.dataoccurdate
  is '数据发生日期';
comment on column OBJ_TOCHECKINF.dataoccuramount
  is '数据发生金额';
comment on column OBJ_TOCHECKINF.enclosureflag
  is '是否存在附件';
comment on column OBJ_TOCHECKINF.org_id
  is '被分配处理机构';
comment on column OBJ_TOCHECKINF.result_phonenum
  is '有效联系电话（个人异议事项核查结果）';
comment on column OBJ_TOCHECKINF.result_checkresult
  is '核查结果（个人异议事项核查结果）';
comment on column OBJ_TOCHECKINF.result_checkresultdesc
  is '异议核查结果描述（个人异议事项核查结果）';
comment on column OBJ_TOCHECKINF.correctresult
  is '异议更正结果';
comment on column OBJ_TOCHECKINF.correctdesc
  is '异议更正结果描述';
comment on column OBJ_TOCHECKINF.correct_enclosureinf
  is '异议更正上传附件名称';
comment on column OBJ_TOCHECKINF.relative_enddate
  is '相对检查到期时间=（检查开始时间+5天）';

