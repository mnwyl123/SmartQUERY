create table COM_PROFIT_INFO_TWO_INFO
(
  report_id            VARCHAR2(30) not null,
  loss_fix_asset       VARCHAR2(100),
  uncomfi_inves_loss   VARCHAR2(100),
  star_year_undoprofit VARCHAR2(100),
  assigen_profit       VARCHAR2(100),
  profit_invest        VARCHAR2(100),
  extra_yygj           VARCHAR2(100),
  net_buss             VARCHAR2(100),
  income_other         VARCHAR2(100),
  non_money_benefits   VARCHAR2(100),
  profits_befor        VARCHAR2(100),
  loss_debt            VARCHAR2(100),
  extra_develop_fund   VARCHAR2(100),
  others_kfp           VARCHAR2(100),
  pay_divi_pt          VARCHAR2(100),
  fina_id              VARCHAR2(100),
  num_fina             VARCHAR2(100),
  num_org              VARCHAR2(100),
  smart_type_report    VARCHAR2(100),
  discount             VARCHAR2(100),
  operating_expense    VARCHAR2(100),
  operating_expen      VARCHAR2(100),
  mana_cost            VARCHAR2(100),
  fine_income          VARCHAR2(100),
  fine_cost            VARCHAR2(100),
  extra_sur_money      VARCHAR2(100),
  other_invest_profits VARCHAR2(100),
  cost_buss            VARCHAR2(100),
  income_invest        VARCHAR2(100),
  income_future        VARCHAR2(100),
  income_buss_yyw      VARCHAR2(100),
  income_asset_shyi    VARCHAR2(100),
  buss_pay             VARCHAR2(100),
  donate_cost          VARCHAR2(100),
  sur_res_loss         VARCHAR2(100),
  supp_flows_asset     VARCHAR2(100),
  extra_reserve        VARCHAR2(100),
  report_year          VARCHAR2(100),
  others               VARCHAR2(100),
  buss_profits_z       VARCHAR2(100),
  buss_profits         VARCHAR2(100),
  other_adjust_reason  VARCHAR2(100),
  single_reten_prof    VARCHAR2(100),
  income_bus           VARCHAR2(100),
  buss_other_profits   VARCHAR2(100),
  others_cost          VARCHAR2(100),
  income_subsidies     VARCHAR2(100),
  profits_loss_min     VARCHAR2(100),
  net_profit           VARCHAR2(100),
  profits_invest_fp    VARCHAR2(100),
  exp_prd_cost         VARCHAR2(100),
  defe_income          VARCHAR2(100),
  income_company_ks    VARCHAR2(100),
  income_sale_asset    VARCHAR2(100),
  others_profits       VARCHAR2(100),
  other_pay            VARCHAR2(100),
  tax                  VARCHAR2(100),
  divi_pay_prefer      VARCHAR2(100),
  pay_div_asset        VARCHAR2(100),
  undis_profit         VARCHAR2(100),
  loss_tax_befor       VARCHAR2(100),
  exp_income_prd       VARCHAR2(100),
  in_income_prd        VARCHAR2(100),
  bus_tax_other        VARCHAR2(100),
  fina_cost            VARCHAR2(100),
  wage_carry_forward   VARCHAR2(100),
  sum_profits          VARCHAR2(100),
  extra_sur_res        VARCHAR2(100),
  extra_emply_wefare   VARCHAR2(100),
  report_type          VARCHAR2(100),
  income_dg            VARCHAR2(100)
)
;
comment on table COM_PROFIT_INFO_TWO_INFO
  is '企业利润及利润分配表（2002 版）信息单元';
comment on column COM_PROFIT_INFO_TWO_INFO.report_id
  is '报告编号';
comment on column COM_PROFIT_INFO_TWO_INFO.loss_fix_asset
  is '（营业外支出科目下）处置固定资产净损失';
comment on column COM_PROFIT_INFO_TWO_INFO.uncomfi_inves_loss
  is '未确认的投资损失';
comment on column COM_PROFIT_INFO_TWO_INFO.star_year_undoprofit
  is '年初未分配利润';
comment on column COM_PROFIT_INFO_TWO_INFO.assigen_profit
  is '可供分配的利润';
comment on column COM_PROFIT_INFO_TWO_INFO.profit_invest
  is '利润归还投资';
comment on column COM_PROFIT_INFO_TWO_INFO.extra_yygj
  is '提取任意盈余公积';
comment on column COM_PROFIT_INFO_TWO_INFO.net_buss
  is '主营业务收入净额';
comment on column COM_PROFIT_INFO_TWO_INFO.income_other
  is '其他（收入）';
comment on column COM_PROFIT_INFO_TWO_INFO.non_money_benefits
  is '（营业外收入科目下）非货币性交易收益';
comment on column COM_PROFIT_INFO_TWO_INFO.profits_befor
  is '（其他科目下）用以前年度含量工资节余弥补利润';
comment on column COM_PROFIT_INFO_TWO_INFO.loss_debt
  is '（营业外支出科目下）债务重组损失';
comment on column COM_PROFIT_INFO_TWO_INFO.extra_develop_fund
  is '提取企业发展基金';
comment on column COM_PROFIT_INFO_TWO_INFO.others_kfp
  is '（可供分配的利润科目下）其他';
comment on column COM_PROFIT_INFO_TWO_INFO.pay_divi_pt
  is '应付普通股股利';
comment on column COM_PROFIT_INFO_TWO_INFO.fina_id
  is '财务报表编号';
comment on column COM_PROFIT_INFO_TWO_INFO.num_fina
  is '业务管理机构';
comment on column COM_PROFIT_INFO_TWO_INFO.num_org
  is '业务管理机构代码';
comment on column COM_PROFIT_INFO_TWO_INFO.smart_type_report
  is '报表类型细分';
comment on column COM_PROFIT_INFO_TWO_INFO.discount
  is '销售折扣与折让';
comment on column COM_PROFIT_INFO_TWO_INFO.operating_expense
  is '经营费用';
comment on column COM_PROFIT_INFO_TWO_INFO.operating_expen
  is '营业费用';
comment on column COM_PROFIT_INFO_TWO_INFO.mana_cost
  is '管理费用';
comment on column COM_PROFIT_INFO_TWO_INFO.fine_income
  is '（营业外收入科目下）罚款净收入';
comment on column COM_PROFIT_INFO_TWO_INFO.fine_cost
  is '（营业外支出科目下）罚款支出';
comment on column COM_PROFIT_INFO_TWO_INFO.extra_sur_money
  is '提取法定公益金';
comment on column COM_PROFIT_INFO_TWO_INFO.other_invest_profits
  is '（可供投资者分配的利润科目下）其他';
comment on column COM_PROFIT_INFO_TWO_INFO.cost_buss
  is '主营业务成本';
comment on column COM_PROFIT_INFO_TWO_INFO.income_invest
  is '投资收益';
comment on column COM_PROFIT_INFO_TWO_INFO.income_future
  is '期货收益';
comment on column COM_PROFIT_INFO_TWO_INFO.income_buss_yyw
  is '营业外收入';
comment on column COM_PROFIT_INFO_TWO_INFO.income_asset_shyi
  is '（营业外收入科目下）处置固定资产净收益';
comment on column COM_PROFIT_INFO_TWO_INFO.buss_pay
  is '营业外支出';
comment on column COM_PROFIT_INFO_TWO_INFO.donate_cost
  is '（营业外支出科目下）捐赠支出';
comment on column COM_PROFIT_INFO_TWO_INFO.sur_res_loss
  is '盈余公积补亏';
comment on column COM_PROFIT_INFO_TWO_INFO.supp_flows_asset
  is '补充流动资本';
comment on column COM_PROFIT_INFO_TWO_INFO.extra_reserve
  is '提取储备基金';
comment on column COM_PROFIT_INFO_TWO_INFO.report_year
  is '报表年份';
comment on column COM_PROFIT_INFO_TWO_INFO.others
  is '其他（业务成本）';
comment on column COM_PROFIT_INFO_TWO_INFO.buss_profits_z
  is '主营业务利润';
comment on column COM_PROFIT_INFO_TWO_INFO.buss_profits
  is '营业利润';
comment on column COM_PROFIT_INFO_TWO_INFO.other_adjust_reason
  is '其他调整因素';
comment on column COM_PROFIT_INFO_TWO_INFO.single_reten_prof
  is '单项留用的利润';
comment on column COM_PROFIT_INFO_TWO_INFO.income_bus
  is '主营业务收入';
comment on column COM_PROFIT_INFO_TWO_INFO.buss_other_profits
  is '其他业务利润';
comment on column COM_PROFIT_INFO_TWO_INFO.others_cost
  is '其他（费用）';
comment on column COM_PROFIT_INFO_TWO_INFO.income_subsidies
  is '补贴收入';
comment on column COM_PROFIT_INFO_TWO_INFO.profits_loss_min
  is '少数股东损益';
comment on column COM_PROFIT_INFO_TWO_INFO.net_profit
  is '净利润';
comment on column COM_PROFIT_INFO_TWO_INFO.profits_invest_fp
  is '可供投资者分配的利润';
comment on column COM_PROFIT_INFO_TWO_INFO.exp_prd_cost
  is '（主营业务成本科目下）出口产品销售成本';
comment on column COM_PROFIT_INFO_TWO_INFO.defe_income
  is '递延收益';
comment on column COM_PROFIT_INFO_TWO_INFO.income_company_ks
  is '（补贴收入科目下）补贴前亏损的企业补贴收入';
comment on column COM_PROFIT_INFO_TWO_INFO.income_sale_asset
  is '（营业外收入科目下）出售无形资产收益';
comment on column COM_PROFIT_INFO_TWO_INFO.others_profits
  is '其他（利润）';
comment on column COM_PROFIT_INFO_TWO_INFO.other_pay
  is '其他支出';
comment on column COM_PROFIT_INFO_TWO_INFO.tax
  is '所得税';
comment on column COM_PROFIT_INFO_TWO_INFO.divi_pay_prefer
  is '应付优先股股利';
comment on column COM_PROFIT_INFO_TWO_INFO.pay_div_asset
  is '转作资本的普通股股利';
comment on column COM_PROFIT_INFO_TWO_INFO.undis_profit
  is '未分配利润';
comment on column COM_PROFIT_INFO_TWO_INFO.loss_tax_befor
  is '（未分配利润科目下）应由以后年度税前利润弥补的亏损';
comment on column COM_PROFIT_INFO_TWO_INFO.exp_income_prd
  is '（主营业务收入科目下）出口产品销售收入';
comment on column COM_PROFIT_INFO_TWO_INFO.in_income_prd
  is '（主营业务收入科目下）进口产品销售收入';
comment on column COM_PROFIT_INFO_TWO_INFO.bus_tax_other
  is '主营业务税金及附加';
comment on column COM_PROFIT_INFO_TWO_INFO.fina_cost
  is '财务费用';
comment on column COM_PROFIT_INFO_TWO_INFO.wage_carry_forward
  is '（其他支出）结转的含量工资包干节余';
comment on column COM_PROFIT_INFO_TWO_INFO.sum_profits
  is '利润总额';
comment on column COM_PROFIT_INFO_TWO_INFO.extra_sur_res
  is '提取法定盈余公积';
comment on column COM_PROFIT_INFO_TWO_INFO.extra_emply_wefare
  is '提取职工奖励及福利基金';
comment on column COM_PROFIT_INFO_TWO_INFO.report_type
  is '报表类型';
comment on column COM_PROFIT_INFO_TWO_INFO.income_dg
  is '代购代销收入';

