create table PERBANK_USERNAME_INTERFACE
(
  username          VARCHAR2(100) not null,
  previous_password VARCHAR2(100),
  current_password  VARCHAR2(100),
  update_time       VARCHAR2(20),
  resultcode        VARCHAR2(100),
  resultdesc        VARCHAR2(100),
  modifresultcode   VARCHAR2(10),
  errdesc           VARCHAR2(200)
)
;
comment on table PERBANK_USERNAME_INTERFACE
  is '接口用户人行账户密码信息';
comment on column PERBANK_USERNAME_INTERFACE.username
  is '人行账号';
comment on column PERBANK_USERNAME_INTERFACE.previous_password
  is '原密码';
comment on column PERBANK_USERNAME_INTERFACE.current_password
  is '新密码';
comment on column PERBANK_USERNAME_INTERFACE.update_time
  is '更新密码时间';
comment on column PERBANK_USERNAME_INTERFACE.resultcode
  is '处理结果代码';
comment on column PERBANK_USERNAME_INTERFACE.resultdesc
  is '处理结果描述';
comment on column PERBANK_USERNAME_INTERFACE.modifresultcode
  is '修改结果代码';
comment on column PERBANK_USERNAME_INTERFACE.errdesc
  is '错误原因描述';
alter table PERBANK_USERNAME_INTERFACE
  add constraint PK_USERNAME primary key (USERNAME);

