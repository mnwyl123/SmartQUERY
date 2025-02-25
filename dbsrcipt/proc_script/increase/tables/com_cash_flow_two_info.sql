create table COM_CASH_FLOW_TWO_INFO
(
  report_id            VARCHAR2(30) not null,
  fixed_fund_old       VARCHAR2(100),
  sum_buss_cash_in     VARCHAR2(100),
  sum_buss_cash_out    VARCHAR2(100),
  long_term_invest     VARCHAR2(100),
  sum_inve_cash_in     VARCHAR2(100),
  repay_pay_cash       VARCHAR2(100),
  impact_exchange_rate VARCHAR2(100),
  net_profit           VARCHAR2(100),
  increas_withholding  VARCHAR2(100),
  fina_char            VARCHAR2(100),
  others_no            VARCHAR2(100),
  cash_star_ba         VARCHAR2(100),
  rece_invest_cash     VARCHAR2(100),
  smart_sum_ca_invest  VARCHAR2(100),
  raise_acti_line      VARCHAR2(100),
  seme_cash_bal        VARCHAR2(100),
  amortization_reduce  VARCHAR2(100),
  reduce_invent        VARCHAR2(100),
  buss_should_reduce   VARCHAR2(100),
  cash_bala_end        VARCHAR2(100),
  rece_other_ac_cash   VARCHAR2(100),
  buy_cash             VARCHAR2(100),
  pay_some_tax         VARCHAR2(100),
  pay_others_cash_bu   VARCHAR2(100),
  invest_rece_cash     VARCHAR2(100),
  receive_other_cash   VARCHAR2(100),
  rece_other_ac_cash_i VARCHAR2(100),
  asset_reduce         VARCHAR2(100),
  long_term_amor       VARCHAR2(100),
  bus_acti_cash_fo     VARCHAR2(100),
  cash_bala_star       VARCHAR2(100),
  fina_id              VARCHAR2(100),
  cash_long_term       VARCHAR2(100),
  borr_rece_cash       VARCHAR2(100),
  defe_tax_credit      VARCHAR2(100),
  others               VARCHAR2(100),
  report_year          VARCHAR2(100),
  cash_good            VARCHAR2(100),
  tax_receive          VARCHAR2(100),
  pay_others_cash_buss VARCHAR2(100),
  fix_loss             VARCHAR2(100),
  debt_capital         VARCHAR2(100),
  num_org              VARCHAR2(100),
  report_type          VARCHAR2(100),
  pay_employ_cash      VARCHAR2(100),
  bus_acti_cash_folw   VARCHAR2(100),
  invest_cash_net      VARCHAR2(100),
  smart_sum_acti       VARCHAR2(100),
  raise_acti_flow      VARCHAR2(100),
  asset_fix_cap        VARCHAR2(100),
  seme_cash_bal_in     VARCHAR2(100),
  num_fina             VARCHAR2(100),
  invest_pay_cash      VARCHAR2(100),
  pay_cash             VARCHAR2(100),
  amortization         VARCHAR2(100),
  asset_loss           VARCHAR2(100),
  invest_loss          VARCHAR2(100),
  buss_should_incres   VARCHAR2(100),
  year_company_debt    VARCHAR2(100),
  cash_end_ba          VARCHAR2(100),
  smart_type_report    VARCHAR2(100),
  inve_other_acti_cash VARCHAR2(100),
  cash_inve_absor      VARCHAR2(100)
)
;
comment on table COM_CASH_FLOW_TWO_INFO
  is '��ҵ�ֽ�������2002 �棩��Ϣ��Ԫ';
comment on column COM_CASH_FLOW_TWO_INFO.report_id
  is '������';
comment on column COM_CASH_FLOW_TWO_INFO.fixed_fund_old
  is '�̶��ʲ����';
comment on column COM_CASH_FLOW_TWO_INFO.sum_buss_cash_in
  is '��Ӫ��ֽ�����С��';
comment on column COM_CASH_FLOW_TWO_INFO.sum_buss_cash_out
  is '��Ӫ��ֽ�����С��';
comment on column COM_CASH_FLOW_TWO_INFO.long_term_invest
  is '���ù̶��ʲ������ʲ������������ʲ����ջص��ֽ𾻶�';
comment on column COM_CASH_FLOW_TWO_INFO.sum_inve_cash_in
  is 'Ͷ�ʻ�ֽ�����С��';
comment on column COM_CASH_FLOW_TWO_INFO.repay_pay_cash
  is '����ծ����֧�����ֽ�';
comment on column COM_CASH_FLOW_TWO_INFO.impact_exchange_rate
  is '���ʱ䶯���ֽ��Ӱ��';
comment on column COM_CASH_FLOW_TWO_INFO.net_profit
  is '������';
comment on column COM_CASH_FLOW_TWO_INFO.increas_withholding
  is 'Ԥ���������';
comment on column COM_CASH_FLOW_TWO_INFO.fina_char
  is '�������';
comment on column COM_CASH_FLOW_TWO_INFO.others_no
  is '�����漰�ֽ���֧��Ͷ�ʺͳ��ʻ��Ŀ�£�����';
comment on column COM_CASH_FLOW_TWO_INFO.cash_star_ba
  is '�ֽ�ȼ�����ڳ����';
comment on column COM_CASH_FLOW_TWO_INFO.rece_invest_cash
  is '�ջ�Ͷ�����յ����ֽ�';
comment on column COM_CASH_FLOW_TWO_INFO.smart_sum_ca_invest
  is 'Ͷ�ʻ�ֽ�����С��';
comment on column COM_CASH_FLOW_TWO_INFO.raise_acti_line
  is '�Ｏ��������ֽ���������';
comment on column COM_CASH_FLOW_TWO_INFO.seme_cash_bal
  is '�ֽ��ֽ�ȼ��ﾻ���Ӷ�';
comment on column COM_CASH_FLOW_TWO_INFO.amortization_reduce
  is '��̯���ü���';
comment on column COM_CASH_FLOW_TWO_INFO.reduce_invent
  is '����ļ���';
comment on column COM_CASH_FLOW_TWO_INFO.buss_should_reduce
  is '��Ӫ��Ӧ����Ŀ�ļ���';
comment on column COM_CASH_FLOW_TWO_INFO.cash_bala_end
  is '�ֽ����ĩ���';
comment on column COM_CASH_FLOW_TWO_INFO.rece_other_ac_cash
  is '�յ��������뾭Ӫ��йص��ֽ�';
comment on column COM_CASH_FLOW_TWO_INFO.buy_cash
  is '������Ʒ����������֧�����ֽ�';
comment on column COM_CASH_FLOW_TWO_INFO.pay_some_tax
  is '֧���ĸ���˰��';
comment on column COM_CASH_FLOW_TWO_INFO.pay_others_cash_bu
  is '֧���������뾭Ӫ��йص��ֽ�';
comment on column COM_CASH_FLOW_TWO_INFO.invest_rece_cash
  is 'ȡ��Ͷ���������յ����ֽ�';
comment on column COM_CASH_FLOW_TWO_INFO.receive_other_cash
  is '�յ���������Ͷ�ʻ�йص��ֽ�';
comment on column COM_CASH_FLOW_TWO_INFO.rece_other_ac_cash_i
  is '�յ�����������ʻ�йص��ֽ�';
comment on column COM_CASH_FLOW_TWO_INFO.asset_reduce
  is '������ʲ���ֵ׼��';
comment on column COM_CASH_FLOW_TWO_INFO.long_term_amor
  is '���ڴ�̯����̯��';
comment on column COM_CASH_FLOW_TWO_INFO.bus_acti_cash_fo
  is '��Ӫ��������ֽ���������';
comment on column COM_CASH_FLOW_TWO_INFO.cash_bala_star
  is '�ֽ���ڳ����';
comment on column COM_CASH_FLOW_TWO_INFO.fina_id
  is '���񱨱���';
comment on column COM_CASH_FLOW_TWO_INFO.cash_long_term
  is '�����̶��ʲ������ʲ������������ʲ���֧�����ֽ�';
comment on column COM_CASH_FLOW_TWO_INFO.borr_rece_cash
  is '������յ����ֽ�';
comment on column COM_CASH_FLOW_TWO_INFO.defe_tax_credit
  is '����˰�����';
comment on column COM_CASH_FLOW_TWO_INFO.others
  is '�����������Ϊ��Ӫ��ֽ�������Ŀ�£�����';
comment on column COM_CASH_FLOW_TWO_INFO.report_year
  is '�������';
comment on column COM_CASH_FLOW_TWO_INFO.cash_good
  is '������Ʒ���ṩ�����յ����ֽ�';
comment on column COM_CASH_FLOW_TWO_INFO.tax_receive
  is '�յ���˰�ѷ���';
comment on column COM_CASH_FLOW_TWO_INFO.pay_others_cash_buss
  is '֧������������ʻ�йص��ֽ�';
comment on column COM_CASH_FLOW_TWO_INFO.fix_loss
  is '�̶��ʲ�������ʧ';
comment on column COM_CASH_FLOW_TWO_INFO.debt_capital
  is 'ծ��תΪ�ʱ�';
comment on column COM_CASH_FLOW_TWO_INFO.num_org
  is 'ҵ������������';
comment on column COM_CASH_FLOW_TWO_INFO.report_type
  is '��������';
comment on column COM_CASH_FLOW_TWO_INFO.pay_employ_cash
  is '֧����ְ���Լ�Ϊְ��֧�����ֽ�';
comment on column COM_CASH_FLOW_TWO_INFO.bus_acti_cash_folw
  is '��Ӫ��������ֽ���������';
comment on column COM_CASH_FLOW_TWO_INFO.invest_cash_net
  is 'Ͷ�ʻ�������ֽ���������';
comment on column COM_CASH_FLOW_TWO_INFO.smart_sum_acti
  is '���ʻ�ֽ�����С��';
comment on column COM_CASH_FLOW_TWO_INFO.raise_acti_flow
  is '���ʻ�ֽ�����С��';
comment on column COM_CASH_FLOW_TWO_INFO.asset_fix_cap
  is '��������̶��ʲ�';
comment on column COM_CASH_FLOW_TWO_INFO.seme_cash_bal_in
  is '�ֽ��ֽ�ȼ��ﾻ���Ӷ�';
comment on column COM_CASH_FLOW_TWO_INFO.num_fina
  is 'ҵ��������';
comment on column COM_CASH_FLOW_TWO_INFO.invest_pay_cash
  is 'Ͷ����֧�����ֽ�';
comment on column COM_CASH_FLOW_TWO_INFO.pay_cash
  is '�������������򳥸���Ϣ��֧�����ֽ�';
comment on column COM_CASH_FLOW_TWO_INFO.amortization
  is '�����ʲ�̯��';
comment on column COM_CASH_FLOW_TWO_INFO.asset_loss
  is '���ù̶��ʲ������ʲ������������ʲ�����ʧ';
comment on column COM_CASH_FLOW_TWO_INFO.invest_loss
  is 'Ͷ����ʧ';
comment on column COM_CASH_FLOW_TWO_INFO.buss_should_incres
  is '��Ӫ��Ӧ����Ŀ������';
comment on column COM_CASH_FLOW_TWO_INFO.year_company_debt
  is 'һ���ڵ��ڵĿ�ת����˾ծȯ';
comment on column COM_CASH_FLOW_TWO_INFO.cash_end_ba
  is '�ֽ�ȼ������ĩ���';
comment on column COM_CASH_FLOW_TWO_INFO.smart_type_report
  is '��������ϸ��';
comment on column COM_CASH_FLOW_TWO_INFO.inve_other_acti_cash
  is '֧����������Ͷ�ʻ�йص��ֽ�';
comment on column COM_CASH_FLOW_TWO_INFO.cash_inve_absor
  is '����Ͷ�����յ����ֽ�';

