create table CIFM_COST_CALCULATE
(
  data_date VARCHAR2(15),
  cost_type NUMBER(1),
  cost      NUMBER(10),
  company   VARCHAR2(10)
)
;
comment on table CIFM_COST_CALCULATE
  is '���ü���';
comment on column CIFM_COST_CALCULATE.data_date
  is '��������';
comment on column CIFM_COST_CALCULATE.cost_type
  is '�������ͣ�1�����ˣ�2����ҵ��';
comment on column CIFM_COST_CALCULATE.cost
  is '���ʷ���';

