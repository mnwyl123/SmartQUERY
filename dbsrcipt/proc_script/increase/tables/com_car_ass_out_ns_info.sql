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
  is '��ҵ��λ����֧����1997 �棩��Ϣ��Ԫ';
comment on column COM_CAR_ASS_OUT_NS_INFO.report_id
  is '������';
comment on column COM_CAR_ASS_OUT_NS_INFO.num_fina
  is 'ҵ��������';
comment on column COM_CAR_ASS_OUT_NS_INFO.pay_bus
  is '��Ӫ֧��';
comment on column COM_CAR_ASS_OUT_NS_INFO.should_pay_tax
  is 'Ӧ������˰';
comment on column COM_CAR_ASS_OUT_NS_INFO.num_org
  is 'ҵ������������';
comment on column COM_CAR_ASS_OUT_NS_INFO.in_car
  is '��ҵ����';
comment on column COM_CAR_ASS_OUT_NS_INFO.income_others
  is '��������';
comment on column COM_CAR_ASS_OUT_NS_INFO.sma_diainto_spefun
  is '����ר��С��';
comment on column COM_CAR_ASS_OUT_NS_INFO.pay_nobudg_out
  is 'Ԥ�����ʽ�֧��';
comment on column COM_CAR_ASS_OUT_NS_INFO.pay_spefun
  is 'ר��֧��';
comment on column COM_CAR_ASS_OUT_NS_INFO.normal_balance
  is '�����������';
comment on column COM_CAR_ASS_OUT_NS_INFO.buss_sum
  is '��Ӫ����';
comment on column COM_CAR_ASS_OUT_NS_INFO.with_dra_fun
  is '��ȡר�û���    ';
comment on column COM_CAR_ASS_OUT_NS_INFO.report_type
  is '��������';
comment on column COM_CAR_ASS_OUT_NS_INFO.out_car
  is '��ҵ֧��';
comment on column COM_CAR_ASS_OUT_NS_INFO.sum_spefun
  is 'ר��С��';
comment on column COM_CAR_ASS_OUT_NS_INFO.pay_last_year_car
  is '�ջ���ǰ�����ҵ֧��';
comment on column COM_CAR_ASS_OUT_NS_INFO.sma_income_bus
  is '��Ӫ����С��';
comment on column COM_CAR_ASS_OUT_NS_INFO.dia_into_spefund
  is '����ר��';
comment on column COM_CAR_ASS_OUT_NS_INFO.pay_out_top
  is '�Ͻ��ϼ�֧��';
comment on column COM_CAR_ASS_OUT_NS_INFO.bus_smar_sum
  is '��Ӫ֧��С��';
comment on column COM_CAR_ASS_OUT_NS_INFO.pay_sum
  is '֧���ܼ�';
comment on column COM_CAR_ASS_OUT_NS_INFO.report_year
  is '�������';
comment on column COM_CAR_ASS_OUT_NS_INFO.in_aff_pay
  is '������λ�ɿ�';
comment on column COM_CAR_ASS_OUT_NS_INFO.income_notbudg_out
  is 'Ԥ�����ʽ�����';
comment on column COM_CAR_ASS_OUT_NS_INFO.income_bus
  is '��Ӫ����';
comment on column COM_CAR_ASS_OUT_NS_INFO.income_sum
  is '�����ܼ�';
comment on column COM_CAR_ASS_OUT_NS_INFO.set_aside_funds
  is '��������';
comment on column COM_CAR_ASS_OUT_NS_INFO.tax_sale
  is '����˰��';
comment on column COM_CAR_ASS_OUT_NS_INFO.balan_dis
  is '�������';
comment on column COM_CAR_ASS_OUT_NS_INFO.sma_sum_car
  is '��ҵ����С��';
comment on column COM_CAR_ASS_OUT_NS_INFO.befor_year_busloss
  is '��ǰ��Ⱦ�Ӫ����';
comment on column COM_CAR_ASS_OUT_NS_INFO.bala_other_dis
  is '�����������    ';
comment on column COM_CAR_ASS_OUT_NS_INFO.in_fis_sub_in
  is '������������';
comment on column COM_CAR_ASS_OUT_NS_INFO.pay_car_fis
  is '��������֧��';
comment on column COM_CAR_ASS_OUT_NS_INFO.carr_for_sel_infras
  is '��ת�Գ����';
comment on column COM_CAR_ASS_OUT_NS_INFO.pay_car_sum
  is '��ҵ֧��С��';
comment on column COM_CAR_ASS_OUT_NS_INFO.dia_out_spefun
  is '����ר��';
comment on column COM_CAR_ASS_OUT_NS_INFO.car_balance
  is '��ҵ����';
comment on column COM_CAR_ASS_OUT_NS_INFO.out_dra_fun
  is 'ת����ҵ����    ';
comment on column COM_CAR_ASS_OUT_NS_INFO.fina_id
  is '���񱨱���';
comment on column COM_CAR_ASS_OUT_NS_INFO.smart_type_report
  is '��������ϸ��';
comment on column COM_CAR_ASS_OUT_NS_INFO.top_in_fis
  is '�ϼ���������';
comment on column COM_CAR_ASS_OUT_NS_INFO.in_fis_sub
  is '�Ը�����λ����';
comment on column COM_CAR_ASS_OUT_NS_INFO.tax_sale_in
  is '����˰��';

