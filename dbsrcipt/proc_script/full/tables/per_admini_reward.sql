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
  is '����������¼��Ϣ��';
comment on column PER_ADMINI_REWARD.report_id
  is '������';
comment on column PER_ADMINI_REWARD.serial
  is '���';
comment on column PER_ADMINI_REWARD.reward_company
  is '��������';
comment on column PER_ADMINI_REWARD.reward_contents
  is '��������';
comment on column PER_ADMINI_REWARD.reward_effective_date
  is '��Ч����';
comment on column PER_ADMINI_REWARD.stop_date
  is '��ֹ����';
comment on column PER_ADMINI_REWARD.label_cnt
  is '��ע����������';

