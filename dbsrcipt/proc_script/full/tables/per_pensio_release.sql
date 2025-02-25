create table PER_PENSIO_RELEASE
(
  report_id        VARCHAR2(30) not null,
  serial           VARCHAR2(10),
  rel_place        VARCHAR2(100),
  retired_type     VARCHAR2(50),
  retired_month    VARCHAR2(20),
  start_work_mon   VARCHAR2(20),
  rel_sum_cur_mon  VARCHAR2(20),
  stop_rel_reason  VARCHAR2(100),
  original_comapny VARCHAR2(200),
  update_time      VARCHAR2(20)
)
;
comment on table PER_PENSIO_RELEASE
  is '养老保险金发放记录';
comment on column PER_PENSIO_RELEASE.report_id
  is '报告编号';
comment on column PER_PENSIO_RELEASE.serial
  is '编号';
comment on column PER_PENSIO_RELEASE.rel_place
  is '发放地';
comment on column PER_PENSIO_RELEASE.retired_type
  is '离退休类别';
comment on column PER_PENSIO_RELEASE.retired_month
  is '离退休月份';
comment on column PER_PENSIO_RELEASE.start_work_mon
  is '参加工作月份';
comment on column PER_PENSIO_RELEASE.rel_sum_cur_mon
  is '本月实发养老金';
comment on column PER_PENSIO_RELEASE.stop_rel_reason
  is '停发原因';
comment on column PER_PENSIO_RELEASE.original_comapny
  is '原单位名称';
comment on column PER_PENSIO_RELEASE.update_time
  is '信息更新日期';

