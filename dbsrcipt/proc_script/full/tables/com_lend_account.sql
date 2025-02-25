create table COM_LEND_ACCOUNT
(
  report_id              VARCHAR2(30) not null,
  smart_lend_bus         VARCHAR2(100),
  num_cred_agree         VARCHAR2(100),
  big_lend_bus           VARCHAR2(100),
  num_lend_account       VARCHAR2(100),
  other_repay_way        VARCHAR2(100),
  issue_way              VARCHAR2(100),
  date_close             VARCHAR2(100),
  type_account_lend      VARCHAR2(100),
  type_bus_mana_org      VARCHAR2(100),
  code_bus_mana_org      VARCHAR2(100),
  len_sum                VARCHAR2(100),
  date_info_report       VARCHAR2(100),
  time_lim_len           VARCHAR2(100),
  date_account_open      VARCHAR2(100),
  cred_line              VARCHAR2(100),
  due_time               VARCHAR2(100),
  jio_loan_mark          VARCHAR2(100),
  state_lend_account_act VARCHAR2(100),
  currency               VARCHAR2(100),
  guar_way               VARCHAR2(100),
  num_repay_record       VARCHAR2(100),
  num_spe_trans          VARCHAR2(100),
  serial                 VARCHAR2(100)
)
;
comment on table COM_LEND_ACCOUNT
  is '借贷账户信息单元';
comment on column COM_LEND_ACCOUNT.report_id
  is '报告编号';
comment on column COM_LEND_ACCOUNT.smart_lend_bus
  is '借贷业务种类细分';
comment on column COM_LEND_ACCOUNT.num_cred_agree
  is '授信协议编号';
comment on column COM_LEND_ACCOUNT.big_lend_bus
  is '借贷业务种类大类';
comment on column COM_LEND_ACCOUNT.num_lend_account
  is '借贷账户编号';
comment on column COM_LEND_ACCOUNT.other_repay_way
  is '其他还款保证方式';
comment on column COM_LEND_ACCOUNT.issue_way
  is '发放形式';
comment on column COM_LEND_ACCOUNT.date_close
  is '关闭日期';
comment on column COM_LEND_ACCOUNT.type_account_lend
  is '借贷账户类型';
comment on column COM_LEND_ACCOUNT.type_bus_mana_org
  is '业务管理机构类型';
comment on column COM_LEND_ACCOUNT.code_bus_mana_org
  is '业务管理机构代码';
comment on column COM_LEND_ACCOUNT.len_sum
  is '借款金额';
comment on column COM_LEND_ACCOUNT.date_info_report
  is '信息报告日期';
comment on column COM_LEND_ACCOUNT.time_lim_len
  is '借款期限';
comment on column COM_LEND_ACCOUNT.date_account_open
  is '开户日期';
comment on column COM_LEND_ACCOUNT.cred_line
  is '信用额度';
comment on column COM_LEND_ACCOUNT.due_time
  is '到期日期';
comment on column COM_LEND_ACCOUNT.jio_loan_mark
  is '共同借款标识';
comment on column COM_LEND_ACCOUNT.state_lend_account_act
  is '账户活动状态';
comment on column COM_LEND_ACCOUNT.currency
  is '币种';
comment on column COM_LEND_ACCOUNT.guar_way
  is '担保方式';
comment on column COM_LEND_ACCOUNT.num_repay_record
  is '还款表现记录条数';
comment on column COM_LEND_ACCOUNT.num_spe_trans
  is '特定交易个数';
comment on column COM_LEND_ACCOUNT.serial
  is '编号';

