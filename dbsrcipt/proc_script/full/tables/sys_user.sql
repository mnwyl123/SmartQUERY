create table SYS_USER
(
  user_id              VARCHAR2(100),
  username             VARCHAR2(255),
  password             VARCHAR2(255),
  name                 VARCHAR2(255),
  last_login           VARCHAR2(255),
  ip                   VARCHAR2(100),
  skin                 VARCHAR2(100),
  email                VARCHAR2(32),
  teller_number        VARCHAR2(100),
  phone                VARCHAR2(32),
  pwd_alter_time       VARCHAR2(20),
  dept_code            VARCHAR2(32),
  state                VARCHAR2(2),
  err_times            INTEGER,
  lock_status          VARCHAR2(2),
  company              VARCHAR2(10),
  department           VARCHAR2(20),
  mac                  VARCHAR2(32),
  username_perbank     VARCHAR2(255),
  username_perbank_org VARCHAR2(255),
  is_online_user       VARCHAR2(255),
  update_time          DATE,
  channel_id           VARCHAR2(20),
  lock_reason          VARCHAR2(200)
)
;
comment on table SYS_USER
  is '�û��� ';
comment on column SYS_USER.user_id
  is '�û�����';
comment on column SYS_USER.username
  is '��¼����';
comment on column SYS_USER.password
  is '����';
comment on column SYS_USER.name
  is '�û�����';
comment on column SYS_USER.last_login
  is '�����¼ʱ��';
comment on column SYS_USER.ip
  is '��¼ip';
comment on column SYS_USER.skin
  is 'Ƥ��';
comment on column SYS_USER.email
  is 'email';
comment on column SYS_USER.teller_number
  is '��Ա��';
comment on column SYS_USER.phone
  is '�绰����';
comment on column SYS_USER.pwd_alter_time
  is '�����޸�����';
comment on column SYS_USER.dept_code
  is '���ű���';
comment on column SYS_USER.state
  is '��Ч״̬';
comment on column SYS_USER.err_times
  is '�������';
comment on column SYS_USER.lock_status
  is '�û�״̬:0-��Ч��1-������2-˯�߻���3-����';
comment on column SYS_USER.company
  is '���˱���';
comment on column SYS_USER.mac
  is 'MAC';
comment on column SYS_USER.username_perbank
  is '���е�¼�˺�(����)';
comment on column SYS_USER.username_perbank_org
  is '���е�¼�˺�(��ҵ)';
comment on column SYS_USER.is_online_user
  is '�����ϲ�ѯ�û�(0:��,1:��)';
comment on column SYS_USER.update_time
  is '�û��޸�ʱ��';
comment on column SYS_USER.channel_id
  is '�������';
comment on column SYS_USER.lock_reason
  is '�û�������ԭ��';
