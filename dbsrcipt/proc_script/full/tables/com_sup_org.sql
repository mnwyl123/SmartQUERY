create table COM_SUP_ORG
(
  report_id            VARCHAR2(30) not null,
  hight_num            VARCHAR2(100),
  hight_insti_type     VARCHAR2(100),
  hight_insti_name     VARCHAR2(100),
  hight_inti_idet_type VARCHAR2(100),
  date_update_hight    VARCHAR2(100)
)
;
comment on table COM_SUP_ORG
  is '�ϼ�������Ϣ��Ԫ';
comment on column COM_SUP_ORG.report_id
  is '������';
comment on column COM_SUP_ORG.hight_num
  is '�ϼ�������ݱ�ʶ����';
comment on column COM_SUP_ORG.hight_insti_type
  is '�ϼ���������';
comment on column COM_SUP_ORG.hight_insti_name
  is '�ϼ���������';
comment on column COM_SUP_ORG.hight_inti_idet_type
  is '�ϼ�������ݱ�ʶ����';
comment on column COM_SUP_ORG.date_update_hight
  is '��������';

