create table COM_INFO_SUMMARY
(
  report_id          VARCHAR2(30) not null,
  first_trade_year   VARCHAR2(30),
  relation_org       VARCHAR2(30),
  unclear_org        VARCHAR2(30),
  current_debt       VARCHAR2(200),
  over_debt          VARCHAR2(200),
  org_num            VARCHAR2(20),
  credit_flag_num    VARCHAR2(20),
  info_statement_num VARCHAR2(20)
)
;
comment on table COM_INFO_SUMMARY
  is '信息概要';
comment on column COM_INFO_SUMMARY.report_id
  is '报告编号';
comment on column COM_INFO_SUMMARY.first_trade_year
  is '首次交易年';
comment on column COM_INFO_SUMMARY.relation_org
  is '办理过信贷业务的金融机构数量';
comment on column COM_INFO_SUMMARY.unclear_org
  is '未结清的金融机构数量';
comment on column COM_INFO_SUMMARY.current_debt
  is '负责余额';
comment on column COM_INFO_SUMMARY.over_debt
  is '不良和违约负债余额';
comment on column COM_INFO_SUMMARY.org_num
  is '报数机构说明条数';
comment on column COM_INFO_SUMMARY.credit_flag_num
  is '征信中心标注条数';
comment on column COM_INFO_SUMMARY.info_statement_num
  is '信息主体声明条数';

