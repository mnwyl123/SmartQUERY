create table COM_PROFIT_INFO_TWO_INFO
(
  report_id            VARCHAR2(30) not null,
  loss_fix_asset       VARCHAR2(100),
  uncomfi_inves_loss   VARCHAR2(100),
  star_year_undoprofit VARCHAR2(100),
  assigen_profit       VARCHAR2(100),
  profit_invest        VARCHAR2(100),
  extra_yygj           VARCHAR2(100),
  net_buss             VARCHAR2(100),
  income_other         VARCHAR2(100),
  non_money_benefits   VARCHAR2(100),
  profits_befor        VARCHAR2(100),
  loss_debt            VARCHAR2(100),
  extra_develop_fund   VARCHAR2(100),
  others_kfp           VARCHAR2(100),
  pay_divi_pt          VARCHAR2(100),
  fina_id              VARCHAR2(100),
  num_fina             VARCHAR2(100),
  num_org              VARCHAR2(100),
  smart_type_report    VARCHAR2(100),
  discount             VARCHAR2(100),
  operating_expense    VARCHAR2(100),
  operating_expen      VARCHAR2(100),
  mana_cost            VARCHAR2(100),
  fine_income          VARCHAR2(100),
  fine_cost            VARCHAR2(100),
  extra_sur_money      VARCHAR2(100),
  other_invest_profits VARCHAR2(100),
  cost_buss            VARCHAR2(100),
  income_invest        VARCHAR2(100),
  income_future        VARCHAR2(100),
  income_buss_yyw      VARCHAR2(100),
  income_asset_shyi    VARCHAR2(100),
  buss_pay             VARCHAR2(100),
  donate_cost          VARCHAR2(100),
  sur_res_loss         VARCHAR2(100),
  supp_flows_asset     VARCHAR2(100),
  extra_reserve        VARCHAR2(100),
  report_year          VARCHAR2(100),
  others               VARCHAR2(100),
  buss_profits_z       VARCHAR2(100),
  buss_profits         VARCHAR2(100),
  other_adjust_reason  VARCHAR2(100),
  single_reten_prof    VARCHAR2(100),
  income_bus           VARCHAR2(100),
  buss_other_profits   VARCHAR2(100),
  others_cost          VARCHAR2(100),
  income_subsidies     VARCHAR2(100),
  profits_loss_min     VARCHAR2(100),
  net_profit           VARCHAR2(100),
  profits_invest_fp    VARCHAR2(100),
  exp_prd_cost         VARCHAR2(100),
  defe_income          VARCHAR2(100),
  income_company_ks    VARCHAR2(100),
  income_sale_asset    VARCHAR2(100),
  others_profits       VARCHAR2(100),
  other_pay            VARCHAR2(100),
  tax                  VARCHAR2(100),
  divi_pay_prefer      VARCHAR2(100),
  pay_div_asset        VARCHAR2(100),
  undis_profit         VARCHAR2(100),
  loss_tax_befor       VARCHAR2(100),
  exp_income_prd       VARCHAR2(100),
  in_income_prd        VARCHAR2(100),
  bus_tax_other        VARCHAR2(100),
  fina_cost            VARCHAR2(100),
  wage_carry_forward   VARCHAR2(100),
  sum_profits          VARCHAR2(100),
  extra_sur_res        VARCHAR2(100),
  extra_emply_wefare   VARCHAR2(100),
  report_type          VARCHAR2(100),
  income_dg            VARCHAR2(100)
)
;
comment on table COM_PROFIT_INFO_TWO_INFO
  is '��ҵ������������2002 �棩��Ϣ��Ԫ';
comment on column COM_PROFIT_INFO_TWO_INFO.report_id
  is '������';
comment on column COM_PROFIT_INFO_TWO_INFO.loss_fix_asset
  is '��Ӫҵ��֧����Ŀ�£����ù̶��ʲ�����ʧ';
comment on column COM_PROFIT_INFO_TWO_INFO.uncomfi_inves_loss
  is 'δȷ�ϵ�Ͷ����ʧ';
comment on column COM_PROFIT_INFO_TWO_INFO.star_year_undoprofit
  is '���δ��������';
comment on column COM_PROFIT_INFO_TWO_INFO.assigen_profit
  is '�ɹ����������';
comment on column COM_PROFIT_INFO_TWO_INFO.profit_invest
  is '����黹Ͷ��';
comment on column COM_PROFIT_INFO_TWO_INFO.extra_yygj
  is '��ȡ����ӯ�๫��';
comment on column COM_PROFIT_INFO_TWO_INFO.net_buss
  is '��Ӫҵ�����뾻��';
comment on column COM_PROFIT_INFO_TWO_INFO.income_other
  is '���������룩';
comment on column COM_PROFIT_INFO_TWO_INFO.non_money_benefits
  is '��Ӫҵ�������Ŀ�£��ǻ����Խ�������';
comment on column COM_PROFIT_INFO_TWO_INFO.profits_befor
  is '��������Ŀ�£�����ǰ��Ⱥ������ʽ����ֲ�����';
comment on column COM_PROFIT_INFO_TWO_INFO.loss_debt
  is '��Ӫҵ��֧����Ŀ�£�ծ��������ʧ';
comment on column COM_PROFIT_INFO_TWO_INFO.extra_develop_fund
  is '��ȡ��ҵ��չ����';
comment on column COM_PROFIT_INFO_TWO_INFO.others_kfp
  is '���ɹ�����������Ŀ�£�����';
comment on column COM_PROFIT_INFO_TWO_INFO.pay_divi_pt
  is 'Ӧ����ͨ�ɹ���';
comment on column COM_PROFIT_INFO_TWO_INFO.fina_id
  is '���񱨱���';
comment on column COM_PROFIT_INFO_TWO_INFO.num_fina
  is 'ҵ��������';
comment on column COM_PROFIT_INFO_TWO_INFO.num_org
  is 'ҵ������������';
comment on column COM_PROFIT_INFO_TWO_INFO.smart_type_report
  is '��������ϸ��';
comment on column COM_PROFIT_INFO_TWO_INFO.discount
  is '�����ۿ�������';
comment on column COM_PROFIT_INFO_TWO_INFO.operating_expense
  is '��Ӫ����';
comment on column COM_PROFIT_INFO_TWO_INFO.operating_expen
  is 'Ӫҵ����';
comment on column COM_PROFIT_INFO_TWO_INFO.mana_cost
  is '�������';
comment on column COM_PROFIT_INFO_TWO_INFO.fine_income
  is '��Ӫҵ�������Ŀ�£��������';
comment on column COM_PROFIT_INFO_TWO_INFO.fine_cost
  is '��Ӫҵ��֧����Ŀ�£�����֧��';
comment on column COM_PROFIT_INFO_TWO_INFO.extra_sur_money
  is '��ȡ���������';
comment on column COM_PROFIT_INFO_TWO_INFO.other_invest_profits
  is '���ɹ�Ͷ���߷���������Ŀ�£�����';
comment on column COM_PROFIT_INFO_TWO_INFO.cost_buss
  is '��Ӫҵ��ɱ�';
comment on column COM_PROFIT_INFO_TWO_INFO.income_invest
  is 'Ͷ������';
comment on column COM_PROFIT_INFO_TWO_INFO.income_future
  is '�ڻ�����';
comment on column COM_PROFIT_INFO_TWO_INFO.income_buss_yyw
  is 'Ӫҵ������';
comment on column COM_PROFIT_INFO_TWO_INFO.income_asset_shyi
  is '��Ӫҵ�������Ŀ�£����ù̶��ʲ�������';
comment on column COM_PROFIT_INFO_TWO_INFO.buss_pay
  is 'Ӫҵ��֧��';
comment on column COM_PROFIT_INFO_TWO_INFO.donate_cost
  is '��Ӫҵ��֧����Ŀ�£�����֧��';
comment on column COM_PROFIT_INFO_TWO_INFO.sur_res_loss
  is 'ӯ�๫������';
comment on column COM_PROFIT_INFO_TWO_INFO.supp_flows_asset
  is '���������ʱ�';
comment on column COM_PROFIT_INFO_TWO_INFO.extra_reserve
  is '��ȡ��������';
comment on column COM_PROFIT_INFO_TWO_INFO.report_year
  is '�������';
comment on column COM_PROFIT_INFO_TWO_INFO.others
  is '������ҵ��ɱ���';
comment on column COM_PROFIT_INFO_TWO_INFO.buss_profits_z
  is '��Ӫҵ������';
comment on column COM_PROFIT_INFO_TWO_INFO.buss_profits
  is 'Ӫҵ����';
comment on column COM_PROFIT_INFO_TWO_INFO.other_adjust_reason
  is '������������';
comment on column COM_PROFIT_INFO_TWO_INFO.single_reten_prof
  is '�������õ�����';
comment on column COM_PROFIT_INFO_TWO_INFO.income_bus
  is '��Ӫҵ������';
comment on column COM_PROFIT_INFO_TWO_INFO.buss_other_profits
  is '����ҵ������';
comment on column COM_PROFIT_INFO_TWO_INFO.others_cost
  is '���������ã�';
comment on column COM_PROFIT_INFO_TWO_INFO.income_subsidies
  is '��������';
comment on column COM_PROFIT_INFO_TWO_INFO.profits_loss_min
  is '�����ɶ�����';
comment on column COM_PROFIT_INFO_TWO_INFO.net_profit
  is '������';
comment on column COM_PROFIT_INFO_TWO_INFO.profits_invest_fp
  is '�ɹ�Ͷ���߷��������';
comment on column COM_PROFIT_INFO_TWO_INFO.exp_prd_cost
  is '����Ӫҵ��ɱ���Ŀ�£����ڲ�Ʒ���۳ɱ�';
comment on column COM_PROFIT_INFO_TWO_INFO.defe_income
  is '��������';
comment on column COM_PROFIT_INFO_TWO_INFO.income_company_ks
  is '�����������Ŀ�£�����ǰ�������ҵ��������';
comment on column COM_PROFIT_INFO_TWO_INFO.income_sale_asset
  is '��Ӫҵ�������Ŀ�£����������ʲ�����';
comment on column COM_PROFIT_INFO_TWO_INFO.others_profits
  is '����������';
comment on column COM_PROFIT_INFO_TWO_INFO.other_pay
  is '����֧��';
comment on column COM_PROFIT_INFO_TWO_INFO.tax
  is '����˰';
comment on column COM_PROFIT_INFO_TWO_INFO.divi_pay_prefer
  is 'Ӧ�����ȹɹ���';
comment on column COM_PROFIT_INFO_TWO_INFO.pay_div_asset
  is 'ת���ʱ�����ͨ�ɹ���';
comment on column COM_PROFIT_INFO_TWO_INFO.undis_profit
  is 'δ��������';
comment on column COM_PROFIT_INFO_TWO_INFO.loss_tax_befor
  is '��δ���������Ŀ�£�Ӧ���Ժ����˰ǰ�����ֲ��Ŀ���';
comment on column COM_PROFIT_INFO_TWO_INFO.exp_income_prd
  is '����Ӫҵ�������Ŀ�£����ڲ�Ʒ��������';
comment on column COM_PROFIT_INFO_TWO_INFO.in_income_prd
  is '����Ӫҵ�������Ŀ�£����ڲ�Ʒ��������';
comment on column COM_PROFIT_INFO_TWO_INFO.bus_tax_other
  is '��Ӫҵ��˰�𼰸���';
comment on column COM_PROFIT_INFO_TWO_INFO.fina_cost
  is '�������';
comment on column COM_PROFIT_INFO_TWO_INFO.wage_carry_forward
  is '������֧������ת�ĺ������ʰ��ɽ���';
comment on column COM_PROFIT_INFO_TWO_INFO.sum_profits
  is '�����ܶ�';
comment on column COM_PROFIT_INFO_TWO_INFO.extra_sur_res
  is '��ȡ����ӯ�๫��';
comment on column COM_PROFIT_INFO_TWO_INFO.extra_emply_wefare
  is '��ȡְ����������������';
comment on column COM_PROFIT_INFO_TWO_INFO.report_type
  is '��������';
comment on column COM_PROFIT_INFO_TWO_INFO.income_dg
  is '������������';

