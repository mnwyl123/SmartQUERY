create table COM_CAR_ASS_LIA_NS_INFO
(
  report_id           VARCHAR2(30) not null,
  num_org             VARCHAR2(100),
  report_type         VARCHAR2(100),
  material            VARCHAR2(100),
  set_aside_funds     VARCHAR2(100),
  out_car             VARCHAR2(100),
  pay_bus             VARCHAR2(100),
  pay_out_top         VARCHAR2(100),
  sum_asset_class     VARCHAR2(100),
  should_budget_par   VARCHAR2(100),
  lia_sum             VARCHAR2(100),
  dra_fun_so          VARCHAR2(100),
  income_sum          VARCHAR2(100),
  fina_id             VARCHAR2(100),
  money               VARCHAR2(100),
  pay_spefun          VARCHAR2(100),
  carr_for_sel_infras VARCHAR2(100),
  bala_mang           VARCHAR2(100),
  sum_set             VARCHAR2(100),
  dia_into_spefund    VARCHAR2(100),
  num_fina            VARCHAR2(100),
  smart_type_report   VARCHAR2(100),
  other_should_par    VARCHAR2(100),
  dia_out_spefun      VARCHAR2(100),
  tax_sale            VARCHAR2(100),
  record_borrow       VARCHAR2(100),
  defe_reven          VARCHAR2(100),
  dra_fun             VARCHAR2(100),
  top_in_fis          VARCHAR2(100),
  report_year         VARCHAR2(100),
  asset_sum           VARCHAR2(100),
  bala_car            VARCHAR2(100),
  should_paper        VARCHAR2(100),
  should_par          VARCHAR2(100),
  pay_sum             VARCHAR2(100),
  mon_spe             VARCHAR2(100),
  income_bus          VARCHAR2(100),
  income_others       VARCHAR2(100),
  in_fis_sub          VARCHAR2(100),
  oth_should_pay      VARCHAR2(100),
  should_car_para     VARCHAR2(100),
  invest_fund         VARCHAR2(100),
  fixed_fund          VARCHAR2(100),
  bank_deposit        VARCHAR2(100),
  finish_goods        VARCHAR2(100),
  fis_asset           VARCHAR2(100),
  un_asset            VARCHAR2(100),
  in_car              VARCHAR2(100),
  in_aff_pay          VARCHAR2(100),
  pre_par             VARCHAR2(100),
  foreign_invest      VARCHAR2(100),
  the_cost            VARCHAR2(100),
  should_pay_tax      VARCHAR2(100),
  sum_lia             VARCHAR2(100),
  detach_subsidy      VARCHAR2(20),
  should_repar        VARCHAR2(20),
  should_re_acc       VARCHAR2(20),
  should_pay_bill     VARCHAR2(20)
)
;
comment on table COM_CAR_ASS_LIA_NS_INFO
  is '事业单位资产负债表（1997 版）信息单元';
comment on column COM_CAR_ASS_LIA_NS_INFO.report_id
  is '报告编号';
comment on column COM_CAR_ASS_LIA_NS_INFO.num_org
  is '业务管理机构代码';
comment on column COM_CAR_ASS_LIA_NS_INFO.report_type
  is '报表类型';
comment on column COM_CAR_ASS_LIA_NS_INFO.material
  is '材料';
comment on column COM_CAR_ASS_LIA_NS_INFO.set_aside_funds
  is '拨出经费';
comment on column COM_CAR_ASS_LIA_NS_INFO.out_car
  is '事业支出';
comment on column COM_CAR_ASS_LIA_NS_INFO.pay_bus
  is '经营支出';
comment on column COM_CAR_ASS_LIA_NS_INFO.pay_out_top
  is '上缴上级支出';
comment on column COM_CAR_ASS_LIA_NS_INFO.sum_asset_class
  is '资产部类总计';
comment on column COM_CAR_ASS_LIA_NS_INFO.should_budget_par
  is '应缴预算款';
comment on column COM_CAR_ASS_LIA_NS_INFO.lia_sum
  is '负债合计';
comment on column COM_CAR_ASS_LIA_NS_INFO.dra_fun_so
  is '一般基金';
comment on column COM_CAR_ASS_LIA_NS_INFO.income_sum
  is '收入合计';
comment on column COM_CAR_ASS_LIA_NS_INFO.fina_id
  is '财务报表编号';
comment on column COM_CAR_ASS_LIA_NS_INFO.money
  is '现金';
comment on column COM_CAR_ASS_LIA_NS_INFO.pay_spefun
  is '专款支出';
comment on column COM_CAR_ASS_LIA_NS_INFO.carr_for_sel_infras
  is '结转自筹基建';
comment on column COM_CAR_ASS_LIA_NS_INFO.bala_mang
  is '经营结余';
comment on column COM_CAR_ASS_LIA_NS_INFO.sum_set
  is '净资产合计';
comment on column COM_CAR_ASS_LIA_NS_INFO.dia_into_spefund
  is '拨入专款';
comment on column COM_CAR_ASS_LIA_NS_INFO.num_fina
  is '业务管理机构';
comment on column COM_CAR_ASS_LIA_NS_INFO.smart_type_report
  is '报表类型细分';
comment on column COM_CAR_ASS_LIA_NS_INFO.other_should_par
  is '其他应收款';
comment on column COM_CAR_ASS_LIA_NS_INFO.dia_out_spefun
  is '拨出专款';
comment on column COM_CAR_ASS_LIA_NS_INFO.tax_sale
  is '销售税金';
comment on column COM_CAR_ASS_LIA_NS_INFO.record_borrow
  is '借记款项';
comment on column COM_CAR_ASS_LIA_NS_INFO.defe_reven
  is '预收账款';
comment on column COM_CAR_ASS_LIA_NS_INFO.dra_fun
  is '事业基金';
comment on column COM_CAR_ASS_LIA_NS_INFO.top_in_fis
  is '上级补助收入';
comment on column COM_CAR_ASS_LIA_NS_INFO.report_year
  is '报表年份';
comment on column COM_CAR_ASS_LIA_NS_INFO.asset_sum
  is '资产合计';
comment on column COM_CAR_ASS_LIA_NS_INFO.bala_car
  is '事业结余';
comment on column COM_CAR_ASS_LIA_NS_INFO.should_paper
  is '应收票据';
comment on column COM_CAR_ASS_LIA_NS_INFO.should_par
  is '应付账款';
comment on column COM_CAR_ASS_LIA_NS_INFO.pay_sum
  is '支出合计';
comment on column COM_CAR_ASS_LIA_NS_INFO.mon_spe
  is '专用基金';
comment on column COM_CAR_ASS_LIA_NS_INFO.income_bus
  is '经营收入';
comment on column COM_CAR_ASS_LIA_NS_INFO.income_others
  is '其他收入';
comment on column COM_CAR_ASS_LIA_NS_INFO.in_fis_sub
  is '财政补助收入';
comment on column COM_CAR_ASS_LIA_NS_INFO.oth_should_pay
  is '其他应付款';
comment on column COM_CAR_ASS_LIA_NS_INFO.should_car_para
  is '应缴财政专户款';
comment on column COM_CAR_ASS_LIA_NS_INFO.invest_fund
  is '投资基金';
comment on column COM_CAR_ASS_LIA_NS_INFO.fixed_fund
  is '固定基金';
comment on column COM_CAR_ASS_LIA_NS_INFO.bank_deposit
  is '银行存款';
comment on column COM_CAR_ASS_LIA_NS_INFO.finish_goods
  is '产成品';
comment on column COM_CAR_ASS_LIA_NS_INFO.fis_asset
  is '固定资产';
comment on column COM_CAR_ASS_LIA_NS_INFO.un_asset
  is '无形资产';
comment on column COM_CAR_ASS_LIA_NS_INFO.in_car
  is '事业收入';
comment on column COM_CAR_ASS_LIA_NS_INFO.in_aff_pay
  is '附属单位缴款';
comment on column COM_CAR_ASS_LIA_NS_INFO.pre_par
  is '预付账款';
comment on column COM_CAR_ASS_LIA_NS_INFO.foreign_invest
  is '对外投资';
comment on column COM_CAR_ASS_LIA_NS_INFO.the_cost
  is '成本费用';
comment on column COM_CAR_ASS_LIA_NS_INFO.should_pay_tax
  is '应交税金';
comment on column COM_CAR_ASS_LIA_NS_INFO.sum_lia
  is '负债部类总计';
comment on column COM_CAR_ASS_LIA_NS_INFO.detach_subsidy
  is '对附属单位补助';
comment on column COM_CAR_ASS_LIA_NS_INFO.should_re_acc
  is '应收账款';
comment on column COM_CAR_ASS_LIA_NS_INFO.should_pay_bill
  is '应付票据';

