create table COM_PATENT_CASE
(
  report_id      VARCHAR2(30) not null,
  patent_name    VARCHAR2(200),
  patent_no      VARCHAR2(100),
  app_date       VARCHAR2(20),
  grant_date     VARCHAR2(20),
  effective_year VARCHAR2(20),
  info_id        VARCHAR2(100)
)
;
comment on table COM_PATENT_CASE
  is '拥有专利情况信息单元';
comment on column COM_PATENT_CASE.report_id
  is '报告编号';
comment on column COM_PATENT_CASE.patent_name
  is '专利名称';
comment on column COM_PATENT_CASE.patent_no
  is '专利号';
comment on column COM_PATENT_CASE.app_date
  is '申请日期';
comment on column COM_PATENT_CASE.grant_date
  is '授予日期';
comment on column COM_PATENT_CASE.effective_year
  is '专利有效期';
comment on column COM_PATENT_CASE.info_id
  is '信息编号';

