create table PER_OTHER_IDENTITY
(
  report_id        VARCHAR2(30) not null,
  credentials_type VARCHAR2(100),
  credentials_no   VARCHAR2(100)
)
;
comment on table PER_OTHER_IDENTITY
  is '其他身份标识信息段';
comment on column PER_OTHER_IDENTITY.report_id
  is '报告编号';
comment on column PER_OTHER_IDENTITY.credentials_type
  is '证件类型';
comment on column PER_OTHER_IDENTITY.credentials_no
  is '证件号码';

