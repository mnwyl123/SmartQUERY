create table SYS_COMPANY
(
  comp_code  VARCHAR2(10) not null,
  comp_short VARCHAR2(20),
  comp_name  VARCHAR2(50),
  user_code  VARCHAR2(20),
  logo_path  VARCHAR2(100)
)
;
comment on table SYS_COMPANY
  is '���˻�����';
comment on column SYS_COMPANY.comp_code
  is '���˴���';
comment on column SYS_COMPANY.comp_short
  is '���˼��';
comment on column SYS_COMPANY.comp_name
  is '��������';
comment on column SYS_COMPANY.user_code
  is '���˹���Ա';
comment on column SYS_COMPANY.logo_path
  is '����logo';
alter table SYS_COMPANY
  add primary key (COMP_CODE);

