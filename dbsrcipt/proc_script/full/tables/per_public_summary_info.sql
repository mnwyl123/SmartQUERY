create table PER_PUBLIC_SUMMARY_INFO
(
  report_id        VARCHAR2(30) not null,
  public_info_type VARCHAR2(100),
  record_num       VARCHAR2(100),
  involve_sum      VARCHAR2(100)
)
;
comment on table PER_PUBLIC_SUMMARY_INFO
  is '������Ϣ��Ҫ��Ϣ';
comment on column PER_PUBLIC_SUMMARY_INFO.report_id
  is '������';
comment on column PER_PUBLIC_SUMMARY_INFO.public_info_type
  is '������Ϣ����';
comment on column PER_PUBLIC_SUMMARY_INFO.record_num
  is '��¼��';
comment on column PER_PUBLIC_SUMMARY_INFO.involve_sum
  is '�漰���';

