create table PER_LARGE_DIVIDE_INFO
(
  report_id VARCHAR2(30) not null,
  expi_date VARCHAR2(100),
  effe_date VARCHAR2(100),
  used_sum  VARCHAR2(100),
  serial    VARCHAR2(100),
  div_quota VARCHAR2(100)
)
;
comment on table PER_LARGE_DIVIDE_INFO
  is '大额专项分期信息';
comment on column PER_LARGE_DIVIDE_INFO.report_id
  is '报告编号';
comment on column PER_LARGE_DIVIDE_INFO.expi_date
  is '分期额度到期日期';
comment on column PER_LARGE_DIVIDE_INFO.effe_date
  is '分期额度生效日期';
comment on column PER_LARGE_DIVIDE_INFO.used_sum
  is '已用分期金额';
comment on column PER_LARGE_DIVIDE_INFO.serial
  is '账户编号';
comment on column PER_LARGE_DIVIDE_INFO.div_quota
  is '大额专项分期额度';

