create table PER_LOAN_DETAIL
(
  report_id                    VARCHAR2(30) not null,
  serial_number                VARCHAR2(64),
  serial                       VARCHAR2(10),
  loans_date                   VARCHAR2(20),
  bussid                       VARCHAR2(50),
  vouchtype                    VARCHAR2(200),
  currencytype                 VARCHAR2(100),
  loans_org                    VARCHAR2(300),
  loans_amount                 VARCHAR2(20),
  loans_use                    VARCHAR2(50),
  repay_num                    VARCHAR2(10),
  repay_type                   VARCHAR2(50),
  expiry_date                  VARCHAR2(20),
  stop_date                    VARCHAR2(20),
  acc_status                   VARCHAR2(20),
  five_type                    VARCHAR2(20),
  principal_balance            VARCHAR2(20),
  rest_repay_num               VARCHAR2(10),
  cur_repay_amout              VARCHAR2(100),
  plan_repay_date              VARCHAR2(20),
  actual_repay_amout           VARCHAR2(20),
  last_repay_date              VARCHAR2(20),
  cur_over_num                 VARCHAR2(10),
  cur_over_amount              VARCHAR2(20),
  t_n_repay_principal          VARCHAR2(20),
  s_n_repay_principal          VARCHAR2(20),
  n_n_repay_principal          VARCHAR2(20),
  l_n_repay_principal          VARCHAR2(20),
  statebtime                   VARCHAR2(20),
  stateetime                   VARCHAR2(20),
  repay_record                 VARCHAR2(100),
  overdue_bdate                VARCHAR2(20),
  overdue_edate                VARCHAR2(20),
  special_trade_type           VARCHAR2(50),
  occur_date                   VARCHAR2(20),
  change_month                 VARCHAR2(10),
  occur_sum                    VARCHAR2(20),
  overdue_detail               VARCHAR2(100),
  balance                      VARCHAR2(16),
  bank_type                    VARCHAR2(200),
  n_cr_card_avg_used_sum       VARCHAR2(100),
  n_cr_card_max_cred_sum       VARCHAR2(100),
  nq_cr_card_cred_sum          VARCHAR2(100),
  nq_cr_card_max_cred_sum      VARCHAR2(100),
  nq_cr_card_avg_used_sum      VARCHAR2(100),
  n_cr_card_used_sum           VARCHAR2(100),
  nq_cr_card_company_org_num   VARCHAR2(100),
  nq_cr_card_overdraft_balance VARCHAR2(100),
  n_cr_card_org_num            VARCHAR2(100),
  n_cr_card_cred_sum           VARCHAR2(100),
  nq_cr_card_acc_num           VARCHAR2(100),
  nq_cr_card_min_cred_sum      VARCHAR2(100),
  n_cr_card_acc_num            VARCHAR2(100),
  repayer_cnt                  VARCHAR2(100),
  bad_debt_num                 VARCHAR2(100),
  bad_debt_balance             VARCHAR2(100),
  n_cr_card_min_cred_sum       VARCHAR2(100),
  circ_acc_acc_sum             VARCHAR2(100),
  circ_acc_balance             VARCHAR2(100),
  circ_acc_cred_sum            VARCHAR2(100),
  circ_acc_mana_org_cnt        VARCHAR2(100),
  circ_acc_repay_avg6          VARCHAR2(100),
  circ_quo_acc_sum             VARCHAR2(100),
  circ_quo_balance             VARCHAR2(100),
  circ_quo_cred_sum            VARCHAR2(100),
  circ_quo_mana_org_cnt        VARCHAR2(100),
  circ_quo_repay_avg6          VARCHAR2(100),
  non_rev_acc_sum              VARCHAR2(100),
  non_rev_balance              VARCHAR2(100),
  non_rev_cred_sum             VARCHAR2(100),
  non_rev_manager_org_cnt      VARCHAR2(100),
  non_rev_repay_avg6           VARCHAR2(100),
  overdue_acc_type_cnt         VARCHAR2(100),
  pro_acc_total                VARCHAR2(100),
  pro_busi_type_cnt            VARCHAR2(100),
  rec_acc_total                VARCHAR2(100),
  rec_balance_total            VARCHAR2(100),
  rec_buss_type_cnt            VARCHAR2(100),
  account_sign                 VARCHAR2(100),
  account_type                 VARCHAR2(100),
  acc_cred_quota               VARCHAR2(100),
  buss_category                VARCHAR2(100),
  buss_org_code                VARCHAR2(100),
  buss_org_type                VARCHAR2(100),
  cession_repay_status         VARCHAR2(100),
  common_loan_sign             VARCHAR2(100),
  create_date                  VARCHAR2(100),
  cred_serial                  VARCHAR2(100),
  currency                     VARCHAR2(100),
  cur_acc_status               VARCHAR2(100),
  cur_actual_repay_amout       VARCHAR2(100),
  cur_avg_overdraft_balance    VARCHAR2(100),
  cur_avg_use_quota            VARCHAR2(100),
  cur_balance                  VARCHAR2(100),
  cur_cur_over_amount          VARCHAR2(100),
  cur_cur_over_num             VARCHAR2(100),
  cur_cur_repay_amout          VARCHAR2(100),
  cur_five_type                VARCHAR2(100),
  cur_info_report_date         VARCHAR2(100),
  cur_large_divide_cnt         VARCHAR2(100),
  cur_last_repay_date          VARCHAR2(100),
  cur_l_n_repay_principal      VARCHAR2(100),
  cur_l_overdraft_principal    VARCHAR2(100),
  cur_m24_edate                VARCHAR2(100),
  cur_m24_sdate                VARCHAR2(100),
  cur_max_overdraft_balance    VARCHAR2(100),
  cur_max_use_quota            VARCHAR2(100),
  cur_no_issued_balanc         VARCHAR2(100),
  cur_n_n_repay_principal      VARCHAR2(100),
  cur_plan_repay_date          VARCHAR2(100),
  cur_p_month                  VARCHAR2(100),
  cur_rest_repay_num           VARCHAR2(100),
  cur_special_case_cnt         VARCHAR2(100),
  cur_special_trade_cnt        VARCHAR2(100),
  cur_s_n_repay_principal      VARCHAR2(100),
  cur_t_n_repay_principal      VARCHAR2(100),
  cur_used_sum                 VARCHAR2(100),
  cur_y5_edate                 VARCHAR2(100),
  cur_y5_month_cnt             VARCHAR2(100),
  cur_y5_sdate                 VARCHAR2(100),
  label_cnt                    VARCHAR2(100),
  loan_distri_form             VARCHAR2(100),
  loan_sum                     VARCHAR2(100),
  new_acc_status               VARCHAR2(100),
  new_balance                  VARCHAR2(100),
  new_close_date               VARCHAR2(100),
  new_five_type                VARCHAR2(100),
  new_info_report_date         VARCHAR2(100),
  new_last_repay_date          VARCHAR2(100),
  new_last_repay_sum           VARCHAR2(100),
  new_out_month                VARCHAR2(100),
  new_repay_statue             VARCHAR2(100),
  repay_freq                   VARCHAR2(100),
  repay_way                    VARCHAR2(100),
  share_cred_quota             VARCHAR2(100),
  five_type2                   VARCHAR2(20),
  vouchtype2                   VARCHAR2(200),
  currencytype2                VARCHAR2(100),
  special_trade_type2          VARCHAR2(50)
)
;
comment on table PER_LOAN_DETAIL
  is '׼���ǿ��˻�������Ϣ��';
comment on column PER_LOAN_DETAIL.report_id
  is '������';
comment on column PER_LOAN_DETAIL.serial_number
  is '��ˮ��';
comment on column PER_LOAN_DETAIL.serial
  is '���';
comment on column PER_LOAN_DETAIL.loans_date
  is '�ſ�����';
comment on column PER_LOAN_DETAIL.bussid
  is 'ҵ���';
comment on column PER_LOAN_DETAIL.vouchtype
  is '������ʽ';
comment on column PER_LOAN_DETAIL.currencytype
  is '����';
comment on column PER_LOAN_DETAIL.loans_org
  is '�ſ����(����:1 ����:0)';
comment on column PER_LOAN_DETAIL.loans_amount
  is '�ſ���';
comment on column PER_LOAN_DETAIL.loans_use
  is '�ſ���;';
comment on column PER_LOAN_DETAIL.repay_num
  is '��������';
comment on column PER_LOAN_DETAIL.repay_type
  is '��������';
comment on column PER_LOAN_DETAIL.expiry_date
  is '������';
comment on column PER_LOAN_DETAIL.stop_date
  is '��ֹ��';
comment on column PER_LOAN_DETAIL.acc_status
  is '�˻�״̬';
comment on column PER_LOAN_DETAIL.five_type
  is '�弶����';
comment on column PER_LOAN_DETAIL.principal_balance
  is '�������';
comment on column PER_LOAN_DETAIL.rest_repay_num
  is 'ʣ�໹������';
comment on column PER_LOAN_DETAIL.cur_repay_amout
  is '����Ӧ����';
comment on column PER_LOAN_DETAIL.plan_repay_date
  is 'Ӧ������';
comment on column PER_LOAN_DETAIL.actual_repay_amout
  is '����ʵ����';
comment on column PER_LOAN_DETAIL.last_repay_date
  is '���һ�λ�������';
comment on column PER_LOAN_DETAIL.cur_over_num
  is '��ǰ��������';
comment on column PER_LOAN_DETAIL.cur_over_amount
  is '��ǰ���ڽ��';
comment on column PER_LOAN_DETAIL.t_n_repay_principal
  is '����31-60��δ������';
comment on column PER_LOAN_DETAIL.s_n_repay_principal
  is '����61-90��δ������';
comment on column PER_LOAN_DETAIL.n_n_repay_principal
  is '����91-180��δ������';
comment on column PER_LOAN_DETAIL.l_n_repay_principal
  is '����180������δ������';
comment on column PER_LOAN_DETAIL.statebtime
  is '24�ڿ�ʼ����';
comment on column PER_LOAN_DETAIL.stateetime
  is '24�ڽ�ֹ����';
comment on column PER_LOAN_DETAIL.repay_record
  is '���24���»����¼';
comment on column PER_LOAN_DETAIL.overdue_bdate
  is '���ڿ�ʼ����';
comment on column PER_LOAN_DETAIL.overdue_edate
  is '���ڽ�ֹ����';
comment on column PER_LOAN_DETAIL.special_trade_type
  is '���⽻������';
comment on column PER_LOAN_DETAIL.occur_date
  is '��������';
comment on column PER_LOAN_DETAIL.change_month
  is '�������';
comment on column PER_LOAN_DETAIL.occur_sum
  is '�������';
comment on column PER_LOAN_DETAIL.overdue_detail
  is '��ϸ��¼';
comment on column PER_LOAN_DETAIL.balance
  is '���';
comment on column PER_LOAN_DETAIL.bank_type
  is '��������';
comment on column PER_LOAN_DETAIL.n_cr_card_avg_used_sum
  is '��� 6 ����ƽ��ʹ�ö��';
comment on column PER_LOAN_DETAIL.n_cr_card_max_cred_sum
  is '������������Ŷ�';
comment on column PER_LOAN_DETAIL.nq_cr_card_cred_sum
  is '�����ܶ�';
comment on column PER_LOAN_DETAIL.nq_cr_card_max_cred_sum
  is '������������Ŷ�';
comment on column PER_LOAN_DETAIL.nq_cr_card_avg_used_sum
  is '��� 6 ����ƽ��͸֧���';
comment on column PER_LOAN_DETAIL.n_cr_card_used_sum
  is '���ö��';
comment on column PER_LOAN_DETAIL.nq_cr_card_company_org_num
  is '����������';
comment on column PER_LOAN_DETAIL.nq_cr_card_overdraft_balance
  is '͸֧���';
comment on column PER_LOAN_DETAIL.n_cr_card_org_num
  is '����������';
comment on column PER_LOAN_DETAIL.n_cr_card_cred_sum
  is '�����ܶ�';
comment on column PER_LOAN_DETAIL.nq_cr_card_acc_num
  is '�˻���';
comment on column PER_LOAN_DETAIL.nq_cr_card_min_cred_sum
  is '������������Ŷ�';
comment on column PER_LOAN_DETAIL.n_cr_card_acc_num
  is '�˻���';
comment on column PER_LOAN_DETAIL.repayer_cnt
  is '��ػ������θ���';
comment on column PER_LOAN_DETAIL.bad_debt_num
  is '�˻���';
comment on column PER_LOAN_DETAIL.bad_debt_balance
  is '���';
comment on column PER_LOAN_DETAIL.n_cr_card_min_cred_sum
  is '������������Ŷ�';
comment on column PER_LOAN_DETAIL.circ_acc_acc_sum
  is '�˻���';
comment on column PER_LOAN_DETAIL.circ_acc_balance
  is '���';
comment on column PER_LOAN_DETAIL.circ_acc_cred_sum
  is '�����ܶ�';
comment on column PER_LOAN_DETAIL.circ_acc_mana_org_cnt
  is '���������';
comment on column PER_LOAN_DETAIL.circ_acc_repay_avg6
  is '��� 6 ����ƽ��Ӧ����';
comment on column PER_LOAN_DETAIL.circ_quo_acc_sum
  is '�˻���';
comment on column PER_LOAN_DETAIL.circ_quo_balance
  is '���';
comment on column PER_LOAN_DETAIL.circ_quo_cred_sum
  is '�����ܶ�';
comment on column PER_LOAN_DETAIL.circ_quo_mana_org_cnt
  is '���������';
comment on column PER_LOAN_DETAIL.circ_quo_repay_avg6
  is '��� 6 ����ƽ��Ӧ����';
comment on column PER_LOAN_DETAIL.non_rev_acc_sum
  is '�˻���';
comment on column PER_LOAN_DETAIL.non_rev_balance
  is '���';
comment on column PER_LOAN_DETAIL.non_rev_cred_sum
  is '�����ܶ�';
comment on column PER_LOAN_DETAIL.non_rev_manager_org_cnt
  is '���������';
comment on column PER_LOAN_DETAIL.non_rev_repay_avg6
  is '��� 6 ����ƽ��Ӧ����';
comment on column PER_LOAN_DETAIL.overdue_acc_type_cnt
  is '�˻���������(���ڣ�͸֧������)';
comment on column PER_LOAN_DETAIL.pro_acc_total
  is '�˻����ϼ�';
comment on column PER_LOAN_DETAIL.pro_busi_type_cnt
  is 'ҵ����������';
comment on column PER_LOAN_DETAIL.rec_acc_total
  is '�˻����ϼ�';
comment on column PER_LOAN_DETAIL.rec_balance_total
  is '���ϼ�';
comment on column PER_LOAN_DETAIL.rec_buss_type_cnt
  is 'ҵ����������';
comment on column PER_LOAN_DETAIL.account_sign
  is '�˻���ʶ';
comment on column PER_LOAN_DETAIL.account_type
  is '�˻�����';
comment on column PER_LOAN_DETAIL.acc_cred_quota
  is '�˻����Ŷ��';
comment on column PER_LOAN_DETAIL.buss_category
  is 'ҵ������';
comment on column PER_LOAN_DETAIL.buss_org_code
  is 'ҵ������������';
comment on column PER_LOAN_DETAIL.buss_org_type
  is 'ҵ������������';
comment on column PER_LOAN_DETAIL.cession_repay_status
  is 'ծȨת��ʱ�Ļ���״̬';
comment on column PER_LOAN_DETAIL.common_loan_sign
  is '��ͬ����־';
comment on column PER_LOAN_DETAIL.create_date
  is '��������';
comment on column PER_LOAN_DETAIL.cred_serial
  is '����Э����';
comment on column PER_LOAN_DETAIL.currency
  is '����';
comment on column PER_LOAN_DETAIL.cur_acc_status
  is '�˻�״̬(���һ���¶�)';
comment on column PER_LOAN_DETAIL.cur_actual_repay_amout
  is '����ʵ����';
comment on column PER_LOAN_DETAIL.cur_avg_overdraft_balance
  is '��� 6 ����ƽ��͸֧���';
comment on column PER_LOAN_DETAIL.cur_avg_use_quota
  is '��� 6 ����ƽ��ʹ�ö��';
comment on column PER_LOAN_DETAIL.cur_balance
  is '���(���һ���¶ȱ���)';
comment on column PER_LOAN_DETAIL.cur_cur_over_amount
  is '��ǰ�����ܶ�';
comment on column PER_LOAN_DETAIL.cur_cur_over_num
  is '��ǰ��������';
comment on column PER_LOAN_DETAIL.cur_cur_repay_amout
  is '����Ӧ����';
comment on column PER_LOAN_DETAIL.cur_five_type
  is '�弶����(���һ���¶ȱ���)';
comment on column PER_LOAN_DETAIL.cur_info_report_date
  is '��Ϣ��������';
comment on column PER_LOAN_DETAIL.cur_large_divide_cnt
  is '���ר����ڱ���';
comment on column PER_LOAN_DETAIL.cur_last_repay_date
  is '���һ�λ�������(���һ���¶�)';
comment on column PER_LOAN_DETAIL.cur_l_n_repay_principal
  is '���� 180 ������δ������';
comment on column PER_LOAN_DETAIL.cur_l_overdraft_principal
  is '͸֧ 180 ������δ�����';
comment on column PER_LOAN_DETAIL.cur_m24_edate
  is '��ֹ����(��� 24 ���»���״̬)';
comment on column PER_LOAN_DETAIL.cur_m24_sdate
  is '��ʼ����(��� 24 ���»���״̬)';
comment on column PER_LOAN_DETAIL.cur_max_overdraft_balance
  is '���͸֧���';
comment on column PER_LOAN_DETAIL.cur_max_use_quota
  is '���ʹ�ö��';
comment on column PER_LOAN_DETAIL.cur_no_issued_balanc
  is 'δ�����Ĵ��ר��������';
comment on column PER_LOAN_DETAIL.cur_n_n_repay_principal
  is '���� 91��180 ��δ������';
comment on column PER_LOAN_DETAIL.cur_plan_repay_date
  is '����/Ӧ������';
comment on column PER_LOAN_DETAIL.cur_p_month
  is '�·�';
comment on column PER_LOAN_DETAIL.cur_rest_repay_num
  is 'ʣ�໹������';
comment on column PER_LOAN_DETAIL.cur_special_case_cnt
  is '�����¼�˵������';
comment on column PER_LOAN_DETAIL.cur_special_trade_cnt
  is '���⽻�׸���';
comment on column PER_LOAN_DETAIL.cur_s_n_repay_principal
  is '���� 61��90 ��δ������';
comment on column PER_LOAN_DETAIL.cur_t_n_repay_principal
  is '���� 31��60 ��δ������';
comment on column PER_LOAN_DETAIL.cur_used_sum
  is '���ö��';
comment on column PER_LOAN_DETAIL.cur_y5_edate
  is '��ֹ����(���5��)';
comment on column PER_LOAN_DETAIL.cur_y5_month_cnt
  is '����(���5��)';
comment on column PER_LOAN_DETAIL.cur_y5_sdate
  is '��ʼ����(���5��)';
comment on column PER_LOAN_DETAIL.label_cnt
  is '��ע����������';
comment on column PER_LOAN_DETAIL.loan_distri_form
  is '�������ʽ';
comment on column PER_LOAN_DETAIL.loan_sum
  is '�����';
comment on column PER_LOAN_DETAIL.new_acc_status
  is '�˻�״̬(���±���)';
comment on column PER_LOAN_DETAIL.new_balance
  is '���(���±���)';
comment on column PER_LOAN_DETAIL.new_close_date
  is '�ر�����';
comment on column PER_LOAN_DETAIL.new_five_type
  is '�弶����(���±�����Ϣ)';
comment on column PER_LOAN_DETAIL.new_info_report_date
  is '��Ϣ��������';
comment on column PER_LOAN_DETAIL.new_last_repay_date
  is '���һ�λ�������(���±�����Ϣ)';
comment on column PER_LOAN_DETAIL.new_last_repay_sum
  is '���һ�λ�����';
comment on column PER_LOAN_DETAIL.new_out_month
  is 'ת���·�';
comment on column PER_LOAN_DETAIL.new_repay_statue
  is '����״̬';
comment on column PER_LOAN_DETAIL.repay_freq
  is '����Ƶ��';
comment on column PER_LOAN_DETAIL.repay_way
  is '���ʽ';
comment on column PER_LOAN_DETAIL.share_cred_quota
  is '�������Ŷ��';
comment on column PER_LOAN_DETAIL.vouchtype2
  is '������ʽ2';

