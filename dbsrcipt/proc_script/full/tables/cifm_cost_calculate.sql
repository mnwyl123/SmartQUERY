create table CIFM_COST_CALCULATE
(
  data_date VARCHAR2(15),
  cost_type NUMBER(1),
  cost      NUMBER(10),
  company   VARCHAR2(10)
)
;
comment on table CIFM_COST_CALCULATE
  is '费用计算';
comment on column CIFM_COST_CALCULATE.data_date
  is '数据日期';
comment on column CIFM_COST_CALCULATE.cost_type
  is '费用类型（1：个人，2：企业）';
comment on column CIFM_COST_CALCULATE.cost
  is '单笔费用';

