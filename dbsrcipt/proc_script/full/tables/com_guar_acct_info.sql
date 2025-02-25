create table COM_GUAR_ACCT_INFO
(
  report_id                VARCHAR2(30) not null,
  num_cred_agree           VARCHAR2(100),
  date_open                VARCHAR2(100),
  due_time_date            VARCHAR2(100),
  guar_trans_species_niche VARCHAR2(100),
  type_acc_guar            VARCHAR2(100),
  type_org                 VARCHAR2(100),
  code_org                 VARCHAR2(100),
  guar_accout_id           VARCHAR2(100),
  balance_num              VARCHAR2(100),
  way_counter_guar         VARCHAR2(100),
  others_repay_ensure_way  VARCHAR2(100),
  margin_percent           VARCHAR2(100),
  currency                 VARCHAR2(100),
  date_report_info_zb      VARCHAR2(100),
  state_lend_accou_zb      VARCHAR2(100),
  balance_num_zb           VARCHAR2(100),
  five_cla_zb              VARCHAR2(100),
  exposure_to_zb           VARCHAR2(100),
  advances_zb              VARCHAR2(100),
  common_debt_indenti_zb   VARCHAR2(100),
  date_close_zb            VARCHAR2(100)
)
;
comment on table COM_GUAR_ACCT_INFO
  is '担保账户信息单元';
comment on column COM_GUAR_ACCT_INFO.report_id
  is '报告编号';
comment on column COM_GUAR_ACCT_INFO.num_cred_agree
  is '授信协议编号';
comment on column COM_GUAR_ACCT_INFO.date_open
  is '开立日期';
comment on column COM_GUAR_ACCT_INFO.due_time_date
  is '到期日期';
comment on column COM_GUAR_ACCT_INFO.guar_trans_species_niche
  is '担保交易业务种类细分';
comment on column COM_GUAR_ACCT_INFO.type_acc_guar
  is '担保账户类型';
comment on column COM_GUAR_ACCT_INFO.type_org
  is '业务管理机构类型';
comment on column COM_GUAR_ACCT_INFO.code_org
  is '业务管理机构代码';
comment on column COM_GUAR_ACCT_INFO.guar_accout_id
  is '担保账户编号';
comment on column COM_GUAR_ACCT_INFO.balance_num
  is '金额';
comment on column COM_GUAR_ACCT_INFO.way_counter_guar
  is '反担保方式';
comment on column COM_GUAR_ACCT_INFO.others_repay_ensure_way
  is '其他还款保证方式';
comment on column COM_GUAR_ACCT_INFO.margin_percent
  is '保证金比例';
comment on column COM_GUAR_ACCT_INFO.currency
  is '币种';
comment on column COM_GUAR_ACCT_INFO.date_report_info_zb
  is '在报信息报告日期';
comment on column COM_GUAR_ACCT_INFO.state_lend_accou_zb
  is '在报账户活动状态';
comment on column COM_GUAR_ACCT_INFO.balance_num_zb
  is '在报余额';
comment on column COM_GUAR_ACCT_INFO.five_cla_zb
  is '五级分类';
comment on column COM_GUAR_ACCT_INFO.exposure_to_zb
  is '在报风险敞口';
comment on column COM_GUAR_ACCT_INFO.advances_zb
  is '在报代偿（垫款）标志';
comment on column COM_GUAR_ACCT_INFO.common_debt_indenti_zb
  is '在报共同债务标识';
comment on column COM_GUAR_ACCT_INFO.date_close_zb
  is '在报关闭日期';

