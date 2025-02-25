create table PER_QUALIFICATION
(
  report_id        VARCHAR2(30) not null,
  serial           VARCHAR2(10),
  qual_name        VARCHAR2(100),
  qual_level       VARCHAR2(200),
  qual_obtain_date VARCHAR2(20),
  maturity_date    VARCHAR2(20),
  revoke_date      VARCHAR2(20),
  issued_comapny   VARCHAR2(100),
  company_location VARCHAR2(100),
  label_cnt        VARCHAR2(100),
  qual_level2      VARCHAR2(200)
)
;
comment on table PER_QUALIFICATION
  is 'ִҵ�ʸ��¼��Ϣ��';
comment on column PER_QUALIFICATION.report_id
  is '������';
comment on column PER_QUALIFICATION.serial
  is '���';
comment on column PER_QUALIFICATION.qual_name
  is 'ִҵ�ʸ�����';
comment on column PER_QUALIFICATION.qual_level
  is '�ȼ�';
comment on column PER_QUALIFICATION.qual_obtain_date
  is '�������';
comment on column PER_QUALIFICATION.maturity_date
  is '��������';
comment on column PER_QUALIFICATION.revoke_date
  is '��������';
comment on column PER_QUALIFICATION.issued_comapny
  is '�䷢����';
comment on column PER_QUALIFICATION.company_location
  is '�������ڵ�';
comment on column PER_QUALIFICATION.label_cnt
  is '��ע����������';
comment on column PER_QUALIFICATION.qual_level2
  is '�ȼ�2';

