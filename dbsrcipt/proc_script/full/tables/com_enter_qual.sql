create table COM_ENTER_QUAL
(
  report_id  VARCHAR2(30) not null,
  qual_type  VARCHAR2(5),
  grant_org  VARCHAR2(200),
  qual_name  VARCHAR2(200),
  grant_date VARCHAR2(20),
  end_date   VARCHAR2(20),
  content    VARCHAR2(200),
  qual_type2 VARCHAR2(5)
)
;
comment on table COM_ENTER_QUAL
  is '��ҵ����';
comment on column COM_ENTER_QUAL.report_id
  is '������';
comment on column COM_ENTER_QUAL.qual_type
  is '��������(01�����,02����֤,03������,04������)';
comment on column COM_ENTER_QUAL.grant_org
  is '���Ż���';
comment on column COM_ENTER_QUAL.qual_name
  is '��������';
comment on column COM_ENTER_QUAL.grant_date
  is '��������';
comment on column COM_ENTER_QUAL.end_date
  is '��ֹ����';
comment on column COM_ENTER_QUAL.content
  is '����';

