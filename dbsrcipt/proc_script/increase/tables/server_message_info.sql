create table SERVER_MESSAGE_INFO
(
  id        VARCHAR2(32 CHAR) not null,
  value     VARCHAR2(100 CHAR),
  chn       VARCHAR2(100 CHAR),
  code      VARCHAR2(100 CHAR),
  data_desc VARCHAR2(1000 CHAR)
)
;
comment on table SERVER_MESSAGE_INFO
  is 'Ӧ��ϵͳ������';
comment on column SERVER_MESSAGE_INFO.id
  is '����ID';
comment on column SERVER_MESSAGE_INFO.chn
  is '������';
comment on column SERVER_MESSAGE_INFO.code
  is '����';
comment on column SERVER_MESSAGE_INFO.data_desc
  is '������Ϣ';
alter table SERVER_MESSAGE_INFO
  add constraint PK_ID primary key (ID);

