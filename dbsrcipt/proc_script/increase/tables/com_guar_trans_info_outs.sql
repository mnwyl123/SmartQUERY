create table COM_GUAR_TRANS_INFO_OUTS
(
  report_id          VARCHAR2(30) not null,
  asset_quality_clas VARCHAR2(100),
  num_account        VARCHAR2(100),
  balance_num        VARCHAR2(100),
  buss_type          VARCHAR2(100)
)
;
comment on table COM_GUAR_TRANS_INFO_OUTS
  is 'δ���嵣�����׻�����Ϣ';
comment on column COM_GUAR_TRANS_INFO_OUTS.report_id
  is '������';
comment on column COM_GUAR_TRANS_INFO_OUTS.asset_quality_clas
  is '�ʲ���������';
comment on column COM_GUAR_TRANS_INFO_OUTS.num_account
  is '�˻��� ';
comment on column COM_GUAR_TRANS_INFO_OUTS.balance_num
  is '���';
comment on column COM_GUAR_TRANS_INFO_OUTS.buss_type
  is 'ҵ������';

