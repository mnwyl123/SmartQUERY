create table COM_FINANCIAL_SEVEN_INFO
(
  report_id            VARCHAR2(30) not null,
  report_year          VARCHAR2(100),
  should_paper_in      VARCHAR2(100),
  should_interst       VARCHAR2(100),
  pay_dep              VARCHAR2(100),
  long_term_amor       VARCHAR2(100),
  trans_info_debt      VARCHAR2(100),
  should_pay_tax       VARCHAR2(100),
  years_unflows_debt   VARCHAR2(100),
  flow_lia_sum         VARCHAR2(100),
  incres_dy            VARCHAR2(100),
  others_unflows_debt  VARCHAR2(100),
  sum_debt             VARCHAR2(100),
  reduce_div           VARCHAR2(100),
  should_account       VARCHAR2(100),
  engin_mater          VARCHAR2(100),
  should_par           VARCHAR2(100),
  total_debt_owner_sum VARCHAR2(100),
  smart_type_report    VARCHAR2(100),
  should_divi_in       VARCHAR2(100),
  unflow_asset_end     VARCHAR2(100),
  other_flow_asset     VARCHAR2(100),
  flow_asset_sum       VARCHAR2(100),
  long_term_equi_inve  VARCHAR2(100),
  long_term_rece       VARCHAR2(100),
  goodwill             VARCHAR2(100),
  other_unflow_asset   VARCHAR2(100),
  sum_asset            VARCHAR2(100),
  receive_money        VARCHAR2(100),
  undis_profit         VARCHAR2(100),
  fix_asset            VARCHAR2(100),
  engineering          VARCHAR2(100),
  asset_produc_biolo   VARCHAR2(100),
  should_wage          VARCHAR2(100),
  other_should_fu_pa   VARCHAR2(100),
  borr_longtim         VARCHAR2(100),
  num_fina             VARCHAR2(100),
  num_org              VARCHAR2(100),
  report_type          VARCHAR2(100),
  invest_build         VARCHAR2(100),
  fix_asset_clean      VARCHAR2(100),
  oil_gas_asset        VARCHAR2(100),
  un_asset             VARCHAR2(100),
  should_profit        VARCHAR2(100),
  should_divi          VARCHAR2(100),
  should_debt          VARCHAR2(100),
  pay_longtim          VARCHAR2(100),
  trans_asset_fix      VARCHAR2(100),
  asset_mark_fina      VARCHAR2(100),
  reduce_asset         VARCHAR2(100),
  short_time_borr      VARCHAR2(100),
  fina_id              VARCHAR2(100),
  inventory            VARCHAR2(100),
  should_paper         VARCHAR2(100),
  spe_should_par       VARCHAR2(100),
  estima_debt          VARCHAR2(100),
  flow_lia_sum_un      VARCHAR2(100),
  capital_reserves     VARCHAR2(100),
  surplus_reserves     VARCHAR2(100),
  total_owner_equity   VARCHAR2(100),
  money_fund           VARCHAR2(100),
  pre_par              VARCHAR2(100),
  other_should_par     VARCHAR2(100),
  end_date_invest      VARCHAR2(100),
  unflow_asset         VARCHAR2(100),
  defe_reven           VARCHAR2(100),
  oth_flow_lia         VARCHAR2(100)
)
;
comment on table COM_FINANCIAL_SEVEN_INFO
  is '企业资产负债表（2007 版）信息单元';
comment on column COM_FINANCIAL_SEVEN_INFO.report_id
  is '报告编号';
comment on column COM_FINANCIAL_SEVEN_INFO.report_year
  is '报表年份';
comment on column COM_FINANCIAL_SEVEN_INFO.should_paper_in
  is '应收票据';
comment on column COM_FINANCIAL_SEVEN_INFO.should_interst
  is '应收利息';
comment on column COM_FINANCIAL_SEVEN_INFO.pay_dep
  is '开发支出';
comment on column COM_FINANCIAL_SEVEN_INFO.long_term_amor
  is '长期待摊费用';
comment on column COM_FINANCIAL_SEVEN_INFO.trans_info_debt
  is '交易性金融负债';
comment on column COM_FINANCIAL_SEVEN_INFO.should_pay_tax
  is '应交税费';
comment on column COM_FINANCIAL_SEVEN_INFO.years_unflows_debt
  is '一年内到期的非流动负债';
comment on column COM_FINANCIAL_SEVEN_INFO.flow_lia_sum
  is '流动负债合计';
comment on column COM_FINANCIAL_SEVEN_INFO.incres_dy
  is '递延所得税负债';
comment on column COM_FINANCIAL_SEVEN_INFO.others_unflows_debt
  is '其他非流动负债';
comment on column COM_FINANCIAL_SEVEN_INFO.sum_debt
  is '负债合计';
comment on column COM_FINANCIAL_SEVEN_INFO.reduce_div
  is '减：库存股';
comment on column COM_FINANCIAL_SEVEN_INFO.should_account
  is '应收账款';
comment on column COM_FINANCIAL_SEVEN_INFO.engin_mater
  is '工程物资';
comment on column COM_FINANCIAL_SEVEN_INFO.should_par
  is '应付账款';
comment on column COM_FINANCIAL_SEVEN_INFO.total_debt_owner_sum
  is '负债和所有者权益合计';
comment on column COM_FINANCIAL_SEVEN_INFO.smart_type_report
  is '报表类型细分';
comment on column COM_FINANCIAL_SEVEN_INFO.should_divi_in
  is '应收股利';
comment on column COM_FINANCIAL_SEVEN_INFO.unflow_asset_end
  is '一年内到期的非流动资产';
comment on column COM_FINANCIAL_SEVEN_INFO.other_flow_asset
  is '其他流动资产';
comment on column COM_FINANCIAL_SEVEN_INFO.flow_asset_sum
  is '流动资产合计';
comment on column COM_FINANCIAL_SEVEN_INFO.long_term_equi_inve
  is '长期股权投资';
comment on column COM_FINANCIAL_SEVEN_INFO.long_term_rece
  is '长期应收款';
comment on column COM_FINANCIAL_SEVEN_INFO.goodwill
  is '商誉';
comment on column COM_FINANCIAL_SEVEN_INFO.other_unflow_asset
  is '其他非流动资产';
comment on column COM_FINANCIAL_SEVEN_INFO.sum_asset
  is '资产总计';
comment on column COM_FINANCIAL_SEVEN_INFO.receive_money
  is '实收资本（或股本）';
comment on column COM_FINANCIAL_SEVEN_INFO.undis_profit
  is '未分配利润';
comment on column COM_FINANCIAL_SEVEN_INFO.fix_asset
  is '固定资产';
comment on column COM_FINANCIAL_SEVEN_INFO.engineering
  is '在建工程';
comment on column COM_FINANCIAL_SEVEN_INFO.asset_produc_biolo
  is '生产性生物资产';
comment on column COM_FINANCIAL_SEVEN_INFO.should_wage
  is '应付职工薪酬';
comment on column COM_FINANCIAL_SEVEN_INFO.other_should_fu_pa
  is '其他应付款';
comment on column COM_FINANCIAL_SEVEN_INFO.borr_longtim
  is '长期借款';
comment on column COM_FINANCIAL_SEVEN_INFO.num_fina
  is '业务管理机构';
comment on column COM_FINANCIAL_SEVEN_INFO.num_org
  is '业务管理机构代码';
comment on column COM_FINANCIAL_SEVEN_INFO.report_type
  is '报表类型';
comment on column COM_FINANCIAL_SEVEN_INFO.invest_build
  is '投资性房地产';
comment on column COM_FINANCIAL_SEVEN_INFO.fix_asset_clean
  is '固定资产清理';
comment on column COM_FINANCIAL_SEVEN_INFO.oil_gas_asset
  is '油气资产';
comment on column COM_FINANCIAL_SEVEN_INFO.un_asset
  is '无形资产';
comment on column COM_FINANCIAL_SEVEN_INFO.should_profit
  is '应付利息';
comment on column COM_FINANCIAL_SEVEN_INFO.should_divi
  is '应付股利';
comment on column COM_FINANCIAL_SEVEN_INFO.should_debt
  is '应付债券';
comment on column COM_FINANCIAL_SEVEN_INFO.pay_longtim
  is '长期应付款';
comment on column COM_FINANCIAL_SEVEN_INFO.trans_asset_fix
  is '交易性金融资产';
comment on column COM_FINANCIAL_SEVEN_INFO.asset_mark_fina
  is '可供出售的金融资产';
comment on column COM_FINANCIAL_SEVEN_INFO.reduce_asset
  is '递延所得税资产';
comment on column COM_FINANCIAL_SEVEN_INFO.short_time_borr
  is '短期借款';
comment on column COM_FINANCIAL_SEVEN_INFO.fina_id
  is '财务报表编号';
comment on column COM_FINANCIAL_SEVEN_INFO.inventory
  is '存货';
comment on column COM_FINANCIAL_SEVEN_INFO.should_paper
  is '应付票据';
comment on column COM_FINANCIAL_SEVEN_INFO.spe_should_par
  is '专项应付款';
comment on column COM_FINANCIAL_SEVEN_INFO.estima_debt
  is '预计负债';
comment on column COM_FINANCIAL_SEVEN_INFO.flow_lia_sum_un
  is '非流动负债合计';
comment on column COM_FINANCIAL_SEVEN_INFO.capital_reserves
  is '资本公积';
comment on column COM_FINANCIAL_SEVEN_INFO.surplus_reserves
  is '盈余公积';
comment on column COM_FINANCIAL_SEVEN_INFO.total_owner_equity
  is '所有者权益合计';
comment on column COM_FINANCIAL_SEVEN_INFO.money_fund
  is '货币资金';
comment on column COM_FINANCIAL_SEVEN_INFO.pre_par
  is '预付账款';
comment on column COM_FINANCIAL_SEVEN_INFO.other_should_par
  is '其他应收款';
comment on column COM_FINANCIAL_SEVEN_INFO.end_date_invest
  is '持有至到期投资';
comment on column COM_FINANCIAL_SEVEN_INFO.unflow_asset
  is '非流动资产合计';
comment on column COM_FINANCIAL_SEVEN_INFO.defe_reven
  is '预收账款';
comment on column COM_FINANCIAL_SEVEN_INFO.oth_flow_lia
  is '其他流动负债';

