create table COM_PENALTIES
(
  report_id              VARCHAR2(30) not null,
  reconsideration_result VARCHAR2(200),
  penalties_comapny      VARCHAR2(100),
  penalties_id           VARCHAR2(100),
  serial                 VARCHAR2(100),
  penalties_sum          VARCHAR2(100),
  start_date             VARCHAR2(100),
  penalties_sitation     VARCHAR2(500),
  ilehal_behavior        VARCHAR2(500),
  penalties_decidion     VARCHAR2(500)
)
;
comment on table COM_PENALTIES
  is '行政处罚记录信息单元';
comment on column COM_PENALTIES.report_id
  is '报告编号';
comment on column COM_PENALTIES.reconsideration_result
  is '行政复议结果';
comment on column COM_PENALTIES.penalties_comapny
  is '处罚机构名称';
comment on column COM_PENALTIES.penalties_id
  is '处罚决定书文号';
comment on column COM_PENALTIES.serial
  is '行政处罚记录编号';
comment on column COM_PENALTIES.penalties_sum
  is '处罚金额';
comment on column COM_PENALTIES.start_date
  is '处罚日期';
comment on column COM_PENALTIES.penalties_sitation
  is '处罚执行情况';
comment on column COM_PENALTIES.ilehal_behavior
  is '违法行为';
comment on column COM_PENALTIES.penalties_decidion
  is '处罚决定';

