create table COM_OBTAIN_CERTIFI
(
  report_id       VARCHAR2(30) not null,
  certifi_type    VARCHAR2(100),
  content_certifi VARCHAR2(200),
  certifi_id      VARCHAR2(100),
  certifi_date    VARCHAR2(100),
  date_end        VARCHAR2(100),
  certifi_name    VARCHAR2(100)
)
;
comment on table COM_OBTAIN_CERTIFI
  is '�����֤��¼��Ϣ��Ԫ';
comment on column COM_OBTAIN_CERTIFI.report_id
  is '������';
comment on column COM_OBTAIN_CERTIFI.certifi_type
  is '��֤����';
comment on column COM_OBTAIN_CERTIFI.content_certifi
  is '��֤����';
comment on column COM_OBTAIN_CERTIFI.certifi_id
  is '��֤��¼���';
comment on column COM_OBTAIN_CERTIFI.certifi_date
  is '��֤����';
comment on column COM_OBTAIN_CERTIFI.date_end
  is '��ֹ����';
comment on column COM_OBTAIN_CERTIFI.certifi_name
  is '��֤��������';

