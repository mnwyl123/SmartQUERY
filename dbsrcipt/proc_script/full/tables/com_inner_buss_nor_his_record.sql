create table COM_INNER_BUSS_NOR_HIS_RECORD
(
  report_id           VARCHAR2(30) not null,
  serial_no           VARCHAR2(64),
  buss_occur_date     VARCHAR2(20),
  balance_change_date VARCHAR2(20),
  balance             VARCHAR2(15),
  five_type           VARCHAR2(15)
)
;
comment on table COM_INNER_BUSS_NOR_HIS_RECORD
  is '表内业务正常类历史记录';
comment on column COM_INNER_BUSS_NOR_HIS_RECORD.report_id
  is '报告编号';
comment on column COM_INNER_BUSS_NOR_HIS_RECORD.serial_no
  is '流水号';
comment on column COM_INNER_BUSS_NOR_HIS_RECORD.buss_occur_date
  is '业务发生日期';
comment on column COM_INNER_BUSS_NOR_HIS_RECORD.balance_change_date
  is '余额改变日期';
comment on column COM_INNER_BUSS_NOR_HIS_RECORD.balance
  is '余额';
comment on column COM_INNER_BUSS_NOR_HIS_RECORD.five_type
  is '五级分类';

