create table SYS_ROLE
(
  role_id      VARCHAR2(32),
  role_name    VARCHAR2(50),
  role_name_en VARCHAR2(50),
  role_desc    VARCHAR2(100),
  company      VARCHAR2(32),
  isvalid      VARCHAR2(30)
)
;
comment on table SYS_ROLE
  is '��ɫ�����';
comment on column SYS_ROLE.role_id
  is '��ɫ����';
comment on column SYS_ROLE.role_name
  is '��ɫ����';
comment on column SYS_ROLE.role_desc
  is '��ɫ����';
comment on column SYS_ROLE.company
  is '���˴���';
comment on column SYS_ROLE.isvalid
  is '�Ƿ���Ч';

