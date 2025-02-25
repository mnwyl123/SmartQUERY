create table COM_CREDIT_INFO_DATA
(
  report_id        VARCHAR2(30) not null,
  cr_credit_sum    VARCHAR2(100),
  cr_used_sum      VARCHAR2(100),
  cr_lim           VARCHAR2(100),
  code_org         VARCHAR2(100),
  end_date         VARCHAR2(100),
  date_info_report VARCHAR2(100),
  effec_date       VARCHAR2(100),
  type_org         VARCHAR2(100),
  currency         VARCHAR2(100),
  cred_id          VARCHAR2(100),
  quota_cyc_mark   VARCHAR2(100),
  type_cerd        VARCHAR2(100),
  cr_lim_id        VARCHAR2(100)
)
;
comment on table COM_CREDIT_INFO_DATA
  is '授信协议信息单元';
comment on column COM_CREDIT_INFO_DATA.report_id
  is '报告编号';
comment on column COM_CREDIT_INFO_DATA.cr_credit_sum
  is '授信额度';
comment on column COM_CREDIT_INFO_DATA.cr_used_sum
  is '已用额度';
comment on column COM_CREDIT_INFO_DATA.cr_lim
  is '授信限额';
comment on column COM_CREDIT_INFO_DATA.code_org
  is '业务管理机构代码';
comment on column COM_CREDIT_INFO_DATA.end_date
  is '终止日期';
comment on column COM_CREDIT_INFO_DATA.date_info_report
  is '信息报告日期';
comment on column COM_CREDIT_INFO_DATA.effec_date
  is '生效日期';
comment on column COM_CREDIT_INFO_DATA.type_org
  is '业务管理机构类型';
comment on column COM_CREDIT_INFO_DATA.currency
  is '币种';
comment on column COM_CREDIT_INFO_DATA.cred_id
  is '授信协议编号';
comment on column COM_CREDIT_INFO_DATA.quota_cyc_mark
  is '额度循环标志';
comment on column COM_CREDIT_INFO_DATA.type_cerd
  is '授信额度类型';
comment on column COM_CREDIT_INFO_DATA.cr_lim_id
  is '授信限额编号';

