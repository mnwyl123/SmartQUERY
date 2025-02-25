create table PER_VERDICT_HIS
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
  settle_style2   VARCHAR2(50)
)
;

