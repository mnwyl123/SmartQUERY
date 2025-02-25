create table PASSWORD_LIST
(
  pwd_code    VARCHAR2(10),
  password    VARCHAR2(50),
  pwd_encrypt VARCHAR2(500)
)
;
comment on table PASSWORD_LIST
  is '密码存放列表';
comment on column PASSWORD_LIST.pwd_code
  is '密码编号';
comment on column PASSWORD_LIST.password
  is '密码明文';
comment on column PASSWORD_LIST.pwd_encrypt
  is '密码加密';

