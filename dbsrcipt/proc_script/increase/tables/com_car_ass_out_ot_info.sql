create table COM_CAR_ASS_OUT_OT_INFO
(
  report_id         VARCHAR2(30) not null,
  fina_id           VARCHAR2(100),
  out_car           VARCHAR2(100),
  bala_befor_year   VARCHAR2(100),
  report_year       VARCHAR2(100),
  out_fis_sub       VARCHAR2(100),
  incom_dona        VARCHAR2(100),
  pay_out_top       VARCHAR2(100),
  report_type       VARCHAR2(100),
  bala_fis_sub      VARCHAR2(100),
  bala_bus_iss      VARCHAR2(100),
  smart_type_report VARCHAR2(100),
  income_others     VARCHAR2(100),
  out_aff_pay       VARCHAR2(100),
  pay_bus           VARCHAR2(100),
  bala_in_year      VARCHAR2(100),
  out_dra_fun       VARCHAR2(100),
  in_fis_sub        VARCHAR2(100),
  in_car            VARCHAR2(100),
  in_aff_pay        VARCHAR2(100),
  in_car_clas       VARCHAR2(100),
  top_in_fis        VARCHAR2(100),
  out_car_unfis     VARCHAR2(100),
  bala_unfis        VARCHAR2(100),
  bala_fis_onyear   VARCHAR2(100),
  should_pay_tax    VARCHAR2(100),
  with_dra_fun      VARCHAR2(100),
  num_fina          VARCHAR2(100),
  num_org           VARCHAR2(100),
  bala_car_iss      VARCHAR2(100),
  out_others        VARCHAR2(100),
  income_bus        VARCHAR2(100)
)
;
comment on table COM_CAR_ASS_OUT_OT_INFO
  is '事业单位收入支出表（2013 版）信息单元';
comment on column COM_CAR_ASS_OUT_OT_INFO.report_id
  is '报告编号';
comment on column COM_CAR_ASS_OUT_OT_INFO.fina_id
  is '财务报表编号';
comment on column COM_CAR_ASS_OUT_OT_INFO.out_car
  is '事业类支出';
comment on column COM_CAR_ASS_OUT_OT_INFO.bala_befor_year
  is '弥补以前年度亏损后的经营结余';
comment on column COM_CAR_ASS_OUT_OT_INFO.report_year
  is '报表年份';
comment on column COM_CAR_ASS_OUT_OT_INFO.out_fis_sub
  is '事业支出（财政补助支出）';
comment on column COM_CAR_ASS_OUT_OT_INFO.incom_dona
  is '（其他收入科目下）捐赠收入';
comment on column COM_CAR_ASS_OUT_OT_INFO.pay_out_top
  is '上缴上级支出';
comment on column COM_CAR_ASS_OUT_OT_INFO.report_type
  is '报表类型';
comment on column COM_CAR_ASS_OUT_OT_INFO.bala_fis_sub
  is '本期财政补助结转结余';
comment on column COM_CAR_ASS_OUT_OT_INFO.bala_bus_iss
  is '本期经营结余';
comment on column COM_CAR_ASS_OUT_OT_INFO.smart_type_report
  is '报表类型细分';
comment on column COM_CAR_ASS_OUT_OT_INFO.income_others
  is '其他收入';
comment on column COM_CAR_ASS_OUT_OT_INFO.out_aff_pay
  is '对附属单位补助支出';
comment on column COM_CAR_ASS_OUT_OT_INFO.pay_bus
  is '经营支出';
comment on column COM_CAR_ASS_OUT_OT_INFO.bala_in_year
  is '本年非财政补助结转结余';
comment on column COM_CAR_ASS_OUT_OT_INFO.out_dra_fun
  is '转入事业基金';
comment on column COM_CAR_ASS_OUT_OT_INFO.in_fis_sub
  is '财政补助收入';
comment on column COM_CAR_ASS_OUT_OT_INFO.in_car
  is '事业收入';
comment on column COM_CAR_ASS_OUT_OT_INFO.in_aff_pay
  is '附属单位上缴收入';
comment on column COM_CAR_ASS_OUT_OT_INFO.in_car_clas
  is '事业类收入';
comment on column COM_CAR_ASS_OUT_OT_INFO.top_in_fis
  is '上级补助收入';
comment on column COM_CAR_ASS_OUT_OT_INFO.out_car_unfis
  is '事业支出（非财政补助支出）';
comment on column COM_CAR_ASS_OUT_OT_INFO.bala_unfis
  is '非财政补助结转';
comment on column COM_CAR_ASS_OUT_OT_INFO.bala_fis_onyear
  is '本年非财政补助结余';
comment on column COM_CAR_ASS_OUT_OT_INFO.should_pay_tax
  is '应缴企业所得税';
comment on column COM_CAR_ASS_OUT_OT_INFO.with_dra_fun
  is '提取专用基金';
comment on column COM_CAR_ASS_OUT_OT_INFO.num_fina
  is '业务管理机构';
comment on column COM_CAR_ASS_OUT_OT_INFO.num_org
  is '业务管理机构代码';
comment on column COM_CAR_ASS_OUT_OT_INFO.bala_car_iss
  is '本期事业结转结余';
comment on column COM_CAR_ASS_OUT_OT_INFO.out_others
  is '其他支出';
comment on column COM_CAR_ASS_OUT_OT_INFO.income_bus
  is '经营收入';

