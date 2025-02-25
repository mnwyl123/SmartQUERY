create table COM_EXTER_GUAR
(
  report_id       VARCHAR2(30) not null,
  serial_no       VARCHAR2(64),
  main_buss_type  VARCHAR2(10),
  currency        VARCHAR2(20),
  guar_sum        VARCHAR2(20),
  guar_balance    VARCHAR2(20),
  start_date      VARCHAR2(20),
  end_date        VARCHAR2(20),
  minor_buss_type VARCHAR2(100),
  five_type       VARCHAR2(20),
  contract_valid  VARCHAR2(15),
  main_buss_type2 VARCHAR2(10)
)
;
comment on table COM_EXTER_GUAR
  is '���ⵣ��';
comment on column COM_EXTER_GUAR.report_id
  is '������';
comment on column COM_EXTER_GUAR.serial_no
  is '��ˮ��';
comment on column COM_EXTER_GUAR.main_buss_type
  is '��ҵ������(01������,02�������,03��ó������,04������,05��Ʊ������,06������,07������֤,08������)';
comment on column COM_EXTER_GUAR.currency
  is '����';
comment on column COM_EXTER_GUAR.guar_sum
  is '���';
comment on column COM_EXTER_GUAR.guar_balance
  is '���';
comment on column COM_EXTER_GUAR.start_date
  is '��ʼ����';
comment on column COM_EXTER_GUAR.end_date
  is '��������';
comment on column COM_EXTER_GUAR.minor_buss_type
  is '�μ�ҵ������';
comment on column COM_EXTER_GUAR.five_type
  is '�弶����';
comment on column COM_EXTER_GUAR.contract_valid
  is '��ͬ�Ƿ���Ч';

