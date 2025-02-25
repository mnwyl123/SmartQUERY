create table SYS_OPERATION_LOG
(
  log_id         VARCHAR2(50),
  user_id        VARCHAR2(100),
  username       VARCHAR2(20),
  name           VARCHAR2(50),
  org            VARCHAR2(50),
  ip             VARCHAR2(20),
  mac            VARCHAR2(50),
  operation_url  VARCHAR2(200),
  operation_time VARCHAR2(20),
  operation_desc VARCHAR2(500)
)
;
comment on table SYS_OPERATION_LOG
  is '平台操作日志表，记录操作平台各功能的信息';
comment on column SYS_OPERATION_LOG.log_id
  is '日志流水号';
comment on column SYS_OPERATION_LOG.user_id
  is '访问者用户Key';
comment on column SYS_OPERATION_LOG.username
  is '访问者用户编码';
comment on column SYS_OPERATION_LOG.name
  is '访问者用户名称';
comment on column SYS_OPERATION_LOG.org
  is '访问者所属机构';
comment on column SYS_OPERATION_LOG.ip
  is '访问者IP地址';
comment on column SYS_OPERATION_LOG.mac
  is '访问者MAC地址';
comment on column SYS_OPERATION_LOG.operation_url
  is '访问URL';
comment on column SYS_OPERATION_LOG.operation_time
  is '操作时间，年月日 时分秒';
comment on column SYS_OPERATION_LOG.operation_desc
  is '具体操作的描述';

