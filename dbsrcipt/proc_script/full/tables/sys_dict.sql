create table SYS_DICT
(
  dic_code         VARCHAR2(50) not null,
  dic_des          VARCHAR2(100),
  dic_type         VARCHAR2(1),
  dic_tblname      VARCHAR2(30),
  dic_id_colname   VARCHAR2(30),
  dic_idvalue      VARCHAR2(35),
  dic_val_colname  VARCHAR2(30),
  dic_des_colname  VARCHAR2(30),
  remark           VARCHAR2(100),
  dic_sort_colname VARCHAR2(30),
  dic_dynamic_sign VARCHAR2(1)
)
;
comment on table SYS_DICT
  is '系统字典表';
comment on column SYS_DICT.dic_code
  is '字典编码';
comment on column SYS_DICT.dic_des
  is '字典名称';
comment on column SYS_DICT.dic_type
  is '字典类型,0-独立表作为字典;1-字典来源于共同表中定义的特定数据';
comment on column SYS_DICT.dic_tblname
  is '字典来源表';
comment on column SYS_DICT.dic_id_colname
  is '字典对应的过滤条件列';
comment on column SYS_DICT.dic_idvalue
  is '字典列对应的过滤条件列取值';
comment on column SYS_DICT.dic_val_colname
  is '字典列对应的取值列';
comment on column SYS_DICT.dic_des_colname
  is '字典列对应的描述列';
comment on column SYS_DICT.remark
  is '备注';
comment on column SYS_DICT.dic_sort_colname
  is '排序字段';
comment on column SYS_DICT.dic_dynamic_sign
  is '是否动态获取，默认为0。0-非动态获取；1-动态获取；';

