create table COM_DEBT_HIST_INFO
(
  report_id            VARCHAR2(30) not null,
  short_term_inves     VARCHAR2(100),
  should_paper_in      VARCHAR2(100),
  inventory_mater      VARCHAR2(100),
  merger_price         VARCHAR2(100),
  engineering          VARCHAR2(100),
  deferr_asset_repair  VARCHAR2(100),
  defe_reven           VARCHAR2(100),
  should_wage          VARCHAR2(100),
  should_pay_tax       VARCHAR2(100),
  withholding          VARCHAR2(100),
  colle_capital        VARCHAR2(100),
  foreign_capital      VARCHAR2(100),
  surplus_reserves     VARCHAR2(100),
  report_type          VARCHAR2(100),
  sm_report_ty         VARCHAR2(100),
  should_interst       VARCHAR2(100),
  pre_par              VARCHAR2(100),
  inventort_prd        VARCHAR2(100),
  wait_asset_loss      VARCHAR2(100),
  flow_asset_sum       VARCHAR2(100),
  fix_asset_pri        VARCHAR2(100),
  fix_asset_clean      VARCHAR2(100),
  other_lon_goods      VARCHAR2(100),
  defe_tax_credit      VARCHAR2(100),
  private_capital      VARCHAR2(100),
  num_org              VARCHAR2(100),
  should_divi          VARCHAR2(100),
  fut_margin           VARCHAR2(100),
  should_sub_acc       VARCHAR2(100),
  sum_dis              VARCHAR2(100),
  fix_asset_pri_redu   VARCHAR2(100),
  land_use_right       VARCHAR2(100),
  spe_storage_fund     VARCHAR2(100),
  surplus_re_g         VARCHAR2(100),
  money_fund           VARCHAR2(100),
  should_account       VARCHAR2(100),
  other_should_par_s   VARCHAR2(100),
  amor                 VARCHAR2(100),
  long_term_in         VARCHAR2(100),
  long_term_equi_inve  VARCHAR2(100),
  fix_asset_loss       VARCHAR2(100),
  un_asset             VARCHAR2(100),
  short_time_borr      VARCHAR2(100),
  pay_longtim          VARCHAR2(100),
  spe_should_par       VARCHAR2(100),
  others_long_tdebt    VARCHAR2(100),
  lia_sum              VARCHAR2(100),
  paid_in_capital      VARCHAR2(100),
  surplus_re_cap       VARCHAR2(100),
  num_find             VARCHAR2(100),
  other_flow_asset     VARCHAR2(100),
  long_term_sum        VARCHAR2(100),
  fix_asset_worth      VARCHAR2(100),
  deferr_asset         VARCHAR2(100),
  deferr_borr_tax      VARCHAR2(100),
  should_paper         VARCHAR2(100),
  should_par           VARCHAR2(100),
  other_should_par     VARCHAR2(100),
  flow_lia_sum         VARCHAR2(100),
  should_debt          VARCHAR2(100),
  undis_profit         VARCHAR2(100),
  deferr_asset_pay     VARCHAR2(100),
  other_long_invest    VARCHAR2(100),
  sum_asset            VARCHAR2(100),
  total_debt_owner_sum VARCHAR2(100),
  find_id              VARCHAR2(100),
  report_year          VARCHAR2(100),
  should_expo_tax      VARCHAR2(100),
  inventory            VARCHAR2(100),
  long_term_cred_inve  VARCHAR2(100),
  engin_mater          VARCHAR2(100),
  should_welfare       VARCHAR2(100),
  other_should_fu_pa   VARCHAR2(100),
  estima_debt          VARCHAR2(100),
  year_long_term_debt  VARCHAR2(100),
  oth_flow_lia         VARCHAR2(100),
  borr_longtim         VARCHAR2(100),
  sum_long_term_debt   VARCHAR2(100),
  minority_equity      VARCHAR2(100),
  state_capital        VARCHAR2(100),
  corpor_capital       VARCHAR2(100),
  con_state_capital    VARCHAR2(100),
  con_coll_capital     VARCHAR2(100),
  capital_reserves     VARCHAR2(100),
  surplus_re_b         VARCHAR2(100),
  foreign_trans_diff   VARCHAR2(100),
  long_term_invest     VARCHAR2(100),
  sum_dis_old          VARCHAR2(100),
  sum_fix_asset        VARCHAR2(100),
  un_asset_sum         VARCHAR2(100),
  should_profit        VARCHAR2(100),
  total_owner_equity   VARCHAR2(100),
  supp_capital         VARCHAR2(20)
)
;
comment on table COM_DEBT_HIST_INFO
  is '企业资产负债表（2002 版）信息单元';
comment on column COM_DEBT_HIST_INFO.report_id
  is '报告编号';
comment on column COM_DEBT_HIST_INFO.short_term_inves
  is '短期投资';
comment on column COM_DEBT_HIST_INFO.should_paper_in
  is '应收票据';
comment on column COM_DEBT_HIST_INFO.inventory_mater
  is '存货原材料';
comment on column COM_DEBT_HIST_INFO.merger_price
  is '合并价差';
comment on column COM_DEBT_HIST_INFO.engineering
  is '在建工程';
comment on column COM_DEBT_HIST_INFO.deferr_asset_repair
  is '（递延资产科目下）固定资产修理';
comment on column COM_DEBT_HIST_INFO.defe_reven
  is '预收账款';
comment on column COM_DEBT_HIST_INFO.should_wage
  is '应付工资';
comment on column COM_DEBT_HIST_INFO.should_pay_tax
  is '应交税金';
comment on column COM_DEBT_HIST_INFO.withholding
  is '预提费用';
comment on column COM_DEBT_HIST_INFO.colle_capital
  is '集体资本';
comment on column COM_DEBT_HIST_INFO.foreign_capital
  is '外商资本';
comment on column COM_DEBT_HIST_INFO.surplus_reserves
  is '盈余公积';
comment on column COM_DEBT_HIST_INFO.report_type
  is '报表类型';
comment on column COM_DEBT_HIST_INFO.sm_report_ty
  is '报表类型细分';
comment on column COM_DEBT_HIST_INFO.should_interst
  is '应收利息';
comment on column COM_DEBT_HIST_INFO.pre_par
  is '预付账款';
comment on column COM_DEBT_HIST_INFO.inventort_prd
  is '存货产成品';
comment on column COM_DEBT_HIST_INFO.wait_asset_loss
  is '待处理流动资产净损失';
comment on column COM_DEBT_HIST_INFO.flow_asset_sum
  is '流动资产合计';
comment on column COM_DEBT_HIST_INFO.fix_asset_pri
  is '固定资产原价';
comment on column COM_DEBT_HIST_INFO.fix_asset_clean
  is '固定资产清理';
comment on column COM_DEBT_HIST_INFO.other_lon_goods
  is '（其他长期资产科目下）特准储备物资';
comment on column COM_DEBT_HIST_INFO.defe_tax_credit
  is '递延税款贷项';
comment on column COM_DEBT_HIST_INFO.private_capital
  is '个人资本';
comment on column COM_DEBT_HIST_INFO.num_org
  is '业务管理机构代码';
comment on column COM_DEBT_HIST_INFO.should_divi
  is '应收股利';
comment on column COM_DEBT_HIST_INFO.fut_margin
  is '期货保证金';
comment on column COM_DEBT_HIST_INFO.should_sub_acc
  is '应收补贴款';
comment on column COM_DEBT_HIST_INFO.sum_dis
  is '固定资产净值';
comment on column COM_DEBT_HIST_INFO.fix_asset_pri_redu
  is '固定资产值减值准备';
comment on column COM_DEBT_HIST_INFO.land_use_right
  is '无形资产科目下）土地使用权';
comment on column COM_DEBT_HIST_INFO.spe_storage_fund
  is '（其他长期负债科目下）特准储备基金';
comment on column COM_DEBT_HIST_INFO.surplus_re_g
  is '（盈余公积科目下）公益金';
comment on column COM_DEBT_HIST_INFO.money_fund
  is '货币资金';
comment on column COM_DEBT_HIST_INFO.should_account
  is '应收账款';
comment on column COM_DEBT_HIST_INFO.other_should_par_s
  is '其他应收款';
comment on column COM_DEBT_HIST_INFO.amor
  is '待摊费用';
comment on column COM_DEBT_HIST_INFO.long_term_in
  is '一年内到期的长期债权投资';
comment on column COM_DEBT_HIST_INFO.long_term_equi_inve
  is '长期股权投资';
comment on column COM_DEBT_HIST_INFO.fix_asset_loss
  is '待处理固定资产净损失';
comment on column COM_DEBT_HIST_INFO.un_asset
  is '无形资产';
comment on column COM_DEBT_HIST_INFO.short_time_borr
  is '短期借款';
comment on column COM_DEBT_HIST_INFO.pay_longtim
  is '长期应付款';
comment on column COM_DEBT_HIST_INFO.spe_should_par
  is '专项应付款';
comment on column COM_DEBT_HIST_INFO.others_long_tdebt
  is '其他长期负债';
comment on column COM_DEBT_HIST_INFO.lia_sum
  is '负债合计';
comment on column COM_DEBT_HIST_INFO.paid_in_capital
  is '实收资本';
comment on column COM_DEBT_HIST_INFO.surplus_re_cap
  is '（盈余公积科目下）法定盈余公积';
comment on column COM_DEBT_HIST_INFO.num_find
  is '业务管理机构';
comment on column COM_DEBT_HIST_INFO.other_flow_asset
  is '其他流动资产';
comment on column COM_DEBT_HIST_INFO.long_term_sum
  is '长期投资合计';
comment on column COM_DEBT_HIST_INFO.fix_asset_worth
  is '固定资产净额';
comment on column COM_DEBT_HIST_INFO.deferr_asset
  is '递延资产';
comment on column COM_DEBT_HIST_INFO.deferr_borr_tax
  is '递延税款借项';
comment on column COM_DEBT_HIST_INFO.should_paper
  is '应付票据';
comment on column COM_DEBT_HIST_INFO.should_par
  is '应付账款';
comment on column COM_DEBT_HIST_INFO.other_should_par
  is '其他应交款';
comment on column COM_DEBT_HIST_INFO.flow_lia_sum
  is '流动负债合计';
comment on column COM_DEBT_HIST_INFO.should_debt
  is '应付债券';
comment on column COM_DEBT_HIST_INFO.undis_profit
  is '未分配利润';
comment on column COM_DEBT_HIST_INFO.deferr_asset_pay
  is '（递延资产科目下）固定资产改良支出';
comment on column COM_DEBT_HIST_INFO.other_long_invest
  is '其他长期资产';
comment on column COM_DEBT_HIST_INFO.sum_asset
  is '资产总计';
comment on column COM_DEBT_HIST_INFO.total_debt_owner_sum
  is '负债和所有者权益总计';
comment on column COM_DEBT_HIST_INFO.find_id
  is '财务报表编号';
comment on column COM_DEBT_HIST_INFO.report_year
  is '报表年份';
comment on column COM_DEBT_HIST_INFO.should_expo_tax
  is '应收出口退税';
comment on column COM_DEBT_HIST_INFO.inventory
  is '存货';
comment on column COM_DEBT_HIST_INFO.long_term_cred_inve
  is '长期债权投资';
comment on column COM_DEBT_HIST_INFO.engin_mater
  is '工程物资';
comment on column COM_DEBT_HIST_INFO.should_welfare
  is '应付福利费';
comment on column COM_DEBT_HIST_INFO.other_should_fu_pa
  is '其他应付款';
comment on column COM_DEBT_HIST_INFO.estima_debt
  is '预计负债';
comment on column COM_DEBT_HIST_INFO.year_long_term_debt
  is '一年内到期的长期负债';
comment on column COM_DEBT_HIST_INFO.oth_flow_lia
  is '其他流动负债';
comment on column COM_DEBT_HIST_INFO.borr_longtim
  is '长期借款';
comment on column COM_DEBT_HIST_INFO.sum_long_term_debt
  is '长期负债合计';
comment on column COM_DEBT_HIST_INFO.minority_equity
  is '少数股东权益';
comment on column COM_DEBT_HIST_INFO.state_capital
  is '国家资本';
comment on column COM_DEBT_HIST_INFO.corpor_capital
  is '法人资本';
comment on column COM_DEBT_HIST_INFO.con_state_capital
  is '（法人资本科目下）国有法人资本';
comment on column COM_DEBT_HIST_INFO.con_coll_capital
  is '（法人资本科目下）集体法人资本';
comment on column COM_DEBT_HIST_INFO.capital_reserves
  is '资本公积';
comment on column COM_DEBT_HIST_INFO.surplus_re_b
  is '未确认的投资损失';
comment on column COM_DEBT_HIST_INFO.foreign_trans_diff
  is '外币报表折算差额';
comment on column COM_DEBT_HIST_INFO.long_term_invest
  is '长期投资';
comment on column COM_DEBT_HIST_INFO.sum_dis_old
  is '累计折旧';
comment on column COM_DEBT_HIST_INFO.sum_fix_asset
  is '固定资产合计';
comment on column COM_DEBT_HIST_INFO.un_asset_sum
  is '无形及其他资产合计';
comment on column COM_DEBT_HIST_INFO.should_profit
  is '应付利润';
comment on column COM_DEBT_HIST_INFO.total_owner_equity
  is '所有者权益合计';
comment on column COM_DEBT_HIST_INFO.supp_capital
  is '（盈余公积科目下）补充流动资本';

