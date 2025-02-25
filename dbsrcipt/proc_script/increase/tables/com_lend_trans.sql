create table COM_LEND_TRANS
(
  report_id                 VARCHAR2(30) not null,
  yassets_disp_num          VARCHAR2(100),
  num_month_fz              VARCHAR2(100),
  last_disp_date            VARCHAR2(100),
  over_sum                  VARCHAR2(100),
  over_principal            VARCHAR2(100),
  ynum_advances_account     VARCHAR2(100),
  num_other_trans           VARCHAR2(100),
  yassets_disp_balance      VARCHAR2(100),
  ynum_other_trans_yj       VARCHAR2(100),
  assets_disp_balance       VARCHAR2(100),
  num_advances_account      VARCHAR2(100),
  over_interst_other        VARCHAR2(100),
  ydate_completion          VARCHAR2(100),
  assets_disp_num           VARCHAR2(100),
  advaes_acc_balance        VARCHAR2(100),
  yadvances_account_balance VARCHAR2(100),
  last_ads_acc_date         VARCHAR2(100),
  ydate_settlement          VARCHAR2(100)
)
;
comment on table COM_LEND_TRANS
  is '借贷交易汇总信息单元';
comment on column COM_LEND_TRANS.report_id
  is '报告编号';
comment on column COM_LEND_TRANS.yassets_disp_num
  is '已结清资产处置业务账户数  ';
comment on column COM_LEND_TRANS.num_month_fz
  is '月份数(负债)';
comment on column COM_LEND_TRANS.last_disp_date
  is '最近一次处置日期';
comment on column COM_LEND_TRANS.over_sum
  is '逾期总额';
comment on column COM_LEND_TRANS.over_principal
  is '逾期本金';
comment on column COM_LEND_TRANS.ynum_advances_account
  is '垫款业务账户数  ';
comment on column COM_LEND_TRANS.num_other_trans
  is '其他借贷交易分类汇总条目数量';
comment on column COM_LEND_TRANS.yassets_disp_balance
  is '资产处置业务金额  ';
comment on column COM_LEND_TRANS.ynum_other_trans_yj
  is '其他借贷交易分类汇总条目数量';
comment on column COM_LEND_TRANS.assets_disp_balance
  is '资产处置业务余额';
comment on column COM_LEND_TRANS.num_advances_account
  is '垫款业务账户数';
comment on column COM_LEND_TRANS.over_interst_other
  is '逾期利息及其他';
comment on column COM_LEND_TRANS.ydate_completion
  is '处置完成日期  ';
comment on column COM_LEND_TRANS.assets_disp_num
  is '未结清资产处置业务账户数';
comment on column COM_LEND_TRANS.advaes_acc_balance
  is '垫款业务余额';
comment on column COM_LEND_TRANS.yadvances_account_balance
  is '垫款业务金额  ';
comment on column COM_LEND_TRANS.last_ads_acc_date
  is '垫款最近一次还款日期';
comment on column COM_LEND_TRANS.ydate_settlement
  is '结清日期  ';

