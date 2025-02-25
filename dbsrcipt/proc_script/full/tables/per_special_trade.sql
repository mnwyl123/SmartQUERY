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
  is '���⽻����Ϣ';
comment on column PER_SPECIAL_TRADE.report_id
  is '������';
comment on column PER_SPECIAL_TRADE.serial
  is '�˻����';
comment on column PER_SPECIAL_TRADE.serial_number
  is '��ˮ��';
comment on column PER_SPECIAL_TRADE.cart_type
  is '����((0:���1:���ǿ���2:׼���ǿ�)';
comment on column PER_SPECIAL_TRADE.special_trade_type
  is '���⽻������';
comment on column PER_SPECIAL_TRADE.occur_date
  is '���⽻�׷�������';
comment on column PER_SPECIAL_TRADE.change_month
  is '�������ڱ������';
comment on column PER_SPECIAL_TRADE.occur_sum
  is '���⽻�׷������';
comment on column PER_SPECIAL_TRADE.overdue_detail
  is '���⽻����ϸ��¼';
comment on column PER_SPECIAL_TRADE.special_trade_type2
  is '���⽻������2';

