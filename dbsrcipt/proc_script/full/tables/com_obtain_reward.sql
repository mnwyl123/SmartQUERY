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
  is '��ý�����¼��Ϣ��Ԫ';
comment on column COM_OBTAIN_REWARD.report_id
  is '������';
comment on column COM_OBTAIN_REWARD.content_reward
  is '������ʵ';
comment on column COM_OBTAIN_REWARD.reward_name
  is '��������';
comment on column COM_OBTAIN_REWARD.reward_id
  is '������¼���';
comment on column COM_OBTAIN_REWARD.reward_org_name
  is '������������';
comment on column COM_OBTAIN_REWARD.date_start
  is '��������';
comment on column COM_OBTAIN_REWARD.date_end
  is '��ֹ����';

