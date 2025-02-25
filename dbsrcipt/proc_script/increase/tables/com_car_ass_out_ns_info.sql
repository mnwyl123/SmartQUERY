create table COM_CAR_ASS_OUT_NS_INFO
(
  report_id           VARCHAR2(30) not null,
  num_fina            VARCHAR2(100),
  pay_bus             VARCHAR2(100),
  should_pay_tax      VARCHAR2(100),
  num_org             VARCHAR2(100),
  in_car              VARCHAR2(100),
  income_others       VARCHAR2(100),
  sma_diainto_spefun  VARCHAR2(100),
  pay_nobudg_out      VARCHAR2(100),
  pay_spefun          VARCHAR2(100),
  normal_balance      VARCHAR2(100),
  buss_sum            VARCHAR2(100),
  with_dra_fun        VARCHAR2(100),
  report_type         VARCHAR2(100),
  out_car             VARCHAR2(100),
  sum_spefun          VARCHAR2(100),
  pay_last_year_car   VARCHAR2(100),
  sma_income_bus      VARCHAR2(100),
  dia_into_spefund    VARCHAR2(100),
  pay_out_top         VARCHAR2(100),
  bus_smar_sum        VARCHAR2(100),
  pay_sum             VARCHAR2(100),
  report_year         VARCHAR2(100),
  in_aff_pay          VARCHAR2(100),
  income_notbudg_out  VARCHAR2(100),
  income_bus          VARCHAR2(100),
  income_sum          VARCHAR2(100),
  set_aside_funds     VARCHAR2(100),
  tax_sale            VARCHAR2(100),
  balan_dis           VARCHAR2(100),
  sma_sum_car         VARCHAR2(100),
  befor_year_busloss  VARCHAR2(100),
  bala_other_dis      VARCHAR2(100),
  in_fis_sub_in       VARCHAR2(100),
  pay_car_fis         VARCHAR2(100),
  carr_for_sel_infras VARCHAR2(100),
  pay_car_sum         VARCHAR2(100),
  dia_out_spefun      VARCHAR2(100),
  car_balance         VARCHAR2(100),
  out_dra_fun         VARCHAR2(100),
  fina_id             VARCHAR2(100),
  smart_type_report   VARCHAR2(100),
  top_in_fis          VARCHAR2(100),
  in_fis_sub          VARCHAR2(100),
  tax_sale_in         VARCHAR2(100)
)
;
comment on table COM_CAR_ASS_OUT_NS_INFO
  is '事业单位收入支出表（1997 版）信息单元';
comment on column COM_CAR_ASS_OUT_NS_INFO.report_id
  is '报告编号';
comment on column COM_CAR_ASS_OUT_NS_INFO.num_fina
  is '业务管理机构';
comment on column COM_CAR_ASS_OUT_NS_INFO.pay_bus
  is '经营支出';
comment on column COM_CAR_ASS_OUT_NS_INFO.should_pay_tax
  is '应交所得税';
comment on column COM_CAR_ASS_OUT_NS_INFO.num_org
  is '业务管理机构代码';
comment on column COM_CAR_ASS_OUT_NS_INFO.in_car
  is '事业收入';
comment on column COM_CAR_ASS_OUT_NS_INFO.income_others
  is '其他收入';
comment on column COM_CAR_ASS_OUT_NS_INFO.sma_diainto_spefun
  is '拨入专款小计';
comment on column COM_CAR_ASS_OUT_NS_INFO.pay_nobudg_out
  is '预算外资金支出';
comment on column COM_CAR_ASS_OUT_NS_INFO.pay_spefun
  is '专款支出';
comment on column COM_CAR_ASS_OUT_NS_INFO.normal_balance
  is '正常收入结余';
comment on column COM_CAR_ASS_OUT_NS_INFO.buss_sum
  is '经营结余';
comment on column COM_CAR_ASS_OUT_NS_INFO.with_dra_fun
  is '提取专用基金    ';
comment on column COM_CAR_ASS_OUT_NS_INFO.report_type
  is '报表类型';
comment on column COM_CAR_ASS_OUT_NS_INFO.out_car
  is '事业支出';
comment on column COM_CAR_ASS_OUT_NS_INFO.sum_spefun
  is '专款小计';
comment on column COM_CAR_ASS_OUT_NS_INFO.pay_last_year_car
  is '收回以前年度事业支出';
comment on column COM_CAR_ASS_OUT_NS_INFO.sma_income_bus
  is '经营收入小计';
comment on column COM_CAR_ASS_OUT_NS_INFO.dia_into_spefund
  is '拨入专款';
comment on column COM_CAR_ASS_OUT_NS_INFO.pay_out_top
  is '上缴上级支出';
comment on column COM_CAR_ASS_OUT_NS_INFO.bus_smar_sum
  is '经营支出小计';
comment on column COM_CAR_ASS_OUT_NS_INFO.pay_sum
  is '支出总计';
comment on column COM_CAR_ASS_OUT_NS_INFO.report_year
  is '报表年份';
comment on column COM_CAR_ASS_OUT_NS_INFO.in_aff_pay
  is '附属单位缴款';
comment on column COM_CAR_ASS_OUT_NS_INFO.income_notbudg_out
  is '预算外资金收入';
comment on column COM_CAR_ASS_OUT_NS_INFO.income_bus
  is '经营收入';
comment on column COM_CAR_ASS_OUT_NS_INFO.income_sum
  is '收入总计';
comment on column COM_CAR_ASS_OUT_NS_INFO.set_aside_funds
  is '拨出经费';
comment on column COM_CAR_ASS_OUT_NS_INFO.tax_sale
  is '销售税金';
comment on column COM_CAR_ASS_OUT_NS_INFO.balan_dis
  is '结余分配';
comment on column COM_CAR_ASS_OUT_NS_INFO.sma_sum_car
  is '事业收入小计';
comment on column COM_CAR_ASS_OUT_NS_INFO.befor_year_busloss
  is '以前年度经营亏损';
comment on column COM_CAR_ASS_OUT_NS_INFO.bala_other_dis
  is '其他结余分配    ';
comment on column COM_CAR_ASS_OUT_NS_INFO.in_fis_sub_in
  is '财政补助收入';
comment on column COM_CAR_ASS_OUT_NS_INFO.pay_car_fis
  is '财政补助支出';
comment on column COM_CAR_ASS_OUT_NS_INFO.carr_for_sel_infras
  is '结转自筹基建';
comment on column COM_CAR_ASS_OUT_NS_INFO.pay_car_sum
  is '事业支出小计';
comment on column COM_CAR_ASS_OUT_NS_INFO.dia_out_spefun
  is '拨出专款';
comment on column COM_CAR_ASS_OUT_NS_INFO.car_balance
  is '事业结余';
comment on column COM_CAR_ASS_OUT_NS_INFO.out_dra_fun
  is '转入事业基金    ';
comment on column COM_CAR_ASS_OUT_NS_INFO.fina_id
  is '财务报表编号';
comment on column COM_CAR_ASS_OUT_NS_INFO.smart_type_report
  is '报表类型细分';
comment on column COM_CAR_ASS_OUT_NS_INFO.top_in_fis
  is '上级补助收入';
comment on column COM_CAR_ASS_OUT_NS_INFO.in_fis_sub
  is '对附属单位补助';
comment on column COM_CAR_ASS_OUT_NS_INFO.tax_sale_in
  is '销售税金';

