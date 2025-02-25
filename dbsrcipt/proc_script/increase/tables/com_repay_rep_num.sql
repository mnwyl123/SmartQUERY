create table COM_REPAY_REP_NUM
(
  report_id        VARCHAR2(30) not null,
  num_repay_lia    VARCHAR2(64),
  num_repay_lia_db VARCHAR2(64)
)
;
comment on table COM_REPAY_REP_NUM
  is '相关还款责任表';
comment on column COM_REPAY_REP_NUM.report_id
  is '报告编号';
comment on column COM_REPAY_REP_NUM.num_repay_lia
  is '还款责任类型数量(借贷)';
comment on column COM_REPAY_REP_NUM.num_repay_lia_db
  is '还款责任类型数量（担保）';

