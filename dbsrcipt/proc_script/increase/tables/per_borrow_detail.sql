create table PER_BORROW_DETAIL
(
  report_id                 VARCHAR2(30) not null,
  buss_org_type             VARCHAR2(100),
  cred_serial               VARCHAR2(100),
  repay_num                 VARCHAR2(100),
  cession_repay_status      VARCHAR2(100),
  new_five_type             VARCHAR2(100),
  cur_rest_repay_num        VARCHAR2(100),
  cur_actual_repay_amout    VARCHAR2(100),
  cur_cur_over_num          VARCHAR2(100),
  cur_y5_sdate              VARCHAR2(100),
  create_date               VARCHAR2(100),
  currency                  VARCHAR2(100),
  loan_sum                  VARCHAR2(100),
  acc_cred_quota            VARCHAR2(100),
  new_acc_status            VARCHAR2(100),
  new_info_report_date      VARCHAR2(100),
  cur_l_n_repay_principal   VARCHAR2(100),
  label_cnt                 VARCHAR2(100),
  serial                    VARCHAR2(100),
  share_cred_quota          VARCHAR2(100),
  expiry_date               VARCHAR2(100),
  repay_freq                VARCHAR2(100),
  loan_distri_form          VARCHAR2(100),
  new_last_repay_date       VARCHAR2(100),
  cur_five_type             VARCHAR2(100),
  cur_plan_repay_date       VARCHAR2(100),
  cur_cur_over_amount       VARCHAR2(100),
  cur_max_use_quota         VARCHAR2(100),
  cur_m24_sdate             VARCHAR2(100),
  cur_large_divide_cnt      VARCHAR2(100),
  buss_org_code             VARCHAR2(100),
  vouchtype                 VARCHAR2(100),
  new_last_repay_sum        VARCHAR2(100),
  cur_p_month               VARCHAR2(100),
  cur_no_issued_balanc      VARCHAR2(100),
  cur_avg_use_quota         VARCHAR2(100),
  cur_y5_edate              VARCHAR2(100),
  repay_way                 VARCHAR2(100),
  new_repay_statue          VARCHAR2(100),
  cur_cur_repay_amout       VARCHAR2(100),
  cur_last_repay_date       VARCHAR2(100),
  cur_n_n_repay_principal   VARCHAR2(100),
  cur_m24_edate             VARCHAR2(100),
  cur_y5_month_cnt          VARCHAR2(100),
  account_type              VARCHAR2(100),
  account_sign              VARCHAR2(100),
  buss_category             VARCHAR2(100),
  common_loan_sign          VARCHAR2(100),
  new_balance               VARCHAR2(100),
  cur_s_n_repay_principal   VARCHAR2(100),
  cur_l_overdraft_principal VARCHAR2(100),
  new_close_date            VARCHAR2(100),
  cur_info_report_date      VARCHAR2(100),
  cur_special_trade_cnt     VARCHAR2(100),
  new_out_month             VARCHAR2(100),
  cur_acc_status            VARCHAR2(100),
  cur_balance               VARCHAR2(100),
  cur_used_sum              VARCHAR2(100),
  cur_t_n_repay_principal   VARCHAR2(100),
  cur_avg_overdraft_balance VARCHAR2(100),
  cur_max_overdraft_balance VARCHAR2(100),
  cur_special_case_cnt      VARCHAR2(100)
)
;
comment on table PER_BORROW_DETAIL
  is '大额专项分期信息段';
comment on column PER_BORROW_DETAIL.report_id
  is '报告编号';
comment on column PER_BORROW_DETAIL.buss_org_type
  is '业务管理机构类型';
comment on column PER_BORROW_DETAIL.cred_serial
  is '授信协议编号';
comment on column PER_BORROW_DETAIL.repay_num
  is '还款期数';
comment on column PER_BORROW_DETAIL.cession_repay_status
  is '债权转移时的还款状态';
comment on column PER_BORROW_DETAIL.new_five_type
  is '五级分类';
comment on column PER_BORROW_DETAIL.cur_rest_repay_num
  is '剩余还款期数';
comment on column PER_BORROW_DETAIL.cur_actual_repay_amout
  is '本月实还款';
comment on column PER_BORROW_DETAIL.cur_cur_over_num
  is '当前逾期期数';
comment on column PER_BORROW_DETAIL.cur_y5_sdate
  is '起始年月(最近5年)';
comment on column PER_BORROW_DETAIL.create_date
  is '开立日期';
comment on column PER_BORROW_DETAIL.currency
  is '币种';
comment on column PER_BORROW_DETAIL.loan_sum
  is '借款金额';
comment on column PER_BORROW_DETAIL.acc_cred_quota
  is '账户授信额度';
comment on column PER_BORROW_DETAIL.new_acc_status
  is '账户状态';
comment on column PER_BORROW_DETAIL.new_info_report_date
  is '信息报告日期';
comment on column PER_BORROW_DETAIL.cur_l_n_repay_principal
  is '逾期 180 天以上未还本金';
comment on column PER_BORROW_DETAIL.label_cnt
  is '标注及声明个数';
comment on column PER_BORROW_DETAIL.serial
  is '账户编号';
comment on column PER_BORROW_DETAIL.share_cred_quota
  is '共享授信额度';
comment on column PER_BORROW_DETAIL.expiry_date
  is '到期日期';
comment on column PER_BORROW_DETAIL.repay_freq
  is '还款频率';
comment on column PER_BORROW_DETAIL.loan_distri_form
  is '贷款发放形式';
comment on column PER_BORROW_DETAIL.new_last_repay_date
  is '最近一次还款日期';
comment on column PER_BORROW_DETAIL.cur_five_type
  is '五级分类';
comment on column PER_BORROW_DETAIL.cur_plan_repay_date
  is '结算/应还款日';
comment on column PER_BORROW_DETAIL.cur_cur_over_amount
  is '当前逾期总额';
comment on column PER_BORROW_DETAIL.cur_max_use_quota
  is '最大使用额度';
comment on column PER_BORROW_DETAIL.cur_m24_sdate
  is '起始年月(最近 24 个月还款状态)';
comment on column PER_BORROW_DETAIL.cur_large_divide_cnt
  is '大额专项分期笔数';
comment on column PER_BORROW_DETAIL.buss_org_code
  is '业务管理机构代码';
comment on column PER_BORROW_DETAIL.vouchtype
  is '担保方式';
comment on column PER_BORROW_DETAIL.new_last_repay_sum
  is '最近一次还款金额';
comment on column PER_BORROW_DETAIL.cur_p_month
  is '月份';
comment on column PER_BORROW_DETAIL.cur_no_issued_balanc
  is '未出单的大额专项分期余额';
comment on column PER_BORROW_DETAIL.cur_avg_use_quota
  is '最近 6 个月平均使用额度';
comment on column PER_BORROW_DETAIL.cur_y5_edate
  is '截止年月(最近5年)';
comment on column PER_BORROW_DETAIL.repay_way
  is '还款方式';
comment on column PER_BORROW_DETAIL.new_repay_statue
  is '还款状态';
comment on column PER_BORROW_DETAIL.cur_cur_repay_amout
  is '本月应还款';
comment on column PER_BORROW_DETAIL.cur_last_repay_date
  is '最近一次还款日期';
comment on column PER_BORROW_DETAIL.cur_n_n_repay_principal
  is '逾期 91－180 天未还本金';
comment on column PER_BORROW_DETAIL.cur_m24_edate
  is '截止年月(最近 24 个月还款状态)';
comment on column PER_BORROW_DETAIL.cur_y5_month_cnt
  is '月数(最近5年)';
comment on column PER_BORROW_DETAIL.account_type
  is '账户类型';
comment on column PER_BORROW_DETAIL.account_sign
  is '账户标识';
comment on column PER_BORROW_DETAIL.buss_category
  is '业务种类';
comment on column PER_BORROW_DETAIL.common_loan_sign
  is '共同借款标志';
comment on column PER_BORROW_DETAIL.new_balance
  is '余额';
comment on column PER_BORROW_DETAIL.cur_s_n_repay_principal
  is '逾期 61－90 天未还本金';
comment on column PER_BORROW_DETAIL.cur_l_overdraft_principal
  is '透支 180 天以上未付余额';
comment on column PER_BORROW_DETAIL.new_close_date
  is '关闭日期';
comment on column PER_BORROW_DETAIL.cur_info_report_date
  is '信息报告日期';
comment on column PER_BORROW_DETAIL.cur_special_trade_cnt
  is '特殊交易个数';
comment on column PER_BORROW_DETAIL.new_out_month
  is '转出月份';
comment on column PER_BORROW_DETAIL.cur_acc_status
  is '账户状态';
comment on column PER_BORROW_DETAIL.cur_balance
  is '余额';
comment on column PER_BORROW_DETAIL.cur_used_sum
  is '已用额度';
comment on column PER_BORROW_DETAIL.cur_t_n_repay_principal
  is '逾期 31—60 天未还本金';
comment on column PER_BORROW_DETAIL.cur_avg_overdraft_balance
  is '最近 6 个月平均透支余额';
comment on column PER_BORROW_DETAIL.cur_max_overdraft_balance
  is '最大透支余额';
comment on column PER_BORROW_DETAIL.cur_special_case_cnt
  is '特殊事件说明个数';

