create table CIFM_HOLIDAY
(
  date_param DATE,
  is_holiday NUMBER(1) default 0,
  company    VARCHAR2(10)
)
;
comment on table CIFM_HOLIDAY
  is '�ڼ��ղ�����';
comment on column CIFM_HOLIDAY.date_param
  is '����';
comment on column CIFM_HOLIDAY.is_holiday
  is '�Ƿ�ڼ���(0:��,1:��)';

