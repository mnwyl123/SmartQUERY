create table COM_UNCLEAR_CREDIT_TYPE_SUMM
(
  report_id     VARCHAR2(30) not null,
  buss_type     VARCHAR2(5),
  attent_status VARCHAR2(5),
  buss_num      INTEGER,
  buss_balance  VARCHAR2(15),
  settle_status VARCHAR2(2),
  buss_type2    VARCHAR2(5)
)
;
comment on table COM_UNCLEAR_CREDIT_TYPE_SUMM
  is '未结清信贷业务分类信息概要';
comment on column COM_UNCLEAR_CREDIT_TYPE_SUMM.report_id
  is '报告编号';
comment on column COM_UNCLEAR_CREDIT_TYPE_SUMM.buss_type
  is '业务类型(01:贷款,02:类贷款,03:贸易融资,04:保理,05:票据贴现,06:银行承兑汇票,07:信用证,08:保函)';
comment on column COM_UNCLEAR_CREDIT_TYPE_SUMM.attent_status
  is '关注状态(01：正常,02：关注,03：不良)';
comment on column COM_UNCLEAR_CREDIT_TYPE_SUMM.buss_num
  is '笔数';
comment on column COM_UNCLEAR_CREDIT_TYPE_SUMM.buss_balance
  is '余额';
comment on column COM_UNCLEAR_CREDIT_TYPE_SUMM.settle_status
  is '结清状态';

