create table COM_OBTAIN_QUAL
(
  report_id    VARCHAR2(30) not null,
  app_date     VARCHAR2(100),
  content_qual VARCHAR2(200),
  qual_id      VARCHAR2(100),
  qual_type    VARCHAR2(100),
  qual_name    VARCHAR2(100),
  date_end     VARCHAR2(100)
)
;
comment on table COM_OBTAIN_QUAL
  is '������ʼ�¼��Ϣ��Ԫ';
comment on column COM_OBTAIN_QUAL.report_id
  is '������';
comment on column COM_OBTAIN_QUAL.app_date
  is '��׼����';
comment on column COM_OBTAIN_QUAL.content_qual
  is '��������';
comment on column COM_OBTAIN_QUAL.qual_id
  is '���ʼ�¼���';
comment on column COM_OBTAIN_QUAL.qual_type
  is '��������';
comment on column COM_OBTAIN_QUAL.qual_name
  is '�϶���������';
comment on column COM_OBTAIN_QUAL.date_end
  is '��ֹ����';

