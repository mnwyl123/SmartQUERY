create table COM_GUARANTEE_DET
(
  report_id                VARCHAR2(30) not null,
  guar_trans_species_niche VARCHAR2(100),
  num_outstand_account     VARCHAR2(100),
  in_sixty_day_bal_num     VARCHAR2(100),
  type_org                 VARCHAR2(100),
  code_org                 VARCHAR2(100),
  guar_accout_id           VARCHAR2(100),
  after_ninety_day_bal_num VARCHAR2(100),
  five_cla                 VARCHAR2(100),
  num_acc_settle           VARCHAR2(100),
  balance_num              VARCHAR2(100),
  in_thirty_day_bal_num    VARCHAR2(100),
  in_ninety_day_bal_num    VARCHAR2(100),
  advances                 VARCHAR2(100)
)
;
comment on table COM_GUARANTEE_DET
  is '担保账户分机构汇总信息单元';
comment on column COM_GUARANTEE_DET.report_id
  is '报告编号';
comment on column COM_GUARANTEE_DET.guar_trans_species_niche
  is '担保交易业务种类细分';
comment on column COM_GUARANTEE_DET.num_outstand_account
  is '未结清账户数';
comment on column COM_GUARANTEE_DET.in_sixty_day_bal_num
  is '60 天内到期的余额';
comment on column COM_GUARANTEE_DET.type_org
  is '业务管理机构类型';
comment on column COM_GUARANTEE_DET.code_org
  is '业务管理机构代码';
comment on column COM_GUARANTEE_DET.guar_accout_id
  is '担保账户分机构汇总信息编号';
comment on column COM_GUARANTEE_DET.after_ninety_day_bal_num
  is '90 天后到期的余额';
comment on column COM_GUARANTEE_DET.five_cla
  is '五级分类';
comment on column COM_GUARANTEE_DET.num_acc_settle
  is '已结清账户数';
comment on column COM_GUARANTEE_DET.balance_num
  is '余额';
comment on column COM_GUARANTEE_DET.in_thirty_day_bal_num
  is '30 天内到期的余额';
comment on column COM_GUARANTEE_DET.in_ninety_day_bal_num
  is '90 天内到期的余额';
comment on column COM_GUARANTEE_DET.advances
  is '垫款标志';

