create table COM_REPAY_REP_NUM
(
  report_id        VARCHAR2(30) not null,
  num_repay_lia    VARCHAR2(64),
  num_repay_lia_db VARCHAR2(64)
)
;
comment on table COM_REPAY_REP_NUM
  is '��ػ������α�';
comment on column COM_REPAY_REP_NUM.report_id
  is '������';
comment on column COM_REPAY_REP_NUM.num_repay_lia
  is '����������������(���)';
comment on column COM_REPAY_REP_NUM.num_repay_lia_db
  is '������������������������';

