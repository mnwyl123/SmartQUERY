create table COM_OBTAIN_QUAL
(
  report_id    VARCHAR2(30) not null,
  app_date     VARCHAR2(100),
  content_qual VARCHAR2(200),
  qual_id      VARCHAR2(100),
  qual_type    VARCHAR2(100),
  qual_name    VARCHAR2(100),
  date_end     VARCHAR2(100)
)
;
comment on table COM_OBTAIN_QUAL
  is '获得资质记录信息单元';
comment on column COM_OBTAIN_QUAL.report_id
  is '报告编号';
comment on column COM_OBTAIN_QUAL.app_date
  is '批准日期';
comment on column COM_OBTAIN_QUAL.content_qual
  is '资质内容';
comment on column COM_OBTAIN_QUAL.qual_id
  is '资质记录编号';
comment on column COM_OBTAIN_QUAL.qual_type
  is '资质类型';
comment on column COM_OBTAIN_QUAL.qual_name
  is '认定部门名称';
comment on column COM_OBTAIN_QUAL.date_end
  is '截止日期';

