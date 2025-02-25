create table COM_EXTEND_DETAIL
(
  report_id         VARCHAR2(30) not null,
  serial_no         VARCHAR2(64),
  extend_start_date VARCHAR2(20),
  extend_end_date   VARCHAR2(20),
  extend_sum        VARCHAR2(15)
)
;
comment on table COM_EXTEND_DETAIL
  is '展期明细';
comment on column COM_EXTEND_DETAIL.report_id
  is '报告编号';
comment on column COM_EXTEND_DETAIL.serial_no
  is '流水号';
comment on column COM_EXTEND_DETAIL.extend_start_date
  is '展期起始日期';
comment on column COM_EXTEND_DETAIL.extend_end_date
  is '展期到期日期';
comment on column COM_EXTEND_DETAIL.extend_sum
  is '展期金额';

