create table COM_REPAY_INFO
(
  report_id                   VARCHAR2(30) not null,
  rece_repay_onece_form       VARCHAR2(100),
  over_principal              VARCHAR2(100),
  over_month                  VARCHAR2(100),
  balance_num_date_change     VARCHAR2(100),
  rece_repay_sum              VARCHAR2(100),
  over_sum                    VARCHAR2(100),
  num_month_remain            VARCHAR2(100),
  serial                      VARCHAR2(100),
  date_report_info            VARCHAR2(100),
  five_cla                    VARCHAR2(100),
  date_five_cla               VARCHAR2(100),
  rece_repay_onece_time       VARCHAR2(100),
  rece_repay_onece_sum        VARCHAR2(100),
  balance_num                 VARCHAR2(100),
  rece_repay_onece_conve_date VARCHAR2(100)
)
;
comment on table COM_REPAY_INFO
  is '还款表现信息';
comment on column COM_REPAY_INFO.report_id
  is '报告编号';
comment on column COM_REPAY_INFO.rece_repay_onece_form
  is '最近一次还款形式';
comment on column COM_REPAY_INFO.over_principal
  is '逾期本金';
comment on column COM_REPAY_INFO.over_month
  is '逾期月数';
comment on column COM_REPAY_INFO.balance_num_date_change
  is '余额变化日期';
comment on column COM_REPAY_INFO.rece_repay_sum
  is '最近一次应还总额';
comment on column COM_REPAY_INFO.over_sum
  is '逾期总额';
comment on column COM_REPAY_INFO.num_month_remain
  is '剩余还款月数';
comment on column COM_REPAY_INFO.serial
  is '编号';
comment on column COM_REPAY_INFO.date_report_info
  is '信息报告日期';
comment on column COM_REPAY_INFO.five_cla
  is '五级分类';
comment on column COM_REPAY_INFO.date_five_cla
  is '五级分类认定日期';
comment on column COM_REPAY_INFO.rece_repay_onece_time
  is '最近一次实际还款日期';
comment on column COM_REPAY_INFO.rece_repay_onece_sum
  is '最近一次实际还款总额';
comment on column COM_REPAY_INFO.balance_num
  is '余额';
comment on column COM_REPAY_INFO.rece_repay_onece_conve_date
  is '最近一次约定还款日期';

