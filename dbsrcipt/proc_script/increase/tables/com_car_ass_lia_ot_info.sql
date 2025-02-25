create table COM_CAR_ASS_LIA_OT_INFO
(
  report_id         VARCHAR2(30) not null,
  line_car_should   VARCHAR2(100),
  unactiv_sum       VARCHAR2(100),
  bal_set_sum       VARCHAR2(100),
  fina_id           VARCHAR2(100),
  short_term_inves  VARCHAR2(100),
  should_paper      VARCHAR2(100),
  unfina_bala       VARCHAR2(100),
  bala_mang         VARCHAR2(100),
  sum_set           VARCHAR2(100),
  report_year       VARCHAR2(100),
  report_type       VARCHAR2(100),
  flow_asset_sum    VARCHAR2(100),
  price_fix_asset   VARCHAR2(100),
  should_salary     VARCHAR2(100),
  flow_lia_sum      VARCHAR2(100),
  borr_longtim      VARCHAR2(100),
  unactiv_mony      VARCHAR2(100),
  fina_aid          VARCHAR2(100),
  inventory         VARCHAR2(100),
  other_flow_asset  VARCHAR2(100),
  un_asset_price    VARCHAR2(100),
  unflow_asset_sum  VARCHAR2(100),
  should_contr_para VARCHAR2(100),
  should_reven      VARCHAR2(100),
  engineering       VARCHAR2(100),
  sum_sell          VARCHAR2(100),
  should_pay_tax    VARCHAR2(100),
  pay_longtim       VARCHAR2(100),
  sum_lia           VARCHAR2(100),
  num_fina          VARCHAR2(100),
  long_term_invest  VARCHAR2(100),
  fis_asset         VARCHAR2(100),
  un_asset          VARCHAR2(100),
  wait_asset_caus   VARCHAR2(100),
  short_time_borr   VARCHAR2(100),
  dra_fun           VARCHAR2(100),
  mon_spe           VARCHAR2(100),
  fina_bala         VARCHAR2(100),
  bala_car          VARCHAR2(100),
  num_org           VARCHAR2(100),
  money_fund        VARCHAR2(100),
  should_par        VARCHAR2(100),
  pre_par           VARCHAR2(100),
  sum_dis_old       VARCHAR2(100),
  sum_asset         VARCHAR2(100),
  should_car_para   VARCHAR2(100),
  defe_reven        VARCHAR2(100),
  unfina_aid        VARCHAR2(100),
  smart_type_report VARCHAR2(100),
  other_should_par  VARCHAR2(100),
  oth_should_pay    VARCHAR2(100),
  oth_flow_lia      VARCHAR2(100),
  should_re_bill    VARCHAR2(20)
)
;
comment on table COM_CAR_ASS_LIA_OT_INFO
  is '事业单位资产负债表（2013 版）信息单元';
comment on column COM_CAR_ASS_LIA_OT_INFO.report_id
  is '报告编号';
comment on column COM_CAR_ASS_LIA_OT_INFO.line_car_should
  is '财政应返还额度';
comment on column COM_CAR_ASS_LIA_OT_INFO.unactiv_sum
  is '非流动负债合计';
comment on column COM_CAR_ASS_LIA_OT_INFO.bal_set_sum
  is '负债和净资产总计';
comment on column COM_CAR_ASS_LIA_OT_INFO.fina_id
  is '财务报表编号';
comment on column COM_CAR_ASS_LIA_OT_INFO.short_term_inves
  is '短期投资';
comment on column COM_CAR_ASS_LIA_OT_INFO.should_paper
  is '应付票据';
comment on column COM_CAR_ASS_LIA_OT_INFO.unfina_bala
  is '非财政补助结余';
comment on column COM_CAR_ASS_LIA_OT_INFO.bala_mang
  is '经营结余';
comment on column COM_CAR_ASS_LIA_OT_INFO.sum_set
  is '净资产合计';
comment on column COM_CAR_ASS_LIA_OT_INFO.report_year
  is '报表年份';
comment on column COM_CAR_ASS_LIA_OT_INFO.report_type
  is '报表类型';
comment on column COM_CAR_ASS_LIA_OT_INFO.flow_asset_sum
  is '流动资产合计';
comment on column COM_CAR_ASS_LIA_OT_INFO.price_fix_asset
  is '固定资产原价';
comment on column COM_CAR_ASS_LIA_OT_INFO.should_salary
  is '应付职工薪酬';
comment on column COM_CAR_ASS_LIA_OT_INFO.flow_lia_sum
  is '流动负债合计';
comment on column COM_CAR_ASS_LIA_OT_INFO.borr_longtim
  is '长期借款';
comment on column COM_CAR_ASS_LIA_OT_INFO.unactiv_mony
  is '非流动资产基金';
comment on column COM_CAR_ASS_LIA_OT_INFO.fina_aid
  is '财政补助结转';
comment on column COM_CAR_ASS_LIA_OT_INFO.inventory
  is '存货';
comment on column COM_CAR_ASS_LIA_OT_INFO.other_flow_asset
  is '其他流动资产';
comment on column COM_CAR_ASS_LIA_OT_INFO.un_asset_price
  is '无形资产原价';
comment on column COM_CAR_ASS_LIA_OT_INFO.unflow_asset_sum
  is '非流动资产合计';
comment on column COM_CAR_ASS_LIA_OT_INFO.should_contr_para
  is '应缴国库款';
comment on column COM_CAR_ASS_LIA_OT_INFO.should_reven
  is '应付账款';
comment on column COM_CAR_ASS_LIA_OT_INFO.engineering
  is '在建工程';
comment on column COM_CAR_ASS_LIA_OT_INFO.sum_sell
  is '累计摊销';
comment on column COM_CAR_ASS_LIA_OT_INFO.should_pay_tax
  is '应缴税费';
comment on column COM_CAR_ASS_LIA_OT_INFO.pay_longtim
  is '长期应付款';
comment on column COM_CAR_ASS_LIA_OT_INFO.sum_lia
  is '负债合计';
comment on column COM_CAR_ASS_LIA_OT_INFO.num_fina
  is '业务管理机构';
comment on column COM_CAR_ASS_LIA_OT_INFO.long_term_invest
  is '长期投资';
comment on column COM_CAR_ASS_LIA_OT_INFO.fis_asset
  is '固定资产';
comment on column COM_CAR_ASS_LIA_OT_INFO.un_asset
  is '无形资产';
comment on column COM_CAR_ASS_LIA_OT_INFO.wait_asset_caus
  is '待处置资产损溢';
comment on column COM_CAR_ASS_LIA_OT_INFO.short_time_borr
  is '短期借款';
comment on column COM_CAR_ASS_LIA_OT_INFO.dra_fun
  is '事业基金';
comment on column COM_CAR_ASS_LIA_OT_INFO.mon_spe
  is '专用基金';
comment on column COM_CAR_ASS_LIA_OT_INFO.fina_bala
  is '财政补助结余';
comment on column COM_CAR_ASS_LIA_OT_INFO.bala_car
  is '事业结余';
comment on column COM_CAR_ASS_LIA_OT_INFO.num_org
  is '业务管理机构代码';
comment on column COM_CAR_ASS_LIA_OT_INFO.money_fund
  is '货币资金';
comment on column COM_CAR_ASS_LIA_OT_INFO.should_par
  is '应收账款';
comment on column COM_CAR_ASS_LIA_OT_INFO.pre_par
  is '预付账款';
comment on column COM_CAR_ASS_LIA_OT_INFO.sum_dis_old
  is '累计折旧';
comment on column COM_CAR_ASS_LIA_OT_INFO.sum_asset
  is '资产总计';
comment on column COM_CAR_ASS_LIA_OT_INFO.should_car_para
  is '应缴财政专户款';
comment on column COM_CAR_ASS_LIA_OT_INFO.defe_reven
  is '预收账款';
comment on column COM_CAR_ASS_LIA_OT_INFO.unfina_aid
  is '非财政补助结转';
comment on column COM_CAR_ASS_LIA_OT_INFO.smart_type_report
  is '报表类型细分';
comment on column COM_CAR_ASS_LIA_OT_INFO.other_should_par
  is '其他应收款';
comment on column COM_CAR_ASS_LIA_OT_INFO.oth_should_pay
  is '其他应付款';
comment on column COM_CAR_ASS_LIA_OT_INFO.oth_flow_lia
  is '其他流动负债';
comment on column COM_CAR_ASS_LIA_OT_INFO.should_re_bill
  is '应收票据';

