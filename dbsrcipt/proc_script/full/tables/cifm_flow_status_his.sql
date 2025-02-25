create table CIFM_FLOW_STATUS_HIS
(
  id                 VARCHAR2(64) not null,
  user_sys_id        VARCHAR2(32),
  application_time   DATE,
  query_time         DATE,
  check_sys_id       VARCHAR2(32),
  check_time         DATE,
  status             VARCHAR2(2),
  ip                 VARCHAR2(16),
  mac                VARCHAR2(64),
  annex              VARCHAR2(2),
  last_change_time   DATE,
  internal           VARCHAR2(64),
  report_id          VARCHAR2(64),
  check_reject_reson VARCHAR2(200),
  client_type        VARCHAR2(2),
  org_id             VARCHAR2(32),
  channel_id         VARCHAR2(20),
  is_wx_check        VARCHAR2(10),
  channel_query_no   VARCHAR2(100),
  send_status        VARCHAR2(2),
  is_print           VARCHAR2(10),
  reruns_time        INTEGER,
  resultcode         VARCHAR2(100),
  resultdesc         VARCHAR2(100),
  reportname         VARCHAR2(100)
);
comment on table CIFM_FLOW_STATUS_HIS
  is '流程状态历史表';
comment on column CIFM_FLOW_STATUS_HIS.id
  is '查询编号';
comment on column CIFM_FLOW_STATUS_HIS.user_sys_id
  is '用户系统ID';
comment on column CIFM_FLOW_STATUS_HIS.application_time
  is '申请时间';
comment on column CIFM_FLOW_STATUS_HIS.query_time
  is '查询时间';
comment on column CIFM_FLOW_STATUS_HIS.check_sys_id
  is '审核人系统ID';
comment on column CIFM_FLOW_STATUS_HIS.check_time
  is '审核时间';
comment on column CIFM_FLOW_STATUS_HIS.status
  is '01:待审核02:审核通过03:审核不通过04:人行查询失败05:未查得06:报告生成07用户名或密码错误09审核不通过12已丢弃';
comment on column CIFM_FLOW_STATUS_HIS.ip
  is 'IP';
comment on column CIFM_FLOW_STATUS_HIS.mac
  is 'mac';
comment on column CIFM_FLOW_STATUS_HIS.annex
  is '是否有附件资料(1:有2没有)';
comment on column CIFM_FLOW_STATUS_HIS.last_change_time
  is '最后变更时间';
comment on column CIFM_FLOW_STATUS_HIS.internal
  is '行内查询(1:行内查询2:人行查询3:本人查询)';
comment on column CIFM_FLOW_STATUS_HIS.report_id
  is '报告编号';
comment on column CIFM_FLOW_STATUS_HIS.check_reject_reson
  is '审核不通过原因';
comment on column CIFM_FLOW_STATUS_HIS.client_type
  is '客户类型(1:个人2:企业)';
comment on column CIFM_FLOW_STATUS_HIS.org_id
  is '系统机构ID';
comment on column CIFM_FLOW_STATUS_HIS.channel_id
  is '渠道编号（01:前置系统页面，02:信用卡中心，03:360）';
comment on column CIFM_FLOW_STATUS_HIS.is_wx_check
  is '是否企业微信审核';
comment on column CIFM_FLOW_STATUS_HIS.channel_query_no
  is '渠道流水号';
comment on column CIFM_FLOW_STATUS_HIS.send_status
  is '报文发送状态（0：失败，1：成功)';
comment on column CIFM_FLOW_STATUS_HIS.is_print
  is '是否打印(0：否，1：是)';
comment on column CIFM_FLOW_STATUS_HIS.resultcode
  is '查询结果代码';
comment on column CIFM_FLOW_STATUS_HIS.resultdesc
  is '查询结果描述';
comment on column CIFM_FLOW_STATUS_HIS.reportname
  is '信用报告文件名称';

