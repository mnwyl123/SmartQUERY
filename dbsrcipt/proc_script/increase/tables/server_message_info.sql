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
  is '应用系统参数表';
comment on column SERVER_MESSAGE_INFO.id
  is '数据ID';
comment on column SERVER_MESSAGE_INFO.chn
  is '中文名';
comment on column SERVER_MESSAGE_INFO.code
  is '编码';
comment on column SERVER_MESSAGE_INFO.data_desc
  is '描述信息';
alter table SERVER_MESSAGE_INFO
  add constraint PK_ID primary key (ID);

