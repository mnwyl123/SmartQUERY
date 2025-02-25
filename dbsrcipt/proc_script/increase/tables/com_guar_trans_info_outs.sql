create table COM_GUAR_TRANS_INFO_OUTS
(
  report_id          VARCHAR2(30) not null,
  asset_quality_clas VARCHAR2(100),
  num_account        VARCHAR2(100),
  balance_num        VARCHAR2(100),
  buss_type          VARCHAR2(100)
)
;
comment on table COM_GUAR_TRANS_INFO_OUTS
  is '未结清担保交易汇总信息';
comment on column COM_GUAR_TRANS_INFO_OUTS.report_id
  is '报告编号';
comment on column COM_GUAR_TRANS_INFO_OUTS.asset_quality_clas
  is '资产质量分类';
comment on column COM_GUAR_TRANS_INFO_OUTS.num_account
  is '账户数 ';
comment on column COM_GUAR_TRANS_INFO_OUTS.balance_num
  is '余额';
comment on column COM_GUAR_TRANS_INFO_OUTS.buss_type
  is '业务类型';

