create table COM_BOR_DISCOUNT
(
  report_id       VARCHAR2(30) not null,
  dis_org_id      VARCHAR2(100),
  repay_resp_bala VARCHAR2(100),
  over_principal  VARCHAR2(100),
  five_cla        VARCHAR2(100),
  smart_bus       VARCHAR2(100),
  repay_resp_type VARCHAR2(100),
  type_org        VARCHAR2(100),
  balance_num     VARCHAR2(100),
  len_sum         VARCHAR2(100),
  num_guar_contra VARCHAR2(100),
  code_org        VARCHAR2(100),
  over_sum        VARCHAR2(100),
  num_account     VARCHAR2(100)
)
;
comment on table COM_BOR_DISCOUNT
  is '相关还款责任贴现账户分机构汇总信息单元';
comment on column COM_BOR_DISCOUNT.report_id
  is '报告编号';
comment on column COM_BOR_DISCOUNT.dis_org_id
  is '贴现账户分机构汇总信息编号';
comment on column COM_BOR_DISCOUNT.repay_resp_bala
  is '相关还款责任金额';
comment on column COM_BOR_DISCOUNT.over_principal
  is '逾期本金';
comment on column COM_BOR_DISCOUNT.five_cla
  is '五级分类';
comment on column COM_BOR_DISCOUNT.smart_bus
  is '业务种类细分';
comment on column COM_BOR_DISCOUNT.repay_resp_type
  is '相关还款责任类型';
comment on column COM_BOR_DISCOUNT.type_org
  is '业务管理机构类型';
comment on column COM_BOR_DISCOUNT.balance_num
  is '余额';
comment on column COM_BOR_DISCOUNT.len_sum
  is '借款金额';
comment on column COM_BOR_DISCOUNT.num_guar_contra
  is '保证合同编号';
comment on column COM_BOR_DISCOUNT.code_org
  is '业务管理机构代码';
comment on column COM_BOR_DISCOUNT.over_sum
  is '逾期总额';
comment on column COM_BOR_DISCOUNT.num_account
  is '账户数';

