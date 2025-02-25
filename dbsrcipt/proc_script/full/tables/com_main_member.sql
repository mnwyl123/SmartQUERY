create table COM_MAIN_MEMBER
(
  report_id          VARCHAR2(30) not null,
  num_pepl           VARCHAR2(64),
  date_update_senior VARCHAR2(64)
)
;
comment on table COM_MAIN_MEMBER
  is '主要成员表';
comment on column COM_MAIN_MEMBER.report_id
  is '报告编号';
comment on column COM_MAIN_MEMBER.num_pepl
  is '主要组成人员个数';
comment on column COM_MAIN_MEMBER.date_update_senior
  is '更新日期';

