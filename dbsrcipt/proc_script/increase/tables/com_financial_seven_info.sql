create table COM_FINANCIAL_SEVEN_INFO
(
  report_id            VARCHAR2(30) not null,
  report_year          VARCHAR2(100),
  should_paper_in      VARCHAR2(100),
  should_interst       VARCHAR2(100),
  pay_dep              VARCHAR2(100),
  long_term_amor       VARCHAR2(100),
  trans_info_debt      VARCHAR2(100),
  should_pay_tax       VARCHAR2(100),
  years_unflows_debt   VARCHAR2(100),
  flow_lia_sum         VARCHAR2(100),
  incres_dy            VARCHAR2(100),
  others_unflows_debt  VARCHAR2(100),
  sum_debt             VARCHAR2(100),
  reduce_div           VARCHAR2(100),
  should_account       VARCHAR2(100),
  engin_mater          VARCHAR2(100),
  should_par           VARCHAR2(100),
  total_debt_owner_sum VARCHAR2(100),
  smart_type_report    VARCHAR2(100),
  should_divi_in       VARCHAR2(100),
  unflow_asset_end     VARCHAR2(100),
  other_flow_asset     VARCHAR2(100),
  flow_asset_sum       VARCHAR2(100),
  long_term_equi_inve  VARCHAR2(100),
  long_term_rece       VARCHAR2(100),
  goodwill             VARCHAR2(100),
  other_unflow_asset   VARCHAR2(100),
  sum_asset            VARCHAR2(100),
  receive_money        VARCHAR2(100),
  undis_profit         VARCHAR2(100),
  fix_asset            VARCHAR2(100),
  engineering          VARCHAR2(100),
  asset_produc_biolo   VARCHAR2(100),
  should_wage          VARCHAR2(100),
  other_should_fu_pa   VARCHAR2(100),
  borr_longtim         VARCHAR2(100),
  num_fina             VARCHAR2(100),
  num_org              VARCHAR2(100),
  report_type          VARCHAR2(100),
  invest_build         VARCHAR2(100),
  fix_asset_clean      VARCHAR2(100),
  oil_gas_asset        VARCHAR2(100),
  un_asset             VARCHAR2(100),
  should_profit        VARCHAR2(100),
  should_divi          VARCHAR2(100),
  should_debt          VARCHAR2(100),
  pay_longtim          VARCHAR2(100),
  trans_asset_fix      VARCHAR2(100),
  asset_mark_fina      VARCHAR2(100),
  reduce_asset         VARCHAR2(100),
  short_time_borr      VARCHAR2(100),
  fina_id              VARCHAR2(100),
  inventory            VARCHAR2(100),
  should_paper         VARCHAR2(100),
  spe_should_par       VARCHAR2(100),
  estima_debt          VARCHAR2(100),
  flow_lia_sum_un      VARCHAR2(100),
  capital_reserves     VARCHAR2(100),
  surplus_reserves     VARCHAR2(100),
  total_owner_equity   VARCHAR2(100),
  money_fund           VARCHAR2(100),
  pre_par              VARCHAR2(100),
  other_should_par     VARCHAR2(100),
  end_date_invest      VARCHAR2(100),
  unflow_asset         VARCHAR2(100),
  defe_reven           VARCHAR2(100),
  oth_flow_lia         VARCHAR2(100)
)
;
comment on table COM_FINANCIAL_SEVEN_INFO
  is '��ҵ�ʲ���ծ��2007 �棩��Ϣ��Ԫ';
comment on column COM_FINANCIAL_SEVEN_INFO.report_id
  is '������';
comment on column COM_FINANCIAL_SEVEN_INFO.report_year
  is '�������';
comment on column COM_FINANCIAL_SEVEN_INFO.should_paper_in
  is 'Ӧ��Ʊ��';
comment on column COM_FINANCIAL_SEVEN_INFO.should_interst
  is 'Ӧ����Ϣ';
comment on column COM_FINANCIAL_SEVEN_INFO.pay_dep
  is '����֧��';
comment on column COM_FINANCIAL_SEVEN_INFO.long_term_amor
  is '���ڴ�̯����';
comment on column COM_FINANCIAL_SEVEN_INFO.trans_info_debt
  is '�����Խ��ڸ�ծ';
comment on column COM_FINANCIAL_SEVEN_INFO.should_pay_tax
  is 'Ӧ��˰��';
comment on column COM_FINANCIAL_SEVEN_INFO.years_unflows_debt
  is 'һ���ڵ��ڵķ�������ծ';
comment on column COM_FINANCIAL_SEVEN_INFO.flow_lia_sum
  is '������ծ�ϼ�';
comment on column COM_FINANCIAL_SEVEN_INFO.incres_dy
  is '��������˰��ծ';
comment on column COM_FINANCIAL_SEVEN_INFO.others_unflows_debt
  is '������������ծ';
comment on column COM_FINANCIAL_SEVEN_INFO.sum_debt
  is '��ծ�ϼ�';
comment on column COM_FINANCIAL_SEVEN_INFO.reduce_div
  is '��������';
comment on column COM_FINANCIAL_SEVEN_INFO.should_account
  is 'Ӧ���˿�';
comment on column COM_FINANCIAL_SEVEN_INFO.engin_mater
  is '��������';
comment on column COM_FINANCIAL_SEVEN_INFO.should_par
  is 'Ӧ���˿�';
comment on column COM_FINANCIAL_SEVEN_INFO.total_debt_owner_sum
  is '��ծ��������Ȩ��ϼ�';
comment on column COM_FINANCIAL_SEVEN_INFO.smart_type_report
  is '��������ϸ��';
comment on column COM_FINANCIAL_SEVEN_INFO.should_divi_in
  is 'Ӧ�չ���';
comment on column COM_FINANCIAL_SEVEN_INFO.unflow_asset_end
  is 'һ���ڵ��ڵķ������ʲ�';
comment on column COM_FINANCIAL_SEVEN_INFO.other_flow_asset
  is '���������ʲ�';
comment on column COM_FINANCIAL_SEVEN_INFO.flow_asset_sum
  is '�����ʲ��ϼ�';
comment on column COM_FINANCIAL_SEVEN_INFO.long_term_equi_inve
  is '���ڹ�ȨͶ��';
comment on column COM_FINANCIAL_SEVEN_INFO.long_term_rece
  is '����Ӧ�տ�';
comment on column COM_FINANCIAL_SEVEN_INFO.goodwill
  is '����';
comment on column COM_FINANCIAL_SEVEN_INFO.other_unflow_asset
  is '�����������ʲ�';
comment on column COM_FINANCIAL_SEVEN_INFO.sum_asset
  is '�ʲ��ܼ�';
comment on column COM_FINANCIAL_SEVEN_INFO.receive_money
  is 'ʵ���ʱ�����ɱ���';
comment on column COM_FINANCIAL_SEVEN_INFO.undis_profit
  is 'δ��������';
comment on column COM_FINANCIAL_SEVEN_INFO.fix_asset
  is '�̶��ʲ�';
comment on column COM_FINANCIAL_SEVEN_INFO.engineering
  is '�ڽ�����';
comment on column COM_FINANCIAL_SEVEN_INFO.asset_produc_biolo
  is '�����������ʲ�';
comment on column COM_FINANCIAL_SEVEN_INFO.should_wage
  is 'Ӧ��ְ��н��';
comment on column COM_FINANCIAL_SEVEN_INFO.other_should_fu_pa
  is '����Ӧ����';
comment on column COM_FINANCIAL_SEVEN_INFO.borr_longtim
  is '���ڽ��';
comment on column COM_FINANCIAL_SEVEN_INFO.num_fina
  is 'ҵ��������';
comment on column COM_FINANCIAL_SEVEN_INFO.num_org
  is 'ҵ������������';
comment on column COM_FINANCIAL_SEVEN_INFO.report_type
  is '��������';
comment on column COM_FINANCIAL_SEVEN_INFO.invest_build
  is 'Ͷ���Է��ز�';
comment on column COM_FINANCIAL_SEVEN_INFO.fix_asset_clean
  is '�̶��ʲ�����';
comment on column COM_FINANCIAL_SEVEN_INFO.oil_gas_asset
  is '�����ʲ�';
comment on column COM_FINANCIAL_SEVEN_INFO.un_asset
  is '�����ʲ�';
comment on column COM_FINANCIAL_SEVEN_INFO.should_profit
  is 'Ӧ����Ϣ';
comment on column COM_FINANCIAL_SEVEN_INFO.should_divi
  is 'Ӧ������';
comment on column COM_FINANCIAL_SEVEN_INFO.should_debt
  is 'Ӧ��ծȯ';
comment on column COM_FINANCIAL_SEVEN_INFO.pay_longtim
  is '����Ӧ����';
comment on column COM_FINANCIAL_SEVEN_INFO.trans_asset_fix
  is '�����Խ����ʲ�';
comment on column COM_FINANCIAL_SEVEN_INFO.asset_mark_fina
  is '�ɹ����۵Ľ����ʲ�';
comment on column COM_FINANCIAL_SEVEN_INFO.reduce_asset
  is '��������˰�ʲ�';
comment on column COM_FINANCIAL_SEVEN_INFO.short_time_borr
  is '���ڽ��';
comment on column COM_FINANCIAL_SEVEN_INFO.fina_id
  is '���񱨱���';
comment on column COM_FINANCIAL_SEVEN_INFO.inventory
  is '���';
comment on column COM_FINANCIAL_SEVEN_INFO.should_paper
  is 'Ӧ��Ʊ��';
comment on column COM_FINANCIAL_SEVEN_INFO.spe_should_par
  is 'ר��Ӧ����';
comment on column COM_FINANCIAL_SEVEN_INFO.estima_debt
  is 'Ԥ�Ƹ�ծ';
comment on column COM_FINANCIAL_SEVEN_INFO.flow_lia_sum_un
  is '��������ծ�ϼ�';
comment on column COM_FINANCIAL_SEVEN_INFO.capital_reserves
  is '�ʱ�����';
comment on column COM_FINANCIAL_SEVEN_INFO.surplus_reserves
  is 'ӯ�๫��';
comment on column COM_FINANCIAL_SEVEN_INFO.total_owner_equity
  is '������Ȩ��ϼ�';
comment on column COM_FINANCIAL_SEVEN_INFO.money_fund
  is '�����ʽ�';
comment on column COM_FINANCIAL_SEVEN_INFO.pre_par
  is 'Ԥ���˿�';
comment on column COM_FINANCIAL_SEVEN_INFO.other_should_par
  is '����Ӧ�տ�';
comment on column COM_FINANCIAL_SEVEN_INFO.end_date_invest
  is '����������Ͷ��';
comment on column COM_FINANCIAL_SEVEN_INFO.unflow_asset
  is '�������ʲ��ϼ�';
comment on column COM_FINANCIAL_SEVEN_INFO.defe_reven
  is 'Ԥ���˿�';
comment on column COM_FINANCIAL_SEVEN_INFO.oth_flow_lia
  is '����������ծ';

