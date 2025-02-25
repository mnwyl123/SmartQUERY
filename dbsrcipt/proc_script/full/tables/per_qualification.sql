create table PER_QUALIFICATION
(
  report_id        VARCHAR2(30) not null,
  serial           VARCHAR2(10),
  qual_name        VARCHAR2(100),
  qual_level       VARCHAR2(200),
  qual_obtain_date VARCHAR2(20),
  maturity_date    VARCHAR2(20),
  revoke_date      VARCHAR2(20),
  issued_comapny   VARCHAR2(100),
  company_location VARCHAR2(100),
  label_cnt        VARCHAR2(100),
  qual_level2      VARCHAR2(200)
)
;
comment on table PER_QUALIFICATION
  is '执业资格记录信息段';
comment on column PER_QUALIFICATION.report_id
  is '报告编号';
comment on column PER_QUALIFICATION.serial
  is '编号';
comment on column PER_QUALIFICATION.qual_name
  is '执业资格名称';
comment on column PER_QUALIFICATION.qual_level
  is '等级';
comment on column PER_QUALIFICATION.qual_obtain_date
  is '获得年月';
comment on column PER_QUALIFICATION.maturity_date
  is '到期年月';
comment on column PER_QUALIFICATION.revoke_date
  is '吊销年月';
comment on column PER_QUALIFICATION.issued_comapny
  is '颁发机构';
comment on column PER_QUALIFICATION.company_location
  is '机构所在地';
comment on column PER_QUALIFICATION.label_cnt
  is '标注及声明个数';
comment on column PER_QUALIFICATION.qual_level2
  is '等级2';

