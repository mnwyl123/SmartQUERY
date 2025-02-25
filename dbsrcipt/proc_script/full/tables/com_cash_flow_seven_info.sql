create table COM_CASH_FLOW_SEVEN_INFO
(
  report_id            VARCHAR2(30) not null,
  tax_receive_others   VARCHAR2(100),
  bus_acti_cash_folw   VARCHAR2(100),
  cash_bus_company     VARCHAR2(100),
  cash_long_term       VARCHAR2(100),
  smart_sum_ca_invest  VARCHAR2(100),
  rece_other_ac_cash   VARCHAR2(100),
  pay_others_cash      VARCHAR2(100),
  impact_exchange_rate VARCHAR2(100),
  seme_cash_bal        VARCHAR2(100),
  net_profit           VARCHAR2(100),
  invest_loss          VARCHAR2(100),
  reduce_tax           VARCHAR2(100),
  buss_should_reduce   VARCHAR2(100),
  debt_capital         VARCHAR2(100),
  cash_bala_star       VARCHAR2(100),
  others_no            VARCHAR2(100),
  smart_type_report    VARCHAR2(100),
  buy_cash             VARCHAR2(100),
  rece_comp_bus_cash   VARCHAR2(100),
  asset_prepare        VARCHAR2(100),
  depreciation         VARCHAR2(100),
  public_loss          VARCHAR2(100),
  reduce_invent        VARCHAR2(100),
  others               VARCHAR2(100),
  fina_id              VARCHAR2(100),
  tax_receive          VARCHAR2(100),
  long_term_invest     VARCHAR2(100),
  invest_cash_net      VARCHAR2(100),
  smart_sum_acti       VARCHAR2(100),
  start_seme_cash_bal  VARCHAR2(100),
  amortization         VARCHAR2(100),
  long_term_amor       VARCHAR2(100),
  fina_char            VARCHAR2(100),
  incres_tax           VARCHAR2(100),
  invest_rece_cash     VARCHAR2(100),
  repay_pay_cash       VARCHAR2(100),
  pay_cash             VARCHAR2(100),
  raise_acti_flow      VARCHAR2(100),
  raise_acti_line      VARCHAR2(100),
  amortization_reduce  VARCHAR2(100),
  fix_loss             VARCHAR2(100),
  increas_in           VARCHAR2(100),
  num_fina             VARCHAR2(100),
  cash                 VARCHAR2(100),
  sum_inve_cash_in     VARCHAR2(100),
  report_year          VARCHAR2(100),
  report_type          VARCHAR2(100),
  rece_invest_cash     VARCHAR2(100),
  pay_other_cash       VARCHAR2(100),
  buss_should_incres   VARCHAR2(100),
  cash_bala_end        VARCHAR2(100),
  cash_star_ba         VARCHAR2(100),
  num_org              VARCHAR2(100),
  sum_buss_cash_in     VARCHAR2(100),
  pay_some_tax         VARCHAR2(100),
  rece_inst_cash_other VARCHAR2(100),
  take_borro_rece_cash VARCHAR2(100),
  increas_withholding  VARCHAR2(100),
  bus_activ_cash       VARCHAR2(100),
  asset_fix_cap        VARCHAR2(100),
  pay_employ_cash      VARCHAR2(100),
  pay_buss_other_cash  VARCHAR2(100),
  sum_buss_cash_out    VARCHAR2(100),
  invest_pay_cash      VARCHAR2(100),
  cash_inve_absor      VARCHAR2(100),
  end_seme_cash_bal    VARCHAR2(100),
  asset_loss           VARCHAR2(100),
  year_company_debt    VARCHAR2(100),
  cash_end_ba          VARCHAR2(100)
)
;
comment on table COM_CASH_FLOW_SEVEN_INFO
  is '企业现金流量表（2007 版）信息单元';
comment on column COM_CASH_FLOW_SEVEN_INFO.report_id
  is '报告编号';
comment on column COM_CASH_FLOW_SEVEN_INFO.tax_receive_others
  is '收到其他与经营活动有关的现金';
comment on column COM_CASH_FLOW_SEVEN_INFO.bus_acti_cash_folw
  is '经营活动产生的现金流量净额';
comment on column COM_CASH_FLOW_SEVEN_INFO.cash_bus_company
  is '处置子公司及其他营业单位收到的现金净额';
comment on column COM_CASH_FLOW_SEVEN_INFO.cash_long_term
  is '购建固定资产无形资产和其他长期资产所支付的现金';
comment on column COM_CASH_FLOW_SEVEN_INFO.smart_sum_ca_invest
  is '投资活动现金流出小计';
comment on column COM_CASH_FLOW_SEVEN_INFO.rece_other_ac_cash
  is '收到其他与筹资活动有关的现金';
comment on column COM_CASH_FLOW_SEVEN_INFO.pay_others_cash
  is '支付其他与筹资活动有关的现金';
comment on column COM_CASH_FLOW_SEVEN_INFO.impact_exchange_rate
  is '汇率变动对现金及现金等价物的影响';
comment on column COM_CASH_FLOW_SEVEN_INFO.seme_cash_bal
  is '现金及现金等价物净增加额';
comment on column COM_CASH_FLOW_SEVEN_INFO.net_profit
  is '净利润';
comment on column COM_CASH_FLOW_SEVEN_INFO.invest_loss
  is '投资损失';
comment on column COM_CASH_FLOW_SEVEN_INFO.reduce_tax
  is '递延所得税资产减少';
comment on column COM_CASH_FLOW_SEVEN_INFO.buss_should_reduce
  is '经营性应收项目的减少';
comment on column COM_CASH_FLOW_SEVEN_INFO.debt_capital
  is '债务转为资本';
comment on column COM_CASH_FLOW_SEVEN_INFO.cash_bala_star
  is '现金的期初余额';
comment on column COM_CASH_FLOW_SEVEN_INFO.others_no
  is '（不涉及现金收支的投资和筹资活动科目下）其他';
comment on column COM_CASH_FLOW_SEVEN_INFO.smart_type_report
  is '报表类型细分';
comment on column COM_CASH_FLOW_SEVEN_INFO.buy_cash
  is '购买商品、接受劳务支付的现金';
comment on column COM_CASH_FLOW_SEVEN_INFO.rece_comp_bus_cash
  is '取得子公司及其他营业单位支付的现金净额';
comment on column COM_CASH_FLOW_SEVEN_INFO.asset_prepare
  is '资产减值准备';
comment on column COM_CASH_FLOW_SEVEN_INFO.depreciation
  is '固定资产折旧、油气资产折耗、生产性生物资产折旧';
comment on column COM_CASH_FLOW_SEVEN_INFO.public_loss
  is '公允价值变动损失';
comment on column COM_CASH_FLOW_SEVEN_INFO.reduce_invent
  is '存货的减少';
comment on column COM_CASH_FLOW_SEVEN_INFO.others
  is '（净利润调节为经营活动现金流量科目下）其他';
comment on column COM_CASH_FLOW_SEVEN_INFO.fina_id
  is '财务报表编号';
comment on column COM_CASH_FLOW_SEVEN_INFO.tax_receive
  is '收到的税费返还';
comment on column COM_CASH_FLOW_SEVEN_INFO.long_term_invest
  is '处置固定资产无形资产和其他长期资产所收回的现金净额';
comment on column COM_CASH_FLOW_SEVEN_INFO.invest_cash_net
  is '投资活动产生的现金流量净额';
comment on column COM_CASH_FLOW_SEVEN_INFO.smart_sum_acti
  is '筹资活动现金流入小计';
comment on column COM_CASH_FLOW_SEVEN_INFO.start_seme_cash_bal
  is '期初现金及现金等价物余额';
comment on column COM_CASH_FLOW_SEVEN_INFO.amortization
  is '无形资产摊销';
comment on column COM_CASH_FLOW_SEVEN_INFO.long_term_amor
  is '长期待摊费用摊销';
comment on column COM_CASH_FLOW_SEVEN_INFO.fina_char
  is '财务费用';
comment on column COM_CASH_FLOW_SEVEN_INFO.incres_tax
  is '递延所得税负债增加';
comment on column COM_CASH_FLOW_SEVEN_INFO.invest_rece_cash
  is '取得投资收益所收到的现金';
comment on column COM_CASH_FLOW_SEVEN_INFO.repay_pay_cash
  is '偿还债务所支付的现金';
comment on column COM_CASH_FLOW_SEVEN_INFO.pay_cash
  is '分配股利、利润或偿付利息所支付的现金';
comment on column COM_CASH_FLOW_SEVEN_INFO.raise_acti_flow
  is '筹资活动现金流出小计';
comment on column COM_CASH_FLOW_SEVEN_INFO.raise_acti_line
  is '筹集活动产生的现金流量净额';
comment on column COM_CASH_FLOW_SEVEN_INFO.amortization_reduce
  is '待摊费用减少';
comment on column COM_CASH_FLOW_SEVEN_INFO.fix_loss
  is '固定资产报废损失';
comment on column COM_CASH_FLOW_SEVEN_INFO.increas_in
  is '现金及现金等价物净增加额';
comment on column COM_CASH_FLOW_SEVEN_INFO.num_fina
  is '业务管理机构';
comment on column COM_CASH_FLOW_SEVEN_INFO.cash
  is '销售商品和提供劳务收到的现金';
comment on column COM_CASH_FLOW_SEVEN_INFO.sum_inve_cash_in
  is '投资活动现金流入小计';
comment on column COM_CASH_FLOW_SEVEN_INFO.report_year
  is '报表年份';
comment on column COM_CASH_FLOW_SEVEN_INFO.report_type
  is '报表类型';
comment on column COM_CASH_FLOW_SEVEN_INFO.rece_invest_cash
  is '收回投资所收到的现金';
comment on column COM_CASH_FLOW_SEVEN_INFO.pay_other_cash
  is '支付其他与投资活动有关的现金';
comment on column COM_CASH_FLOW_SEVEN_INFO.buss_should_incres
  is '经营性应付项目的增加';
comment on column COM_CASH_FLOW_SEVEN_INFO.cash_bala_end
  is '现金的期末余额';
comment on column COM_CASH_FLOW_SEVEN_INFO.cash_star_ba
  is '现金等价物的期初余额';
comment on column COM_CASH_FLOW_SEVEN_INFO.num_org
  is '业务管理机构代码';
comment on column COM_CASH_FLOW_SEVEN_INFO.sum_buss_cash_in
  is '经营活动现金流入小计';
comment on column COM_CASH_FLOW_SEVEN_INFO.pay_some_tax
  is '支付的各项税费';
comment on column COM_CASH_FLOW_SEVEN_INFO.rece_inst_cash_other
  is '收到其他与投资活动有关的现金';
comment on column COM_CASH_FLOW_SEVEN_INFO.take_borro_rece_cash
  is '取得借款收到的现金';
comment on column COM_CASH_FLOW_SEVEN_INFO.increas_withholding
  is '预提费用增加';
comment on column COM_CASH_FLOW_SEVEN_INFO.bus_activ_cash
  is '经营活动产生的现金流量净额';
comment on column COM_CASH_FLOW_SEVEN_INFO.asset_fix_cap
  is '融资租入固定资产';
comment on column COM_CASH_FLOW_SEVEN_INFO.pay_employ_cash
  is '支付给职工以及为职工支付的现金';
comment on column COM_CASH_FLOW_SEVEN_INFO.pay_buss_other_cash
  is '支付其他与经营活动有关的现金';
comment on column COM_CASH_FLOW_SEVEN_INFO.sum_buss_cash_out
  is '经营活动现金流出小计';
comment on column COM_CASH_FLOW_SEVEN_INFO.invest_pay_cash
  is '投资所支付的现金';
comment on column COM_CASH_FLOW_SEVEN_INFO.cash_inve_absor
  is '吸收投资收到的现金';
comment on column COM_CASH_FLOW_SEVEN_INFO.end_seme_cash_bal
  is '期末现金及现金等价物余额';
comment on column COM_CASH_FLOW_SEVEN_INFO.asset_loss
  is '处置固定资产无形资产和其他长期资产的损失';
comment on column COM_CASH_FLOW_SEVEN_INFO.year_company_debt
  is '一年内到期的可转换公司债券';
comment on column COM_CASH_FLOW_SEVEN_INFO.cash_end_ba
  is '现金等价物的期末余额';

