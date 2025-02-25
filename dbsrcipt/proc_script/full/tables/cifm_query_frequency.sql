create table CIFM_QUERY_FREQUENCY
(
  username        VARCHAR2(20),
  query_min_count INTEGER,
  query_multiple  NUMBER,
  query_month     VARCHAR2(6),
  query_count     INTEGER,
  avg_query_count INTEGER,
  company         VARCHAR2(10),
  user_id         VARCHAR2(32),
  user_type       VARCHAR2(5)
)
;
comment on table CIFM_QUERY_FREQUENCY
  is '�û���ѯ�������ñ�';
comment on column CIFM_QUERY_FREQUENCY.username
  is '�û���¼��';
comment on column CIFM_QUERY_FREQUENCY.query_min_count
  is 'ƽ����ѯ��������ֵ';
comment on column CIFM_QUERY_FREQUENCY.query_multiple
  is '��ѯ����Ԥ������';
comment on column CIFM_QUERY_FREQUENCY.query_month
  is '��ǰ�·�';
comment on column CIFM_QUERY_FREQUENCY.query_count
  is '���²�ѯ����';
comment on column CIFM_QUERY_FREQUENCY.avg_query_count
  is 'ǰ�����²�ѯƽ������';
comment on column CIFM_QUERY_FREQUENCY.company
  is '���˱���';
comment on column CIFM_QUERY_FREQUENCY.user_id
  is '�û�ID';
comment on column CIFM_QUERY_FREQUENCY.user_type
  is '�û�����(1:���ˣ�2:��ҵ)';

