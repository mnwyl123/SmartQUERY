create table SYS_PASSWORD
(
  initial_password       VARCHAR2(50),
  max_error_logon        INTEGER,
  effect_days            INTEGER,
  min_length             INTEGER,
  max_length             INTEGER,
  repeat_num             INTEGER,
  modified_restrict_time INTEGER,
  encrypt_type           VARCHAR2(20),
  password_rule          VARCHAR2(50),
  password_rule_desc     VARCHAR2(100)
)
;
comment on table SYS_PASSWORD
  is '密码参数表';
comment on column SYS_PASSWORD.initial_password
  is '初始密码明码';
comment on column SYS_PASSWORD.max_error_logon
  is '每天输错密码次数';
comment on column SYS_PASSWORD.effect_days
  is '密码过期天数';
comment on column SYS_PASSWORD.min_length
  is '密码最小长度';
comment on column SYS_PASSWORD.max_length
  is '密码最大长度';
comment on column SYS_PASSWORD.repeat_num
  is '密码不能重复次数';
comment on column SYS_PASSWORD.modified_restrict_time
  is '重复修改限制时间';
comment on column SYS_PASSWORD.encrypt_type
  is '密码加密规则，默认采用MD5';
comment on column SYS_PASSWORD.password_rule
  is '密码校验规则，采用正则表达式的形式存储，便于校验';
comment on column SYS_PASSWORD.password_rule_desc
  is '密码校验规则描述';

