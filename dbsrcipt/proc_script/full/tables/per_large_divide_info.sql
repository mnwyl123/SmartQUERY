create table PER_LARGE_DIVIDE_INFO
(
  report_id VARCHAR2(30) not null,
  expi_date VARCHAR2(100),
  effe_date VARCHAR2(100),
  used_sum  VARCHAR2(100),
  serial    VARCHAR2(100),
  div_quota VARCHAR2(100)
)
;
comment on table PER_LARGE_DIVIDE_INFO
  is '���ר�������Ϣ';
comment on column PER_LARGE_DIVIDE_INFO.report_id
  is '������';
comment on column PER_LARGE_DIVIDE_INFO.expi_date
  is '���ڶ�ȵ�������';
comment on column PER_LARGE_DIVIDE_INFO.effe_date
  is '���ڶ����Ч����';
comment on column PER_LARGE_DIVIDE_INFO.used_sum
  is '���÷��ڽ��';
comment on column PER_LARGE_DIVIDE_INFO.serial
  is '�˻����';
comment on column PER_LARGE_DIVIDE_INFO.div_quota
  is '���ר����ڶ��';

