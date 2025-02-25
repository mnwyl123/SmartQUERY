create table SYS_USER
(
  user_id              VARCHAR2(100),
  username             VARCHAR2(255),
  password             VARCHAR2(255),
  name                 VARCHAR2(255),
  last_login           VARCHAR2(255),
  ip                   VARCHAR2(100),
  skin                 VARCHAR2(100),
  email                VARCHAR2(32),
  teller_number        VARCHAR2(100),
  phone                VARCHAR2(32),
  pwd_alter_time       VARCHAR2(20),
  dept_code            VARCHAR2(32),
  state                VARCHAR2(2),
  err_times            INTEGER,
  lock_status          VARCHAR2(2),
  company              VARCHAR2(10),
  department           VARCHAR2(20),
  mac                  VARCHAR2(32),
  username_perbank     VARCHAR2(255),
  username_perbank_org VARCHAR2(255),
  is_online_user       VARCHAR2(255),
  update_time          DATE,
  channel_id           VARCHAR2(20),
  lock_reason          VARCHAR2(200)
)
;
comment on table SYS_USER
  is '用户表 ';
comment on column SYS_USER.user_id
  is '用户编码';
comment on column SYS_USER.username
  is '登录编码';
comment on column SYS_USER.password
  is '密码';
comment on column SYS_USER.name
  is '用户名称';
comment on column SYS_USER.last_login
  is '最近登录时间';
comment on column SYS_USER.ip
  is '登录ip';
comment on column SYS_USER.skin
  is '皮肤';
comment on column SYS_USER.email
  is 'email';
comment on column SYS_USER.teller_number
  is '柜员号';
comment on column SYS_USER.phone
  is '电话号码';
comment on column SYS_USER.pwd_alter_time
  is '密码修改日期';
comment on column SYS_USER.dept_code
  is '部门编码';
comment on column SYS_USER.state
  is '有效状态';
comment on column SYS_USER.err_times
  is '出错次数';
comment on column SYS_USER.lock_status
  is '用户状态:0-无效，1-正常，2-睡眠户，3-锁定';
comment on column SYS_USER.company
  is '法人编码';
comment on column SYS_USER.mac
  is 'MAC';
comment on column SYS_USER.username_perbank
  is '人行登录账号(个人)';
comment on column SYS_USER.username_perbank_org
  is '人行登录账号(企业)';
comment on column SYS_USER.is_online_user
  is '否线上查询用户(0:否,1:是)';
comment on column SYS_USER.update_time
  is '用户修改时间';
comment on column SYS_USER.channel_id
  is '渠道编号';
comment on column SYS_USER.lock_reason
  is '用户锁定的原因';
