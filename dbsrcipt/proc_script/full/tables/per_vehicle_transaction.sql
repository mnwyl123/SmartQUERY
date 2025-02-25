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
  is '�������׺͵�Ѻ��¼';
comment on column PER_VEHICLE_TRANSACTION.report_id
  is '������';
comment on column PER_VEHICLE_TRANSACTION.serial
  is '���';
comment on column PER_VEHICLE_TRANSACTION.plate_num
  is '���ƺ���';
comment on column PER_VEHICLE_TRANSACTION.engine_num
  is '��������';
comment on column PER_VEHICLE_TRANSACTION.brand
  is 'Ʒ��';
comment on column PER_VEHICLE_TRANSACTION.vehicle_type
  is '��������';
comment on column PER_VEHICLE_TRANSACTION.used_type
  is 'ʹ������';
comment on column PER_VEHICLE_TRANSACTION.vehicle_status
  is '����״̬';
comment on column PER_VEHICLE_TRANSACTION.mortgage_mark
  is '��Ѻ���';
comment on column PER_VEHICLE_TRANSACTION.update_time
  is '��Ϣ��������';

