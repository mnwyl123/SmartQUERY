create table PER_OTHER_IDENTITY
(
  report_id        VARCHAR2(30) not null,
  credentials_type VARCHAR2(100),
  credentials_no   VARCHAR2(100)
)
;
comment on table PER_OTHER_IDENTITY
  is '������ݱ�ʶ��Ϣ��';
comment on column PER_OTHER_IDENTITY.report_id
  is '������';
comment on column PER_OTHER_IDENTITY.credentials_type
  is '֤������';
comment on column PER_OTHER_IDENTITY.credentials_no
  is '֤������';

