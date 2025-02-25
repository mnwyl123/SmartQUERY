create table PER_CAREER
(
  report_id       VARCHAR2(30) not null,
  serial          VARCHAR2(10),
  company_name    VARCHAR2(300),
  company_address VARCHAR2(300),
  career          VARCHAR2(50),
  industry        VARCHAR2(50),
  duties          VARCHAR2(150),
  job_title       VARCHAR2(100),
  enter_year      VARCHAR2(10),
  update_time     VARCHAR2(20),
  work_status     VARCHAR2(100),
  company_tel     VARCHAR2(100),
  company_nature  VARCHAR2(100),
  duties2         VARCHAR2(100),
  industry2       VARCHAR2(50),
  job_title2      VARCHAR2(100),
  career2         VARCHAR2(50)
)
;
comment on table PER_CAREER
  is '职业信息表';
comment on column PER_CAREER.report_id
  is '报告编号';
comment on column PER_CAREER.serial
  is '编号';
comment on column PER_CAREER.company_name
  is '工作单位';
comment on column PER_CAREER.company_address
  is '单位地址';
comment on column PER_CAREER.career
  is '职业';
comment on column PER_CAREER.industry
  is '行业';
comment on column PER_CAREER.duties
  is '职务';
comment on column PER_CAREER.job_title
  is '职称';
comment on column PER_CAREER.enter_year
  is '进入本单位年份';
comment on column PER_CAREER.update_time
  is '信息更新日期';
comment on column PER_CAREER.work_status
  is '就业状况';
comment on column PER_CAREER.company_tel
  is '单位电话';
comment on column PER_CAREER.company_nature
  is '单位性质';
comment on column PER_CAREER.duties2
  is '职务2';
comment on column PER_CAREER.industry2
  is '行业2';
comment on column PER_CAREER.job_title2
  is '职称2';

