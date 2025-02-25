create table SYS_PASSWORD
(
  initial_password       VARCHAR2(50),
  max_error_logon        INTEGER,
  effect_days            INTEGER,
  min_length             INTEGER,
  max_length             INTEGER,
  repeat_num             INTEGER,
  modified_restrict_time INTEGER,
  encrypt_type           VARCHAR2(20),
  password_rule          VARCHAR2(50),
  password_rule_desc     VARCHAR2(100)
)
;
comment on table SYS_PASSWORD
  is '���������';
comment on column SYS_PASSWORD.initial_password
  is '��ʼ��������';
comment on column SYS_PASSWORD.max_error_logon
  is 'ÿ������������';
comment on column SYS_PASSWORD.effect_days
  is '�����������';
comment on column SYS_PASSWORD.min_length
  is '������С����';
comment on column SYS_PASSWORD.max_length
  is '������󳤶�';
comment on column SYS_PASSWORD.repeat_num
  is '���벻���ظ�����';
comment on column SYS_PASSWORD.modified_restrict_time
  is '�ظ��޸�����ʱ��';
comment on column SYS_PASSWORD.encrypt_type
  is '������ܹ���Ĭ�ϲ���MD5';
comment on column SYS_PASSWORD.password_rule
  is '����У����򣬲���������ʽ����ʽ�洢������У��';
comment on column SYS_PASSWORD.password_rule_desc
  is '����У���������';

