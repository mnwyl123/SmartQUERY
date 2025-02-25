create table CIFM_MATERIAL_CHANGE
(
  id               VARCHAR2(64) not null,
  check_sys_id     VARCHAR2(32) not null,
  user_sys_id      VARCHAR2(32) not null,
  status           VARCHAR2(255) not null,
  client_name      VARCHAR2(50) not null,
  credentials_type VARCHAR2(50) not null,
  credentials_no   VARCHAR2(50) not null,
  fileaddress      VARCHAR2(255) not null,
  edit_reason      VARCHAR2(255) not null,
  client_type      VARCHAR2(255) not null,
  audit_opinion    VARCHAR2(255),
  application_time VARCHAR2(30),
  check_time       VARCHAR2(30)
)
;
comment on column CIFM_MATERIAL_CHANGE.id
  is '查询编号';
comment on column CIFM_MATERIAL_CHANGE.check_sys_id
  is '审核人系统ID';
comment on column CIFM_MATERIAL_CHANGE.user_sys_id
  is '用户系统ID';
comment on column CIFM_MATERIAL_CHANGE.status
  is '状态(00:待审核01:同意02:不同意)';
comment on column CIFM_MATERIAL_CHANGE.client_name
  is '姓名';
comment on column CIFM_MATERIAL_CHANGE.credentials_type
  is '证件类型';
comment on column CIFM_MATERIAL_CHANGE.credentials_no
  is '证件号码';
comment on column CIFM_MATERIAL_CHANGE.fileaddress
  is '文件夹的地址';
comment on column CIFM_MATERIAL_CHANGE.edit_reason
  is '变更原因';
comment on column CIFM_MATERIAL_CHANGE.client_type
  is '客户类型';
comment on column CIFM_MATERIAL_CHANGE.audit_opinion
  is '审核意见';

