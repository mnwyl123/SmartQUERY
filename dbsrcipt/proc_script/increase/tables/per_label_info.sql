create table PER_LABEL_INFO
(
  report_id  VARCHAR2(30) not null,
  l_content  VARCHAR2(200),
  add_date   VARCHAR2(100),
  per_type   VARCHAR2(100),
  l_type     VARCHAR2(200),
  serial     VARCHAR2(100),
  l_content2 VARCHAR2(100),
  per_type2  VARCHAR2(100)
)
;
comment on table PER_LABEL_INFO
  is '��ע��������Ϣ(����)';
comment on column PER_LABEL_INFO.report_id
  is '������';
comment on column PER_LABEL_INFO.l_content
  is '��ע����������';
comment on column PER_LABEL_INFO.add_date
  is '�������';
comment on column PER_LABEL_INFO.per_type
  is '��ע���ͣ�1-���� 2-����˻� 3-����Э�� 4-��ػ������� 5-�󸶷�ҵ�� 6-Ƿ˰��¼ 7-�����о� 8-ǿ��ִ�� 9-�������� 10-ס�������� 11-�ͱ� 12-ִҵ�ʸ� 13-����������';
comment on column PER_LABEL_INFO.l_type
  is '��ע����������';
comment on column PER_LABEL_INFO.serial
  is '���';

