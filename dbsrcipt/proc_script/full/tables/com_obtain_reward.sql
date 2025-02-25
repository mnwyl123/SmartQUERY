create table COM_OBTAIN_REWARD
(
  report_id       VARCHAR2(30) not null,
  content_reward  VARCHAR2(200),
  reward_name     VARCHAR2(100),
  reward_id       VARCHAR2(100),
  reward_org_name VARCHAR2(100),
  date_start      VARCHAR2(100),
  date_end        VARCHAR2(100)
)
;
comment on table COM_OBTAIN_REWARD
  is '获得奖励记录信息单元';
comment on column COM_OBTAIN_REWARD.report_id
  is '报告编号';
comment on column COM_OBTAIN_REWARD.content_reward
  is '奖励事实';
comment on column COM_OBTAIN_REWARD.reward_name
  is '奖励名称';
comment on column COM_OBTAIN_REWARD.reward_id
  is '奖励记录编号';
comment on column COM_OBTAIN_REWARD.reward_org_name
  is '奖励部门名称';
comment on column COM_OBTAIN_REWARD.date_start
  is '授予日期';
comment on column COM_OBTAIN_REWARD.date_end
  is '截止日期';

