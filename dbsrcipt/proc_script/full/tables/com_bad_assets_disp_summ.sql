create table COM_BAD_ASSETS_DISP_SUMM
(
  report_id          VARCHAR2(30) not null,
  bad_assets_type    VARCHAR2(5),
  bad_assets_num     VARCHAR2(20),
  bad_assets_balance VARCHAR2(15),
  last_disposal_date VARCHAR2(20),
  settle_status      VARCHAR2(20),
  bad_assets_type2   VARCHAR2(5)
)
;
comment on table COM_BAD_ASSETS_DISP_SUMM
  is '未结清不良资产处置信息概要';
comment on column COM_BAD_ASSETS_DISP_SUMM.report_id
  is '报告编号';
comment on column COM_BAD_ASSETS_DISP_SUMM.bad_assets_type
  is '不良资产类型(01：有资产管理公司处置的债务,02：欠息,03：垫款,04：担保代偿或第三方代偿的债务,05：不良资产剥离（不存在未结清状态）)';
comment on column COM_BAD_ASSETS_DISP_SUMM.bad_assets_num
  is '笔数';
comment on column COM_BAD_ASSETS_DISP_SUMM.bad_assets_balance
  is '余额';
comment on column COM_BAD_ASSETS_DISP_SUMM.last_disposal_date
  is '最后一次处置日期';
comment on column COM_BAD_ASSETS_DISP_SUMM.settle_status
  is '结清状态(0:未结清，1：已结清)';

