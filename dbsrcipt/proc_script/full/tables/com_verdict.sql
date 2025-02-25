create table COM_VERDICT
(
  report_id     VARCHAR2(30) not null,
  litig_reason  VARCHAR2(100),
  apply_sym     VARCHAR2(200),
  result        VARCHAR2(100),
  settle_style  VARCHAR2(100),
  register_date VARCHAR2(100),
  apply_sym_sum VARCHAR2(100),
  goal_sym_sum  VARCHAR2(100),
  serial        VARCHAR2(100),
  court_name    VARCHAR2(100),
  goal_sym      VARCHAR2(200),
  case_num      VARCHAR2(100)
)
;
comment on table COM_VERDICT
  is '强制执行记录信息单元';
comment on column COM_VERDICT.report_id
  is '报告编号';
comment on column COM_VERDICT.litig_reason
  is '执行案由';
comment on column COM_VERDICT.apply_sym
  is '申请执行标的';
comment on column COM_VERDICT.result
  is '案件状态';
comment on column COM_VERDICT.settle_style
  is '结案方式';
comment on column COM_VERDICT.register_date
  is '立案日期';
comment on column COM_VERDICT.apply_sym_sum
  is '申请执行标的金额';
comment on column COM_VERDICT.goal_sym_sum
  is '已执行标的金额';
comment on column COM_VERDICT.serial
  is '强制执行记录编号';
comment on column COM_VERDICT.court_name
  is '执行法院名称';
comment on column COM_VERDICT.goal_sym
  is '已执行标的';
comment on column COM_VERDICT.case_num
  is '案号';

