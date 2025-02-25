create table COM_RAT_INFO_OBJ
(
  report_id VARCHAR2(30) not null,
  sta_type  VARCHAR2(100),
  sta_cont  VARCHAR2(400),
  obj_type  VARCHAR2(100),
  date_t    VARCHAR2(100),
  obj_logo  VARCHAR2(100)
)
;
comment on table COM_RAT_INFO_OBJ
  is '声明及异议标注信息单元';
comment on column COM_RAT_INFO_OBJ.report_id
  is '报告编号';
comment on column COM_RAT_INFO_OBJ.sta_type
  is '标注及声明类型';
comment on column COM_RAT_INFO_OBJ.sta_cont
  is '标注或声明内容';
comment on column COM_RAT_INFO_OBJ.obj_type
  is '对象类型';
comment on column COM_RAT_INFO_OBJ.date_t
  is '添加日期';
comment on column COM_RAT_INFO_OBJ.obj_logo
  is '对象标识';

