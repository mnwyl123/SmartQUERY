create table COM_LEND_TRANS_SE_TYPE
(
  report_id                    VARCHAR2(30) not null,
  asset_quality_classification VARCHAR2(100),
  buss_type                    VARCHAR2(100),
  num_account                  VARCHAR2(100)
)
;
comment on table COM_LEND_TRANS_SE_TYPE
  is '�ѽ�������������׷��������Ϣ';
comment on column COM_LEND_TRANS_SE_TYPE.report_id
  is '������';
comment on column COM_LEND_TRANS_SE_TYPE.asset_quality_classification
  is '�ʲ���������';
comment on column COM_LEND_TRANS_SE_TYPE.buss_type
  is 'ҵ������';
comment on column COM_LEND_TRANS_SE_TYPE.num_account
  is '�˻��� ';

