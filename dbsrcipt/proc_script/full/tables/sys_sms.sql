create table SYS_SMS
(
  sms_id        VARCHAR2(100) not null,
  content       VARCHAR2(1000),
  type          VARCHAR2(5),
  to_username   VARCHAR2(255),
  from_username VARCHAR2(255),
  send_time     VARCHAR2(100),
  status        VARCHAR2(5),
  sanme_id      VARCHAR2(100)
)
;
comment on table SYS_SMS
  is 'վ����';
comment on column SYS_SMS.sms_id
  is 'վ����ID';
comment on column SYS_SMS.content
  is 'վ��������';
comment on column SYS_SMS.type
  is 'վ��������';
comment on column SYS_SMS.to_username
  is '������';
comment on column SYS_SMS.from_username
  is '������';
comment on column SYS_SMS.send_time
  is '����ʱ��';
comment on column SYS_SMS.status
  is '״̬';

