create table COM_LEND_TRANS_OTHER
(
  report_id          VARCHAR2(30) not null,
  buss_type          VARCHAR2(100),
  asset_quality_clas VARCHAR2(100),
  num_account        VARCHAR2(100),
  balance_num        VARCHAR2(100)
)
;
comment on table COM_LEND_TRANS_OTHER
  is '未结清其他借贷交易分类汇总信息';
comment on column COM_LEND_TRANS_OTHER.report_id
  is '报告编号';
comment on column COM_LEND_TRANS_OTHER.buss_type
  is '业务类型';
comment on column COM_LEND_TRANS_OTHER.asset_quality_clas
  is '资产质量分类';
comment on column COM_LEND_TRANS_OTHER.num_account
  is '账户数';
comment on column COM_LEND_TRANS_OTHER.balance_num
  is '余额';

