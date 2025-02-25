create table PER_SPECIAL_TRADE
(
  report_id           VARCHAR2(30) not null,
  serial              VARCHAR2(10),
  serial_number       VARCHAR2(64),
  cart_type           VARCHAR2(10),
  special_trade_type  VARCHAR2(50),
  occur_date          VARCHAR2(20),
  change_month        VARCHAR2(10),
  occur_sum           VARCHAR2(20),
  overdue_detail      VARCHAR2(200),
  special_trade_type2 VARCHAR2(50)
)
;
comment on table PER_SPECIAL_TRADE
  is '特殊交易信息';
comment on column PER_SPECIAL_TRADE.report_id
  is '报告编号';
comment on column PER_SPECIAL_TRADE.serial
  is '账户编号';
comment on column PER_SPECIAL_TRADE.serial_number
  is '流水号';
comment on column PER_SPECIAL_TRADE.cart_type
  is '类型((0:贷款，1:贷记卡，2:准贷记卡)';
comment on column PER_SPECIAL_TRADE.special_trade_type
  is '特殊交易类型';
comment on column PER_SPECIAL_TRADE.occur_date
  is '特殊交易发生日期';
comment on column PER_SPECIAL_TRADE.change_month
  is '到期日期变更月数';
comment on column PER_SPECIAL_TRADE.occur_sum
  is '特殊交易发生金额';
comment on column PER_SPECIAL_TRADE.overdue_detail
  is '特殊交易明细记录';
comment on column PER_SPECIAL_TRADE.special_trade_type2
  is '特殊交易类型2';

