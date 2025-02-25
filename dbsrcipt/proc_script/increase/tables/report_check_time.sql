create table REPORT_CHECK_TIME
(
  user_id          VARCHAR2(64),
  username_perbank VARCHAR2(64),
  flow_id          VARCHAR2(64),
  check_time       DATE
)
;
comment on table REPORT_CHECK_TIME
  is '记录审核信息';
comment on column REPORT_CHECK_TIME.user_id
  is '审核用户id';
comment on column REPORT_CHECK_TIME.username_perbank
  is '审核用户对应的人行用户';
comment on column REPORT_CHECK_TIME.flow_id
  is '流程id';
comment on column REPORT_CHECK_TIME.check_time
  is '审核时间';

