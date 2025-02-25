create table COM_INFO_CREDIT
(
  report_id             VARCHAR2(30) not null,
  first_repay_liab_year VARCHAR2(100),
  recover_current_debt  VARCHAR2(100),
  focus_current_debt    VARCHAR2(100),
  secured_over_debt     VARCHAR2(100),
  tax_arrens_num        VARCHAR2(100),
  num_enforce_record    VARCHAR2(100),
  first_trade_year      VARCHAR2(100),
  num_no_cret_tra_acc   VARCHAR2(100),
  unclear_org           VARCHAR2(100),
  secured_trans_balance VARCHAR2(100),
  focus_sec_trans_ba    VARCHAR2(100),
  num_judg_record       VARCHAR2(100),
  relation_org          VARCHAR2(100),
  current_debt          VARCHAR2(100),
  num_admini_puni       VARCHAR2(100),
  over_debt             VARCHAR2(100)
)
;
comment on table COM_INFO_CREDIT
  is '信用提示信息单元';
comment on column COM_INFO_CREDIT.report_id
  is '报告编号';
comment on column COM_INFO_CREDIT.first_repay_liab_year
  is '首次有相关还款责任的年份';
comment on column COM_INFO_CREDIT.recover_current_debt
  is '被追偿的借贷交易余额';
comment on column COM_INFO_CREDIT.focus_current_debt
  is '关注类借贷交易余额';
comment on column COM_INFO_CREDIT.secured_over_debt
  is '不良类担保交易余额';
comment on column COM_INFO_CREDIT.tax_arrens_num
  is '欠税记录条数';
comment on column COM_INFO_CREDIT.num_enforce_record
  is '强制执行记录条数';
comment on column COM_INFO_CREDIT.first_trade_year
  is '首次有信贷交易的年份';
comment on column COM_INFO_CREDIT.num_no_cret_tra_acc
  is '非信贷交易账户数';
comment on column COM_INFO_CREDIT.unclear_org
  is '当前有未结清信贷交易的机构数';
comment on column COM_INFO_CREDIT.secured_trans_balance
  is '担保交易余额';
comment on column COM_INFO_CREDIT.focus_sec_trans_ba
  is '关注类担保交易余额';
comment on column COM_INFO_CREDIT.num_judg_record
  is '民事判决记录条数';
comment on column COM_INFO_CREDIT.relation_org
  is '发生信贷交易的机构数';
comment on column COM_INFO_CREDIT.current_debt
  is '借贷交易余额';
comment on column COM_INFO_CREDIT.num_admini_puni
  is '行政处罚记录条数';
comment on column COM_INFO_CREDIT.over_debt
  is '不良类借贷交易余额';

