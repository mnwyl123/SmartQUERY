create table COM_ACTUAL_CONTROLLER
(
  report_id          VARCHAR2(30) not null,
  type_identity_num  VARCHAR2(100),
  type_identity      VARCHAR2(100),
  name_identity      VARCHAR2(150),
  type_identity_logo VARCHAR2(100)
)
;
comment on table COM_ACTUAL_CONTROLLER
  is '实际控制人信息';
comment on column COM_ACTUAL_CONTROLLER.report_id
  is '报告编号';
comment on column COM_ACTUAL_CONTROLLER.type_identity_num
  is '实际控制人身份标识号码';
comment on column COM_ACTUAL_CONTROLLER.type_identity
  is '实际控制人身份类型';
comment on column COM_ACTUAL_CONTROLLER.name_identity
  is '实际控制人名称';
comment on column COM_ACTUAL_CONTROLLER.type_identity_logo
  is '实际控制人身份标识类型';

