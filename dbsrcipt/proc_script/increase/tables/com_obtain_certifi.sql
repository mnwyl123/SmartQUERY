create table COM_OBTAIN_CERTIFI
(
  report_id       VARCHAR2(30) not null,
  certifi_type    VARCHAR2(100),
  content_certifi VARCHAR2(200),
  certifi_id      VARCHAR2(100),
  certifi_date    VARCHAR2(100),
  date_end        VARCHAR2(100),
  certifi_name    VARCHAR2(100)
)
;
comment on table COM_OBTAIN_CERTIFI
  is '获得认证记录信息单元';
comment on column COM_OBTAIN_CERTIFI.report_id
  is '报告编号';
comment on column COM_OBTAIN_CERTIFI.certifi_type
  is '认证类型';
comment on column COM_OBTAIN_CERTIFI.content_certifi
  is '认证内容';
comment on column COM_OBTAIN_CERTIFI.certifi_id
  is '认证记录编号';
comment on column COM_OBTAIN_CERTIFI.certifi_date
  is '认证日期';
comment on column COM_OBTAIN_CERTIFI.date_end
  is '截止日期';
comment on column COM_OBTAIN_CERTIFI.certifi_name
  is '认证部门名称';

