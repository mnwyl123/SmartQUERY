create table COM_GUAR_TRANS_INFO_SET
(
  report_id         VARCHAR2(30) not null,
  asset_quality_cla VARCHAR2(100),
  buss_type         VARCHAR2(100),
  num_account       VARCHAR2(100)
)
;
comment on table COM_GUAR_TRANS_INFO_SET
  is '�ѽ��嵣�����׻�����Ϣ';
comment on column COM_GUAR_TRANS_INFO_SET.report_id
  is '������';
comment on column COM_GUAR_TRANS_INFO_SET.asset_quality_cla
  is '�ʲ���������';
comment on column COM_GUAR_TRANS_INFO_SET.buss_type
  is 'ҵ������';
comment on column COM_GUAR_TRANS_INFO_SET.num_account
  is '�˻��� ';

