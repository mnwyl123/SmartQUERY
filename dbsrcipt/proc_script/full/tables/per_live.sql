create table PER_LIVE
(
  report_id              VARCHAR2(30) not null,
  serial                 VARCHAR2(10),
  residential_address    VARCHAR2(300),
  residential_condition  VARCHAR2(50),
  update_time            VARCHAR2(20),
  house_tel              VARCHAR2(100),
  residential_condition2 VARCHAR2(50)
)
;
comment on table PER_LIVE
  is '居住信息表';
comment on column PER_LIVE.report_id
  is '报告编号';
comment on column PER_LIVE.serial
  is '编号';
comment on column PER_LIVE.residential_address
  is '居住地址';
comment on column PER_LIVE.residential_condition
  is '居住状况';
comment on column PER_LIVE.update_time
  is '信息更新日期';
comment on column PER_LIVE.house_tel
  is '住宅电话';

