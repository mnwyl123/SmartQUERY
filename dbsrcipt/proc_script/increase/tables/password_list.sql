create table PASSWORD_LIST
(
  pwd_code    VARCHAR2(10),
  password    VARCHAR2(50),
  pwd_encrypt VARCHAR2(500)
)
;
comment on table PASSWORD_LIST
  is '�������б�';
comment on column PASSWORD_LIST.pwd_code
  is '������';
comment on column PASSWORD_LIST.password
  is '��������';
comment on column PASSWORD_LIST.pwd_encrypt
  is '�������';

