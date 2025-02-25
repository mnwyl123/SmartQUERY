create table COM_REPAY_GUAR
(
  report_id       VARCHAR2(30) not null,
  guar_accout_id  VARCHAR2(100),
  five_cla        VARCHAR2(100),
  num_account     VARCHAR2(100),
  repay_resp_type VARCHAR2(100),
  balance_num     VARCHAR2(100),
  repay_resp_bala VARCHAR2(100),
  guar_sum        VARCHAR2(100),
  smart_bus       VARCHAR2(100),
  type_org        VARCHAR2(100),
  code_org        VARCHAR2(100),
  num_guar_contra VARCHAR2(100)
)
;
comment on table COM_REPAY_GUAR
  is '相关还款责任担保账户分机构汇总信息单元';
comment on column COM_REPAY_GUAR.report_id
  is '报告编号';
comment on column COM_REPAY_GUAR.guar_accout_id
  is '担保账户分机构汇总信息编号';
comment on column COM_REPAY_GUAR.five_cla
  is '五级分类';
comment on column COM_REPAY_GUAR.num_account
  is '账户数';
comment on column COM_REPAY_GUAR.repay_resp_type
  is '相关还款责任类型';
comment on column COM_REPAY_GUAR.balance_num
  is '余额';
comment on column COM_REPAY_GUAR.repay_resp_bala
  is '相关还款责任金额';
comment on column COM_REPAY_GUAR.guar_sum
  is '担保金额';
comment on column COM_REPAY_GUAR.smart_bus
  is '业务种类细分';
comment on column COM_REPAY_GUAR.type_org
  is '业务管理机构类型';
comment on column COM_REPAY_GUAR.code_org
  is '业务管理机构代码';
comment on column COM_REPAY_GUAR.num_guar_contra
  is '保证合同编号';

