create table SYS_SMS
(
  sms_id        VARCHAR2(100) not null,
  content       VARCHAR2(1000),
  type          VARCHAR2(5),
  to_username   VARCHAR2(255),
  from_username VARCHAR2(255),
  send_time     VARCHAR2(100),
  status        VARCHAR2(5),
  sanme_id      VARCHAR2(100)
)
;
comment on table SYS_SMS
  is '站内信';
comment on column SYS_SMS.sms_id
  is '站内信ID';
comment on column SYS_SMS.content
  is '站内信内容';
comment on column SYS_SMS.type
  is '站内信类型';
comment on column SYS_SMS.to_username
  is '收信人';
comment on column SYS_SMS.from_username
  is '发信人';
comment on column SYS_SMS.send_time
  is '发信时间';
comment on column SYS_SMS.status
  is '状态';

