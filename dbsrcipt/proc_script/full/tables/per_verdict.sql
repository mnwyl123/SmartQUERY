create table PER_VERDICT
(
  report_id       VARCHAR2(30) not null,
  serial          VARCHAR2(10),
  type            VARCHAR2(10),
  court_name      VARCHAR2(100),
  cause           VARCHAR2(200),
  register_date   VARCHAR2(20),
  settle_style    VARCHAR2(50),
  result          VARCHAR2(200),
  settle_date     VARCHAR2(20),
  apply_sym       VARCHAR2(50),
  apply_sym_value VARCHAR2(20),
  goal_sym        VARCHAR2(200),
  goal_sym_sum    VARCHAR2(20),
  label_cnt       VARCHAR2(100),
  settle_style2   VARCHAR2(50),
  settle_style3   VARCHAR2(50)
)
;
comment on table PER_VERDICT
  is '民事判决信息段';
comment on column PER_VERDICT.report_id
  is '报告编号';
comment on column PER_VERDICT.serial
  is '编号';
comment on column PER_VERDICT.type
  is '类型(0:民事判决，1:强制执行)';
comment on column PER_VERDICT.court_name
  is '立案法院';
comment on column PER_VERDICT.cause
  is '案由';
comment on column PER_VERDICT.register_date
  is '立案日期';
comment on column PER_VERDICT.settle_style
  is '结案方式';
comment on column PER_VERDICT.result
  is '判决/调解结果';
comment on column PER_VERDICT.settle_date
  is '判决/调解生效日期';
comment on column PER_VERDICT.apply_sym
  is '申请执行标的';
comment on column PER_VERDICT.apply_sym_value
  is '申请执行标的价值';
comment on column PER_VERDICT.goal_sym
  is '诉讼标的';
comment on column PER_VERDICT.goal_sym_sum
  is '诉讼标的金额';
comment on column PER_VERDICT.label_cnt
  is '标注及声明个数';
comment on column PER_VERDICT.settle_style2
  is '结案方式2';

