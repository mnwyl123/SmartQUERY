create table SYS_INFO
(
  sys_no     VARCHAR2(3),
  sys_status VARCHAR2(3),
  sys_name   VARCHAR2(20)
)
;
comment on table SYS_INFO
  is 'ϵͳ��Ϣ��';
comment on column SYS_INFO.sys_no
  is 'ϵͳ���';
comment on column SYS_INFO.sys_status
  is 'ϵͳ״̬(0ά���У�1����)';
comment on column SYS_INFO.sys_name
  is 'ϵͳ����';

