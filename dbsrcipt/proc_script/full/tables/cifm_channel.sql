create table CIFM_CHANNEL
(
  channel_id      VARCHAR2(20) not null,
  channel_des     VARCHAR2(100),
  channel_status  VARCHAR2(10),
  channel_contact VARCHAR2(50),
  company         VARCHAR2(10)
)
;
comment on table CIFM_CHANNEL
  is '渠道信息表';
comment on column CIFM_CHANNEL.channel_id
  is '渠道编号';
comment on column CIFM_CHANNEL.channel_des
  is '渠道描述';
comment on column CIFM_CHANNEL.channel_status
  is '渠道状态(0正常，1停用)';
comment on column CIFM_CHANNEL.channel_contact
  is '联系人';

