create table COM_INSP_QUARA
(
  report_id        VARCHAR2(30) not null,
  exp_com_name     VARCHAR2(100),
  quara_id         VARCHAR2(100),
  date_effe        VARCHAR2(100),
  appr_depart_name VARCHAR2(100)
)
;
comment on table COM_INSP_QUARA
  is '出入境检验检疫绿色通道信息单元';
comment on column COM_INSP_QUARA.report_id
  is '报告编号';
comment on column COM_INSP_QUARA.exp_com_name
  is '出口商品名称';
comment on column COM_INSP_QUARA.quara_id
  is '信息编号';
comment on column COM_INSP_QUARA.date_effe
  is '生效日期';
comment on column COM_INSP_QUARA.appr_depart_name
  is '批准部门名称';

