create table CIFM_HOLIDAY
(
  date_param DATE,
  is_holiday NUMBER(1) default 0,
  company    VARCHAR2(10)
)
;
comment on table CIFM_HOLIDAY
  is '节假日参数表';
comment on column CIFM_HOLIDAY.date_param
  is '日期';
comment on column CIFM_HOLIDAY.is_holiday
  is '是否节假日(0:否,1:是)';

