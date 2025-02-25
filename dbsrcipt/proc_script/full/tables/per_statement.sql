create table PER_STATEMENT
(
  report_id          VARCHAR2(30) not null,
  serial             VARCHAR2(10),
  serial_number      VARCHAR2(64),
  cart_type          VARCHAR2(10),
  org_des            VARCHAR2(200),
  org_des_date       VARCHAR2(20),
  owner_declare      VARCHAR2(200),
  owner_declare_date VARCHAR2(20),
  objections         VARCHAR2(200),
  objections_date    VARCHAR2(20),
  instruction_type   VARCHAR2(2),
  instruction        VARCHAR2(255),
  add_date           VARCHAR2(24),
  instruction_type2  VARCHAR2(2)
)
;
comment on table PER_STATEMENT
  is '说明/声明/标注信息表';
comment on column PER_STATEMENT.report_id
  is '报告编号';
comment on column PER_STATEMENT.serial
  is '编号';
comment on column PER_STATEMENT.serial_number
  is '流水号';
comment on column PER_STATEMENT.cart_type
  is '类型((0:贷款，1:贷记卡，2:准贷记卡，3:本人声明，4:异议标注))';
comment on column PER_STATEMENT.org_des
  is '贷款/发卡机构说明(已废除)';
comment on column PER_STATEMENT.org_des_date
  is '添加日期（已废除）';
comment on column PER_STATEMENT.owner_declare
  is '本人声明（已废除）';
comment on column PER_STATEMENT.owner_declare_date
  is '添加日期（已废除）';
comment on column PER_STATEMENT.objections
  is '异议标注（已废除）';
comment on column PER_STATEMENT.objections_date
  is '添加日期（已废除）';
comment on column PER_STATEMENT.instruction_type
  is '说明类型（0:贷款/发卡机构说明，1:本人声明，2:异议标注）';
comment on column PER_STATEMENT.instruction
  is '说明内容';
comment on column PER_STATEMENT.add_date
  is '添加日期';

