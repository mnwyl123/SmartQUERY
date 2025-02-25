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
  is '��ҵ��λ�ʲ���ծ��1997 �棩��Ϣ��Ԫ';
comment on column COM_CAR_ASS_LIA_NS_INFO.report_id
  is '������';
comment on column COM_CAR_ASS_LIA_NS_INFO.num_org
  is 'ҵ������������';
comment on column COM_CAR_ASS_LIA_NS_INFO.report_type
  is '��������';
comment on column COM_CAR_ASS_LIA_NS_INFO.material
  is '����';
comment on column COM_CAR_ASS_LIA_NS_INFO.set_aside_funds
  is '��������';
comment on column COM_CAR_ASS_LIA_NS_INFO.out_car
  is '��ҵ֧��';
comment on column COM_CAR_ASS_LIA_NS_INFO.pay_bus
  is '��Ӫ֧��';
comment on column COM_CAR_ASS_LIA_NS_INFO.pay_out_top
  is '�Ͻ��ϼ�֧��';
comment on column COM_CAR_ASS_LIA_NS_INFO.sum_asset_class
  is '�ʲ������ܼ�';
comment on column COM_CAR_ASS_LIA_NS_INFO.should_budget_par
  is 'Ӧ��Ԥ���';
comment on column COM_CAR_ASS_LIA_NS_INFO.lia_sum
  is '��ծ�ϼ�';
comment on column COM_CAR_ASS_LIA_NS_INFO.dra_fun_so
  is 'һ�����';
comment on column COM_CAR_ASS_LIA_NS_INFO.income_sum
  is '����ϼ�';
comment on column COM_CAR_ASS_LIA_NS_INFO.fina_id
  is '���񱨱���';
comment on column COM_CAR_ASS_LIA_NS_INFO.money
  is '�ֽ�';
comment on column COM_CAR_ASS_LIA_NS_INFO.pay_spefun
  is 'ר��֧��';
comment on column COM_CAR_ASS_LIA_NS_INFO.carr_for_sel_infras
  is '��ת�Գ����';
comment on column COM_CAR_ASS_LIA_NS_INFO.bala_mang
  is '��Ӫ����';
comment on column COM_CAR_ASS_LIA_NS_INFO.sum_set
  is '���ʲ��ϼ�';
comment on column COM_CAR_ASS_LIA_NS_INFO.dia_into_spefund
  is '����ר��';
comment on column COM_CAR_ASS_LIA_NS_INFO.num_fina
  is 'ҵ��������';
comment on column COM_CAR_ASS_LIA_NS_INFO.smart_type_report
  is '��������ϸ��';
comment on column COM_CAR_ASS_LIA_NS_INFO.other_should_par
  is '����Ӧ�տ�';
comment on column COM_CAR_ASS_LIA_NS_INFO.dia_out_spefun
  is '����ר��';
comment on column COM_CAR_ASS_LIA_NS_INFO.tax_sale
  is '����˰��';
comment on column COM_CAR_ASS_LIA_NS_INFO.record_borrow
  is '��ǿ���';
comment on column COM_CAR_ASS_LIA_NS_INFO.defe_reven
  is 'Ԥ���˿�';
comment on column COM_CAR_ASS_LIA_NS_INFO.dra_fun
  is '��ҵ����';
comment on column COM_CAR_ASS_LIA_NS_INFO.top_in_fis
  is '�ϼ���������';
comment on column COM_CAR_ASS_LIA_NS_INFO.report_year
  is '�������';
comment on column COM_CAR_ASS_LIA_NS_INFO.asset_sum
  is '�ʲ��ϼ�';
comment on column COM_CAR_ASS_LIA_NS_INFO.bala_car
  is '��ҵ����';
comment on column COM_CAR_ASS_LIA_NS_INFO.should_paper
  is 'Ӧ��Ʊ��';
comment on column COM_CAR_ASS_LIA_NS_INFO.should_par
  is 'Ӧ���˿�';
comment on column COM_CAR_ASS_LIA_NS_INFO.pay_sum
  is '֧���ϼ�';
comment on column COM_CAR_ASS_LIA_NS_INFO.mon_spe
  is 'ר�û���';
comment on column COM_CAR_ASS_LIA_NS_INFO.income_bus
  is '��Ӫ����';
comment on column COM_CAR_ASS_LIA_NS_INFO.income_others
  is '��������';
comment on column COM_CAR_ASS_LIA_NS_INFO.in_fis_sub
  is '������������';
comment on column COM_CAR_ASS_LIA_NS_INFO.oth_should_pay
  is '����Ӧ����';
comment on column COM_CAR_ASS_LIA_NS_INFO.should_car_para
  is 'Ӧ�ɲ���ר����';
comment on column COM_CAR_ASS_LIA_NS_INFO.invest_fund
  is 'Ͷ�ʻ���';
comment on column COM_CAR_ASS_LIA_NS_INFO.fixed_fund
  is '�̶�����';
comment on column COM_CAR_ASS_LIA_NS_INFO.bank_deposit
  is '���д��';
comment on column COM_CAR_ASS_LIA_NS_INFO.finish_goods
  is '����Ʒ';
comment on column COM_CAR_ASS_LIA_NS_INFO.fis_asset
  is '�̶��ʲ�';
comment on column COM_CAR_ASS_LIA_NS_INFO.un_asset
  is '�����ʲ�';
comment on column COM_CAR_ASS_LIA_NS_INFO.in_car
  is '��ҵ����';
comment on column COM_CAR_ASS_LIA_NS_INFO.in_aff_pay
  is '������λ�ɿ�';
comment on column COM_CAR_ASS_LIA_NS_INFO.pre_par
  is 'Ԥ���˿�';
comment on column COM_CAR_ASS_LIA_NS_INFO.foreign_invest
  is '����Ͷ��';
comment on column COM_CAR_ASS_LIA_NS_INFO.the_cost
  is '�ɱ�����';
comment on column COM_CAR_ASS_LIA_NS_INFO.should_pay_tax
  is 'Ӧ��˰��';
comment on column COM_CAR_ASS_LIA_NS_INFO.sum_lia
  is '��ծ�����ܼ�';
comment on column COM_CAR_ASS_LIA_NS_INFO.detach_subsidy
  is '�Ը�����λ����';
comment on column COM_CAR_ASS_LIA_NS_INFO.should_re_acc
  is 'Ӧ���˿�';
comment on column COM_CAR_ASS_LIA_NS_INFO.should_pay_bill
  is 'Ӧ��Ʊ��';

