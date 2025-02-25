create table COM_GUAR_TRANS_INFO_SET
(
  report_id         VARCHAR2(30) not null,
  asset_quality_cla VARCHAR2(100),
  buss_type         VARCHAR2(100),
  num_account       VARCHAR2(100)
)
;
comment on table COM_GUAR_TRANS_INFO_SET
  is '已结清担保交易汇总信息';
comment on column COM_GUAR_TRANS_INFO_SET.report_id
  is '报告编号';
comment on column COM_GUAR_TRANS_INFO_SET.asset_quality_cla
  is '资产质量分类';
comment on column COM_GUAR_TRANS_INFO_SET.buss_type
  is '业务类型';
comment on column COM_GUAR_TRANS_INFO_SET.num_account
  is '账户数 ';

