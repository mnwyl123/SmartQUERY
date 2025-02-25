create table COM_INVESTOR
(
  report_id          VARCHAR2(30) not null,
  reig_capital       VARCHAR2(64),
  num_invest         VARCHAR2(64),
  date_update_invest VARCHAR2(64)
)
;
comment on table COM_INVESTOR
  is '注册资本表';
comment on column COM_INVESTOR.report_id
  is '报告编号';
comment on column COM_INVESTOR.reig_capital
  is '注册资本（折人民币合计）';
comment on column COM_INVESTOR.num_invest
  is '主要出资人个数';
comment on column COM_INVESTOR.date_update_invest
  is '更新日期(注册人)';

