create table COM_PROFIT_INFO_SEVEN_INFO
(
  report_id          VARCHAR2(30) not null,
  income_bus         VARCHAR2(100),
  fina_cost          VARCHAR2(100),
  unflow_loss        VARCHAR2(100),
  fina_id            VARCHAR2(100),
  sale_cost          VARCHAR2(100),
  mana_cost          VARCHAR2(100),
  inves_income       VARCHAR2(100),
  buss_other_incom   VARCHAR2(100),
  dilu_ear_per_share VARCHAR2(100),
  report_year        VARCHAR2(100),
  income_cost        VARCHAR2(100),
  buss_other_pay     VARCHAR2(100),
  bus_tax_other      VARCHAR2(100),
  buss_profits       VARCHAR2(100),
  report_type        VARCHAR2(100),
  smart_type_report  VARCHAR2(100),
  loss_redu          VARCHAR2(100),
  sum_profits        VARCHAR2(100),
  incom_join_venture VARCHAR2(100),
  income_tax         VARCHAR2(100),
  net_profit         VARCHAR2(100),
  num_fina           VARCHAR2(100),
  num_org            VARCHAR2(100),
  chang_incom        VARCHAR2(100),
  every_net_income   VARCHAR2(100)
)
;
comment on table COM_PROFIT_INFO_SEVEN_INFO
  is '企业利润及利润分配表（2007 版）信息单元';
comment on column COM_PROFIT_INFO_SEVEN_INFO.report_id
  is '报告编号';
comment on column COM_PROFIT_INFO_SEVEN_INFO.income_bus
  is '营业收入';
comment on column COM_PROFIT_INFO_SEVEN_INFO.fina_cost
  is '财务费用';
comment on column COM_PROFIT_INFO_SEVEN_INFO.unflow_loss
  is '非流动资产损失（其中：非流动资产处置损失)';
comment on column COM_PROFIT_INFO_SEVEN_INFO.fina_id
  is '财务报表编号';
comment on column COM_PROFIT_INFO_SEVEN_INFO.sale_cost
  is '销售费用';
comment on column COM_PROFIT_INFO_SEVEN_INFO.mana_cost
  is '管理费用';
comment on column COM_PROFIT_INFO_SEVEN_INFO.inves_income
  is '投资净收益';
comment on column COM_PROFIT_INFO_SEVEN_INFO.buss_other_incom
  is '营业外收入';
comment on column COM_PROFIT_INFO_SEVEN_INFO.dilu_ear_per_share
  is '稀释每股收益';
comment on column COM_PROFIT_INFO_SEVEN_INFO.report_year
  is '报表年份';
comment on column COM_PROFIT_INFO_SEVEN_INFO.income_cost
  is '营业成本';
comment on column COM_PROFIT_INFO_SEVEN_INFO.buss_other_pay
  is '营业外支出';
comment on column COM_PROFIT_INFO_SEVEN_INFO.bus_tax_other
  is '营业税金及附加';
comment on column COM_PROFIT_INFO_SEVEN_INFO.buss_profits
  is '营业利润';
comment on column COM_PROFIT_INFO_SEVEN_INFO.report_type
  is '报表类型';
comment on column COM_PROFIT_INFO_SEVEN_INFO.smart_type_report
  is '报表类型细分';
comment on column COM_PROFIT_INFO_SEVEN_INFO.loss_redu
  is '资产减值损失';
comment on column COM_PROFIT_INFO_SEVEN_INFO.sum_profits
  is '利润总额';
comment on column COM_PROFIT_INFO_SEVEN_INFO.incom_join_venture
  is '对联营企业和合营企业的投资收益';
comment on column COM_PROFIT_INFO_SEVEN_INFO.income_tax
  is '所得税费用';
comment on column COM_PROFIT_INFO_SEVEN_INFO.net_profit
  is '净利润';
comment on column COM_PROFIT_INFO_SEVEN_INFO.num_fina
  is '业务管理机构';
comment on column COM_PROFIT_INFO_SEVEN_INFO.num_org
  is '业务管理机构代码';
comment on column COM_PROFIT_INFO_SEVEN_INFO.chang_incom
  is '公允价值变动净收益';
comment on column COM_PROFIT_INFO_SEVEN_INFO.every_net_income
  is '基本每股收益';

