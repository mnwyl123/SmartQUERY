create table COM_BOR_UNDISCOUNT
(
  report_id        VARCHAR2(30) not null,
  num_guar_contra  VARCHAR2(100),
  cred_id          VARCHAR2(100),
  code_org         VARCHAR2(100),
  five_cla         VARCHAR2(100),
  stat_repay       VARCHAR2(100),
  type_business    VARCHAR2(100),
  len_sum          VARCHAR2(100),
  smart_bus        VARCHAR2(100),
  line_credit      VARCHAR2(100),
  type_bor         VARCHAR2(100),
  currency         VARCHAR2(100),
  over_sum         VARCHAR2(100),
  type_repay_pes   VARCHAR2(100),
  type_org         VARCHAR2(100),
  over_month       VARCHAR2(100),
  num_month_remain VARCHAR2(100),
  type_acc         VARCHAR2(100),
  currency_repay   VARCHAR2(100),
  due_time_date    VARCHAR2(100),
  over_principal   VARCHAR2(100),
  date_info_report VARCHAR2(100),
  repay_resp_bala  VARCHAR2(100),
  date_open        VARCHAR2(100),
  balance_num      VARCHAR2(100)
);
comment on table COM_BOR_UNDISCOUNT
  is '相关还款责任借贷账户（不含贴现）信息单元';
comment on column COM_BOR_UNDISCOUNT.report_id
  is '报告编号';
comment on column COM_BOR_UNDISCOUNT.num_guar_contra
  is '保证合同编号';
comment on column COM_BOR_UNDISCOUNT.cred_id
  is '账户编号';
comment on column COM_BOR_UNDISCOUNT.code_org
  is '业务管理机构代码';
comment on column COM_BOR_UNDISCOUNT.five_cla
  is '五级分类';
comment on column COM_BOR_UNDISCOUNT.stat_repay
  is '还款状态';
comment on column COM_BOR_UNDISCOUNT.type_business
  is '业务种类';
comment on column COM_BOR_UNDISCOUNT.len_sum
  is '借款金额';
comment on column COM_BOR_UNDISCOUNT.smart_bus
  is '业务种类细分';
comment on column COM_BOR_UNDISCOUNT.line_credit
  is '信用额度';
comment on column COM_BOR_UNDISCOUNT.type_bor
  is '主借款人身份类别';
comment on column COM_BOR_UNDISCOUNT.currency
  is '币种';
comment on column COM_BOR_UNDISCOUNT.over_sum
  is '逾期总额';
comment on column COM_BOR_UNDISCOUNT.type_repay_pes
  is '相关还款责任人类型';
comment on column COM_BOR_UNDISCOUNT.type_org
  is '业务管理机构类型';
comment on column COM_BOR_UNDISCOUNT.over_month
  is '逾期月数';
comment on column COM_BOR_UNDISCOUNT.num_month_remain
  is '剩余还款月数';
comment on column COM_BOR_UNDISCOUNT.type_acc
  is '账户类型';
comment on column COM_BOR_UNDISCOUNT.currency_repay
  is '币种（相关还款责任金额）';
comment on column COM_BOR_UNDISCOUNT.due_time_date
  is '到期日期';
comment on column COM_BOR_UNDISCOUNT.over_principal
  is '逾期本金';
comment on column COM_BOR_UNDISCOUNT.date_info_report
  is '信息报告日期';
comment on column COM_BOR_UNDISCOUNT.repay_resp_bala
  is '相关还款责任金额';
comment on column COM_BOR_UNDISCOUNT.date_open
  is '开立日期';
comment on column COM_BOR_UNDISCOUNT.balance_num
  is '余额';

