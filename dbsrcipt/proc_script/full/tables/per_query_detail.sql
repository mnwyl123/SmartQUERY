create table PER_QUERY_DETAIL
(
  report_id         VARCHAR2(30) not null,
  serial            VARCHAR2(10),
  cr_query_time     VARCHAR2(20),
  cr_query_operator VARCHAR2(50),
  cr_query_reason   VARCHAR2(50),
  query_org_type    VARCHAR2(100),
  query_org_code    VARCHAR2(100),
  query_reason      VARCHAR2(100),
  query_time        VARCHAR2(100)
)
;
comment on table PER_QUERY_DETAIL
  is '��ѯ��¼��Ϣ��Ԫ';
comment on column PER_QUERY_DETAIL.report_id
  is '������';
comment on column PER_QUERY_DETAIL.serial
  is '���';
comment on column PER_QUERY_DETAIL.cr_query_time
  is '��ѯʱ��';
comment on column PER_QUERY_DETAIL.cr_query_operator
  is '����Ա';
comment on column PER_QUERY_DETAIL.cr_query_reason
  is '��ѯԭ��';
comment on column PER_QUERY_DETAIL.query_org_type
  is '��ѯ��������';
comment on column PER_QUERY_DETAIL.query_org_code
  is '��ѯ����';
comment on column PER_QUERY_DETAIL.query_reason
  is '��ѯԭ��';
comment on column PER_QUERY_DETAIL.query_time
  is '��ѯ����';

