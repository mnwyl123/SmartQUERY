create table PER_CAREER
(
  report_id       VARCHAR2(30) not null,
  serial          VARCHAR2(10),
  company_name    VARCHAR2(300),
  company_address VARCHAR2(300),
  career          VARCHAR2(50),
  industry        VARCHAR2(50),
  duties          VARCHAR2(150),
  job_title       VARCHAR2(100),
  enter_year      VARCHAR2(10),
  update_time     VARCHAR2(20),
  work_status     VARCHAR2(100),
  company_tel     VARCHAR2(100),
  company_nature  VARCHAR2(100),
  duties2         VARCHAR2(100),
  industry2       VARCHAR2(50),
  job_title2      VARCHAR2(100),
  career2         VARCHAR2(50)
)
;
comment on table PER_CAREER
  is 'ְҵ��Ϣ��';
comment on column PER_CAREER.report_id
  is '������';
comment on column PER_CAREER.serial
  is '���';
comment on column PER_CAREER.company_name
  is '������λ';
comment on column PER_CAREER.company_address
  is '��λ��ַ';
comment on column PER_CAREER.career
  is 'ְҵ';
comment on column PER_CAREER.industry
  is '��ҵ';
comment on column PER_CAREER.duties
  is 'ְ��';
comment on column PER_CAREER.job_title
  is 'ְ��';
comment on column PER_CAREER.enter_year
  is '���뱾��λ���';
comment on column PER_CAREER.update_time
  is '��Ϣ��������';
comment on column PER_CAREER.work_status
  is '��ҵ״��';
comment on column PER_CAREER.company_tel
  is '��λ�绰';
comment on column PER_CAREER.company_nature
  is '��λ����';
comment on column PER_CAREER.duties2
  is 'ְ��2';
comment on column PER_CAREER.industry2
  is '��ҵ2';
comment on column PER_CAREER.job_title2
  is 'ְ��2';

