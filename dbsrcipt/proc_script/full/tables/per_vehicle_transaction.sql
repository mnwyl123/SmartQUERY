create table PER_VEHICLE_TRANSACTION
(
  report_id      VARCHAR2(30) not null,
  serial         VARCHAR2(10),
  plate_num      VARCHAR2(100),
  engine_num     VARCHAR2(100),
  brand          VARCHAR2(20),
  vehicle_type   VARCHAR2(20),
  used_type      VARCHAR2(30),
  vehicle_status VARCHAR2(30),
  mortgage_mark  VARCHAR2(15),
  update_time    VARCHAR2(20)
)
;
comment on table PER_VEHICLE_TRANSACTION
  is '车辆交易和抵押记录';
comment on column PER_VEHICLE_TRANSACTION.report_id
  is '报告编号';
comment on column PER_VEHICLE_TRANSACTION.serial
  is '编号';
comment on column PER_VEHICLE_TRANSACTION.plate_num
  is '车牌号码';
comment on column PER_VEHICLE_TRANSACTION.engine_num
  is '发动机号';
comment on column PER_VEHICLE_TRANSACTION.brand
  is '品牌';
comment on column PER_VEHICLE_TRANSACTION.vehicle_type
  is '车辆类型';
comment on column PER_VEHICLE_TRANSACTION.used_type
  is '使用性质';
comment on column PER_VEHICLE_TRANSACTION.vehicle_status
  is '车辆状态';
comment on column PER_VEHICLE_TRANSACTION.mortgage_mark
  is '抵押标记';
comment on column PER_VEHICLE_TRANSACTION.update_time
  is '信息更新日期';

