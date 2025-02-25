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
  is '��ҵ��λ�ʲ���ծ��2013 �棩��Ϣ��Ԫ';
comment on column COM_CAR_ASS_LIA_OT_INFO.report_id
  is '������';
comment on column COM_CAR_ASS_LIA_OT_INFO.line_car_should
  is '����Ӧ�������';
comment on column COM_CAR_ASS_LIA_OT_INFO.unactiv_sum
  is '��������ծ�ϼ�';
comment on column COM_CAR_ASS_LIA_OT_INFO.bal_set_sum
  is '��ծ�;��ʲ��ܼ�';
comment on column COM_CAR_ASS_LIA_OT_INFO.fina_id
  is '���񱨱���';
comment on column COM_CAR_ASS_LIA_OT_INFO.short_term_inves
  is '����Ͷ��';
comment on column COM_CAR_ASS_LIA_OT_INFO.should_paper
  is 'Ӧ��Ʊ��';
comment on column COM_CAR_ASS_LIA_OT_INFO.unfina_bala
  is '�ǲ�����������';
comment on column COM_CAR_ASS_LIA_OT_INFO.bala_mang
  is '��Ӫ����';
comment on column COM_CAR_ASS_LIA_OT_INFO.sum_set
  is '���ʲ��ϼ�';
comment on column COM_CAR_ASS_LIA_OT_INFO.report_year
  is '�������';
comment on column COM_CAR_ASS_LIA_OT_INFO.report_type
  is '��������';
comment on column COM_CAR_ASS_LIA_OT_INFO.flow_asset_sum
  is '�����ʲ��ϼ�';
comment on column COM_CAR_ASS_LIA_OT_INFO.price_fix_asset
  is '�̶��ʲ�ԭ��';
comment on column COM_CAR_ASS_LIA_OT_INFO.should_salary
  is 'Ӧ��ְ��н��';
comment on column COM_CAR_ASS_LIA_OT_INFO.flow_lia_sum
  is '������ծ�ϼ�';
comment on column COM_CAR_ASS_LIA_OT_INFO.borr_longtim
  is '���ڽ��';
comment on column COM_CAR_ASS_LIA_OT_INFO.unactiv_mony
  is '�������ʲ�����';
comment on column COM_CAR_ASS_LIA_OT_INFO.fina_aid
  is '����������ת';
comment on column COM_CAR_ASS_LIA_OT_INFO.inventory
  is '���';
comment on column COM_CAR_ASS_LIA_OT_INFO.other_flow_asset
  is '���������ʲ�';
comment on column COM_CAR_ASS_LIA_OT_INFO.un_asset_price
  is '�����ʲ�ԭ��';
comment on column COM_CAR_ASS_LIA_OT_INFO.unflow_asset_sum
  is '�������ʲ��ϼ�';
comment on column COM_CAR_ASS_LIA_OT_INFO.should_contr_para
  is 'Ӧ�ɹ����';
comment on column COM_CAR_ASS_LIA_OT_INFO.should_reven
  is 'Ӧ���˿�';
comment on column COM_CAR_ASS_LIA_OT_INFO.engineering
  is '�ڽ�����';
comment on column COM_CAR_ASS_LIA_OT_INFO.sum_sell
  is '�ۼ�̯��';
comment on column COM_CAR_ASS_LIA_OT_INFO.should_pay_tax
  is 'Ӧ��˰��';
comment on column COM_CAR_ASS_LIA_OT_INFO.pay_longtim
  is '����Ӧ����';
comment on column COM_CAR_ASS_LIA_OT_INFO.sum_lia
  is '��ծ�ϼ�';
comment on column COM_CAR_ASS_LIA_OT_INFO.num_fina
  is 'ҵ��������';
comment on column COM_CAR_ASS_LIA_OT_INFO.long_term_invest
  is '����Ͷ��';
comment on column COM_CAR_ASS_LIA_OT_INFO.fis_asset
  is '�̶��ʲ�';
comment on column COM_CAR_ASS_LIA_OT_INFO.un_asset
  is '�����ʲ�';
comment on column COM_CAR_ASS_LIA_OT_INFO.wait_asset_caus
  is '�������ʲ�����';
comment on column COM_CAR_ASS_LIA_OT_INFO.short_time_borr
  is '���ڽ��';
comment on column COM_CAR_ASS_LIA_OT_INFO.dra_fun
  is '��ҵ����';
comment on column COM_CAR_ASS_LIA_OT_INFO.mon_spe
  is 'ר�û���';
comment on column COM_CAR_ASS_LIA_OT_INFO.fina_bala
  is '������������';
comment on column COM_CAR_ASS_LIA_OT_INFO.bala_car
  is '��ҵ����';
comment on column COM_CAR_ASS_LIA_OT_INFO.num_org
  is 'ҵ������������';
comment on column COM_CAR_ASS_LIA_OT_INFO.money_fund
  is '�����ʽ�';
comment on column COM_CAR_ASS_LIA_OT_INFO.should_par
  is 'Ӧ���˿�';
comment on column COM_CAR_ASS_LIA_OT_INFO.pre_par
  is 'Ԥ���˿�';
comment on column COM_CAR_ASS_LIA_OT_INFO.sum_dis_old
  is '�ۼ��۾�';
comment on column COM_CAR_ASS_LIA_OT_INFO.sum_asset
  is '�ʲ��ܼ�';
comment on column COM_CAR_ASS_LIA_OT_INFO.should_car_para
  is 'Ӧ�ɲ���ר����';
comment on column COM_CAR_ASS_LIA_OT_INFO.defe_reven
  is 'Ԥ���˿�';
comment on column COM_CAR_ASS_LIA_OT_INFO.unfina_aid
  is '�ǲ���������ת';
comment on column COM_CAR_ASS_LIA_OT_INFO.smart_type_report
  is '��������ϸ��';
comment on column COM_CAR_ASS_LIA_OT_INFO.other_should_par
  is '����Ӧ�տ�';
comment on column COM_CAR_ASS_LIA_OT_INFO.oth_should_pay
  is '����Ӧ����';
comment on column COM_CAR_ASS_LIA_OT_INFO.oth_flow_lia
  is '����������ծ';
comment on column COM_CAR_ASS_LIA_OT_INFO.should_re_bill
  is 'Ӧ��Ʊ��';

