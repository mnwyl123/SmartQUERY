create table SYS_PICTURES
(
  pictures_id VARCHAR2(100),
  title       VARCHAR2(255),
  name        VARCHAR2(255),
  path        VARCHAR2(255),
  createtime  VARCHAR2(100),
  master_id   VARCHAR2(255),
  bz          VARCHAR2(255)
)
;
comment on table SYS_PICTURES
  is 'ͼƬ��Ϣ��';
comment on column SYS_PICTURES.pictures_id
  is 'ͼƬID ';
comment on column SYS_PICTURES.title
  is '����';
comment on column SYS_PICTURES.name
  is '�ļ���';
comment on column SYS_PICTURES.path
  is '·��';
comment on column SYS_PICTURES.createtime
  is '����ʱ��';
comment on column SYS_PICTURES.master_id
  is '����';
comment on column SYS_PICTURES.bz
  is '��ע';

