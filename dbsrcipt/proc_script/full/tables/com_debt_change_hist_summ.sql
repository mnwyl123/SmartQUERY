create table COM_DEBT_CHANGE_HIST_SUMM
(
  report_id              VARCHAR2(30) not null,
  change_date            VARCHAR2(20),
  all_debt_balance       VARCHAR2(15),
  bad_debt_balance       VARCHAR2(15),
  month                  VARCHAR2(100),
  num_over_debt          VARCHAR2(100),
  num_over_principal     VARCHAR2(100),
  over_principal         VARCHAR2(100),
  num_focus_debt_balance VARCHAR2(100),
  all_num_debt_balance   VARCHAR2(100),
  over_sum               VARCHAR2(100),
  focus_debt_balance     VARCHAR2(100),
  num_account_bad_debt   VARCHAR2(100)
)
;
comment on table COM_DEBT_CHANGE_HIST_SUMM
  is '负债变化历史概要';
comment on column COM_DEBT_CHANGE_HIST_SUMM.report_id
  is '报告编号';
comment on column COM_DEBT_CHANGE_HIST_SUMM.change_date
  is '日期';
comment on column COM_DEBT_CHANGE_HIST_SUMM.all_debt_balance
  is '全部负债余额';
comment on column COM_DEBT_CHANGE_HIST_SUMM.bad_debt_balance
  is '不良类负债余额';
comment on column COM_DEBT_CHANGE_HIST_SUMM.month
  is '月份';
comment on column COM_DEBT_CHANGE_HIST_SUMM.num_over_debt
  is '逾期账户数';
comment on column COM_DEBT_CHANGE_HIST_SUMM.num_over_principal
  is '逾期本金账户数';
comment on column COM_DEBT_CHANGE_HIST_SUMM.over_principal
  is '逾期本金';
comment on column COM_DEBT_CHANGE_HIST_SUMM.num_focus_debt_balance
  is '关注类负债账户数';
comment on column COM_DEBT_CHANGE_HIST_SUMM.all_num_debt_balance
  is '全部负债账户数';
comment on column COM_DEBT_CHANGE_HIST_SUMM.over_sum
  is '逾期总额';
comment on column COM_DEBT_CHANGE_HIST_SUMM.focus_debt_balance
  is '关注类负债余额';
comment on column COM_DEBT_CHANGE_HIST_SUMM.num_account_bad_debt
  is '不良类负债账户数';

