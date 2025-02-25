create table COM_FINAN_SCAL
(
  report_id       VARCHAR2(30) not null,
  sub_list        VARCHAR2(100),
  type_contr_scal VARCHAR2(100),
  info_id         VARCHAR2(100),
  the_size        VARCHAR2(100),
  years           VARCHAR2(100)
)
;
comment on table COM_FINAN_SCAL
  is '融资规模控制信息单元';
comment on column COM_FINAN_SCAL.report_id
  is '报告编号';
comment on column COM_FINAN_SCAL.sub_list
  is '所属名录';
comment on column COM_FINAN_SCAL.type_contr_scal
  is '融资控制类型';
comment on column COM_FINAN_SCAL.info_id
  is '信息编号';
comment on column COM_FINAN_SCAL.the_size
  is '规模';
comment on column COM_FINAN_SCAL.years
  is '年度';

