create table COM_DEBT_HIST_INFO
(
  report_id            VARCHAR2(30) not null,
  short_term_inves     VARCHAR2(100),
  should_paper_in      VARCHAR2(100),
  inventory_mater      VARCHAR2(100),
  merger_price         VARCHAR2(100),
  engineering          VARCHAR2(100),
  deferr_asset_repair  VARCHAR2(100),
  defe_reven           VARCHAR2(100),
  should_wage          VARCHAR2(100),
  should_pay_tax       VARCHAR2(100),
  withholding          VARCHAR2(100),
  colle_capital        VARCHAR2(100),
  foreign_capital      VARCHAR2(100),
  surplus_reserves     VARCHAR2(100),
  report_type          VARCHAR2(100),
  sm_report_ty         VARCHAR2(100),
  should_interst       VARCHAR2(100),
  pre_par              VARCHAR2(100),
  inventort_prd        VARCHAR2(100),
  wait_asset_loss      VARCHAR2(100),
  flow_asset_sum       VARCHAR2(100),
  fix_asset_pri        VARCHAR2(100),
  fix_asset_clean      VARCHAR2(100),
  other_lon_goods      VARCHAR2(100),
  defe_tax_credit      VARCHAR2(100),
  private_capital      VARCHAR2(100),
  num_org              VARCHAR2(100),
  should_divi          VARCHAR2(100),
  fut_margin           VARCHAR2(100),
  should_sub_acc       VARCHAR2(100),
  sum_dis              VARCHAR2(100),
  fix_asset_pri_redu   VARCHAR2(100),
  land_use_right       VARCHAR2(100),
  spe_storage_fund     VARCHAR2(100),
  surplus_re_g         VARCHAR2(100),
  money_fund           VARCHAR2(100),
  should_account       VARCHAR2(100),
  other_should_par_s   VARCHAR2(100),
  amor                 VARCHAR2(100),
  long_term_in         VARCHAR2(100),
  long_term_equi_inve  VARCHAR2(100),
  fix_asset_loss       VARCHAR2(100),
  un_asset             VARCHAR2(100),
  short_time_borr      VARCHAR2(100),
  pay_longtim          VARCHAR2(100),
  spe_should_par       VARCHAR2(100),
  others_long_tdebt    VARCHAR2(100),
  lia_sum              VARCHAR2(100),
  paid_in_capital      VARCHAR2(100),
  surplus_re_cap       VARCHAR2(100),
  num_find             VARCHAR2(100),
  other_flow_asset     VARCHAR2(100),
  long_term_sum        VARCHAR2(100),
  fix_asset_worth      VARCHAR2(100),
  deferr_asset         VARCHAR2(100),
  deferr_borr_tax      VARCHAR2(100),
  should_paper         VARCHAR2(100),
  should_par           VARCHAR2(100),
  other_should_par     VARCHAR2(100),
  flow_lia_sum         VARCHAR2(100),
  should_debt          VARCHAR2(100),
  undis_profit         VARCHAR2(100),
  deferr_asset_pay     VARCHAR2(100),
  other_long_invest    VARCHAR2(100),
  sum_asset            VARCHAR2(100),
  total_debt_owner_sum VARCHAR2(100),
  find_id              VARCHAR2(100),
  report_year          VARCHAR2(100),
  should_expo_tax      VARCHAR2(100),
  inventory            VARCHAR2(100),
  long_term_cred_inve  VARCHAR2(100),
  engin_mater          VARCHAR2(100),
  should_welfare       VARCHAR2(100),
  other_should_fu_pa   VARCHAR2(100),
  estima_debt          VARCHAR2(100),
  year_long_term_debt  VARCHAR2(100),
  oth_flow_lia         VARCHAR2(100),
  borr_longtim         VARCHAR2(100),
  sum_long_term_debt   VARCHAR2(100),
  minority_equity      VARCHAR2(100),
  state_capital        VARCHAR2(100),
  corpor_capital       VARCHAR2(100),
  con_state_capital    VARCHAR2(100),
  con_coll_capital     VARCHAR2(100),
  capital_reserves     VARCHAR2(100),
  surplus_re_b         VARCHAR2(100),
  foreign_trans_diff   VARCHAR2(100),
  long_term_invest     VARCHAR2(100),
  sum_dis_old          VARCHAR2(100),
  sum_fix_asset        VARCHAR2(100),
  un_asset_sum         VARCHAR2(100),
  should_profit        VARCHAR2(100),
  total_owner_equity   VARCHAR2(100),
  supp_capital         VARCHAR2(20)
)
;
comment on table COM_DEBT_HIST_INFO
  is '��ҵ�ʲ���ծ��2002 �棩��Ϣ��Ԫ';
comment on column COM_DEBT_HIST_INFO.report_id
  is '������';
comment on column COM_DEBT_HIST_INFO.short_term_inves
  is '����Ͷ��';
comment on column COM_DEBT_HIST_INFO.should_paper_in
  is 'Ӧ��Ʊ��';
comment on column COM_DEBT_HIST_INFO.inventory_mater
  is '���ԭ����';
comment on column COM_DEBT_HIST_INFO.merger_price
  is '�ϲ��۲�';
comment on column COM_DEBT_HIST_INFO.engineering
  is '�ڽ�����';
comment on column COM_DEBT_HIST_INFO.deferr_asset_repair
  is '�������ʲ���Ŀ�£��̶��ʲ�����';
comment on column COM_DEBT_HIST_INFO.defe_reven
  is 'Ԥ���˿�';
comment on column COM_DEBT_HIST_INFO.should_wage
  is 'Ӧ������';
comment on column COM_DEBT_HIST_INFO.should_pay_tax
  is 'Ӧ��˰��';
comment on column COM_DEBT_HIST_INFO.withholding
  is 'Ԥ�����';
comment on column COM_DEBT_HIST_INFO.colle_capital
  is '�����ʱ�';
comment on column COM_DEBT_HIST_INFO.foreign_capital
  is '�����ʱ�';
comment on column COM_DEBT_HIST_INFO.surplus_reserves
  is 'ӯ�๫��';
comment on column COM_DEBT_HIST_INFO.report_type
  is '��������';
comment on column COM_DEBT_HIST_INFO.sm_report_ty
  is '��������ϸ��';
comment on column COM_DEBT_HIST_INFO.should_interst
  is 'Ӧ����Ϣ';
comment on column COM_DEBT_HIST_INFO.pre_par
  is 'Ԥ���˿�';
comment on column COM_DEBT_HIST_INFO.inventort_prd
  is '�������Ʒ';
comment on column COM_DEBT_HIST_INFO.wait_asset_loss
  is '�����������ʲ�����ʧ';
comment on column COM_DEBT_HIST_INFO.flow_asset_sum
  is '�����ʲ��ϼ�';
comment on column COM_DEBT_HIST_INFO.fix_asset_pri
  is '�̶��ʲ�ԭ��';
comment on column COM_DEBT_HIST_INFO.fix_asset_clean
  is '�̶��ʲ�����';
comment on column COM_DEBT_HIST_INFO.other_lon_goods
  is '�����������ʲ���Ŀ�£���׼��������';
comment on column COM_DEBT_HIST_INFO.defe_tax_credit
  is '����˰�����';
comment on column COM_DEBT_HIST_INFO.private_capital
  is '�����ʱ�';
comment on column COM_DEBT_HIST_INFO.num_org
  is 'ҵ������������';
comment on column COM_DEBT_HIST_INFO.should_divi
  is 'Ӧ�չ���';
comment on column COM_DEBT_HIST_INFO.fut_margin
  is '�ڻ���֤��';
comment on column COM_DEBT_HIST_INFO.should_sub_acc
  is 'Ӧ�ղ�����';
comment on column COM_DEBT_HIST_INFO.sum_dis
  is '�̶��ʲ���ֵ';
comment on column COM_DEBT_HIST_INFO.fix_asset_pri_redu
  is '�̶��ʲ�ֵ��ֵ׼��';
comment on column COM_DEBT_HIST_INFO.land_use_right
  is '�����ʲ���Ŀ�£�����ʹ��Ȩ';
comment on column COM_DEBT_HIST_INFO.spe_storage_fund
  is '���������ڸ�ծ��Ŀ�£���׼��������';
comment on column COM_DEBT_HIST_INFO.surplus_re_g
  is '��ӯ�๫����Ŀ�£������';
comment on column COM_DEBT_HIST_INFO.money_fund
  is '�����ʽ�';
comment on column COM_DEBT_HIST_INFO.should_account
  is 'Ӧ���˿�';
comment on column COM_DEBT_HIST_INFO.other_should_par_s
  is '����Ӧ�տ�';
comment on column COM_DEBT_HIST_INFO.amor
  is '��̯����';
comment on column COM_DEBT_HIST_INFO.long_term_in
  is 'һ���ڵ��ڵĳ���ծȨͶ��';
comment on column COM_DEBT_HIST_INFO.long_term_equi_inve
  is '���ڹ�ȨͶ��';
comment on column COM_DEBT_HIST_INFO.fix_asset_loss
  is '������̶��ʲ�����ʧ';
comment on column COM_DEBT_HIST_INFO.un_asset
  is '�����ʲ�';
comment on column COM_DEBT_HIST_INFO.short_time_borr
  is '���ڽ��';
comment on column COM_DEBT_HIST_INFO.pay_longtim
  is '����Ӧ����';
comment on column COM_DEBT_HIST_INFO.spe_should_par
  is 'ר��Ӧ����';
comment on column COM_DEBT_HIST_INFO.others_long_tdebt
  is '�������ڸ�ծ';
comment on column COM_DEBT_HIST_INFO.lia_sum
  is '��ծ�ϼ�';
comment on column COM_DEBT_HIST_INFO.paid_in_capital
  is 'ʵ���ʱ�';
comment on column COM_DEBT_HIST_INFO.surplus_re_cap
  is '��ӯ�๫����Ŀ�£�����ӯ�๫��';
comment on column COM_DEBT_HIST_INFO.num_find
  is 'ҵ��������';
comment on column COM_DEBT_HIST_INFO.other_flow_asset
  is '���������ʲ�';
comment on column COM_DEBT_HIST_INFO.long_term_sum
  is '����Ͷ�ʺϼ�';
comment on column COM_DEBT_HIST_INFO.fix_asset_worth
  is '�̶��ʲ�����';
comment on column COM_DEBT_HIST_INFO.deferr_asset
  is '�����ʲ�';
comment on column COM_DEBT_HIST_INFO.deferr_borr_tax
  is '����˰�����';
comment on column COM_DEBT_HIST_INFO.should_paper
  is 'Ӧ��Ʊ��';
comment on column COM_DEBT_HIST_INFO.should_par
  is 'Ӧ���˿�';
comment on column COM_DEBT_HIST_INFO.other_should_par
  is '����Ӧ����';
comment on column COM_DEBT_HIST_INFO.flow_lia_sum
  is '������ծ�ϼ�';
comment on column COM_DEBT_HIST_INFO.should_debt
  is 'Ӧ��ծȯ';
comment on column COM_DEBT_HIST_INFO.undis_profit
  is 'δ��������';
comment on column COM_DEBT_HIST_INFO.deferr_asset_pay
  is '�������ʲ���Ŀ�£��̶��ʲ�����֧��';
comment on column COM_DEBT_HIST_INFO.other_long_invest
  is '���������ʲ�';
comment on column COM_DEBT_HIST_INFO.sum_asset
  is '�ʲ��ܼ�';
comment on column COM_DEBT_HIST_INFO.total_debt_owner_sum
  is '��ծ��������Ȩ���ܼ�';
comment on column COM_DEBT_HIST_INFO.find_id
  is '���񱨱���';
comment on column COM_DEBT_HIST_INFO.report_year
  is '�������';
comment on column COM_DEBT_HIST_INFO.should_expo_tax
  is 'Ӧ�ճ�����˰';
comment on column COM_DEBT_HIST_INFO.inventory
  is '���';
comment on column COM_DEBT_HIST_INFO.long_term_cred_inve
  is '����ծȨͶ��';
comment on column COM_DEBT_HIST_INFO.engin_mater
  is '��������';
comment on column COM_DEBT_HIST_INFO.should_welfare
  is 'Ӧ��������';
comment on column COM_DEBT_HIST_INFO.other_should_fu_pa
  is '����Ӧ����';
comment on column COM_DEBT_HIST_INFO.estima_debt
  is 'Ԥ�Ƹ�ծ';
comment on column COM_DEBT_HIST_INFO.year_long_term_debt
  is 'һ���ڵ��ڵĳ��ڸ�ծ';
comment on column COM_DEBT_HIST_INFO.oth_flow_lia
  is '����������ծ';
comment on column COM_DEBT_HIST_INFO.borr_longtim
  is '���ڽ��';
comment on column COM_DEBT_HIST_INFO.sum_long_term_debt
  is '���ڸ�ծ�ϼ�';
comment on column COM_DEBT_HIST_INFO.minority_equity
  is '�����ɶ�Ȩ��';
comment on column COM_DEBT_HIST_INFO.state_capital
  is '�����ʱ�';
comment on column COM_DEBT_HIST_INFO.corpor_capital
  is '�����ʱ�';
comment on column COM_DEBT_HIST_INFO.con_state_capital
  is '�������ʱ���Ŀ�£����з����ʱ�';
comment on column COM_DEBT_HIST_INFO.con_coll_capital
  is '�������ʱ���Ŀ�£����巨���ʱ�';
comment on column COM_DEBT_HIST_INFO.capital_reserves
  is '�ʱ�����';
comment on column COM_DEBT_HIST_INFO.surplus_re_b
  is 'δȷ�ϵ�Ͷ����ʧ';
comment on column COM_DEBT_HIST_INFO.foreign_trans_diff
  is '��ұ���������';
comment on column COM_DEBT_HIST_INFO.long_term_invest
  is '����Ͷ��';
comment on column COM_DEBT_HIST_INFO.sum_dis_old
  is '�ۼ��۾�';
comment on column COM_DEBT_HIST_INFO.sum_fix_asset
  is '�̶��ʲ��ϼ�';
comment on column COM_DEBT_HIST_INFO.un_asset_sum
  is '���μ������ʲ��ϼ�';
comment on column COM_DEBT_HIST_INFO.should_profit
  is 'Ӧ������';
comment on column COM_DEBT_HIST_INFO.total_owner_equity
  is '������Ȩ��ϼ�';
comment on column COM_DEBT_HIST_INFO.supp_capital
  is '��ӯ�๫����Ŀ�£����������ʱ�';

