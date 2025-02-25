create table COM_PLEDGE
(
  report_id      VARCHAR2(30) not null,
  serial_no      VARCHAR2(64),
  pledge_type    VARCHAR2(5),
  pledge_owner   VARCHAR2(200),
  pledge_species VARCHAR2(200),
  currency       VARCHAR2(15),
  assess_sum     VARCHAR2(15),
  assess_date    VARCHAR2(20),
  guar_sum       VARCHAR2(15)
)
;
comment on table COM_PLEDGE
  is '抵/质押物';
comment on column COM_PLEDGE.report_id
  is '报告编号';
comment on column COM_PLEDGE.serial_no
  is '流水号';
comment on column COM_PLEDGE.pledge_type
  is '抵质押物类型(01：抵押,02：质押)';
comment on column COM_PLEDGE.pledge_owner
  is '抵押物所有人';
comment on column COM_PLEDGE.pledge_species
  is '抵押物种类';
comment on column COM_PLEDGE.currency
  is '币种';
comment on column COM_PLEDGE.assess_sum
  is '估值金额';
comment on column COM_PLEDGE.assess_date
  is '评估日期';
comment on column COM_PLEDGE.guar_sum
  is '担保金额';

