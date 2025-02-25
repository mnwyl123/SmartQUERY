create table COM_GUAR_COMP_DETAIL
(
  report_id       VARCHAR2(30) not null,
  serial_no       VARCHAR2(64),
  comp_org        VARCHAR2(100),
  last_comp_date  VARCHAR2(20),
  tatal_comp_sum  VARCHAR2(15),
  comp_balance    VARCHAR2(15),
  last_repay_date VARCHAR2(20),
  orig_guss       VARCHAR2(100),
  settle_status   VARCHAR2(5),
  remarks         VARCHAR2(200)
)
;
comment on table COM_GUAR_COMP_DETAIL
  is '担保及第三方代偿业务明细';
comment on column COM_GUAR_COMP_DETAIL.report_id
  is '报告编号';
comment on column COM_GUAR_COMP_DETAIL.serial_no
  is '流水号';
comment on column COM_GUAR_COMP_DETAIL.comp_org
  is '代偿机构';
comment on column COM_GUAR_COMP_DETAIL.last_comp_date
  is '最近代偿日期';
comment on column COM_GUAR_COMP_DETAIL.tatal_comp_sum
  is '累计代偿金额';
comment on column COM_GUAR_COMP_DETAIL.comp_balance
  is '代偿余额(已结清的余额为0)';
comment on column COM_GUAR_COMP_DETAIL.last_repay_date
  is '最近还款日期';
comment on column COM_GUAR_COMP_DETAIL.orig_guss
  is '原业务';
comment on column COM_GUAR_COMP_DETAIL.settle_status
  is '结清状态(0：未结清,1：已结清)';
comment on column COM_GUAR_COMP_DETAIL.remarks
  is '备注';

