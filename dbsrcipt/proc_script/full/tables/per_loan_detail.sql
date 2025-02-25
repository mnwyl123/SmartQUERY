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
  is '准贷记卡账户汇总信息段';
comment on column PER_LOAN_DETAIL.report_id
  is '报告编号';
comment on column PER_LOAN_DETAIL.serial_number
  is '流水号';
comment on column PER_LOAN_DETAIL.serial
  is '编号';
comment on column PER_LOAN_DETAIL.loans_date
  is '放款日期';
comment on column PER_LOAN_DETAIL.bussid
  is '业务号';
comment on column PER_LOAN_DETAIL.vouchtype
  is '担保方式';
comment on column PER_LOAN_DETAIL.currencytype
  is '币种';
comment on column PER_LOAN_DETAIL.loans_org
  is '放款机构(我行:1 他行:0)';
comment on column PER_LOAN_DETAIL.loans_amount
  is '放款金额';
comment on column PER_LOAN_DETAIL.loans_use
  is '放款用途';
comment on column PER_LOAN_DETAIL.repay_num
  is '还款期数';
comment on column PER_LOAN_DETAIL.repay_type
  is '还款类型';
comment on column PER_LOAN_DETAIL.expiry_date
  is '到期日';
comment on column PER_LOAN_DETAIL.stop_date
  is '截止日';
comment on column PER_LOAN_DETAIL.acc_status
  is '账户状态';
comment on column PER_LOAN_DETAIL.five_type
  is '五级分类';
comment on column PER_LOAN_DETAIL.principal_balance
  is '本金余额';
comment on column PER_LOAN_DETAIL.rest_repay_num
  is '剩余还款期数';
comment on column PER_LOAN_DETAIL.cur_repay_amout
  is '本月应还款';
comment on column PER_LOAN_DETAIL.plan_repay_date
  is '应还款日';
comment on column PER_LOAN_DETAIL.actual_repay_amout
  is '本月实还款';
comment on column PER_LOAN_DETAIL.last_repay_date
  is '最近一次还款日期';
comment on column PER_LOAN_DETAIL.cur_over_num
  is '当前逾期期数';
comment on column PER_LOAN_DETAIL.cur_over_amount
  is '当前逾期金额';
comment on column PER_LOAN_DETAIL.t_n_repay_principal
  is '逾期31-60天未还本金';
comment on column PER_LOAN_DETAIL.s_n_repay_principal
  is '逾期61-90天未还本金';
comment on column PER_LOAN_DETAIL.n_n_repay_principal
  is '逾期91-180天未还本金';
comment on column PER_LOAN_DETAIL.l_n_repay_principal
  is '逾期180天以上未还本金';
comment on column PER_LOAN_DETAIL.statebtime
  is '24期开始日期';
comment on column PER_LOAN_DETAIL.stateetime
  is '24期截止日期';
comment on column PER_LOAN_DETAIL.repay_record
  is '最近24个月还款记录';
comment on column PER_LOAN_DETAIL.overdue_bdate
  is '逾期开始日期';
comment on column PER_LOAN_DETAIL.overdue_edate
  is '逾期截止日期';
comment on column PER_LOAN_DETAIL.special_trade_type
  is '特殊交易类型';
comment on column PER_LOAN_DETAIL.occur_date
  is '发生日期';
comment on column PER_LOAN_DETAIL.change_month
  is '变更月数';
comment on column PER_LOAN_DETAIL.occur_sum
  is '发生金额';
comment on column PER_LOAN_DETAIL.overdue_detail
  is '明细记录';
comment on column PER_LOAN_DETAIL.balance
  is '余额';
comment on column PER_LOAN_DETAIL.bank_type
  is '银行类型';
comment on column PER_LOAN_DETAIL.n_cr_card_avg_used_sum
  is '最近 6 个月平均使用额度';
comment on column PER_LOAN_DETAIL.n_cr_card_max_cred_sum
  is '单家行最高授信额';
comment on column PER_LOAN_DETAIL.nq_cr_card_cred_sum
  is '授信总额';
comment on column PER_LOAN_DETAIL.nq_cr_card_max_cred_sum
  is '单家行最高授信额';
comment on column PER_LOAN_DETAIL.nq_cr_card_avg_used_sum
  is '最近 6 个月平均透支余额';
comment on column PER_LOAN_DETAIL.n_cr_card_used_sum
  is '已用额度';
comment on column PER_LOAN_DETAIL.nq_cr_card_company_org_num
  is '发卡机构数';
comment on column PER_LOAN_DETAIL.nq_cr_card_overdraft_balance
  is '透支余额';
comment on column PER_LOAN_DETAIL.n_cr_card_org_num
  is '发卡机构数';
comment on column PER_LOAN_DETAIL.n_cr_card_cred_sum
  is '授信总额';
comment on column PER_LOAN_DETAIL.nq_cr_card_acc_num
  is '账户数';
comment on column PER_LOAN_DETAIL.nq_cr_card_min_cred_sum
  is '单家行最低授信额';
comment on column PER_LOAN_DETAIL.n_cr_card_acc_num
  is '账户数';
comment on column PER_LOAN_DETAIL.repayer_cnt
  is '相关还款责任个数';
comment on column PER_LOAN_DETAIL.bad_debt_num
  is '账户数';
comment on column PER_LOAN_DETAIL.bad_debt_balance
  is '余额';
comment on column PER_LOAN_DETAIL.n_cr_card_min_cred_sum
  is '单家行最低授信额';
comment on column PER_LOAN_DETAIL.circ_acc_acc_sum
  is '账户数';
comment on column PER_LOAN_DETAIL.circ_acc_balance
  is '余额';
comment on column PER_LOAN_DETAIL.circ_acc_cred_sum
  is '授信总额';
comment on column PER_LOAN_DETAIL.circ_acc_mana_org_cnt
  is '管理机构数';
comment on column PER_LOAN_DETAIL.circ_acc_repay_avg6
  is '最近 6 个月平均应还款';
comment on column PER_LOAN_DETAIL.circ_quo_acc_sum
  is '账户数';
comment on column PER_LOAN_DETAIL.circ_quo_balance
  is '余额';
comment on column PER_LOAN_DETAIL.circ_quo_cred_sum
  is '授信总额';
comment on column PER_LOAN_DETAIL.circ_quo_mana_org_cnt
  is '管理机构数';
comment on column PER_LOAN_DETAIL.circ_quo_repay_avg6
  is '最近 6 个月平均应还款';
comment on column PER_LOAN_DETAIL.non_rev_acc_sum
  is '账户数';
comment on column PER_LOAN_DETAIL.non_rev_balance
  is '余额';
comment on column PER_LOAN_DETAIL.non_rev_cred_sum
  is '授信总额';
comment on column PER_LOAN_DETAIL.non_rev_manager_org_cnt
  is '管理机构数';
comment on column PER_LOAN_DETAIL.non_rev_repay_avg6
  is '最近 6 个月平均应还款';
comment on column PER_LOAN_DETAIL.overdue_acc_type_cnt
  is '账户类型数量(逾期（透支）汇总)';
comment on column PER_LOAN_DETAIL.pro_acc_total
  is '账户数合计';
comment on column PER_LOAN_DETAIL.pro_busi_type_cnt
  is '业务类型数量';
comment on column PER_LOAN_DETAIL.rec_acc_total
  is '账户数合计';
comment on column PER_LOAN_DETAIL.rec_balance_total
  is '余额合计';
comment on column PER_LOAN_DETAIL.rec_buss_type_cnt
  is '业务类型数量';
comment on column PER_LOAN_DETAIL.account_sign
  is '账户标识';
comment on column PER_LOAN_DETAIL.account_type
  is '账户类型';
comment on column PER_LOAN_DETAIL.acc_cred_quota
  is '账户授信额度';
comment on column PER_LOAN_DETAIL.buss_category
  is '业务种类';
comment on column PER_LOAN_DETAIL.buss_org_code
  is '业务管理机构代码';
comment on column PER_LOAN_DETAIL.buss_org_type
  is '业务管理机构类型';
comment on column PER_LOAN_DETAIL.cession_repay_status
  is '债权转移时的还款状态';
comment on column PER_LOAN_DETAIL.common_loan_sign
  is '共同借款标志';
comment on column PER_LOAN_DETAIL.create_date
  is '开立日期';
comment on column PER_LOAN_DETAIL.cred_serial
  is '授信协议编号';
comment on column PER_LOAN_DETAIL.currency
  is '币种';
comment on column PER_LOAN_DETAIL.cur_acc_status
  is '账户状态(最近一次月度)';
comment on column PER_LOAN_DETAIL.cur_actual_repay_amout
  is '本月实还款';
comment on column PER_LOAN_DETAIL.cur_avg_overdraft_balance
  is '最近 6 个月平均透支余额';
comment on column PER_LOAN_DETAIL.cur_avg_use_quota
  is '最近 6 个月平均使用额度';
comment on column PER_LOAN_DETAIL.cur_balance
  is '余额(最近一次月度表现)';
comment on column PER_LOAN_DETAIL.cur_cur_over_amount
  is '当前逾期总额';
comment on column PER_LOAN_DETAIL.cur_cur_over_num
  is '当前逾期期数';
comment on column PER_LOAN_DETAIL.cur_cur_repay_amout
  is '本月应还款';
comment on column PER_LOAN_DETAIL.cur_five_type
  is '五级分类(最近一次月度表现)';
comment on column PER_LOAN_DETAIL.cur_info_report_date
  is '信息报告日期';
comment on column PER_LOAN_DETAIL.cur_large_divide_cnt
  is '大额专项分期笔数';
comment on column PER_LOAN_DETAIL.cur_last_repay_date
  is '最近一次还款日期(最近一次月度)';
comment on column PER_LOAN_DETAIL.cur_l_n_repay_principal
  is '逾期 180 天以上未还本金';
comment on column PER_LOAN_DETAIL.cur_l_overdraft_principal
  is '透支 180 天以上未付余额';
comment on column PER_LOAN_DETAIL.cur_m24_edate
  is '截止年月(最近 24 个月还款状态)';
comment on column PER_LOAN_DETAIL.cur_m24_sdate
  is '起始年月(最近 24 个月还款状态)';
comment on column PER_LOAN_DETAIL.cur_max_overdraft_balance
  is '最大透支余额';
comment on column PER_LOAN_DETAIL.cur_max_use_quota
  is '最大使用额度';
comment on column PER_LOAN_DETAIL.cur_no_issued_balanc
  is '未出单的大额专项分期余额';
comment on column PER_LOAN_DETAIL.cur_n_n_repay_principal
  is '逾期 91－180 天未还本金';
comment on column PER_LOAN_DETAIL.cur_plan_repay_date
  is '结算/应还款日';
comment on column PER_LOAN_DETAIL.cur_p_month
  is '月份';
comment on column PER_LOAN_DETAIL.cur_rest_repay_num
  is '剩余还款期数';
comment on column PER_LOAN_DETAIL.cur_special_case_cnt
  is '特殊事件说明个数';
comment on column PER_LOAN_DETAIL.cur_special_trade_cnt
  is '特殊交易个数';
comment on column PER_LOAN_DETAIL.cur_s_n_repay_principal
  is '逾期 61－90 天未还本金';
comment on column PER_LOAN_DETAIL.cur_t_n_repay_principal
  is '逾期 31—60 天未还本金';
comment on column PER_LOAN_DETAIL.cur_used_sum
  is '已用额度';
comment on column PER_LOAN_DETAIL.cur_y5_edate
  is '截止年月(最近5年)';
comment on column PER_LOAN_DETAIL.cur_y5_month_cnt
  is '月数(最近5年)';
comment on column PER_LOAN_DETAIL.cur_y5_sdate
  is '起始年月(最近5年)';
comment on column PER_LOAN_DETAIL.label_cnt
  is '标注及声明个数';
comment on column PER_LOAN_DETAIL.loan_distri_form
  is '贷款发放形式';
comment on column PER_LOAN_DETAIL.loan_sum
  is '借款金额';
comment on column PER_LOAN_DETAIL.new_acc_status
  is '账户状态(最新表现)';
comment on column PER_LOAN_DETAIL.new_balance
  is '余额(最新表现)';
comment on column PER_LOAN_DETAIL.new_close_date
  is '关闭日期';
comment on column PER_LOAN_DETAIL.new_five_type
  is '五级分类(最新表现信息)';
comment on column PER_LOAN_DETAIL.new_info_report_date
  is '信息报告日期';
comment on column PER_LOAN_DETAIL.new_last_repay_date
  is '最近一次还款日期(最新表现信息)';
comment on column PER_LOAN_DETAIL.new_last_repay_sum
  is '最近一次还款金额';
comment on column PER_LOAN_DETAIL.new_out_month
  is '转出月份';
comment on column PER_LOAN_DETAIL.new_repay_statue
  is '还款状态';
comment on column PER_LOAN_DETAIL.repay_freq
  is '还款频率';
comment on column PER_LOAN_DETAIL.repay_way
  is '还款方式';
comment on column PER_LOAN_DETAIL.share_cred_quota
  is '共享授信额度';
comment on column PER_LOAN_DETAIL.vouchtype2
  is '担保方式2';

