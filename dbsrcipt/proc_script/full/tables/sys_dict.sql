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
  is 'ϵͳ�ֵ��';
comment on column SYS_DICT.dic_code
  is '�ֵ����';
comment on column SYS_DICT.dic_des
  is '�ֵ�����';
comment on column SYS_DICT.dic_type
  is '�ֵ�����,0-��������Ϊ�ֵ�;1-�ֵ���Դ�ڹ�ͬ���ж�����ض�����';
comment on column SYS_DICT.dic_tblname
  is '�ֵ���Դ��';
comment on column SYS_DICT.dic_id_colname
  is '�ֵ��Ӧ�Ĺ���������';
comment on column SYS_DICT.dic_idvalue
  is '�ֵ��ж�Ӧ�Ĺ���������ȡֵ';
comment on column SYS_DICT.dic_val_colname
  is '�ֵ��ж�Ӧ��ȡֵ��';
comment on column SYS_DICT.dic_des_colname
  is '�ֵ��ж�Ӧ��������';
comment on column SYS_DICT.remark
  is '��ע';
comment on column SYS_DICT.dic_sort_colname
  is '�����ֶ�';
comment on column SYS_DICT.dic_dynamic_sign
  is '�Ƿ�̬��ȡ��Ĭ��Ϊ0��0-�Ƕ�̬��ȡ��1-��̬��ȡ��';

