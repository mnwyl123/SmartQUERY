create table PER_PENSIO_RELEASE
(
  report_id        VARCHAR2(30) not null,
  serial           VARCHAR2(10),
  rel_place        VARCHAR2(100),
  retired_type     VARCHAR2(50),
  retired_month    VARCHAR2(20),
  start_work_mon   VARCHAR2(20),
  rel_sum_cur_mon  VARCHAR2(20),
  stop_rel_reason  VARCHAR2(100),
  original_comapny VARCHAR2(200),
  update_time      VARCHAR2(20)
)
;
comment on table PER_PENSIO_RELEASE
  is '���ϱ��ս𷢷ż�¼';
comment on column PER_PENSIO_RELEASE.report_id
  is '������';
comment on column PER_PENSIO_RELEASE.serial
  is '���';
comment on column PER_PENSIO_RELEASE.rel_place
  is '���ŵ�';
comment on column PER_PENSIO_RELEASE.retired_type
  is '���������';
comment on column PER_PENSIO_RELEASE.retired_month
  is '�������·�';
comment on column PER_PENSIO_RELEASE.start_work_mon
  is '�μӹ����·�';
comment on column PER_PENSIO_RELEASE.rel_sum_cur_mon
  is '����ʵ�����Ͻ�';
comment on column PER_PENSIO_RELEASE.stop_rel_reason
  is 'ͣ��ԭ��';
comment on column PER_PENSIO_RELEASE.original_comapny
  is 'ԭ��λ����';
comment on column PER_PENSIO_RELEASE.update_time
  is '��Ϣ��������';

