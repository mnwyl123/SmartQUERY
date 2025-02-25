create table PER_Q_CREDIT_DETAIL
(
  report_id               VARCHAR2(30) not null,
  serial_number           VARCHAR2(64),
  serial                  VARCHAR2(10),
  q_cr_rel_card_date      VARCHAR2(20),
  q_cr_rel_card_org       VARCHAR2(30),
  bussid                  VARCHAR2(40),
  vouchtype               VARCHAR2(200),
  currencytype            VARCHAR2(100),
  cardtype                VARCHAR2(18),
  q_cr_credit_sum         VARCHAR2(20),
  q_cr_share_credit_sum   VARCHAR2(20),
  q_cr_stop_date          VARCHAR2(20),
  q_cr_acc_status         VARCHAR2(10),
  q_cr_used_sum           VARCHAR2(20),
  q_cr_avg_used_sum       VARCHAR2(20),
  q_cr_used_max_sum       VARCHAR2(20),
  q_cr_should_repay_amout VARCHAR2(20),
  q_cr_bill_date          VARCHAR2(20),
  q_cr_actual_repay_amout VARCHAR2(20),
  q_cr_last_repay_date    VARCHAR2(20),
  unrepay_balance         VARCHAR2(20),
  q_cr_cur_over_num       VARCHAR2(20),
  q_cr_cur_over_amout     VARCHAR2(20),
  statebtime              VARCHAR2(20),
  stateetime              VARCHAR2(20),
  q_cr_repay_record       VARCHAR2(100),
  overdue_bdate           VARCHAR2(20),
  overdue_edate           VARCHAR2(20),
  special_trade_type      VARCHAR2(50),
  occur_date              VARCHAR2(20),
  change_month            VARCHAR2(10),
  occur_sum               VARCHAR2(20),
  overdue_detail          VARCHAR2(100),
  balance                 VARCHAR2(16),
  bank_type               VARCHAR2(200),
  currencytype2           VARCHAR2(100),
  bank_type2              VARCHAR2(200),
  vouchtype2              VARCHAR2(200),
  cardtype2               VARCHAR2(18),
  q_cr_acc_status2        VARCHAR2(10)
)
;
comment on table PER_Q_CREDIT_DETAIL
  is '准贷记卡交易明细表';
comment on column PER_Q_CREDIT_DETAIL.report_id
  is '报告编号';
comment on column PER_Q_CREDIT_DETAIL.serial_number
  is '流水号';
comment on column PER_Q_CREDIT_DETAIL.serial
  is '编号';
comment on column PER_Q_CREDIT_DETAIL.q_cr_rel_card_date
  is '发卡日期';
comment on column PER_Q_CREDIT_DETAIL.q_cr_rel_card_org
  is '发卡机构';
comment on column PER_Q_CREDIT_DETAIL.bussid
  is '业务号';
comment on column PER_Q_CREDIT_DETAIL.vouchtype
  is '担保方式';
comment on column PER_Q_CREDIT_DETAIL.currencytype
  is '币种';
comment on column PER_Q_CREDIT_DETAIL.cardtype
  is '卡类型';
comment on column PER_Q_CREDIT_DETAIL.q_cr_credit_sum
  is '授信额度';
comment on column PER_Q_CREDIT_DETAIL.q_cr_share_credit_sum
  is '共享授信额度';
comment on column PER_Q_CREDIT_DETAIL.q_cr_stop_date
  is '截止日期';
comment on column PER_Q_CREDIT_DETAIL.q_cr_acc_status
  is '账户状态';
comment on column PER_Q_CREDIT_DETAIL.q_cr_used_sum
  is '已用额度';
comment on column PER_Q_CREDIT_DETAIL.q_cr_avg_used_sum
  is '最近6个月平均使用额度';
comment on column PER_Q_CREDIT_DETAIL.q_cr_used_max_sum
  is '最大使用额度';
comment on column PER_Q_CREDIT_DETAIL.q_cr_should_repay_amout
  is '本月应还款';
comment on column PER_Q_CREDIT_DETAIL.q_cr_bill_date
  is '账单日';
comment on column PER_Q_CREDIT_DETAIL.q_cr_actual_repay_amout
  is '本月实还款';
comment on column PER_Q_CREDIT_DETAIL.q_cr_last_repay_date
  is '最近一次还款日期';
comment on column PER_Q_CREDIT_DETAIL.unrepay_balance
  is '透支180天以上未付余额';
comment on column PER_Q_CREDIT_DETAIL.q_cr_cur_over_num
  is '当前逾期期数';
comment on column PER_Q_CREDIT_DETAIL.q_cr_cur_over_amout
  is '当前逾期期数';
comment on column PER_Q_CREDIT_DETAIL.statebtime
  is '24期开始日期';
comment on column PER_Q_CREDIT_DETAIL.stateetime
  is '24期截止日期';
comment on column PER_Q_CREDIT_DETAIL.q_cr_repay_record
  is '最近24个月还款记录';
comment on column PER_Q_CREDIT_DETAIL.overdue_bdate
  is '逾期开始日期';
comment on column PER_Q_CREDIT_DETAIL.overdue_edate
  is '逾期截止日期';
comment on column PER_Q_CREDIT_DETAIL.special_trade_type
  is '特殊交易类型';
comment on column PER_Q_CREDIT_DETAIL.occur_date
  is '发生日期';
comment on column PER_Q_CREDIT_DETAIL.change_month
  is '变更月数';
comment on column PER_Q_CREDIT_DETAIL.occur_sum
  is '发生金额';
comment on column PER_Q_CREDIT_DETAIL.overdue_detail
  is '明细记录';
comment on column PER_Q_CREDIT_DETAIL.balance
  is '余额';
comment on column PER_Q_CREDIT_DETAIL.bank_type
  is '银行类型';

