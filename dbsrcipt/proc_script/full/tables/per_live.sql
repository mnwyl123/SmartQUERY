create table PER_LIVE
(
  report_id              VARCHAR2(30) not null,
  serial                 VARCHAR2(10),
  residential_address    VARCHAR2(300),
  residential_condition  VARCHAR2(50),
  update_time            VARCHAR2(20),
  house_tel              VARCHAR2(100),
  residential_condition2 VARCHAR2(50)
)
;
comment on table PER_LIVE
  is '��ס��Ϣ��';
comment on column PER_LIVE.report_id
  is '������';
comment on column PER_LIVE.serial
  is '���';
comment on column PER_LIVE.residential_address
  is '��ס��ַ';
comment on column PER_LIVE.residential_condition
  is '��ס״��';
comment on column PER_LIVE.update_time
  is '��Ϣ��������';
comment on column PER_LIVE.house_tel
  is 'סլ�绰';

