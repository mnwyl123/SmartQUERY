create table SYS_POSITION
(
  positi_id      VARCHAR2(32),
  positi_name    VARCHAR2(50),
  positi_name_en VARCHAR2(50),
  positi_desc    VARCHAR2(50)
)
;
comment on table SYS_POSITION
  is '�û�ְλ��';
comment on column SYS_POSITION.positi_id
  is 'ְλ����';
comment on column SYS_POSITION.positi_name
  is 'ְλ����';
comment on column SYS_POSITION.positi_desc
  is 'ְλ��������';

