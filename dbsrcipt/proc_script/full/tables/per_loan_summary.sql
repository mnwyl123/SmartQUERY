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
  is '贷款概要信息表';
comment on column PER_LOAN_SUMMARY.report_id
  is '报告编号';
comment on column PER_LOAN_SUMMARY.per_house_loan_num
  is '个人住房贷款笔数';
comment on column PER_LOAN_SUMMARY.per_comme_loan_num
  is '个人商用房（包括商住两用）贷款笔数';
comment on column PER_LOAN_SUMMARY.other_loan_num
  is '其他贷款笔数';
comment on column PER_LOAN_SUMMARY.first_loan_rel_mon
  is '首笔贷款发放月份';
comment on column PER_LOAN_SUMMARY.cr_card_acc_num
  is '贷记卡账户数';
comment on column PER_LOAN_SUMMARY.first_card_rel_mon
  is '首张贷记卡发卡月份';
comment on column PER_LOAN_SUMMARY.q_cr_card_acc_num
  is '准贷记卡账户数';
comment on column PER_LOAN_SUMMARY.q_first_card_rel_mon
  is '首张准贷记卡发卡月份';
comment on column PER_LOAN_SUMMARY.declart_num
  is '本人声明数目';
comment on column PER_LOAN_SUMMARY.objection_num
  is '异议标注数目';
comment on column PER_LOAN_SUMMARY.digital_interpre
  is '数字解读';
comment on column PER_LOAN_SUMMARY.relative_positiont
  is '相对位置';
comment on column PER_LOAN_SUMMARY.digital_interpre_des
  is '分数说明';
comment on column PER_LOAN_SUMMARY.loan_num
  is '贷款笔数（逾期（透支））';
comment on column PER_LOAN_SUMMARY.loan_mon_num
  is '贷款月份数';
comment on column PER_LOAN_SUMMARY.loan_mon_over_sum
  is '贷款单月最高逾期总额';
comment on column PER_LOAN_SUMMARY.loan_over_mon_num
  is '贷款最长逾期月数';
comment on column PER_LOAN_SUMMARY.cr_card_over_acc_num
  is '贷记卡逾期账户数';
comment on column PER_LOAN_SUMMARY.cr_card_over_mon_num
  is '贷记卡逾期月份数';
comment on column PER_LOAN_SUMMARY.cr_card_mon_over_sum
  is '贷记卡逾期单月最高逾期总额';
comment on column PER_LOAN_SUMMARY.cr_card_over_long_mon_num
  is '贷记卡逾期最长逾期月数';
comment on column PER_LOAN_SUMMARY.q_cr_card_over_acc_num
  is '准贷记卡60天以上透支账户数';
comment on column PER_LOAN_SUMMARY.q_cr_card_over_mon_num
  is '准贷记卡60天以上透支月份数';
comment on column PER_LOAN_SUMMARY.q_cr_card_over_mon_balance
  is '准贷记卡60天以上透支单月最高透支余额';
comment on column PER_LOAN_SUMMARY.q_cr_card_over_long_mon_num
  is '准贷记卡60天以上透支最长透支月数';
comment on column PER_LOAN_SUMMARY.loan_company_org_num
  is '贷款法人机构数';
comment on column PER_LOAN_SUMMARY.loan_org_num
  is '贷款机构数';
comment on column PER_LOAN_SUMMARY.unclear_loan_num
  is '未结清贷款笔数';
comment on column PER_LOAN_SUMMARY.loan_contract_total
  is '贷款合同总额';
comment on column PER_LOAN_SUMMARY.loan_banlance
  is '贷款余额';
comment on column PER_LOAN_SUMMARY.avg_should_repay
  is '最近6个月平均应还款';
comment on column PER_LOAN_SUMMARY.n_cr_card_company_org_num
  is '未销户贷记卡发卡法人机构数';
comment on column PER_LOAN_SUMMARY.n_cr_card_org_num
  is '未销户贷记卡发卡机构数';
comment on column PER_LOAN_SUMMARY.n_cr_card_acc_num
  is '未销户贷记卡账户数';
comment on column PER_LOAN_SUMMARY.n_cr_card_cred_sum
  is '未销户贷记卡授信总额';
comment on column PER_LOAN_SUMMARY.n_cr_card_max_cred_sum
  is '未销户贷记卡单家行最高授信额';
comment on column PER_LOAN_SUMMARY.n_cr_card_min_cred_sum
  is '未销户贷记卡单家行最低授信额';
comment on column PER_LOAN_SUMMARY.n_cr_card_used_sum
  is '未销户贷记卡已用额度';
comment on column PER_LOAN_SUMMARY.n_cr_card_avg_used_sum
  is '未销户贷记卡最近6个月平均使用额度';
comment on column PER_LOAN_SUMMARY.nq_cr_card_company_org_num
  is '未销户准贷记卡发卡法人机构数';
comment on column PER_LOAN_SUMMARY.nq_cr_card_org_num
  is '未销户准贷记卡发卡机构数';
comment on column PER_LOAN_SUMMARY.nq_cr_card_acc_num
  is '未销户准贷记卡账户数';
comment on column PER_LOAN_SUMMARY.nq_cr_card_cred_sum
  is '未销户准贷记卡授信总额';
comment on column PER_LOAN_SUMMARY.nq_cr_card_max_cred_sum
  is '未销户准贷记卡单家行最高授信额';
comment on column PER_LOAN_SUMMARY.nq_cr_card_min_cred_sum
  is '未销户准贷记卡单家行最低授信额';
comment on column PER_LOAN_SUMMARY.nq_cr_card_overdraft_balance
  is '未销户准贷记卡透支余额';
comment on column PER_LOAN_SUMMARY.nq_cr_card_avg_used_sum
  is '未销户准贷记卡最近6个月平均使用额度';
comment on column PER_LOAN_SUMMARY.bad_debt_num
  is '呆账信息汇总笔数';
comment on column PER_LOAN_SUMMARY.bad_debt_balance
  is '呆账信息汇总余额';
comment on column PER_LOAN_SUMMARY.asset_num
  is '资产处置信息汇总笔数';
comment on column PER_LOAN_SUMMARY.asset_balance
  is '资产处置信息汇总余额';
comment on column PER_LOAN_SUMMARY.assurer_num
  is '保证人代偿信息汇总笔数';
comment on column PER_LOAN_SUMMARY.assurer_balance
  is '保证人代偿信息汇总余额';
comment on column PER_LOAN_SUMMARY.guarantee_num
  is '对外担保笔数';
comment on column PER_LOAN_SUMMARY.guarantee_sum
  is '对外担保金额';
comment on column PER_LOAN_SUMMARY.guarantee_balance
  is '对外担保本金余额';
comment on column PER_LOAN_SUMMARY.digital_interpre_des_cnt
  is '分数说明条数';
comment on column PER_LOAN_SUMMARY.circ_acc_acc_sum
  is '账户数(循环贷账户)';
comment on column PER_LOAN_SUMMARY.circ_acc_balance
  is '余额(循环贷账户)';
comment on column PER_LOAN_SUMMARY.circ_acc_cred_sum
  is '授信总额(循环贷账户)';
comment on column PER_LOAN_SUMMARY.circ_acc_mana_org_cnt
  is '管理机构数(循环贷账户)';
comment on column PER_LOAN_SUMMARY.circ_acc_repay_avg6
  is '最近 6 个月平均应还款(循环贷账户)';
comment on column PER_LOAN_SUMMARY.circ_quo_acc_sum
  is '账户数(循环额度下分账户)';
comment on column PER_LOAN_SUMMARY.circ_quo_balance
  is '余额(循环额度下分账户)';
comment on column PER_LOAN_SUMMARY.circ_quo_cred_sum
  is '授信总额(循环额度下分账户)';
comment on column PER_LOAN_SUMMARY.circ_quo_mana_org_cnt
  is '管理机构数(循环额度下分账户)';
comment on column PER_LOAN_SUMMARY.circ_quo_repay_avg6
  is '最近 6 个月平均应还款(循环额度下分账户)';
comment on column PER_LOAN_SUMMARY.non_rev_acc_sum
  is '账户数(非循环贷账户)';
comment on column PER_LOAN_SUMMARY.non_rev_balance
  is '余额(非循环贷账户)';
comment on column PER_LOAN_SUMMARY.non_rev_cred_sum
  is '授信总额(非循环贷账户)';
comment on column PER_LOAN_SUMMARY.non_rev_manager_org_cnt
  is '管理机构数(非循环贷账户)';
comment on column PER_LOAN_SUMMARY.non_rev_repay_avg6
  is '最近 6 个月平均应还款(非循环贷账户)';
comment on column PER_LOAN_SUMMARY.overdue_acc_type_cnt
  is '账户类型数量(逾期（透支）汇总)';
comment on column PER_LOAN_SUMMARY.pro_acc_total
  is '账户数合计(信贷交易提示)';
comment on column PER_LOAN_SUMMARY.pro_busi_type_cnt
  is '业务类型数量';
comment on column PER_LOAN_SUMMARY.rec_acc_total
  is '账户数合计(被追偿汇总)';
comment on column PER_LOAN_SUMMARY.rec_balance_total
  is '余额合计';
comment on column PER_LOAN_SUMMARY.rec_buss_type_cnt
  is '业务类型数量';
comment on column PER_LOAN_SUMMARY.repayer_cnt
  is '相关还款责任个数';

