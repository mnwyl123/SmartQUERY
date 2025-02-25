create table COM_PROFIT_INFO_SEVEN_INFO
(
  report_id          VARCHAR2(30) not null,
  income_bus         VARCHAR2(100),
  fina_cost          VARCHAR2(100),
  unflow_loss        VARCHAR2(100),
  fina_id            VARCHAR2(100),
  sale_cost          VARCHAR2(100),
  mana_cost          VARCHAR2(100),
  inves_income       VARCHAR2(100),
  buss_other_incom   VARCHAR2(100),
  dilu_ear_per_share VARCHAR2(100),
  report_year        VARCHAR2(100),
  income_cost        VARCHAR2(100),
  buss_other_pay     VARCHAR2(100),
  bus_tax_other      VARCHAR2(100),
  buss_profits       VARCHAR2(100),
  report_type        VARCHAR2(100),
  smart_type_report  VARCHAR2(100),
  loss_redu          VARCHAR2(100),
  sum_profits        VARCHAR2(100),
  incom_join_venture VARCHAR2(100),
  income_tax         VARCHAR2(100),
  net_profit         VARCHAR2(100),
  num_fina           VARCHAR2(100),
  num_org            VARCHAR2(100),
  chang_incom        VARCHAR2(100),
  every_net_income   VARCHAR2(100)
)
;
comment on table COM_PROFIT_INFO_SEVEN_INFO
  is '��ҵ������������2007 �棩��Ϣ��Ԫ';
comment on column COM_PROFIT_INFO_SEVEN_INFO.report_id
  is '������';
comment on column COM_PROFIT_INFO_SEVEN_INFO.income_bus
  is 'Ӫҵ����';
comment on column COM_PROFIT_INFO_SEVEN_INFO.fina_cost
  is '�������';
comment on column COM_PROFIT_INFO_SEVEN_INFO.unflow_loss
  is '�������ʲ���ʧ�����У��������ʲ�������ʧ)';
comment on column COM_PROFIT_INFO_SEVEN_INFO.fina_id
  is '���񱨱���';
comment on column COM_PROFIT_INFO_SEVEN_INFO.sale_cost
  is '���۷���';
comment on column COM_PROFIT_INFO_SEVEN_INFO.mana_cost
  is '�������';
comment on column COM_PROFIT_INFO_SEVEN_INFO.inves_income
  is 'Ͷ�ʾ�����';
comment on column COM_PROFIT_INFO_SEVEN_INFO.buss_other_incom
  is 'Ӫҵ������';
comment on column COM_PROFIT_INFO_SEVEN_INFO.dilu_ear_per_share
  is 'ϡ��ÿ������';
comment on column COM_PROFIT_INFO_SEVEN_INFO.report_year
  is '�������';
comment on column COM_PROFIT_INFO_SEVEN_INFO.income_cost
  is 'Ӫҵ�ɱ�';
comment on column COM_PROFIT_INFO_SEVEN_INFO.buss_other_pay
  is 'Ӫҵ��֧��';
comment on column COM_PROFIT_INFO_SEVEN_INFO.bus_tax_other
  is 'Ӫҵ˰�𼰸���';
comment on column COM_PROFIT_INFO_SEVEN_INFO.buss_profits
  is 'Ӫҵ����';
comment on column COM_PROFIT_INFO_SEVEN_INFO.report_type
  is '��������';
comment on column COM_PROFIT_INFO_SEVEN_INFO.smart_type_report
  is '��������ϸ��';
comment on column COM_PROFIT_INFO_SEVEN_INFO.loss_redu
  is '�ʲ���ֵ��ʧ';
comment on column COM_PROFIT_INFO_SEVEN_INFO.sum_profits
  is '�����ܶ�';
comment on column COM_PROFIT_INFO_SEVEN_INFO.incom_join_venture
  is '����Ӫ��ҵ�ͺ�Ӫ��ҵ��Ͷ������';
comment on column COM_PROFIT_INFO_SEVEN_INFO.income_tax
  is '����˰����';
comment on column COM_PROFIT_INFO_SEVEN_INFO.net_profit
  is '������';
comment on column COM_PROFIT_INFO_SEVEN_INFO.num_fina
  is 'ҵ��������';
comment on column COM_PROFIT_INFO_SEVEN_INFO.num_org
  is 'ҵ������������';
comment on column COM_PROFIT_INFO_SEVEN_INFO.chang_incom
  is '���ʼ�ֵ�䶯������';
comment on column COM_PROFIT_INFO_SEVEN_INFO.every_net_income
  is '����ÿ������';

