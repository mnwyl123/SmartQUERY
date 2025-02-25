
create table CIFM_CREDIT_ACCT_MANAGE
(
  credit_code       VARCHAR2(32),
  credit_name       VARCHAR2(50),
  credentials_type  VARCHAR2(2),
  credentials_no    VARCHAR2(50),
  start_date        VARCHAR2(32),
  end_date          VARCHAR2(32),
  previous_password VARCHAR2(50),
  current_password  VARCHAR2(50),
  current_time      VARCHAR2(32),
  pwd_expires_date  VARCHAR2(32),
  credit_acct_type  VARCHAR2(2),
  company           VARCHAR2(10),
  perbank_status    VARCHAR2(10),
  pwd_code          VARCHAR2(10),
  is_web            VARCHAR2(5)
);
-- Add comments to the table 
comment on table CIFM_CREDIT_ACCT_MANAGE
  is '征信账户管理信息表';
-- Add comments to the columns 
comment on column CIFM_CREDIT_ACCT_MANAGE.credit_code
  is '征信登录名';
comment on column CIFM_CREDIT_ACCT_MANAGE.credit_name
  is '征信用户名称';
comment on column CIFM_CREDIT_ACCT_MANAGE.credentials_type
  is '证件类型';
comment on column CIFM_CREDIT_ACCT_MANAGE.credentials_no
  is '证件号码';
comment on column CIFM_CREDIT_ACCT_MANAGE.start_date
  is '启用日期';
comment on column CIFM_CREDIT_ACCT_MANAGE.end_date
  is '停用日期';
comment on column CIFM_CREDIT_ACCT_MANAGE.previous_password
  is '原密码';
comment on column CIFM_CREDIT_ACCT_MANAGE.current_password
  is '新密码';
comment on column CIFM_CREDIT_ACCT_MANAGE.current_time
  is '密码修改时间';
comment on column CIFM_CREDIT_ACCT_MANAGE.pwd_expires_date
  is '密码到期日';
comment on column CIFM_CREDIT_ACCT_MANAGE.credit_acct_type
  is '账号类型（1个人，2企业）';
comment on column CIFM_CREDIT_ACCT_MANAGE.perbank_status
  is '人行账户状态(1:正常，0：锁定)';
comment on column CIFM_CREDIT_ACCT_MANAGE.pwd_code
  is '密码编号';
comment on column CIFM_CREDIT_ACCT_MANAGE.is_web
  is '是否爬虫用户（0-否，1-是）';
