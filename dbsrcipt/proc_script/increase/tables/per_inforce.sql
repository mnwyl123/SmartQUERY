create table PER_INFORCE
(
  report_id       VARCHAR2(30) not null,
  settle_style    VARCHAR2(100),
  apply_sym_value VARCHAR2(100),
  label_cnt       VARCHAR2(100),
  register_date   VARCHAR2(100),
  cause           VARCHAR2(100),
  apply_sym       VARCHAR2(200),
  goal_sym        VARCHAR2(200),
  result          VARCHAR2(100),
  goal_sym_sum    VARCHAR2(100),
  settle_date     VARCHAR2(100),
  serial          VARCHAR2(100),
  exec_court      VARCHAR2(100)
)
;
comment on table PER_INFORCE
  is '强制执行记录信息段';
comment on column PER_INFORCE.report_id
  is '报告编号';
comment on column PER_INFORCE.settle_style
  is '结案方式';
comment on column PER_INFORCE.apply_sym_value
  is '申请执行标的金额';
comment on column PER_INFORCE.label_cnt
  is '标注及声明个数';
comment on column PER_INFORCE.register_date
  is '立案日期';
comment on column PER_INFORCE.cause
  is '执行案由';
comment on column PER_INFORCE.apply_sym
  is '申请执行标的';
comment on column PER_INFORCE.goal_sym
  is '已执行标的';
comment on column PER_INFORCE.result
  is '案件状态';
comment on column PER_INFORCE.goal_sym_sum
  is '已执行标的金额';
comment on column PER_INFORCE.settle_date
  is '结案日期';

