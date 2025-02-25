create table PER_CRED_BASE_INFO
(
  report_id      VARCHAR2(30) not null,
  buss_org_code  VARCHAR2(100),
  cred_quota_use VARCHAR2(100),
  cred_quota     VARCHAR2(100),
  cred_status    VARCHAR2(100),
  cred_limit     VARCHAR2(100),
  label_cnt      VARCHAR2(100),
  buss_org_type  VARCHAR2(100),
  expi_date      VARCHAR2(100),
  cred_limit_num VARCHAR2(100),
  cred_sign      VARCHAR2(100),
  currency       VARCHAR2(100),
  effe_date      VARCHAR2(100),
  used_quota     VARCHAR2(100),
  cred_num       VARCHAR2(100),
  serial         VARCHAR2(100)
)
;
comment on table PER_CRED_BASE_INFO
  is '授信协议基本信息段';
comment on column PER_CRED_BASE_INFO.report_id
  is '报告编号';
comment on column PER_CRED_BASE_INFO.buss_org_code
  is '业务管理机构';
comment on column PER_CRED_BASE_INFO.cred_quota_use
  is '授信额度用途';
comment on column PER_CRED_BASE_INFO.cred_quota
  is '授信额度';
comment on column PER_CRED_BASE_INFO.cred_status
  is '授信协议状态';
comment on column PER_CRED_BASE_INFO.cred_limit
  is '授信限额';
comment on column PER_CRED_BASE_INFO.label_cnt
  is '标注及声明个数';
comment on column PER_CRED_BASE_INFO.buss_org_type
  is '业务管理机构类型';
comment on column PER_CRED_BASE_INFO.expi_date
  is '到期日期';
comment on column PER_CRED_BASE_INFO.cred_limit_num
  is '授信限额编号';
comment on column PER_CRED_BASE_INFO.cred_sign
  is '授信协议标识';
comment on column PER_CRED_BASE_INFO.currency
  is '币种';
comment on column PER_CRED_BASE_INFO.effe_date
  is '生效日期';
comment on column PER_CRED_BASE_INFO.used_quota
  is '已用额度';
comment on column PER_CRED_BASE_INFO.cred_num
  is '授信协议编号';

