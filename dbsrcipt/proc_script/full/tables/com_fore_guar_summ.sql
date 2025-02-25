create table COM_FORE_GUAR_SUMM
(
  report_id          VARCHAR2(30) not null,
  guar_type          VARCHAR2(10),
  guar_num           VARCHAR2(20),
  guar_sum           VARCHAR2(15),
  nor_guar_balance   VARCHAR2(15),
  atten_guar_balance VARCHAR2(15),
  bad_guar_balance   VARCHAR2(15)
)
;
comment on table COM_FORE_GUAR_SUMM
  is '对外担保概要';
comment on column COM_FORE_GUAR_SUMM.report_id
  is '报告编号';
comment on column COM_FORE_GUAR_SUMM.guar_type
  is '担保类型(01：保证,02：抵押,03：质押)';
comment on column COM_FORE_GUAR_SUMM.guar_num
  is '笔数';
comment on column COM_FORE_GUAR_SUMM.guar_sum
  is '担保金额';
comment on column COM_FORE_GUAR_SUMM.nor_guar_balance
  is '所担保主业务余额（正常）';
comment on column COM_FORE_GUAR_SUMM.atten_guar_balance
  is '所担保主业务余额（关注）';
comment on column COM_FORE_GUAR_SUMM.bad_guar_balance
  is '所担保主业务余额（不良）';

