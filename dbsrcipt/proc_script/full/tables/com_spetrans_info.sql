create table COM_SPETRANS_INFO
(
  report_id             VARCHAR2(30) not null,
  trans_info            VARCHAR2(200),
  serial                VARCHAR2(100),
  date_trans            VARCHAR2(100),
  trans_sum             VARCHAR2(100),
  month_change_due_time VARCHAR2(100),
  type_trans            VARCHAR2(100)
)
;
comment on table COM_SPETRANS_INFO
  is '特定交易信息';
comment on column COM_SPETRANS_INFO.report_id
  is '报告编号';
comment on column COM_SPETRANS_INFO.trans_info
  is '交易明细信息';
comment on column COM_SPETRANS_INFO.serial
  is '编号';
comment on column COM_SPETRANS_INFO.date_trans
  is '交易日期';
comment on column COM_SPETRANS_INFO.trans_sum
  is '交易金额';
comment on column COM_SPETRANS_INFO.month_change_due_time
  is '到期日期变更月数';
comment on column COM_SPETRANS_INFO.type_trans
  is '交易类型';

