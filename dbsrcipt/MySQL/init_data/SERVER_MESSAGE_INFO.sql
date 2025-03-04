
insert into SERVER_MESSAGE_INFO (id, value, chn, code, data_desc)
values ('5bded4f11f674bbd9367aa2433784fef', 'D10027910H0001', '查询机构代码（企业）', 'COM_QueryOrgCode', '征信报告个人请求报文“查询机构代码”来源');
insert into SERVER_MESSAGE_INFO (id, value, chn, code, data_desc)
values ('e92ad8e9790546a28c7df44788b10b32', 'D10027910H0001', '数据提供机构代码（个人）', 'PER_DataProviderOrgCode', '获取个人异议事项请求报文“数据提供机构代码”来源');
insert into SERVER_MESSAGE_INFO (id, value, chn, code, data_desc)
values ('1b38bc0a2f374157a8c86c13d2b9aec4', 'D10027910H0001', '数据提供机构代码（企业）', 'COM_DataProviderOrgCode', '获取企业异议事项请求报文“数据提供机构代码”来源');
insert into SERVER_MESSAGE_INFO (id, value, chn, code, data_desc)
values ('91e4004951b34642bb923b44da9d8701', '104166', '发起用户代码（个人）', 'PER_OriginateUserCode', '获取个人异议事项请求报文“发起用户代码”来源');
insert into SERVER_MESSAGE_INFO (id, value, chn, code, data_desc)
values ('cff1583344194a4293ee9681f619828e', 'FW_GRXYBG_0074', '服务代码（个人不含数字解读）', 'PER_ServiceCode_NumRead', '征信报告请求报文“服务代码”来源');
insert into SERVER_MESSAGE_INFO (id, value, chn, code, data_desc)
values ('77ad65340c95476badabb12ea84bdc65', '104166', '发起用户代码（企业）', 'COM_OriginateUserCode', '获取企业异议事项请求报文“发起用户代码”来源');
insert into SERVER_MESSAGE_INFO (id, value, chn, code, data_desc)
values ('b29a8702d1e14728bad580e8c8b071c5', 'FW_GRXYBG_0074', '服务代码（个人含数字解读）', 'PER_ServiceCode', '征信报告请求报文“服务代码”来源');
insert into SERVER_MESSAGE_INFO (id, value, chn, code, data_desc)
values ('e9a737f577aa4d34901bea349d2b96ad', 'FW_QYXYBG_0043', '服务代码（企业）', 'COM_ServiceCode', '征信报告请求报文“服务代码”来源');
insert into SERVER_MESSAGE_INFO (id, value, chn, code, data_desc)
values ('46850cbc9c8d461da6b878f2fe2d9693', 'D10027910H0001', '查询机构代码（个人）', 'PER_QueryOrgCode', '征信报告企业请求报文“查询机构代码”来源');
insert into SERVER_MESSAGE_INFO (id, value, chn, code, data_desc)
values ('94c8f4fe7f0a4729826b3d21b3a58a23', '2,3', '村镇银行法人代码', 'TOWN_Company', '村镇银行的法人编码，用来判断查询征信报告是爬虫还是接口方式，格式：法人代码1,法人代码2,...');
insert into SERVER_MESSAGE_INFO (id, value, chn, code, data_desc)
values ('685aa559dde14622b59e8ed6377624d5', 'B0000000000001', '接收结构代码', 'RECE_ORG_CODE', '报文头中“接收结构代码”来源');
commit;
