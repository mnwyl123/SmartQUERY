create table COM_PUB_COST_PAY_RECORD
(
  report_id             VARCHAR2(30) not null,
  serial_no             VARCHAR2(64),
  pub_com_name          VARCHAR2(200),
  info_type             VARCHAR2(20),
  static_date           VARCHAR2(15),
  pay_status            VARCHAR2(20),
  last_pay_date         VARCHAR2(20),
  total_arrear_sum      VARCHAR2(20),
  max_arrear_occur_date VARCHAR2(20),
  max_arrear_sum        VARCHAR2(20),
  type_business         VARCHAR2(100),
  serial                VARCHAR2(100),
  pub_pay_id            VARCHAR2(100),
  pay_recod_num_pub     VARCHAR2(100),
  pay_status2           VARCHAR2(20)
)
;
comment on table COM_PUB_COST_PAY_RECORD
  is '公共事业缴费信息明细单元';
comment on column COM_PUB_COST_PAY_RECORD.report_id
  is '报告编号';
comment on column COM_PUB_COST_PAY_RECORD.serial_no
  is '流水号';
comment on column COM_PUB_COST_PAY_RECORD.pub_com_name
  is '公用事业单位名称';
comment on column COM_PUB_COST_PAY_RECORD.info_type
  is '信息类型';
comment on column COM_PUB_COST_PAY_RECORD.static_date
  is '统计年月';
comment on column COM_PUB_COST_PAY_RECORD.pay_status
  is '缴费状态';
comment on column COM_PUB_COST_PAY_RECORD.last_pay_date
  is '最近一次缴费日期';
comment on column COM_PUB_COST_PAY_RECORD.total_arrear_sum
  is '累计欠费金额';
comment on column COM_PUB_COST_PAY_RECORD.max_arrear_occur_date
  is '最高欠费发生日期';
comment on column COM_PUB_COST_PAY_RECORD.max_arrear_sum
  is '最高欠费金额';
comment on column COM_PUB_COST_PAY_RECORD.type_business
  is '业务类型';
comment on column COM_PUB_COST_PAY_RECORD.serial
  is '编号';
comment on column COM_PUB_COST_PAY_RECORD.pub_pay_id
  is '公用事业缴费账户编号';
comment on column COM_PUB_COST_PAY_RECORD.pay_recod_num_pub
  is '缴费记录条数';
comment on column COM_PUB_COST_PAY_RECORD.pay_status2
  is '缴费状态2';

