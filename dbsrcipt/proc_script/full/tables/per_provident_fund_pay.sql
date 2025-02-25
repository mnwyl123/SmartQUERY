create table PER_PROVIDENT_FUND_PAY
(
  report_id       VARCHAR2(30) not null,
  serial          VARCHAR2(10),
  pay_place       VARCHAR2(50),
  pay_date        VARCHAR2(20),
  start_pay_mon   VARCHAR2(20),
  stop_pay_mon    VARCHAR2(20),
  pay_status      VARCHAR2(20),
  pay_mon_amout   VARCHAR2(10),
  per_pay_percent VARCHAR2(10),
  com_pay_percent VARCHAR2(10),
  pay_com_name    VARCHAR2(100),
  update_time     VARCHAR2(20),
  label_cnt       VARCHAR2(100),
  pay_status2     VARCHAR2(20)
)
;
comment on table PER_PROVIDENT_FUND_PAY
  is '住房公积金参缴记录信息段';
comment on column PER_PROVIDENT_FUND_PAY.report_id
  is '报告编号';
comment on column PER_PROVIDENT_FUND_PAY.serial
  is '编号';
comment on column PER_PROVIDENT_FUND_PAY.pay_place
  is '参缴地';
comment on column PER_PROVIDENT_FUND_PAY.pay_date
  is '参缴日期';
comment on column PER_PROVIDENT_FUND_PAY.start_pay_mon
  is '初缴月份';
comment on column PER_PROVIDENT_FUND_PAY.stop_pay_mon
  is '缴至月份';
comment on column PER_PROVIDENT_FUND_PAY.pay_status
  is '缴费状态';
comment on column PER_PROVIDENT_FUND_PAY.pay_mon_amout
  is '月缴存额';
comment on column PER_PROVIDENT_FUND_PAY.per_pay_percent
  is '个人缴存比例';
comment on column PER_PROVIDENT_FUND_PAY.com_pay_percent
  is '单位缴存比例';
comment on column PER_PROVIDENT_FUND_PAY.pay_com_name
  is '缴费单位';
comment on column PER_PROVIDENT_FUND_PAY.update_time
  is '信息更新日期';
comment on column PER_PROVIDENT_FUND_PAY.label_cnt
  is '标注及声明个数';
comment on column PER_PROVIDENT_FUND_PAY.pay_status2
  is '缴费状态2';

