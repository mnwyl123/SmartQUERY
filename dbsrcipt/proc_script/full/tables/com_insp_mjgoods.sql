create table COM_INSP_MJGOODS
(
  report_id        VARCHAR2(30) not null,
  mj_name          VARCHAR2(100),
  mj_id            VARCHAR2(100),
  appr_depart_name VARCHAR2(100),
  date_end         VARCHAR2(100),
  info_id          VARCHAR2(100)
)
;
comment on table COM_INSP_MJGOODS
  is '进出口商品免验信息单元';
comment on column COM_INSP_MJGOODS.report_id
  is '报告编号';
comment on column COM_INSP_MJGOODS.mj_name
  is '免验商品名称';
comment on column COM_INSP_MJGOODS.mj_id
  is '免验号';
comment on column COM_INSP_MJGOODS.appr_depart_name
  is '批准部门名称';
comment on column COM_INSP_MJGOODS.date_end
  is '截至日期';
comment on column COM_INSP_MJGOODS.info_id
  is '信息编号';

