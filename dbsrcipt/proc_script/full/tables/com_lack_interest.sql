create table COM_LACK_INTEREST
(
  report_id            VARCHAR2(30) not null,
  serial_no            VARCHAR2(64),
  credit_org           VARCHAR2(200),
  currency             VARCHAR2(10),
  lack_inte_balance    VARCHAR2(15),
  balance_change_date  VARCHAR2(20),
  lack_inte_type       VARCHAR2(20),
  his_max_lack_inte    VARCHAR2(15),
  first_lack_inte_date VARCHAR2(20),
  last_settle_date     VARCHAR2(20),
  settle_status        VARCHAR2(10),
  remarks              VARCHAR2(200),
  type_org             VARCHAR2(100),
  code_org             VARCHAR2(100),
  num_lack             VARCHAR2(100),
  date_report          VARCHAR2(100),
  currency2            VARCHAR2(10),
  lack_inte_type2      VARCHAR2(20)
)
;
comment on table COM_LACK_INTEREST
  is '欠息信息单元';
comment on column COM_LACK_INTEREST.report_id
  is '报告编号';
comment on column COM_LACK_INTEREST.serial_no
  is '流水号';
comment on column COM_LACK_INTEREST.credit_org
  is '授信机构';
comment on column COM_LACK_INTEREST.currency
  is '币种';
comment on column COM_LACK_INTEREST.lack_inte_balance
  is '欠息余额';
comment on column COM_LACK_INTEREST.balance_change_date
  is '余额变化日期';
comment on column COM_LACK_INTEREST.lack_inte_type
  is '欠息类型';
comment on column COM_LACK_INTEREST.his_max_lack_inte
  is '历史最高欠息金额（元）';
comment on column COM_LACK_INTEREST.first_lack_inte_date
  is '首次欠息发生日期';
comment on column COM_LACK_INTEREST.last_settle_date
  is '最近一次结清日期';
comment on column COM_LACK_INTEREST.settle_status
  is '结清状态(0：未结清,1：已结清)';
comment on column COM_LACK_INTEREST.remarks
  is '备注';
comment on column COM_LACK_INTEREST.type_org
  is '业务管理机构类型';
comment on column COM_LACK_INTEREST.code_org
  is '业务管理机构代码';
comment on column COM_LACK_INTEREST.num_lack
  is '欠息信息编号';
comment on column COM_LACK_INTEREST.date_report
  is '信息报告日期';
comment on column COM_LACK_INTEREST.currency2
  is '币种2';
comment on column COM_LACK_INTEREST.lack_inte_type2
  is '欠息类型2';

