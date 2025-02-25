create table COM_SUP_ORG
(
  report_id            VARCHAR2(30) not null,
  hight_num            VARCHAR2(100),
  hight_insti_type     VARCHAR2(100),
  hight_insti_name     VARCHAR2(100),
  hight_inti_idet_type VARCHAR2(100),
  date_update_hight    VARCHAR2(100)
)
;
comment on table COM_SUP_ORG
  is '上级机构信息单元';
comment on column COM_SUP_ORG.report_id
  is '报告编号';
comment on column COM_SUP_ORG.hight_num
  is '上级机构身份标识号码';
comment on column COM_SUP_ORG.hight_insti_type
  is '上级机构类型';
comment on column COM_SUP_ORG.hight_insti_name
  is '上级机构名称';
comment on column COM_SUP_ORG.hight_inti_idet_type
  is '上级机构身份标识类型';
comment on column COM_SUP_ORG.date_update_hight
  is '更新日期';

