create table COM_PATENT_CASE
(
  report_id      VARCHAR2(30) not null,
  patent_name    VARCHAR2(200),
  patent_no      VARCHAR2(100),
  app_date       VARCHAR2(20),
  grant_date     VARCHAR2(20),
  effective_year VARCHAR2(20),
  info_id        VARCHAR2(100)
)
;
comment on table COM_PATENT_CASE
  is 'ӵ��ר�������Ϣ��Ԫ';
comment on column COM_PATENT_CASE.report_id
  is '������';
comment on column COM_PATENT_CASE.patent_name
  is 'ר������';
comment on column COM_PATENT_CASE.patent_no
  is 'ר����';
comment on column COM_PATENT_CASE.app_date
  is '��������';
comment on column COM_PATENT_CASE.grant_date
  is '��������';
comment on column COM_PATENT_CASE.effective_year
  is 'ר����Ч��';
comment on column COM_PATENT_CASE.info_id
  is '��Ϣ���';

