create table CIFM_MACHE_CHANGE_HISTORY
(
  user_id       VARCHAR2(32),
  username      VARCHAR2(20),
  company       VARCHAR2(10),
  old_mac       VARCHAR2(20),
  old_ip        VARCHAR2(30),
  new_mac       VARCHAR2(20),
  new_ip        VARCHAR2(30),
  update_time   VARCHAR2(30),
  status        VARCHAR2(10),
  audit_opinion VARCHAR2(200),
  id            VARCHAR2(32)
)
;
comment on table CIFM_MACHE_CHANGE_HISTORY
  is '����������';
comment on column CIFM_MACHE_CHANGE_HISTORY.user_id
  is '�û�ID';
comment on column CIFM_MACHE_CHANGE_HISTORY.username
  is '�û���¼��';
comment on column CIFM_MACHE_CHANGE_HISTORY.company
  is '���˱���';
comment on column CIFM_MACHE_CHANGE_HISTORY.old_mac
  is '���ǰMAC';
comment on column CIFM_MACHE_CHANGE_HISTORY.old_ip
  is '���ǰIP';
comment on column CIFM_MACHE_CHANGE_HISTORY.new_mac
  is '�����MAC';
comment on column CIFM_MACHE_CHANGE_HISTORY.new_ip
  is '�����IP';
comment on column CIFM_MACHE_CHANGE_HISTORY.update_time
  is '���ʱ��';
comment on column CIFM_MACHE_CHANGE_HISTORY.status
  is '���״̬';
comment on column CIFM_MACHE_CHANGE_HISTORY.audit_opinion
  is '������';

