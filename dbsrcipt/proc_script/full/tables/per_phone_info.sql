create table PER_PHONE_INFO
(
  report_id   VARCHAR2(30) not null,
  phone_num   VARCHAR2(100),
  update_date VARCHAR2(100)
)
;
comment on table PER_PHONE_INFO
  is '手机号码信息';
comment on column PER_PHONE_INFO.report_id
  is '报告编号';
comment on column PER_PHONE_INFO.phone_num
  is '手机号码';
comment on column PER_PHONE_INFO.update_date
  is '信息更新日期';

