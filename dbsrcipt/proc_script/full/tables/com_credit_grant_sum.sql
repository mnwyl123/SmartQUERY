create table COM_CREDIT_GRANT_SUM
(
  report_id                  VARCHAR2(30) not null,
  use_total_non_rev_credt    VARCHAR2(100),
  remain_total_non_rev_credt VARCHAR2(100),
  total_rev_credt            VARCHAR2(100),
  remain_total_rev_credt     VARCHAR2(100),
  whet_credit_limt           VARCHAR2(100),
  total_non_rev_credt        VARCHAR2(100),
  use_total_rev_credt        VARCHAR2(100)
)
;
comment on table COM_CREDIT_GRANT_SUM
  is '授信协议汇总信息单元';
comment on column COM_CREDIT_GRANT_SUM.report_id
  is '报告编号';
comment on column COM_CREDIT_GRANT_SUM.use_total_non_rev_credt
  is '已使用的非循环信用额度合计';
comment on column COM_CREDIT_GRANT_SUM.remain_total_non_rev_credt
  is '剩余可用的非循环额度合计';
comment on column COM_CREDIT_GRANT_SUM.total_rev_credt
  is '循环信用额度合计';
comment on column COM_CREDIT_GRANT_SUM.remain_total_rev_credt
  is '剩余可用的循环额度合计';
comment on column COM_CREDIT_GRANT_SUM.whet_credit_limt
  is '是否包含授信限额';
comment on column COM_CREDIT_GRANT_SUM.total_non_rev_credt
  is '非循环信用额度合计';
comment on column COM_CREDIT_GRANT_SUM.use_total_rev_credt
  is '已使用的循环信用额度合计';

