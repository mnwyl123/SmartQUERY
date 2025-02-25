create table COM_DECL_INFO
(
  report_id VARCHAR2(30) not null,
  contents  VARCHAR2(500),
  decl_obj  VARCHAR2(100),
  add_date  VARCHAR2(20)
)
;
comment on table COM_DECL_INFO
  is '声明信息';
comment on column COM_DECL_INFO.report_id
  is '报告编号';
comment on column COM_DECL_INFO.contents
  is '内容';
comment on column COM_DECL_INFO.decl_obj
  is '声明主体';
comment on column COM_DECL_INFO.add_date
  is '添加日期';

