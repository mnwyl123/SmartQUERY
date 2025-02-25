create table PER_LOAN_SUMMARY
(
  report_id                    VARCHAR2(30) not null,
  per_house_loan_num           INTEGER,
  per_comme_loan_num           INTEGER,
  other_loan_num               INTEGER,
  first_loan_rel_mon           VARCHAR2(20),
  cr_card_acc_num              INTEGER,
  first_card_rel_mon           VARCHAR2(20),
  q_cr_card_acc_num            INTEGER,
  q_first_card_rel_mon         VARCHAR2(20),
  declart_num                  INTEGER,
  objection_num                INTEGER,
  digital_interpre             VARCHAR2(20),
  relative_positiont           VARCHAR2(20),
  digital_interpre_des         VARCHAR2(100),
  loan_num                     INTEGER,
  loan_mon_num                 INTEGER,
  loan_mon_over_sum            VARCHAR2(20),
  loan_over_mon_num            INTEGER,
  cr_card_over_acc_num         INTEGER,
  cr_card_over_mon_num         INTEGER,
  cr_card_mon_over_sum         VARCHAR2(20),
  cr_card_over_long_mon_num    INTEGER,
  q_cr_card_over_acc_num       INTEGER,
  q_cr_card_over_mon_num       INTEGER,
  q_cr_card_over_mon_balance   VARCHAR2(20),
  q_cr_card_over_long_mon_num  INTEGER,
  loan_company_org_num         INTEGER,
  loan_org_num                 INTEGER,
  unclear_loan_num             INTEGER,
  loan_contract_total          VARCHAR2(20),
  loan_banlance                VARCHAR2(20),
  avg_should_repay             VARCHAR2(20),
  n_cr_card_company_org_num    INTEGER,
  n_cr_card_org_num            INTEGER,
  n_cr_card_acc_num            INTEGER,
  n_cr_card_cred_sum           VARCHAR2(20),
  n_cr_card_max_cred_sum       VARCHAR2(20),
  n_cr_card_min_cred_sum       VARCHAR2(20),
  n_cr_card_used_sum           VARCHAR2(20),
  n_cr_card_avg_used_sum       VARCHAR2(20),
  nq_cr_card_company_org_num   INTEGER,
  nq_cr_card_org_num           INTEGER,
  nq_cr_card_acc_num           INTEGER,
  nq_cr_card_cred_sum          VARCHAR2(20),
  nq_cr_card_max_cred_sum      VARCHAR2(20),
  nq_cr_card_min_cred_sum      VARCHAR2(20),
  nq_cr_card_overdraft_balance VARCHAR2(20),
  nq_cr_card_avg_used_sum      VARCHAR2(20),
  bad_debt_num                 INTEGER,
  bad_debt_balance             VARCHAR2(20),
  asset_num                    INTEGER,
  asset_balance                VARCHAR2(20),
  assurer_num                  INTEGER,
  assurer_balance              VARCHAR2(20),
  guarantee_num                INTEGER,
  guarantee_sum                VARCHAR2(20),
  guarantee_balance            VARCHAR2(20),
  digital_interpre_des_cnt     VARCHAR2(100),
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
  repayer_cnt                  VARCHAR2(100)
)
;
comment on table PER_LOAN_SUMMARY
  is '�����Ҫ��Ϣ��';
comment on column PER_LOAN_SUMMARY.report_id
  is '������';
comment on column PER_LOAN_SUMMARY.per_house_loan_num
  is '����ס���������';
comment on column PER_LOAN_SUMMARY.per_comme_loan_num
  is '�������÷���������ס���ã��������';
comment on column PER_LOAN_SUMMARY.other_loan_num
  is '�����������';
comment on column PER_LOAN_SUMMARY.first_loan_rel_mon
  is '�ױʴ�����·�';
comment on column PER_LOAN_SUMMARY.cr_card_acc_num
  is '���ǿ��˻���';
comment on column PER_LOAN_SUMMARY.first_card_rel_mon
  is '���Ŵ��ǿ������·�';
comment on column PER_LOAN_SUMMARY.q_cr_card_acc_num
  is '׼���ǿ��˻���';
comment on column PER_LOAN_SUMMARY.q_first_card_rel_mon
  is '����׼���ǿ������·�';
comment on column PER_LOAN_SUMMARY.declart_num
  is '����������Ŀ';
comment on column PER_LOAN_SUMMARY.objection_num
  is '�����ע��Ŀ';
comment on column PER_LOAN_SUMMARY.digital_interpre
  is '���ֽ��';
comment on column PER_LOAN_SUMMARY.relative_positiont
  is '���λ��';
comment on column PER_LOAN_SUMMARY.digital_interpre_des
  is '����˵��';
comment on column PER_LOAN_SUMMARY.loan_num
  is '������������ڣ�͸֧����';
comment on column PER_LOAN_SUMMARY.loan_mon_num
  is '�����·���';
comment on column PER_LOAN_SUMMARY.loan_mon_over_sum
  is '�������������ܶ�';
comment on column PER_LOAN_SUMMARY.loan_over_mon_num
  is '�������������';
comment on column PER_LOAN_SUMMARY.cr_card_over_acc_num
  is '���ǿ������˻���';
comment on column PER_LOAN_SUMMARY.cr_card_over_mon_num
  is '���ǿ������·���';
comment on column PER_LOAN_SUMMARY.cr_card_mon_over_sum
  is '���ǿ����ڵ�����������ܶ�';
comment on column PER_LOAN_SUMMARY.cr_card_over_long_mon_num
  is '���ǿ��������������';
comment on column PER_LOAN_SUMMARY.q_cr_card_over_acc_num
  is '׼���ǿ�60������͸֧�˻���';
comment on column PER_LOAN_SUMMARY.q_cr_card_over_mon_num
  is '׼���ǿ�60������͸֧�·���';
comment on column PER_LOAN_SUMMARY.q_cr_card_over_mon_balance
  is '׼���ǿ�60������͸֧�������͸֧���';
comment on column PER_LOAN_SUMMARY.q_cr_card_over_long_mon_num
  is '׼���ǿ�60������͸֧�͸֧����';
comment on column PER_LOAN_SUMMARY.loan_company_org_num
  is '����˻�����';
comment on column PER_LOAN_SUMMARY.loan_org_num
  is '���������';
comment on column PER_LOAN_SUMMARY.unclear_loan_num
  is 'δ����������';
comment on column PER_LOAN_SUMMARY.loan_contract_total
  is '�����ͬ�ܶ�';
comment on column PER_LOAN_SUMMARY.loan_banlance
  is '�������';
comment on column PER_LOAN_SUMMARY.avg_should_repay
  is '���6����ƽ��Ӧ����';
comment on column PER_LOAN_SUMMARY.n_cr_card_company_org_num
  is 'δ�������ǿ��������˻�����';
comment on column PER_LOAN_SUMMARY.n_cr_card_org_num
  is 'δ�������ǿ�����������';
comment on column PER_LOAN_SUMMARY.n_cr_card_acc_num
  is 'δ�������ǿ��˻���';
comment on column PER_LOAN_SUMMARY.n_cr_card_cred_sum
  is 'δ�������ǿ������ܶ�';
comment on column PER_LOAN_SUMMARY.n_cr_card_max_cred_sum
  is 'δ�������ǿ�������������Ŷ�';
comment on column PER_LOAN_SUMMARY.n_cr_card_min_cred_sum
  is 'δ�������ǿ�������������Ŷ�';
comment on column PER_LOAN_SUMMARY.n_cr_card_used_sum
  is 'δ�������ǿ����ö��';
comment on column PER_LOAN_SUMMARY.n_cr_card_avg_used_sum
  is 'δ�������ǿ����6����ƽ��ʹ�ö��';
comment on column PER_LOAN_SUMMARY.nq_cr_card_company_org_num
  is 'δ����׼���ǿ��������˻�����';
comment on column PER_LOAN_SUMMARY.nq_cr_card_org_num
  is 'δ����׼���ǿ�����������';
comment on column PER_LOAN_SUMMARY.nq_cr_card_acc_num
  is 'δ����׼���ǿ��˻���';
comment on column PER_LOAN_SUMMARY.nq_cr_card_cred_sum
  is 'δ����׼���ǿ������ܶ�';
comment on column PER_LOAN_SUMMARY.nq_cr_card_max_cred_sum
  is 'δ����׼���ǿ�������������Ŷ�';
comment on column PER_LOAN_SUMMARY.nq_cr_card_min_cred_sum
  is 'δ����׼���ǿ�������������Ŷ�';
comment on column PER_LOAN_SUMMARY.nq_cr_card_overdraft_balance
  is 'δ����׼���ǿ�͸֧���';
comment on column PER_LOAN_SUMMARY.nq_cr_card_avg_used_sum
  is 'δ����׼���ǿ����6����ƽ��ʹ�ö��';
comment on column PER_LOAN_SUMMARY.bad_debt_num
  is '������Ϣ���ܱ���';
comment on column PER_LOAN_SUMMARY.bad_debt_balance
  is '������Ϣ�������';
comment on column PER_LOAN_SUMMARY.asset_num
  is '�ʲ�������Ϣ���ܱ���';
comment on column PER_LOAN_SUMMARY.asset_balance
  is '�ʲ�������Ϣ�������';
comment on column PER_LOAN_SUMMARY.assurer_num
  is '��֤�˴�����Ϣ���ܱ���';
comment on column PER_LOAN_SUMMARY.assurer_balance
  is '��֤�˴�����Ϣ�������';
comment on column PER_LOAN_SUMMARY.guarantee_num
  is '���ⵣ������';
comment on column PER_LOAN_SUMMARY.guarantee_sum
  is '���ⵣ�����';
comment on column PER_LOAN_SUMMARY.guarantee_balance
  is '���ⵣ���������';
comment on column PER_LOAN_SUMMARY.digital_interpre_des_cnt
  is '����˵������';
comment on column PER_LOAN_SUMMARY.circ_acc_acc_sum
  is '�˻���(ѭ�����˻�)';
comment on column PER_LOAN_SUMMARY.circ_acc_balance
  is '���(ѭ�����˻�)';
comment on column PER_LOAN_SUMMARY.circ_acc_cred_sum
  is '�����ܶ�(ѭ�����˻�)';
comment on column PER_LOAN_SUMMARY.circ_acc_mana_org_cnt
  is '���������(ѭ�����˻�)';
comment on column PER_LOAN_SUMMARY.circ_acc_repay_avg6
  is '��� 6 ����ƽ��Ӧ����(ѭ�����˻�)';
comment on column PER_LOAN_SUMMARY.circ_quo_acc_sum
  is '�˻���(ѭ������·��˻�)';
comment on column PER_LOAN_SUMMARY.circ_quo_balance
  is '���(ѭ������·��˻�)';
comment on column PER_LOAN_SUMMARY.circ_quo_cred_sum
  is '�����ܶ�(ѭ������·��˻�)';
comment on column PER_LOAN_SUMMARY.circ_quo_mana_org_cnt
  is '���������(ѭ������·��˻�)';
comment on column PER_LOAN_SUMMARY.circ_quo_repay_avg6
  is '��� 6 ����ƽ��Ӧ����(ѭ������·��˻�)';
comment on column PER_LOAN_SUMMARY.non_rev_acc_sum
  is '�˻���(��ѭ�����˻�)';
comment on column PER_LOAN_SUMMARY.non_rev_balance
  is '���(��ѭ�����˻�)';
comment on column PER_LOAN_SUMMARY.non_rev_cred_sum
  is '�����ܶ�(��ѭ�����˻�)';
comment on column PER_LOAN_SUMMARY.non_rev_manager_org_cnt
  is '���������(��ѭ�����˻�)';
comment on column PER_LOAN_SUMMARY.non_rev_repay_avg6
  is '��� 6 ����ƽ��Ӧ����(��ѭ�����˻�)';
comment on column PER_LOAN_SUMMARY.overdue_acc_type_cnt
  is '�˻���������(���ڣ�͸֧������)';
comment on column PER_LOAN_SUMMARY.pro_acc_total
  is '�˻����ϼ�(�Ŵ�������ʾ)';
comment on column PER_LOAN_SUMMARY.pro_busi_type_cnt
  is 'ҵ����������';
comment on column PER_LOAN_SUMMARY.rec_acc_total
  is '�˻����ϼ�(��׷������)';
comment on column PER_LOAN_SUMMARY.rec_balance_total
  is '���ϼ�';
comment on column PER_LOAN_SUMMARY.rec_buss_type_cnt
  is 'ҵ����������';
comment on column PER_LOAN_SUMMARY.repayer_cnt
  is '��ػ������θ���';

