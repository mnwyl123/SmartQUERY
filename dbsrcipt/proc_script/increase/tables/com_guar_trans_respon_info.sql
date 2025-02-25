create table COM_GUAR_TRANS_RESPON_INFO
(
  report_id             VARCHAR2(30) not null,
  type_respon           VARCHAR2(100),
  balance_num_focus_bad VARCHAR2(100),
  amount_repay_recover  VARCHAR2(100),
  balance_num_focus     VARCHAR2(100),
  num_account           VARCHAR2(100),
  balance_num           VARCHAR2(100)
)
;
comment on table COM_GUAR_TRANS_RESPON_INFO
  is '担保交易相关还款责任汇总信息';
comment on column COM_GUAR_TRANS_RESPON_INFO.report_id
  is '报告编号';
comment on column COM_GUAR_TRANS_RESPON_INFO.type_respon
  is '责任类型';
comment on column COM_GUAR_TRANS_RESPON_INFO.balance_num_focus_bad
  is '不良类余额';
comment on column COM_GUAR_TRANS_RESPON_INFO.amount_repay_recover
  is '还款责任金额';
comment on column COM_GUAR_TRANS_RESPON_INFO.balance_num_focus
  is '关注类余额';
comment on column COM_GUAR_TRANS_RESPON_INFO.num_account
  is '账户数';
comment on column COM_GUAR_TRANS_RESPON_INFO.balance_num
  is '余额';

