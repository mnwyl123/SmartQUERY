create table PER_LOW_SECURITY
(
  report_id        VARCHAR2(30) not null,
  serial           VARCHAR2(10),
  personnel_type   VARCHAR2(30),
  location         VARCHAR2(30),
  company          VARCHAR2(200),
  house_mon_income VARCHAR2(20),
  apply_date       VARCHAR2(20),
  approval_date    VARCHAR2(20),
  update_time      VARCHAR2(20),
  label_cnt        VARCHAR2(100),
  personnel_type2  VARCHAR2(30)
)
;
comment on table PER_LOW_SECURITY
  is '�ͱ�������Ϣ��¼��Ϣ��';
comment on column PER_LOW_SECURITY.report_id
  is '������';
comment on column PER_LOW_SECURITY.serial
  is '���';
comment on column PER_LOW_SECURITY.personnel_type
  is '��Ա���';
comment on column PER_LOW_SECURITY.location
  is '���ڵ�';
comment on column PER_LOW_SECURITY.company
  is '������λ';
comment on column PER_LOW_SECURITY.house_mon_income
  is '��ͥ������';
comment on column PER_LOW_SECURITY.apply_date
  is '��������';
comment on column PER_LOW_SECURITY.approval_date
  is '��׼����';
comment on column PER_LOW_SECURITY.update_time
  is '��Ϣ��������';
comment on column PER_LOW_SECURITY.label_cnt
  is '��ע����������';
comment on column PER_LOW_SECURITY.personnel_type2
  is '��Ա���2';

