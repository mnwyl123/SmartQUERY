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
  is '机器变更审核';
comment on column CIFM_MACHE_CHANGE_HISTORY.user_id
  is '用户ID';
comment on column CIFM_MACHE_CHANGE_HISTORY.username
  is '用户登录名';
comment on column CIFM_MACHE_CHANGE_HISTORY.company
  is '法人编码';
comment on column CIFM_MACHE_CHANGE_HISTORY.old_mac
  is '变更前MAC';
comment on column CIFM_MACHE_CHANGE_HISTORY.old_ip
  is '变更前IP';
comment on column CIFM_MACHE_CHANGE_HISTORY.new_mac
  is '变更后MAC';
comment on column CIFM_MACHE_CHANGE_HISTORY.new_ip
  is '变更后IP';
comment on column CIFM_MACHE_CHANGE_HISTORY.update_time
  is '审核时间';
comment on column CIFM_MACHE_CHANGE_HISTORY.status
  is '审核状态';
comment on column CIFM_MACHE_CHANGE_HISTORY.audit_opinion
  is '审核意见';

