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
  is '����״̬��ʷ��';
comment on column CIFM_FLOW_STATUS_HIS.id
  is '��ѯ���';
comment on column CIFM_FLOW_STATUS_HIS.user_sys_id
  is '�û�ϵͳID';
comment on column CIFM_FLOW_STATUS_HIS.application_time
  is '����ʱ��';
comment on column CIFM_FLOW_STATUS_HIS.query_time
  is '��ѯʱ��';
comment on column CIFM_FLOW_STATUS_HIS.check_sys_id
  is '�����ϵͳID';
comment on column CIFM_FLOW_STATUS_HIS.check_time
  is '���ʱ��';
comment on column CIFM_FLOW_STATUS_HIS.status
  is '01:�����02:���ͨ��03:��˲�ͨ��04:���в�ѯʧ��05:δ���06:��������07�û������������09��˲�ͨ��12�Ѷ���';
comment on column CIFM_FLOW_STATUS_HIS.ip
  is 'IP';
comment on column CIFM_FLOW_STATUS_HIS.mac
  is 'mac';
comment on column CIFM_FLOW_STATUS_HIS.annex
  is '�Ƿ��и�������(1:��2û��)';
comment on column CIFM_FLOW_STATUS_HIS.last_change_time
  is '�����ʱ��';
comment on column CIFM_FLOW_STATUS_HIS.internal
  is '���ڲ�ѯ(1:���ڲ�ѯ2:���в�ѯ3:���˲�ѯ)';
comment on column CIFM_FLOW_STATUS_HIS.report_id
  is '������';
comment on column CIFM_FLOW_STATUS_HIS.check_reject_reson
  is '��˲�ͨ��ԭ��';
comment on column CIFM_FLOW_STATUS_HIS.client_type
  is '�ͻ�����(1:����2:��ҵ)';
comment on column CIFM_FLOW_STATUS_HIS.org_id
  is 'ϵͳ����ID';
comment on column CIFM_FLOW_STATUS_HIS.channel_id
  is '������ţ�01:ǰ��ϵͳҳ�棬02:���ÿ����ģ�03:360��';
comment on column CIFM_FLOW_STATUS_HIS.is_wx_check
  is '�Ƿ���ҵ΢�����';
comment on column CIFM_FLOW_STATUS_HIS.channel_query_no
  is '������ˮ��';
comment on column CIFM_FLOW_STATUS_HIS.send_status
  is '���ķ���״̬��0��ʧ�ܣ�1���ɹ�)';
comment on column CIFM_FLOW_STATUS_HIS.is_print
  is '�Ƿ��ӡ(0����1����)';
comment on column CIFM_FLOW_STATUS_HIS.resultcode
  is '��ѯ�������';
comment on column CIFM_FLOW_STATUS_HIS.resultdesc
  is '��ѯ�������';
comment on column CIFM_FLOW_STATUS_HIS.reportname
  is '���ñ����ļ�����';

