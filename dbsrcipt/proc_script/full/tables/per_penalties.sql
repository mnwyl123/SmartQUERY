create table PER_PENALTIES
(
  report_id              VARCHAR2(30) not null,
  serial                 VARCHAR2(10),
  penalties_comapny      VARCHAR2(100),
  penalties_contents     VARCHAR2(200),
  penalties_sum          VARCHAR2(20),
  start_date             VARCHAR2(20),
  stop_date              VARCHAR2(20),
  reconsideration_result VARCHAR2(100),
  label_cnt              VARCHAR2(100)
)
;
comment on table PER_PENALTIES
  is '行政处罚记录信息段';
comment on column PER_PENALTIES.report_id
  is '报告编号';
comment on column PER_PENALTIES.serial
  is '编号';
comment on column PER_PENALTIES.penalties_comapny
  is '处罚机构';
comment on column PER_PENALTIES.penalties_contents
  is '处罚内容';
comment on column PER_PENALTIES.penalties_sum
  is '处罚金额';
comment on column PER_PENALTIES.start_date
  is '处罚生效日期';
comment on column PER_PENALTIES.stop_date
  is '处罚截止日期';
comment on column PER_PENALTIES.reconsideration_result
  is '行政复议结果';
comment on column PER_PENALTIES.label_cnt
  is '标注及声明个数';

