create table COM_SENIOR_MANAGER_INFO
(
  report_id         VARCHAR2(30) not null,
  senior_duties     VARCHAR2(200),
  senior_name       VARCHAR2(300),
  sneior_cred_type  VARCHAR2(100),
  sneior_cred_num   VARCHAR2(200),
  sneior_cred_type2 VARCHAR2(100),
  senior_duties2    VARCHAR2(200)
)
;
comment on table COM_SENIOR_MANAGER_INFO
  is '��Ҫ�����Ա��Ϣ';
comment on column COM_SENIOR_MANAGER_INFO.report_id
  is '������';
comment on column COM_SENIOR_MANAGER_INFO.senior_duties
  is 'ְλ';
comment on column COM_SENIOR_MANAGER_INFO.senior_name
  is '����';
comment on column COM_SENIOR_MANAGER_INFO.sneior_cred_type
  is '֤������';
comment on column COM_SENIOR_MANAGER_INFO.sneior_cred_num
  is '֤������';
comment on column COM_SENIOR_MANAGER_INFO.sneior_cred_type2
  is '֤������2';

