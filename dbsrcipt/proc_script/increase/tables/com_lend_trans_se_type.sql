create table COM_LEND_TRANS_SE_TYPE
(
  report_id                    VARCHAR2(30) not null,
  asset_quality_classification VARCHAR2(100),
  buss_type                    VARCHAR2(100),
  num_account                  VARCHAR2(100)
)
;
comment on table COM_LEND_TRANS_SE_TYPE
  is '已结清其他借贷交易分类汇总信息';
comment on column COM_LEND_TRANS_SE_TYPE.report_id
  is '报告编号';
comment on column COM_LEND_TRANS_SE_TYPE.asset_quality_classification
  is '资产质量分类';
comment on column COM_LEND_TRANS_SE_TYPE.buss_type
  is '业务类型';
comment on column COM_LEND_TRANS_SE_TYPE.num_account
  is '账户数 ';

