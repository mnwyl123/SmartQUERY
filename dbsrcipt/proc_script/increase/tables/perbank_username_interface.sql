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
  is '�ӿ��û������˻�������Ϣ';
comment on column PERBANK_USERNAME_INTERFACE.username
  is '�����˺�';
comment on column PERBANK_USERNAME_INTERFACE.previous_password
  is 'ԭ����';
comment on column PERBANK_USERNAME_INTERFACE.current_password
  is '������';
comment on column PERBANK_USERNAME_INTERFACE.update_time
  is '��������ʱ��';
comment on column PERBANK_USERNAME_INTERFACE.resultcode
  is '����������';
comment on column PERBANK_USERNAME_INTERFACE.resultdesc
  is '����������';
comment on column PERBANK_USERNAME_INTERFACE.modifresultcode
  is '�޸Ľ������';
comment on column PERBANK_USERNAME_INTERFACE.errdesc
  is '����ԭ������';
alter table PERBANK_USERNAME_INTERFACE
  add constraint PK_USERNAME primary key (USERNAME);

