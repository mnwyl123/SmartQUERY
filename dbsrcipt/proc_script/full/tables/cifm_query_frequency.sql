create table CIFM_QUERY_FREQUENCY
(
  username        VARCHAR2(20),
  query_min_count INTEGER,
  query_multiple  NUMBER,
  query_month     VARCHAR2(6),
  query_count     INTEGER,
  avg_query_count INTEGER,
  company         VARCHAR2(10),
  user_id         VARCHAR2(32),
  user_type       VARCHAR2(5)
)
;
comment on table CIFM_QUERY_FREQUENCY
  is '用户查询次数设置表';
comment on column CIFM_QUERY_FREQUENCY.username
  is '用户登录名';
comment on column CIFM_QUERY_FREQUENCY.query_min_count
  is '平均查询笔数下限值';
comment on column CIFM_QUERY_FREQUENCY.query_multiple
  is '查询激增预警倍数';
comment on column CIFM_QUERY_FREQUENCY.query_month
  is '当前月份';
comment on column CIFM_QUERY_FREQUENCY.query_count
  is '本月查询次数';
comment on column CIFM_QUERY_FREQUENCY.avg_query_count
  is '前三个月查询平均次数';
comment on column CIFM_QUERY_FREQUENCY.company
  is '法人编码';
comment on column CIFM_QUERY_FREQUENCY.user_id
  is '用户ID';
comment on column CIFM_QUERY_FREQUENCY.user_type
  is '用户类型(1:个人，2:企业)';

