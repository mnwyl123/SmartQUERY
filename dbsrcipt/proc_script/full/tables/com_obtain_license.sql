create table COM_OBTAIN_LICENSE
(
  report_id       VARCHAR2(30) not null,
  obtain_name     VARCHAR2(100),
  date_end        VARCHAR2(100),
  type_obtain     VARCHAR2(100),
  date_obtain     VARCHAR2(100),
  obtain_id       VARCHAR2(100),
  content_license VARCHAR2(1000)
)
;
comment on table COM_OBTAIN_LICENSE
  is '获得许可记录信息单元';
comment on column COM_OBTAIN_LICENSE.report_id
  is '报告编号';
comment on column COM_OBTAIN_LICENSE.obtain_name
  is '许可部门名称';
comment on column COM_OBTAIN_LICENSE.date_end
  is '截止日期';
comment on column COM_OBTAIN_LICENSE.type_obtain
  is '许可类型';
comment on column COM_OBTAIN_LICENSE.date_obtain
  is '许可日期';
comment on column COM_OBTAIN_LICENSE.obtain_id
  is '许可记录编号';
comment on column COM_OBTAIN_LICENSE.content_license
  is '许可内容';

