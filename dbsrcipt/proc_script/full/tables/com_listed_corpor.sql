create table COM_LISTED_CORPOR
(
  report_id  VARCHAR2(30) not null,
  report_org VARCHAR2(100),
  matter     VARCHAR2(200),
  info_date  VARCHAR2(20)
)
;
comment on table COM_LISTED_CORPOR
  is '���й�˾��������';
comment on column COM_LISTED_CORPOR.report_id
  is '������';
comment on column COM_LISTED_CORPOR.report_org
  is '�ϱ�����';
comment on column COM_LISTED_CORPOR.matter
  is '��������';
comment on column COM_LISTED_CORPOR.info_date
  is '��Ϣ����';

