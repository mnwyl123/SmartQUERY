create table PER_ADMINI_REWARD
(
  report_id             VARCHAR2(30) not null,
  serial                VARCHAR2(10),
  reward_company        VARCHAR2(200),
  reward_contents       VARCHAR2(200),
  reward_effective_date VARCHAR2(20),
  stop_date             VARCHAR2(20),
  label_cnt             VARCHAR2(100)
)
;
comment on table PER_ADMINI_REWARD
  is '行政奖励记录信息段';
comment on column PER_ADMINI_REWARD.report_id
  is '报告编号';
comment on column PER_ADMINI_REWARD.serial
  is '编号';
comment on column PER_ADMINI_REWARD.reward_company
  is '奖励机构';
comment on column PER_ADMINI_REWARD.reward_contents
  is '奖励内容';
comment on column PER_ADMINI_REWARD.reward_effective_date
  is '生效年月';
comment on column PER_ADMINI_REWARD.stop_date
  is '截止年月';
comment on column PER_ADMINI_REWARD.label_cnt
  is '标注及声明个数';

