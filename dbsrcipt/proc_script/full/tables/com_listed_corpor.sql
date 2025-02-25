create table COM_LISTED_CORPOR
(
  report_id  VARCHAR2(30) not null,
  report_org VARCHAR2(100),
  matter     VARCHAR2(200),
  info_date  VARCHAR2(20)
)
;
comment on table COM_LISTED_CORPOR
  is '上市公司或有事项';
comment on column COM_LISTED_CORPOR.report_id
  is '报告编号';
comment on column COM_LISTED_CORPOR.report_org
  is '上报机构';
comment on column COM_LISTED_CORPOR.matter
  is '或有事项';
comment on column COM_LISTED_CORPOR.info_date
  is '信息日期';

