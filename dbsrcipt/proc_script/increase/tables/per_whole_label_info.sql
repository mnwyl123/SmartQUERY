create table PER_WHOLE_LABEL_INFO
(
  report_id            VARCHAR2(30) not null,
  serial               VARCHAR2(100),
  whole_label_cnt      VARCHAR2(100),
  whole_label_obj_sign VARCHAR2(100),
  whole_label_obj_type VARCHAR2(100)
)
;
comment on table PER_WHOLE_LABEL_INFO
  is '标注及声明信息';
comment on column PER_WHOLE_LABEL_INFO.whole_label_cnt
  is '标注及声明类型个数';
comment on column PER_WHOLE_LABEL_INFO.whole_label_obj_sign
  is '对象标识';
comment on column PER_WHOLE_LABEL_INFO.whole_label_obj_type
  is '对象类型';

