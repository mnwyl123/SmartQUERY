create table PER_BASIC
(
  report_id                VARCHAR2(30) not null,
  client_name              VARCHAR2(150),
  credentials_type         VARCHAR2(50),
  credentials_no           VARCHAR2(150),
  client_sex               VARCHAR2(10),
  client_birthday          VARCHAR2(100),
  marital_status           VARCHAR2(10),
  phone_num                VARCHAR2(150),
  company_tel              VARCHAR2(150),
  family_tel               VARCHAR2(150),
  education                VARCHAR2(50),
  degree                   VARCHAR2(15),
  mailing_address          VARCHAR2(300),
  residence_address        VARCHAR2(300),
  whole_label_cnt          VARCHAR2(100),
  nationality              VARCHAR2(100),
  after_pay_cnt            VARCHAR2(100),
  query_org_code           VARCHAR2(100),
  ch_sign                  VARCHAR2(100),
  work_status              VARCHAR2(100),
  ch_phone                 VARCHAR2(200),
  ch_sdate                 VARCHAR2(100),
  ch_edate                 VARCHAR2(100),
  whole_label_obj_type     VARCHAR2(100),
  ide_cnt                  VARCHAR2(100),
  public_info_cnt          VARCHAR2(100),
  whole_label_obj_sign     VARCHAR2(100),
  query_reason_code        VARCHAR2(100),
  objection_num            VARCHAR2(100),
  email                    VARCHAR2(100),
  phone_cnt                VARCHAR2(100),
  report_time              VARCHAR2(100),
  serial                   VARCHAR2(100),
  digital_interpre         VARCHAR2(100),
  digital_interpre_des     VARCHAR2(100),
  digital_interpre_des_cnt VARCHAR2(100),
  relative_positiont       VARCHAR2(100),
  credentials_type2        VARCHAR2(50),
  degree2                  VARCHAR2(15),
  education2               VARCHAR2(50),
  marital_status2          VARCHAR2(10),
  client_sex2              VARCHAR2(10)
)
;
comment on table PER_BASIC
  is '标注及声明信息单元';
comment on column PER_BASIC.report_id
  is '报告编号';
comment on column PER_BASIC.client_name
  is '被查询者姓名';
comment on column PER_BASIC.credentials_type
  is '被查询者证件类型';
comment on column PER_BASIC.credentials_no
  is '被查询者证件号码';
comment on column PER_BASIC.client_sex
  is '性别';
comment on column PER_BASIC.client_birthday
  is '出生日期';
comment on column PER_BASIC.marital_status
  is '婚姻状况';
comment on column PER_BASIC.phone_num
  is '手机号码';
comment on column PER_BASIC.company_tel
  is '单位电话';
comment on column PER_BASIC.family_tel
  is '住宅电话';
comment on column PER_BASIC.education
  is '学历';
comment on column PER_BASIC.degree
  is '学位';
comment on column PER_BASIC.mailing_address
  is '通讯地址';
comment on column PER_BASIC.residence_address
  is '户籍地址';
comment on column PER_BASIC.whole_label_cnt
  is '标注及声明类型个数(整体)';
comment on column PER_BASIC.nationality
  is '国籍';
comment on column PER_BASIC.after_pay_cnt
  is '后付费业务类型数量';
comment on column PER_BASIC.query_org_code
  is '查询机构代码';
comment on column PER_BASIC.ch_sign
  is '防欺诈警示标志';
comment on column PER_BASIC.work_status
  is '就业状况';
comment on column PER_BASIC.ch_phone
  is '防欺诈警示联系电话';
comment on column PER_BASIC.ch_sdate
  is '防欺诈警示生效日期';
comment on column PER_BASIC.ch_edate
  is '防欺诈警示截止日期 ';
comment on column PER_BASIC.whole_label_obj_type
  is '对象类型(整体)';
comment on column PER_BASIC.ide_cnt
  is '身份标识个数';
comment on column PER_BASIC.public_info_cnt
  is '公共信息类型数量';
comment on column PER_BASIC.whole_label_obj_sign
  is '对象标识(整体)';
comment on column PER_BASIC.query_reason_code
  is '查询原因代码';
comment on column PER_BASIC.objection_num
  is '异议标注数目';
comment on column PER_BASIC.email
  is '电子邮箱';
comment on column PER_BASIC.phone_cnt
  is '手机号码个数';
comment on column PER_BASIC.report_time
  is '报告时间';
comment on column PER_BASIC.digital_interpre
  is '数字解读';
comment on column PER_BASIC.digital_interpre_des
  is '分数说明';
comment on column PER_BASIC.digital_interpre_des_cnt
  is '分数说明条数';
comment on column PER_BASIC.relative_positiont
  is '相对位置';
comment on column PER_BASIC.credentials_type2
  is '被查询者证件类型2';
comment on column PER_BASIC.degree2
  is '学位2';
comment on column PER_BASIC.education2
  is '学历2';

