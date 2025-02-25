create table PER_LOW_SECURITY
(
  report_id        VARCHAR2(30) not null,
  serial           VARCHAR2(10),
  personnel_type   VARCHAR2(30),
  location         VARCHAR2(30),
  company          VARCHAR2(200),
  house_mon_income VARCHAR2(20),
  apply_date       VARCHAR2(20),
  approval_date    VARCHAR2(20),
  update_time      VARCHAR2(20),
  label_cnt        VARCHAR2(100),
  personnel_type2  VARCHAR2(30)
)
;
comment on table PER_LOW_SECURITY
  is '低保救助信息记录信息段';
comment on column PER_LOW_SECURITY.report_id
  is '报告编号';
comment on column PER_LOW_SECURITY.serial
  is '编号';
comment on column PER_LOW_SECURITY.personnel_type
  is '人员类别';
comment on column PER_LOW_SECURITY.location
  is '所在地';
comment on column PER_LOW_SECURITY.company
  is '工作单位';
comment on column PER_LOW_SECURITY.house_mon_income
  is '家庭月收入';
comment on column PER_LOW_SECURITY.apply_date
  is '申请日期';
comment on column PER_LOW_SECURITY.approval_date
  is '批准日期';
comment on column PER_LOW_SECURITY.update_time
  is '信息更新日期';
comment on column PER_LOW_SECURITY.label_cnt
  is '标注及声明个数';
comment on column PER_LOW_SECURITY.personnel_type2
  is '人员类别2';

