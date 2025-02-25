create table COM_CONTRO_PERSON
(
  report_id       VARCHAR2(30) not null,
  control_num     VARCHAR2(64),
  date_update_act VARCHAR2(64)
)
;
comment on table COM_CONTRO_PERSON
  is '主要成员表';
comment on column COM_CONTRO_PERSON.report_id
  is '报告编号';
comment on column COM_CONTRO_PERSON.control_num
  is '主要组成人员个数';
comment on column COM_CONTRO_PERSON.date_update_act
  is '更新日期';

