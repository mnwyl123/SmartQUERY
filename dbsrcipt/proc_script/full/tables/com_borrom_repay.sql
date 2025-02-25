create table COM_BORROM_REPAY
(
  report_id                      VARCHAR2(30) not null,
  num_other_trans_borrow         VARCHAR2(100),
  balance_num_other_trans_borrow VARCHAR2(100),
  type_respon                    VARCHAR2(100),
  amount_repay_recover           VARCHAR2(100),
  balance_num_other_bad          VARCHAR2(100),
  num_amonut_account             VARCHAR2(100),
  balance_num_recover            VARCHAR2(100),
  amount_repay_recover_others    VARCHAR2(100),
  balance_num_other_focus        VARCHAR2(100)
)
;
comment on table COM_BORROM_REPAY
  is '借贷交易相关还款责任汇总信';
comment on column COM_BORROM_REPAY.report_id
  is '报告编号';
comment on column COM_BORROM_REPAY.num_other_trans_borrow
  is '其他借贷交易账户数';
comment on column COM_BORROM_REPAY.balance_num_other_trans_borrow
  is '其他借贷交易账户余额';
comment on column COM_BORROM_REPAY.type_respon
  is '责任类型';
comment on column COM_BORROM_REPAY.amount_repay_recover
  is '被追偿账户的还款责任金额';
comment on column COM_BORROM_REPAY.balance_num_other_bad
  is '其他借贷交易账户不良类余额';
comment on column COM_BORROM_REPAY.num_amonut_account
  is '被追偿账户数';
comment on column COM_BORROM_REPAY.balance_num_recover
  is '被追偿账户余额';
comment on column COM_BORROM_REPAY.amount_repay_recover_others
  is '其他借贷交易的还款责任金额';
comment on column COM_BORROM_REPAY.balance_num_other_focus
  is '其他借贷交易账户关注类余额';

