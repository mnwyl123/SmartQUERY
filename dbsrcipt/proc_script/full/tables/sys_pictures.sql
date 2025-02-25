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
  is '图片信息表';
comment on column SYS_PICTURES.pictures_id
  is '图片ID ';
comment on column SYS_PICTURES.title
  is '标题';
comment on column SYS_PICTURES.name
  is '文件名';
comment on column SYS_PICTURES.path
  is '路径';
comment on column SYS_PICTURES.createtime
  is '创建时间';
comment on column SYS_PICTURES.master_id
  is '属于';
comment on column SYS_PICTURES.bz
  is '备注';

