create table COM_GUAR_TRANS_IN
(
  report_id             VARCHAR2(30) not null,
  num_secured_notrans   VARCHAR2(100),
  num_secured_trans_cat VARCHAR2(100)
)
;
comment on table COM_GUAR_TRANS_IN
  is '担保交易汇总信息单元';
comment on column COM_GUAR_TRANS_IN.report_id
  is '报告编号';
comment on column COM_GUAR_TRANS_IN.num_secured_notrans
  is '担保交易分类汇总条目数量(已结清)';
comment on column COM_GUAR_TRANS_IN.num_secured_trans_cat
  is '担保交易分类汇总条目数量(未结清)';

