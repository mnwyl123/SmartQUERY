create table COM_RAT_INFO
(
  report_id VARCHAR2(30) not null,
  rat_res   VARCHAR2(100),
  rat_date  VARCHAR2(100),
  rat_id    VARCHAR2(100),
  rat_name  VARCHAR2(100)
)
;
comment on table COM_RAT_INFO
  is '评级信息单元';
comment on column COM_RAT_INFO.report_id
  is '报告编号';
comment on column COM_RAT_INFO.rat_res
  is '评级结果';
comment on column COM_RAT_INFO.rat_date
  is '评级日期';
comment on column COM_RAT_INFO.rat_id
  is '评级信息编号';
comment on column COM_RAT_INFO.rat_name
  is '评级机构名称';

