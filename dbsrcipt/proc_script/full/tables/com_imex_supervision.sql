create table COM_IMEX_SUPERVISION
(
  report_id     VARCHAR2(30) not null,
  super_org     VARCHAR2(100),
  super_council VARCHAR2(100),
  super_level   VARCHAR2(100),
  start_date    VARCHAR2(20),
  end_date      VARCHAR2(20),
  info_id       VARCHAR2(100),
  super_level2  VARCHAR2(100)
)
;
comment on table COM_IMEX_SUPERVISION
  is '进出口商品检验分类监管信息单元';
comment on column COM_IMEX_SUPERVISION.report_id
  is '报告编号';
comment on column COM_IMEX_SUPERVISION.super_org
  is '监管部门名称';
comment on column COM_IMEX_SUPERVISION.super_council
  is '管辖直属局';
comment on column COM_IMEX_SUPERVISION.super_level
  is '监管级别';
comment on column COM_IMEX_SUPERVISION.start_date
  is '生效日期';
comment on column COM_IMEX_SUPERVISION.end_date
  is '截至日期';
comment on column COM_IMEX_SUPERVISION.info_id
  is '信息编号';
comment on column COM_IMEX_SUPERVISION.super_level2
  is '监管级别2';

