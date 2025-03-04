/*
Navicat MySQL Data Transfer

Source Server         : jiekou-test
Source Server Version : 50733
Source Host           : 10.39.0.151:3306
Source Database       : hong

Target Server Type    : MYSQL
Target Server Version : 50733
File Encoding         : 65001

Date: 2025-02-26 16:36:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for body_data
-- ----------------------------
DROP TABLE IF EXISTS body_data;
CREATE TABLE body_data (
  QUERY_NO varchar(60) NOT NULL COMMENT '报告编号',
  ID varchar(64) DEFAULT NULL COMMENT '编号',
  BODY longtext COMMENT '报文内容',
  DATE varchar(50) DEFAULT NULL COMMENT '日期',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_BODY_DATA (ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='报文信息表';

-- ----------------------------
-- Table structure for c3p0testtable
-- ----------------------------
DROP TABLE IF EXISTS c3p0testtable;
CREATE TABLE c3p0testtable (
  a char(1) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for cifm_bank_query_count
-- ----------------------------
DROP TABLE IF EXISTS cifm_bank_query_count;
CREATE TABLE cifm_bank_query_count (
  ORG_ID varchar(100) DEFAULT NULL COMMENT 'ORG_ID',
  APPLICATION_TIME varchar(20) DEFAULT NULL COMMENT '查询时间',
  ENTER_QUERY_COUNT varchar(20) DEFAULT NULL COMMENT '企业查询次数',
  PERSONAL_QUERY_COUNT varchar(20) DEFAULT NULL COMMENT '个人查询次数',
  ORG_CODE varchar(50) DEFAULT NULL COMMENT 'ORG_CODE',
  ORG_NAME varchar(30) DEFAULT NULL COMMENT 'ORG_NAME',
  USER_ID varchar(100) DEFAULT NULL COMMENT 'USER_ID',
  USER_CODE varchar(255) DEFAULT NULL COMMENT 'USER_CODE',
  USER_NAME varchar(255) DEFAULT NULL COMMENT 'USER_NAME',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='人行查询流水统计结果表';

-- ----------------------------
-- Table structure for cifm_bank_query_flow
-- ----------------------------
DROP TABLE IF EXISTS cifm_bank_query_flow;
CREATE TABLE cifm_bank_query_flow (
  TRADE_NO varchar(100) DEFAULT NULL COMMENT '交易号',
  TRADE_TIME varchar(32) DEFAULT NULL COMMENT '交易时间',
  HQ_INSTITUTION_CODE varchar(50) DEFAULT NULL COMMENT '总部机构代码',
  HQ_INSTITUTION_NAME varchar(100) DEFAULT NULL COMMENT '总部机构名称',
  BRANCH_CODE varchar(50) DEFAULT NULL COMMENT '分支机构代码',
  BRANCH_NAME varchar(50) DEFAULT NULL COMMENT '分支机构名称',
  BRANCH_LOCATION varchar(100) DEFAULT NULL COMMENT '分支机构所在地',
  USER_NAME varchar(30) DEFAULT NULL COMMENT '用户名',
  REPORT_TYPE varchar(50) DEFAULT NULL COMMENT '产品名称（客户类型）',
  CONSUMPTION_NUM varchar(20) DEFAULT NULL COMMENT '消费件数',
  PRODUCT_DES1 varchar(150) DEFAULT NULL COMMENT '产品说明1',
  PRODUCT_DES2 varchar(100) DEFAULT NULL COMMENT '产品说明2',
  PRODUCT_DES3 varchar(200) DEFAULT NULL COMMENT '产品说明3',
  PRODUCT_DES4 varchar(100) DEFAULT NULL COMMENT '产品说明4',
  FRI_ORG_NAME varchar(30) DEFAULT NULL COMMENT '一级机构名称',
  SEC_ORG_NAME varchar(30) DEFAULT NULL COMMENT '二级机构名称',
  THR_ORG_NAME varchar(30) DEFAULT NULL COMMENT '三级机构名称',
  FOUR_ORG_NAME varchar(30) DEFAULT NULL COMMENT '四级机构名称',
  FIV_ORG_NAME varchar(30) DEFAULT NULL COMMENT '五级机构名称',
  SIX_ORG_NAME varchar(30) DEFAULT NULL COMMENT '六级机构名称',
  COMPANY varchar(10) DEFAULT NULL COMMENT '机构',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='人行查询流水表';

-- ----------------------------
-- Table structure for cifm_channel
-- ----------------------------
DROP TABLE IF EXISTS cifm_channel;
CREATE TABLE cifm_channel (
  CHANNEL_ID varchar(20) NOT NULL COMMENT '渠道编号',
  CHANNEL_DES varchar(100) DEFAULT NULL COMMENT '渠道描述',
  CHANNEL_STATUS varchar(10) DEFAULT NULL COMMENT '渠道状态(0正常，1停用)',
  CHANNEL_CONTACT varchar(50) DEFAULT NULL COMMENT '联系人',
  COMPANY varchar(10) DEFAULT NULL COMMENT '机构',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='cifm_channel';

-- ----------------------------
-- Table structure for cifm_company_detail
-- ----------------------------
DROP TABLE IF EXISTS cifm_company_detail;
CREATE TABLE cifm_company_detail (
  ID varchar(64) DEFAULT NULL COMMENT '查询编号',
  ORG_CODE varchar(30) DEFAULT NULL COMMENT '上级机构代码',
  BRANCH_CODE varchar(30) DEFAULT NULL COMMENT '查询网点机构码',
  BRANCH_NAME varchar(100) DEFAULT NULL COMMENT '查询网点名称',
  USER_SYS_NAME varchar(30) DEFAULT NULL COMMENT '查询用户系统名',
  USER_REAL_NAME varchar(20) DEFAULT NULL COMMENT '查询用户真实姓名',
  DEPT_CODE varchar(20) DEFAULT NULL COMMENT '部门名称',
  QUERY_TIME datetime DEFAULT NULL COMMENT '查询时间',
  QUERY_REASON varchar(2) DEFAULT NULL COMMENT '查询原因',
  CHINA_CREDIT_CODE varchar(150) DEFAULT NULL COMMENT '中征码',
  IS_GET varchar(2) DEFAULT NULL COMMENT '是否查得',
  CHECK_TIME datetime DEFAULT NULL COMMENT '查询授权时间',
  IP varchar(16) DEFAULT NULL COMMENT '查询机IP',
  COMPANY_NAME varchar(200) DEFAULT NULL COMMENT '机构',
  QUERY_COST decimal(8,2) DEFAULT NULL COMMENT '查询费用',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY IDX_CIFM_COMPANY_DETAIL_INDEX (ID,COMPANY_NAME) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='cifm_company_detail';

-- ----------------------------
-- Table structure for cifm_company_detail_his
-- ----------------------------
DROP TABLE IF EXISTS cifm_company_detail_his;
CREATE TABLE cifm_company_detail_his (
  ID varchar(64) DEFAULT NULL COMMENT '查询编号',
  ORG_CODE varchar(30) DEFAULT NULL COMMENT '上级机构代码',
  BRANCH_CODE varchar(30) DEFAULT NULL COMMENT '查询网点机构码',
  BRANCH_NAME varchar(100) DEFAULT NULL COMMENT '查询网点名称',
  USER_SYS_NAME varchar(30) DEFAULT NULL COMMENT '查询用户系统名',
  USER_REAL_NAME varchar(20) DEFAULT NULL COMMENT '查询用户真实姓名',
  DEPT_CODE varchar(20) DEFAULT NULL COMMENT '部门名称',
  QUERY_TIME datetime DEFAULT NULL COMMENT '查询时间',
  QUERY_REASON varchar(2) DEFAULT NULL COMMENT '查询原因',
  CHINA_CREDIT_CODE varchar(150) DEFAULT NULL COMMENT '中征码',
  IS_GET varchar(2) DEFAULT NULL COMMENT '是否查得',
  CHECK_TIME datetime DEFAULT NULL COMMENT '查询授权时间',
  IP varchar(16) DEFAULT NULL COMMENT '查询机IP',
  COMPANY_NAME varchar(200) DEFAULT NULL COMMENT '机构',
  QUERY_COST decimal(8,2) DEFAULT NULL COMMENT '查询费用',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY IDX_CIFM_COMPANY_DETAIL_HIS_INDEX (CHINA_CREDIT_CODE) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='征信查询企业信息历史表';

-- ----------------------------
-- Table structure for cifm_company_info
-- ----------------------------
DROP TABLE IF EXISTS cifm_company_info;
CREATE TABLE cifm_company_info (
  ID varchar(64) DEFAULT NULL COMMENT '查询编号',
  QUERY_REASON varchar(2) DEFAULT NULL COMMENT '查询原因',
  CHINA_CREDIT_CODE varchar(150) DEFAULT NULL COMMENT '企业证件号码',
  WARRANT_MATURITY_DATE varchar(20) DEFAULT NULL COMMENT '授权书到期日',
  QUERY_VERSION varchar(2) DEFAULT NULL COMMENT '查询版本',
  COMPANY_NAME varchar(200) DEFAULT NULL COMMENT '客户名称',
  QUERY_TYPE varchar(2) DEFAULT NULL COMMENT '查询类型',
  CUST_MANAGER varchar(50) DEFAULT NULL COMMENT '客户经理',
  AUDITORS varchar(50) DEFAULT NULL COMMENT '授权审批人',
  CREDENTIALS_NO_TYPE varchar(2) DEFAULT NULL COMMENT '证件号类型',
  REMARKS varchar(50) DEFAULT NULL COMMENT '备注',
  BUSINESS_STATUS varchar(10) DEFAULT NULL COMMENT '业务办理状态',
  SERVICECODE varchar(30) DEFAULT NULL COMMENT '服务代码',
  REPORTNAME varchar(50) DEFAULT NULL COMMENT '信用报告文件名称',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY IDX_CIFM_COMPANY_INFO_INDEX (COMPANY_NAME,ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='征信查询企业信息表';

-- ----------------------------
-- Table structure for cifm_company_info_his
-- ----------------------------
DROP TABLE IF EXISTS cifm_company_info_his;
CREATE TABLE cifm_company_info_his (
  ID varchar(64) DEFAULT NULL COMMENT '查询编号',
  QUERY_REASON varchar(2) DEFAULT NULL COMMENT '查询原因',
  CHINA_CREDIT_CODE varchar(150) DEFAULT NULL COMMENT '企业证件号码',
  WARRANT_MATURITY_DATE varchar(20) DEFAULT NULL COMMENT '授权书到期日',
  QUERY_VERSION varchar(2) DEFAULT NULL COMMENT '查询版本',
  COMPANY_NAME varchar(200) DEFAULT NULL COMMENT '客户名称',
  QUERY_TYPE varchar(2) DEFAULT NULL COMMENT '查询类型',
  CUST_MANAGER varchar(50) DEFAULT NULL COMMENT '客户经理',
  AUDITORS varchar(50) DEFAULT NULL COMMENT '授权审批人',
  CREDENTIALS_NO_TYPE varchar(2) DEFAULT NULL COMMENT '证件号类型',
  REMARKS varchar(50) DEFAULT NULL COMMENT '备注',
  BUSINESS_STATUS varchar(10) DEFAULT NULL COMMENT '业务办理状态',
  SERVICECODE varchar(30) DEFAULT NULL COMMENT '服务代码',
  REPORTNAME varchar(50) DEFAULT NULL COMMENT '信用报告文件名称',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY IDX_CIFM_COMPANY_INFO_HIS_INDEX (ID,COMPANY_NAME) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='征信查询企业信息历史表';

-- ----------------------------
-- Table structure for cifm_company_loanno
-- ----------------------------
DROP TABLE IF EXISTS cifm_company_loanno;
CREATE TABLE cifm_company_loanno (
  COM_NAME varchar(200) DEFAULT NULL COMMENT '企业名称',
  CREDITCODE varchar(100) DEFAULT NULL COMMENT '机构信代码',
  LOANCARDNO varchar(100) DEFAULT NULL COMMENT '中证码',
  SDEPORGCODE varchar(100) DEFAULT NULL COMMENT '组织机构代码',
  REGISTERTYPE varchar(30) DEFAULT NULL COMMENT '登记注册类型',
  REGISTERCODE varchar(100) DEFAULT NULL COMMENT '登记注册号',
  SDEPNATIONALTAXCODE varchar(100) DEFAULT NULL COMMENT '纳税人国税识别号',
  SDEPLANDTAXCODE varchar(100) DEFAULT NULL COMMENT '纳税人地税识别号',
  CLAWER_TIME varchar(50) DEFAULT NULL COMMENT '爬取时间',
  SOCIALCREDIT varchar(100) DEFAULT NULL COMMENT '统一社会信用代码',
  BUSINESSNUM varchar(100) DEFAULT NULL COMMENT '工商注册号',
  SOCIALGROUPNO varchar(100) DEFAULT NULL COMMENT '社会团体登记号',
  PUBLICNUM varchar(100) DEFAULT NULL COMMENT '机关和事业单位登记号',
  CIVILNO varchar(100) DEFAULT NULL COMMENT '民办非企业登记号',
  FUNDNO varchar(100) DEFAULT NULL COMMENT '基金会登记号',
  OTHER varchar(100) DEFAULT NULL COMMENT '其他',
  RELIGIONNO varchar(100) DEFAULT NULL COMMENT '宗教证书登记号',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='企业中证码存放表';

-- ----------------------------
-- Table structure for cifm_company_queue
-- ----------------------------
DROP TABLE IF EXISTS cifm_company_queue;
CREATE TABLE cifm_company_queue (
  INCREMENT_ID varchar(64) NOT NULL COMMENT 'ID序列',
  ID varchar(100) DEFAULT NULL,
  USERNAME varchar(30) NOT NULL COMMENT '查询账号用户名',
  QUEUE_TIME varchar(30) DEFAULT NULL COMMENT '加入队列时间',
  QUERY_START_TIME varchar(30) DEFAULT NULL COMMENT '爬取开始时间',
  QUERY_END_TIME varchar(30) DEFAULT NULL COMMENT '爬取结束时间',
  QUERY_STATUS varchar(5) DEFAULT NULL COMMENT '查询状态:1-未查询,2-查询中,3-查询完成',
  RELEASE_LOCK_STSTUS varchar(5) DEFAULT NULL COMMENT '放锁状态:1-自身放锁(包括正常运行与异常运行),2-被后续任务强制放锁',
  LEVEL varchar(2) DEFAULT NULL COMMENT '优先级',
  UN_USING_2 varchar(10) DEFAULT NULL COMMENT '备用字段_2',
  UN_USING_3 varchar(10) DEFAULT NULL COMMENT '备用字段_3',
  PRIMARY KEY (INCREMENT_ID),
  UNIQUE KEY UK_CIFM_COMPANY_QUEUE (INCREMENT_ID) USING BTREE,
  KEY UK_CIFM_COMPANY_QUEUE_id (ID) USING BTREE,
  KEY idx_username_queryStatus (USERNAME,QUERY_STATUS) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='企业爬虫队列流程表';

-- ----------------------------
-- Table structure for cifm_cost_calculate
-- ----------------------------
DROP TABLE IF EXISTS cifm_cost_calculate;
CREATE TABLE cifm_cost_calculate (
  DATA_DATE varchar(15) DEFAULT NULL COMMENT '数据日期',
  COST_TYPE decimal(1,0) DEFAULT NULL COMMENT '费用类型（1：个人，2：企业）',
  COST decimal(10,0) DEFAULT NULL COMMENT '单笔费用',
  COMPANY varchar(10) DEFAULT NULL COMMENT '机构',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='费用计算';

-- ----------------------------
-- Table structure for cifm_credit_acct_manage
-- ----------------------------
DROP TABLE IF EXISTS cifm_credit_acct_manage;
CREATE TABLE cifm_credit_acct_manage (
  CREDIT_CODE varchar(32) DEFAULT NULL COMMENT '征信登录名',
  CREDIT_NAME varchar(50) DEFAULT NULL COMMENT '征信用户名称',
  CREDENTIALS_TYPE varchar(2) DEFAULT NULL COMMENT '证件类型',
  CREDENTIALS_NO varchar(50) DEFAULT NULL COMMENT '证件号码',
  START_DATE varchar(32) DEFAULT NULL COMMENT '启用日期',
  END_DATE varchar(32) DEFAULT NULL COMMENT '停用日期',
  PREVIOUS_PASSWORD varchar(300) DEFAULT NULL COMMENT '原密码',
  CURRENT_PASSWORD varchar(300) DEFAULT NULL COMMENT '新密码',
  CURRENTTIME varchar(32) DEFAULT NULL COMMENT '密码修改时间',
  PWD_EXPIRES_DATE varchar(32) DEFAULT NULL COMMENT '密码到期日',
  CREDIT_ACCT_TYPE varchar(2) DEFAULT NULL COMMENT '账号类型（1个人，2企业）',
  COMPANY varchar(10) DEFAULT NULL COMMENT '机构',
  PERBANK_STATUS varchar(10) DEFAULT NULL COMMENT '人行账户状态(1:正常，0：锁定)',
  PWD_CODE varchar(10) DEFAULT NULL COMMENT '密码编号',
  IS_WEB varchar(5) DEFAULT NULL COMMENT '是否爬虫用户（0-否，1-是）',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  SUBJECT varchar(100) DEFAULT NULL,
  ISWHITE varchar(2) DEFAULT NULL COMMENT '是否白名单：是：1 否 ：0',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='征信账户管理信息表';

-- ----------------------------
-- Table structure for cifm_flow_status
-- ----------------------------
DROP TABLE IF EXISTS cifm_flow_status;
CREATE TABLE cifm_flow_status (
  ID varchar(64) NOT NULL COMMENT '查询编号',
  USER_SYS_ID varchar(32) DEFAULT NULL COMMENT '用户系统ID',
  APPLICATION_TIME datetime DEFAULT NULL COMMENT '申请时间',
  QUERY_TIME datetime DEFAULT NULL COMMENT '时间',
  CHECK_SYS_ID varchar(32) DEFAULT NULL COMMENT '审核人系统ID',
  CHECK_TIME datetime DEFAULT NULL COMMENT '审核时间',
  STATUS varchar(2) DEFAULT NULL COMMENT '01:待审核02:审核通过03:审核不通过04:人行查询失败05:未查得06:报告生成07用户名或密码错误09审核不通过12已丢弃',
  IP varchar(16) DEFAULT NULL COMMENT 'IP',
  MAC varchar(64) DEFAULT NULL COMMENT 'mac',
  ANNEX varchar(2) DEFAULT NULL COMMENT '是否有附件资料(1:有2没有)',
  LAST_CHANGE_TIME datetime DEFAULT NULL COMMENT '最后变更时间',
  INTERNAL varchar(64) DEFAULT NULL COMMENT '行内查询(1:行内查询2:人行查询3:本人查询)',
  REPORT_ID varchar(64) DEFAULT NULL COMMENT '报告编号',
  CHECK_REJECT_RESON varchar(200) DEFAULT NULL COMMENT '审核不通过原因',
  CLIENT_TYPE varchar(2) DEFAULT NULL COMMENT '客户类型(1:个人2:企业)',
  ORG_ID varchar(32) DEFAULT NULL COMMENT '系统机构ID',
  CHANNEL_ID varchar(20) DEFAULT NULL COMMENT '渠道编号（01:前置系统页面，02:信用卡中心，03:360）',
  IS_WX_CHECK varchar(10) DEFAULT NULL COMMENT '是否企业微信审核',
  CHANNEL_QUERY_NO varchar(100) DEFAULT NULL COMMENT '渠道流水号',
  SEND_STATUS varchar(2) DEFAULT NULL COMMENT '报文发送状态（0：失败，1：成功)',
  IS_PRINT varchar(10) DEFAULT NULL COMMENT '是否打印(0：否，1：是)',
  RERUNS_TIME int(11) DEFAULT NULL COMMENT 'RERUNS_TIME',
  RESULTCODE varchar(100) DEFAULT NULL COMMENT '查询结果代码',
  RESULTDESC varchar(100) DEFAULT NULL COMMENT '查询结果描述',
  REPORTNAME varchar(100) DEFAULT NULL COMMENT '信用报告文件名称',
  WARRANT varchar(1000) DEFAULT NULL COMMENT '授权书',
  LOAN_APPLICATION varchar(1000) DEFAULT NULL COMMENT '贷款申请书',
  IDENTITY_DOCUMENT varchar(1000) DEFAULT NULL COMMENT '身份证明信息',
  PRO_ID varchar(20) DEFAULT NULL COMMENT '产品编号',
  QUERY_NO varchar(40) DEFAULT NULL COMMENT '原系统流水号',
  OSYSNO varchar(10) DEFAULT NULL,
  PRIMARY KEY (ID),
  KEY IDX_CIFM_FLOW_STATUS_INDEX (ID,USER_SYS_ID,STATUS) USING BTREE,
  KEY IDX_CFS_CHA_ID_NO_INDEX (CHANNEL_QUERY_NO(40),CHANNEL_ID) USING BTREE,
  KEY IDX_CFS_QN (QUERY_NO) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='流程状态表';

-- ----------------------------
-- Table structure for cifm_flow_status_20220515
-- ----------------------------
DROP TABLE IF EXISTS cifm_flow_status_20220515;
CREATE TABLE cifm_flow_status_20220515 (
  ID varchar(64) NOT NULL COMMENT '查询编号',
  USER_SYS_ID varchar(32) DEFAULT NULL COMMENT '用户系统ID',
  APPLICATION_TIME datetime DEFAULT NULL COMMENT '申请时间',
  QUERY_TIME datetime DEFAULT NULL COMMENT '时间',
  CHECK_SYS_ID varchar(32) DEFAULT NULL COMMENT '审核人系统ID',
  CHECK_TIME datetime DEFAULT NULL COMMENT '审核时间',
  STATUS varchar(2) DEFAULT NULL COMMENT '01:待审核02:审核通过03:审核不通过04:人行查询失败05:未查得06:报告生成07用户名或密码错误09审核不通过12已丢弃',
  IP varchar(16) DEFAULT NULL COMMENT 'IP',
  MAC varchar(64) DEFAULT NULL COMMENT 'mac',
  ANNEX varchar(2) DEFAULT NULL COMMENT '是否有附件资料(1:有2没有)',
  LAST_CHANGE_TIME datetime DEFAULT NULL COMMENT '最后变更时间',
  INTERNAL varchar(64) DEFAULT NULL COMMENT '行内查询(1:行内查询2:人行查询3:本人查询)',
  REPORT_ID varchar(64) DEFAULT NULL COMMENT '报告编号',
  CHECK_REJECT_RESON varchar(200) DEFAULT NULL COMMENT '审核不通过原因',
  CLIENT_TYPE varchar(2) DEFAULT NULL COMMENT '客户类型(1:个人2:企业)',
  ORG_ID varchar(32) DEFAULT NULL COMMENT '系统机构ID',
  CHANNEL_ID varchar(20) DEFAULT NULL COMMENT '渠道编号（01:前置系统页面，02:信用卡中心，03:360）',
  IS_WX_CHECK varchar(10) DEFAULT NULL COMMENT '是否企业微信审核',
  CHANNEL_QUERY_NO varchar(100) DEFAULT NULL COMMENT '渠道流水号',
  SEND_STATUS varchar(2) DEFAULT NULL COMMENT '报文发送状态（0：失败，1：成功)',
  IS_PRINT varchar(10) DEFAULT NULL COMMENT '是否打印(0：否，1：是)',
  RERUNS_TIME int(11) DEFAULT NULL COMMENT 'RERUNS_TIME',
  RESULTCODE varchar(100) DEFAULT NULL COMMENT '查询结果代码',
  RESULTDESC varchar(100) DEFAULT NULL COMMENT '查询结果描述',
  REPORTNAME varchar(100) DEFAULT NULL COMMENT '信用报告文件名称',
  WARRANT varchar(1000) DEFAULT NULL COMMENT '授权书',
  LOAN_APPLICATION varchar(1000) DEFAULT NULL COMMENT '贷款申请书',
  IDENTITY_DOCUMENT varchar(1000) DEFAULT NULL COMMENT '身份证明信息',
  PRO_ID varchar(20) DEFAULT NULL COMMENT '产品编号',
  QUERY_NO varchar(40) DEFAULT NULL COMMENT '原系统流水号',
  OSYSNO varchar(10) DEFAULT NULL,
  PRIMARY KEY (ID) USING BTREE,
  KEY IDX_CIFM_FLOW_STATUS_INDEX (ID,USER_SYS_ID,STATUS) USING BTREE,
  KEY IDX_CFS_CHA_ID_NO_INDEX (CHANNEL_QUERY_NO(40),CHANNEL_ID) USING BTREE,
  KEY IDX_CFS_QN (QUERY_NO) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='流程状态表';

-- ----------------------------
-- Table structure for cifm_flow_status_his
-- ----------------------------
DROP TABLE IF EXISTS cifm_flow_status_his;
CREATE TABLE cifm_flow_status_his (
  ID varchar(64) NOT NULL COMMENT '查询编号',
  USER_SYS_ID varchar(32) DEFAULT NULL COMMENT '用户系统ID',
  APPLICATION_TIME datetime DEFAULT NULL COMMENT '申请时间',
  QUERY_TIME datetime DEFAULT NULL COMMENT '查询时间',
  CHECK_SYS_ID varchar(32) DEFAULT NULL COMMENT '审核人系统ID',
  CHECK_TIME datetime DEFAULT NULL COMMENT '审核时间',
  STATUS varchar(2) DEFAULT NULL COMMENT '01:待审核02:审核通过03:审核不通过04:人行查询失败05:未查得06:报告生成07用户名或密码错误09审核不通过12已丢弃',
  IP varchar(16) DEFAULT NULL COMMENT 'IP',
  MAC varchar(64) DEFAULT NULL COMMENT 'mac',
  ANNEX varchar(2) DEFAULT NULL COMMENT '是否有附件资料(1:有2没有)',
  LAST_CHANGE_TIME datetime DEFAULT NULL COMMENT '最后变更时间',
  INTERNAL varchar(64) DEFAULT NULL COMMENT '行内查询(1:行内查询2:人行查询3:本人查询)',
  REPORT_ID varchar(64) DEFAULT NULL COMMENT '报告编号',
  CHECK_REJECT_RESON varchar(200) DEFAULT NULL COMMENT '审核不通过原因',
  CLIENT_TYPE varchar(2) DEFAULT NULL COMMENT '客户类型(1:个人2:企业)',
  ORG_ID varchar(32) DEFAULT NULL COMMENT '系统机构ID',
  CHANNEL_ID varchar(20) DEFAULT NULL COMMENT '渠道编号（01:前置系统页面，02:信用卡中心，03:360）',
  IS_WX_CHECK varchar(10) DEFAULT NULL COMMENT '是否企业微信审核',
  CHANNEL_QUERY_NO varchar(100) DEFAULT NULL COMMENT '渠道流水号',
  SEND_STATUS varchar(2) DEFAULT NULL COMMENT '报文发送状态（0：失败，1：成功)',
  IS_PRINT varchar(10) DEFAULT NULL COMMENT '是否打印(0：否，1：是)',
  RERUNS_TIME int(11) DEFAULT NULL COMMENT 'RERUNS_TIME',
  RESULTCODE varchar(100) DEFAULT NULL COMMENT '查询结果代码',
  RESULTDESC varchar(100) DEFAULT NULL COMMENT '查询结果描述',
  REPORTNAME varchar(100) DEFAULT NULL COMMENT '信用报告文件名称',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='流程状态历史表';

-- ----------------------------
-- Table structure for cifm_holiday
-- ----------------------------
DROP TABLE IF EXISTS cifm_holiday;
CREATE TABLE cifm_holiday (
  date_param datetime NOT NULL COMMENT '日期',
  is_holiday varchar(1) DEFAULT NULL COMMENT '是否节假日(0:否,1:是)',
  company varchar(10) DEFAULT NULL COMMENT 'company'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='节假日参数表';

-- ----------------------------
-- Table structure for cifm_key_cust_maintain
-- ----------------------------
DROP TABLE IF EXISTS cifm_key_cust_maintain;
CREATE TABLE cifm_key_cust_maintain (
  CUST_NO varchar(50) DEFAULT NULL COMMENT '客户编号',
  CLIENT_TYPE varchar(2) DEFAULT NULL COMMENT '客户类型',
  CLIENT_NAME varchar(50) DEFAULT NULL COMMENT '客户名称',
  CREDENTIALS_NO varchar(50) DEFAULT NULL COMMENT '证件号码/中征码',
  OPERATION_TYPE varchar(2) DEFAULT NULL COMMENT 'OPERATION_TYPE',
  ORG_NAME varchar(50) DEFAULT NULL COMMENT '操作用户所属机构名称',
  ORG_CODE varchar(50) DEFAULT NULL COMMENT '操作用户所属机构编号',
  USER_NAME varchar(50) DEFAULT NULL COMMENT '操作用户名称',
  USER_CODE varchar(50) DEFAULT NULL COMMENT '操作用户编号',
  ADD_DATE varchar(50) DEFAULT NULL COMMENT '移入日期',
  ADD_REASON varchar(255) DEFAULT NULL COMMENT '移入原因',
  DELETE_DATE varchar(50) DEFAULT NULL COMMENT '移出日期',
  DELETE_REASON varchar(255) DEFAULT NULL COMMENT '移出原因',
  COMPANY varchar(10) DEFAULT NULL COMMENT '机构',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='重点关注客户维护表';

-- ----------------------------
-- Table structure for cifm_mache_change_history
-- ----------------------------
DROP TABLE IF EXISTS cifm_mache_change_history;
CREATE TABLE cifm_mache_change_history (
  USER_ID varchar(32) DEFAULT NULL COMMENT '用户ID',
  USERNAME varchar(20) DEFAULT NULL COMMENT '用户登录名',
  COMPANY varchar(10) DEFAULT NULL COMMENT '法人编码',
  OLD_MAC varchar(20) DEFAULT NULL COMMENT '变更前MAC',
  OLD_IP varchar(30) DEFAULT NULL COMMENT '变更前IP',
  NEW_MAC varchar(20) DEFAULT NULL COMMENT '变更后MAC',
  NEW_IP varchar(30) DEFAULT NULL COMMENT '变更后IP',
  UPDATE_TIME varchar(30) DEFAULT NULL COMMENT '审核时间',
  STATUS varchar(10) DEFAULT NULL COMMENT '审核状态',
  AUDIT_OPINION varchar(200) DEFAULT NULL COMMENT '审核意见',
  ID varchar(32) DEFAULT NULL COMMENT 'ID',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='机器变更审核';

-- ----------------------------
-- Table structure for cifm_material_change
-- ----------------------------
DROP TABLE IF EXISTS cifm_material_change;
CREATE TABLE cifm_material_change (
  ID varchar(64) NOT NULL COMMENT '查询编号',
  CHECK_SYS_ID varchar(32) NOT NULL COMMENT '审核人系统ID',
  USER_SYS_ID varchar(32) NOT NULL COMMENT '用户系统ID',
  STATUS varchar(255) NOT NULL COMMENT '状态(00:待审核01:同意02:不同意)',
  CLIENT_NAME varchar(50) NOT NULL COMMENT '姓名',
  CREDENTIALS_TYPE varchar(50) NOT NULL COMMENT '证件类型',
  CREDENTIALS_NO varchar(50) NOT NULL COMMENT '证件号码',
  FILEADDRESS varchar(255) NOT NULL COMMENT '文件夹的地址',
  EDIT_REASON varchar(255) NOT NULL COMMENT '变更原因',
  CLIENT_TYPE varchar(255) NOT NULL COMMENT '客户类型',
  AUDIT_OPINION varchar(255) DEFAULT NULL COMMENT '审核意见',
  APPLICATION_TIME varchar(30) DEFAULT NULL COMMENT 'APPLICATION_TIME',
  CHECK_TIME varchar(30) DEFAULT NULL COMMENT 'CHECK_TIME',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='cifm_material_change';

-- ----------------------------
-- Table structure for cifm_number_read_param
-- ----------------------------
DROP TABLE IF EXISTS cifm_number_read_param;
CREATE TABLE cifm_number_read_param (
  REQUEST_USER_NAME varchar(50) DEFAULT NULL COMMENT '上报员名称',
  REQUEST_USER_CODE varchar(50) DEFAULT NULL COMMENT '上报员人行用户代码',
  COMPANY varchar(10) DEFAULT NULL COMMENT '所属法人',
  PARAM varchar(50) DEFAULT NULL COMMENT 'PARAM',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='数字解读上报员参数表';

-- ----------------------------
-- Table structure for cifm_numreadre_quest
-- ----------------------------
DROP TABLE IF EXISTS cifm_numreadre_quest;
CREATE TABLE cifm_numreadre_quest (
  ID varchar(64) DEFAULT NULL COMMENT '编号',
  REQUEST_ID varchar(64) DEFAULT NULL COMMENT '请求信息编号(唯一标识该条请求信息)',
  CLIENT_NAME varchar(64) DEFAULT NULL COMMENT '被查询人姓名',
  CREDENTIALS_TYPE varchar(4) DEFAULT NULL COMMENT '被查询人证件类型',
  CREDENTIALS_NO varchar(64) DEFAULT NULL COMMENT '被查询人证件号码',
  PRODUCE_DATE datetime DEFAULT NULL COMMENT '产品时间',
  COMPANY varchar(10) DEFAULT NULL COMMENT '机构',
  STATUS varchar(20) DEFAULT NULL COMMENT '状态',
  QUERY_REASON varchar(20) DEFAULT NULL COMMENT '查询原因',
  FILENAME_REQUEST varchar(64) DEFAULT NULL COMMENT '申请报文文件名',
  REQUESTID varchar(100) DEFAULT NULL COMMENT '信息记录号',
  RESULTCODE varchar(100) DEFAULT NULL COMMENT '查询结果代码',
  RESULTDESC varchar(100) DEFAULT NULL COMMENT '查询结果描述',
  ORIGINATEORGCODE varchar(100) DEFAULT NULL COMMENT '发起机构代码',
  ORIGINATEUSERCODE varchar(100) DEFAULT NULL COMMENT '发起用户代码',
  NAME varchar(100) DEFAULT NULL COMMENT '信息主体姓名',
  IDTYPE varchar(100) DEFAULT NULL COMMENT '信息主体证件类型',
  IDNUM varchar(100) DEFAULT NULL COMMENT '信息主体证件号码',
  QUERYREASON varchar(100) DEFAULT NULL COMMENT '查询原因',
  SERVICECODE varchar(100) DEFAULT NULL COMMENT '服务代码',
  PRODUCTDATE varchar(100) DEFAULT NULL COMMENT '产品日期',
  RESULTTYPE varchar(100) DEFAULT NULL COMMENT '查询结果类型',
  SCORE varchar(100) DEFAULT NULL COMMENT '数字解读值',
  FACTORNUM varchar(100) DEFAULT NULL COMMENT '影响因素个数',
  FACTORRECS varchar(100) DEFAULT NULL COMMENT '影响因素',
  POSITION varchar(100) DEFAULT NULL COMMENT '相对位置',
  SCOREDATE varchar(100) DEFAULT NULL COMMENT '计算日期',
  REQUEST_NO int(11) DEFAULT NULL COMMENT '请求信息编号(唯一标识该条请求信息)',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='"数字解读"批量查询请求报文';

-- ----------------------------
-- Table structure for cifm_numreadr_batch
-- ----------------------------
DROP TABLE IF EXISTS cifm_numreadr_batch;
CREATE TABLE cifm_numreadr_batch (
  BATCH_NAME varchar(40) DEFAULT NULL COMMENT '发送报文的文件名',
  REQUEST_NO int(11) DEFAULT NULL COMMENT '发送报文的请求编号',
  COMPANY varchar(10) DEFAULT NULL COMMENT '机构',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='数字解读发送报文日志';

-- ----------------------------
-- Table structure for cifm_numreadr_fail_log
-- ----------------------------
DROP TABLE IF EXISTS cifm_numreadr_fail_log;
CREATE TABLE cifm_numreadr_fail_log (
  ERROR_CODE varchar(20) DEFAULT NULL COMMENT '错误信息编码',
  ERROR_MSG varchar(1000) DEFAULT NULL COMMENT '错误信息内容',
  USER_CODE varchar(40) DEFAULT NULL COMMENT '接收方用户代码',
  ORG_CODE varchar(40) DEFAULT NULL COMMENT '接收方机构代码',
  RESPONSE_TIME varchar(50) DEFAULT NULL COMMENT '响应时间',
  TOTAL_NUM int(11) DEFAULT NULL COMMENT '报文总数',
  RE_FILE_NAME varchar(40) DEFAULT NULL COMMENT '反馈报文名称',
  COMPANY varchar(10) DEFAULT NULL COMMENT '机构',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='"数字解读"批量查询异常反馈报文';

-- ----------------------------
-- Table structure for cifm_numreadr_succ_log
-- ----------------------------
DROP TABLE IF EXISTS cifm_numreadr_succ_log;
CREATE TABLE cifm_numreadr_succ_log (
  REQUEST_NO int(11) DEFAULT NULL COMMENT '请求信息编号(唯一标识该条请求信息)',
  RESULT_TYPE varchar(4) DEFAULT NULL COMMENT '查询结果类型',
  SCORE varchar(50) DEFAULT NULL COMMENT '数字解读值',
  FACTORS varchar(50) DEFAULT NULL COMMENT '影响因素',
  POSITION varchar(30) DEFAULT NULL COMMENT '相对位置',
  SCORE_DATE varchar(40) DEFAULT NULL COMMENT '计算日期',
  RE_FILE_NAME varchar(40) DEFAULT NULL COMMENT '反馈报文名称',
  USER_CODE varchar(40) DEFAULT NULL COMMENT '接收方用户代码',
  ORG_CODE varchar(40) DEFAULT NULL COMMENT '接收方机构代码',
  COMPANY varchar(10) DEFAULT NULL COMMENT '机构',
  NO int(11) DEFAULT NULL COMMENT 'NO',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='"数字解读"批量查询反馈报文';

-- ----------------------------
-- Table structure for cifm_numread_info
-- ----------------------------
DROP TABLE IF EXISTS cifm_numread_info;
CREATE TABLE cifm_numread_info (
  ID varchar(100) DEFAULT NULL COMMENT '编号',
  REQUESTID varchar(100) DEFAULT NULL COMMENT '信息记录号',
  RESULTCODE varchar(100) DEFAULT NULL COMMENT '查询结果代码 ',
  RESULTDESC varchar(100) DEFAULT NULL COMMENT '查询结果描述',
  ORIGINATEORGCODE varchar(100) DEFAULT NULL COMMENT '发起机构代码',
  ORIGINATEUSERCODE varchar(100) DEFAULT NULL COMMENT '发起用户代码',
  NAME varchar(100) DEFAULT NULL COMMENT '信息主体姓名',
  IDTYPE varchar(100) DEFAULT NULL COMMENT '信息主体证件类型',
  IDNUM varchar(100) DEFAULT NULL COMMENT '信息主体证件号码',
  QUERYREASON varchar(100) DEFAULT NULL COMMENT '查询原因',
  SERVICECODE varchar(100) DEFAULT NULL COMMENT '服务代码',
  PRODUCTDATE varchar(100) DEFAULT NULL COMMENT '产品日期',
  RESULTTYPE varchar(100) DEFAULT NULL COMMENT '查询结果类型',
  SCORE varchar(100) DEFAULT NULL COMMENT '数字解读值',
  FACTORNUM varchar(100) DEFAULT NULL COMMENT '影响因素个数',
  FACTORRECS varchar(100) DEFAULT NULL COMMENT '影响因素集合',
  POSITION varchar(100) DEFAULT NULL COMMENT '相对位置',
  SCOREDATE varchar(100) DEFAULT NULL COMMENT '计算日期',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='个人数字解读报告信息表';

-- ----------------------------
-- Table structure for cifm_num_read
-- ----------------------------
DROP TABLE IF EXISTS cifm_num_read;
CREATE TABLE cifm_num_read (
  QUERYORGCODE varchar(100) DEFAULT NULL COMMENT '查询机构代码',
  USERNAME varchar(100) DEFAULT NULL COMMENT '用户名',
  FILENAME_REQUEST varchar(100) DEFAULT NULL COMMENT '请求批量查询请求文件名称',
  ID varchar(100) DEFAULT NULL COMMENT '编号',
  FILENAME_RESPONSE varchar(100) DEFAULT NULL COMMENT '返回批量查询请求文件名称',
  RESULTCODE varchar(100) DEFAULT NULL COMMENT '查询结果代码',
  RESULTDESC varchar(100) DEFAULT NULL COMMENT '查询结果描述',
  STATECODE varchar(100) DEFAULT NULL COMMENT '文件处理状态代码',
  STATEDESC varchar(100) DEFAULT NULL COMMENT '文件处理状态描述',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='数字解读表';

-- ----------------------------
-- Table structure for cifm_obj_com_info
-- ----------------------------
DROP TABLE IF EXISTS cifm_obj_com_info;
CREATE TABLE cifm_obj_com_info (
  ID varchar(64) DEFAULT NULL COMMENT 'ID',
  DATAPROVIDERORGCODE varchar(100) DEFAULT NULL COMMENT '数据提供机构代码',
  USERCODE varchar(70) DEFAULT NULL COMMENT '用户代码',
  PASSWORD varchar(70) DEFAULT NULL COMMENT '用户密码',
  ORIGINATEORGCODE varchar(70) DEFAULT NULL COMMENT '发起机构代码',
  ORIGINATEUSERCODE varchar(70) DEFAULT NULL COMMENT '发起用户代码',
  BEGINDATE varchar(70) DEFAULT NULL COMMENT '开始日期',
  ENDDATE varchar(70) DEFAULT NULL COMMENT '结束日期',
  OBJCHECKID varchar(70) DEFAULT NULL COMMENT '异议事项号',
  PHONENUM varchar(70) DEFAULT NULL COMMENT '有效联系电话',
  OBJCHECKNUM varchar(70) DEFAULT NULL COMMENT '异议事项流水号',
  CHECKRESULT varchar(70) DEFAULT NULL COMMENT '核查结果',
  CHECKRESULTDESC varchar(70) DEFAULT NULL COMMENT '异议核查结果描述',
  CORRECTRESULT varchar(70) DEFAULT NULL COMMENT '异议更正结果',
  ENCLOSUREINF varchar(70) DEFAULT NULL COMMENT '附件信息',
  CORRECTDESC varchar(70) DEFAULT NULL COMMENT '异议更正结果描述',
  ENTNAME varchar(70) DEFAULT NULL COMMENT '企业名称',
  ENTIDTYPE varchar(70) DEFAULT NULL COMMENT '企业身份标识类型',
  ENTIDNUM varchar(70) DEFAULT NULL COMMENT '企业身份标识号码',
  BUSINESSCODE varchar(70) DEFAULT NULL COMMENT '业务标识号',
  LOCATEINFNM varchar(70) DEFAULT NULL COMMENT '定位信息个数',
  LOCATEINFTYPE varchar(70) DEFAULT NULL COMMENT '定位信息类别',
  DATAOCCURORGCODE varchar(70) DEFAULT NULL COMMENT '数据发生机构代码',
  OBJDESC varchar(70) DEFAULT NULL COMMENT '异议说明',
  SERVICERETURNCODE varchar(70) DEFAULT NULL COMMENT '业务回执代码',
  USERNAME varchar(255) DEFAULT NULL COMMENT '用户名',
  REPORT_TYPE varchar(1) DEFAULT NULL COMMENT '报告类型（1-获取企业待核查异议事项 2-获取企业待核查异议事项附件信息 3-反馈企业异议事项核查结果 4-反馈企业异议事项更正结果 5-查询企业异议事项更正结果接受情况 6-添加企业标注 7-删除企业标注）',
  OBJCORRECTID varchar(70) DEFAULT NULL COMMENT '异议事项更正号',
  DEL_RESULTCODE varchar(10) DEFAULT NULL COMMENT '删除企业标志处理结果代码',
  DEL_RESULTDESC varchar(30) DEFAULT NULL COMMENT '删除个人标志处理结果描述',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='异议个人信息';

-- ----------------------------
-- Table structure for cifm_obj_per_info
-- ----------------------------
DROP TABLE IF EXISTS cifm_obj_per_info;
CREATE TABLE cifm_obj_per_info (
  ID varchar(64) DEFAULT NULL COMMENT 'ID',
  DATAPROVIDERORGCODE varchar(70) DEFAULT NULL COMMENT '数据提供机构代码',
  USERCODE varchar(70) DEFAULT NULL COMMENT '用户代码',
  PASSWORD varchar(70) DEFAULT NULL COMMENT '用户密码',
  ORIGINATEORGCODE varchar(70) DEFAULT NULL COMMENT '发起机构代码',
  ORIGINATEUSERCODE varchar(70) DEFAULT NULL COMMENT '发起用户代码',
  BEGINDATE varchar(70) DEFAULT NULL COMMENT '开始日期',
  ENDDATE varchar(70) DEFAULT NULL COMMENT '结束日期',
  OBJCHECKID varchar(70) DEFAULT NULL COMMENT '异议事项号',
  PHONENUM varchar(70) DEFAULT NULL COMMENT '有效联系电话',
  OBJCHECKNUM varchar(70) DEFAULT NULL COMMENT '异议事项流水号',
  CHECKRESULT varchar(70) DEFAULT NULL COMMENT '核查结果',
  CHECKRESULTDESC varchar(70) DEFAULT NULL COMMENT '异议核查结果描述',
  CORRECTRESULT varchar(70) DEFAULT NULL COMMENT '异议更正结果',
  ENCLOSUREINF varchar(70) DEFAULT NULL COMMENT '附件信息',
  CORRECTDESC varchar(70) DEFAULT NULL COMMENT '异议更正结果描述',
  NAME varchar(70) DEFAULT NULL COMMENT '个人姓名',
  IDTYPE varchar(70) DEFAULT NULL COMMENT '个人证件类型',
  IDNUM varchar(70) DEFAULT NULL COMMENT '个人证件号码',
  BUSINESSCODE varchar(70) DEFAULT NULL COMMENT '业务标识号',
  LOCATEINFNM varchar(70) DEFAULT NULL COMMENT '定位信息个数',
  LOCATEINFTYPE varchar(70) DEFAULT NULL COMMENT '定位信息类别',
  DATAOCCURORGCODE varchar(70) DEFAULT NULL COMMENT '数据发生机构代码',
  OBJDESC varchar(70) DEFAULT NULL COMMENT '异议说明',
  SERVICERETURNCODE varchar(70) DEFAULT NULL COMMENT '业务回执代码',
  USERNAME varchar(255) DEFAULT NULL COMMENT 'USERNAME',
  REPORT_TYPE varchar(1) DEFAULT NULL COMMENT '报告类型（1-获取个人待核查异议事项 2-获取个人待核查异议事项附件信息 3-反馈个人异议事项核查结果 4-反馈个人异议事项更正结果 5-查询个人异议事项更正结果接受情况 6-添加个人标注 7-删除个人标注）',
  OBJCORRECTID varchar(70) DEFAULT NULL COMMENT '异议更正号',
  DEL_RESULTCODE varchar(10) DEFAULT NULL COMMENT '删除个人标志处理结果代码',
  DEL_RESULTDESC varchar(30) DEFAULT NULL COMMENT '删除个人标志处理结果描述',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='异议个人信息';

-- ----------------------------
-- Table structure for cifm_org_query_count
-- ----------------------------
DROP TABLE IF EXISTS cifm_org_query_count;
CREATE TABLE cifm_org_query_count (
  ORG_ID varchar(50) DEFAULT NULL COMMENT '机构号',
  APPLICATION_TIME datetime DEFAULT NULL COMMENT '申请日期',
  ENTER_QUERY_COUNT varchar(32) DEFAULT NULL COMMENT '企业查询次数',
  PERSONAL_QUERY_COUNT varchar(32) DEFAULT NULL COMMENT '个人查询次数',
  TOTAL varchar(32) DEFAULT NULL COMMENT '总计',
  ORG_CODE varchar(50) DEFAULT NULL COMMENT 'ORG_CODE',
  ORG_NAME varchar(50) DEFAULT NULL COMMENT 'ORG_NAME',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='机构查询量统计表';

-- ----------------------------
-- Table structure for cifm_param_list
-- ----------------------------
DROP TABLE IF EXISTS cifm_param_list;
CREATE TABLE cifm_param_list (
  ORG_ID varchar(100) DEFAULT NULL COMMENT '机构编号',
  FAIL_ZBSX_PER decimal(5,2) DEFAULT NULL COMMENT '个人失败占比上限',
  FAIL_ZBSX_ORG decimal(5,2) DEFAULT NULL COMMENT '企业失败占比上限',
  OTHER_REASON_ZBSX decimal(5,2) DEFAULT NULL COMMENT '其他理由占比上限',
  CROSS_REGION_ZBSX decimal(5,2) DEFAULT NULL COMMENT '跨地域占比上限',
  COMPANY varchar(10) DEFAULT NULL COMMENT '机构',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='异常查询参数表';

-- ----------------------------
-- Table structure for cifm_param_list_norelation
-- ----------------------------
DROP TABLE IF EXISTS cifm_param_list_norelation;
CREATE TABLE cifm_param_list_norelation (
  PARAM varchar(100) DEFAULT NULL COMMENT '参数',
  PARAM_NAME varchar(100) DEFAULT NULL COMMENT '参数名称',
  PARAM_VALUE varchar(100) DEFAULT NULL COMMENT '参数值',
  PARAM_FORMAT varchar(200) DEFAULT NULL COMMENT '参数格式',
  COMPANY varchar(10) DEFAULT NULL COMMENT '机构',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='参数和其他信息没有关联的参数表';

-- ----------------------------
-- Table structure for cifm_person_detail
-- ----------------------------
DROP TABLE IF EXISTS cifm_person_detail;
CREATE TABLE cifm_person_detail (
  ID varchar(64) DEFAULT NULL COMMENT '查询编号',
  ORG_CODE varchar(30) DEFAULT NULL COMMENT '上级机构代码',
  BRANCH_CODE varchar(30) DEFAULT NULL COMMENT '查询网点机构码',
  BRANCH_NAME varchar(100) DEFAULT NULL COMMENT '查询网点名称',
  USER_SYS_NAME varchar(30) DEFAULT NULL COMMENT '查询用户系统名',
  USER_REAL_NAME varchar(20) DEFAULT NULL COMMENT '查询用户真实姓名',
  QUERY_TIME datetime DEFAULT NULL COMMENT '查询时间',
  CLIENT_NAME varchar(100) DEFAULT NULL COMMENT '被查询人姓名',
  CREDENTIALS_TYPE varchar(10) DEFAULT NULL COMMENT '证件类型',
  CREDENTIALS_NO varchar(150) DEFAULT NULL COMMENT '证件号码',
  QUERY_REASON varchar(2) DEFAULT NULL COMMENT '查询原因',
  QUERY_VERSION varchar(2) DEFAULT NULL COMMENT '查询版本',
  IS_GET varchar(2) DEFAULT NULL COMMENT '是否查得',
  CHECK_TIME datetime DEFAULT NULL COMMENT '查询授权时间',
  IP varchar(16) DEFAULT NULL COMMENT '查询机IP',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY IDX_CIFM_PERSON_DETAIL_INDEX (CREDENTIALS_NO,CLIENT_NAME) USING BTREE,
  KEY idx_pd_id (ID) USING BTREE,
  KEY IDX_PD_ID1 (ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='征信查询个人明细表';

-- ----------------------------
-- Table structure for cifm_person_detail_his
-- ----------------------------
DROP TABLE IF EXISTS cifm_person_detail_his;
CREATE TABLE cifm_person_detail_his (
  ID varchar(64) DEFAULT NULL COMMENT '查询编号',
  ORG_CODE varchar(30) DEFAULT NULL COMMENT '上级机构代码',
  BRANCH_CODE varchar(30) DEFAULT NULL COMMENT '查询网点机构码',
  BRANCH_NAME varchar(100) DEFAULT NULL COMMENT '查询网点名称',
  USER_SYS_NAME varchar(30) DEFAULT NULL COMMENT '查询用户系统名',
  USER_REAL_NAME varchar(20) DEFAULT NULL COMMENT '查询用户真实姓名',
  QUERY_TIME datetime DEFAULT NULL COMMENT '查询时间',
  CLIENT_NAME varchar(100) DEFAULT NULL COMMENT '被查询人姓名',
  CREDENTIALS_TYPE varchar(10) DEFAULT NULL COMMENT '证件类型',
  CREDENTIALS_NO varchar(150) DEFAULT NULL COMMENT '证件号码',
  QUERY_REASON varchar(2) DEFAULT NULL COMMENT '查询原因',
  QUERY_VERSION varchar(2) DEFAULT NULL COMMENT '查询版本',
  IS_GET varchar(2) DEFAULT NULL COMMENT '是否查得',
  CHECK_TIME datetime DEFAULT NULL COMMENT '查询授权时间',
  IP varchar(16) DEFAULT NULL COMMENT '查询机IP',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY IDX_CIFM_PERSON_DETAIL_HIS_INDEX (CREDENTIALS_NO,CLIENT_NAME) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='征信查询个人明细历史表';

-- ----------------------------
-- Table structure for cifm_person_info
-- ----------------------------
DROP TABLE IF EXISTS cifm_person_info;
CREATE TABLE cifm_person_info (
  ID varchar(64) NOT NULL COMMENT '查询编号',
  CLIENT_NAME varchar(100) DEFAULT NULL COMMENT '被查询人姓名',
  CREDENTIALS_TYPE varchar(10) DEFAULT NULL COMMENT '证件类型',
  CREDENTIALS_NO varchar(150) DEFAULT NULL COMMENT '证件号码',
  QUERY_REASON varchar(2) DEFAULT NULL COMMENT '查询原因',
  QUERY_VERSION varchar(2) DEFAULT NULL COMMENT '查询版本',
  WARRANT_MATURITY_DATE varchar(20) DEFAULT NULL COMMENT '授权书到期日',
  CUST_MANAGER varchar(50) DEFAULT NULL COMMENT '客户经理',
  QUERY_TYPE varchar(2) DEFAULT NULL COMMENT '查询类型',
  AUDITORS varchar(50) DEFAULT NULL COMMENT '授权审核人员',
  REMARKS varchar(50) DEFAULT NULL COMMENT '备注',
  BUSINESS_STATUS varchar(10) DEFAULT NULL COMMENT '业务办理状态',
  QUERYORGCODE varchar(100) DEFAULT NULL COMMENT '查询机构代码',
  USERNAME varchar(100) DEFAULT NULL COMMENT '系统用户名',
  ORIGINATEORGCODE varchar(100) DEFAULT NULL COMMENT '发起机构代码',
  ORIGINATEUSERCODE varchar(100) DEFAULT NULL COMMENT '发起用户代码',
  SERVICECODE varchar(100) DEFAULT NULL COMMENT '服务代码',
  REPORTNAME varchar(100) DEFAULT NULL COMMENT '信用报告文件名称',
  clno varchar(20) DEFAULT NULL COMMENT '证件号码前六位',
  RLSB varchar(1) DEFAULT NULL COMMENT '有无人脸识别',
  SHFS varchar(1) DEFAULT NULL COMMENT '授权方式',
  SQTIME varchar(20) DEFAULT NULL COMMENT '授权书到期日',
  YMQNAME varchar(30) DEFAULT NULL COMMENT '授权书到期日',
  MQNAME varchar(30) DEFAULT NULL COMMENT '面签授权人',
  YWFF varchar(20) DEFAULT NULL COMMENT '业务发放时间',
  YWSHS varchar(50) DEFAULT NULL COMMENT '业务申请书编号',
  YWLB varchar(2) DEFAULT NULL COMMENT '业务类别',
  SFYD varchar(1) DEFAULT NULL COMMENT '是否异地查询',
  USEPERSON varchar(30) DEFAULT NULL COMMENT '报告使用人',
  PRIMARY KEY (ID) USING BTREE,
  KEY IDX_CIFM_PERSON_INFO_INDEX (CLIENT_NAME,ID) USING BTREE,
  KEY index_CIFM_PERSON_INFO (ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='征信查询个人信息表';

-- ----------------------------
-- Table structure for cifm_person_info_his
-- ----------------------------
DROP TABLE IF EXISTS cifm_person_info_his;
CREATE TABLE cifm_person_info_his (
  ID varchar(64) DEFAULT NULL COMMENT '查询编号',
  CLIENT_NAME varchar(100) DEFAULT NULL COMMENT '被查询人姓名',
  CREDENTIALS_TYPE varchar(10) DEFAULT NULL COMMENT '证件类型',
  CREDENTIALS_NO varchar(150) DEFAULT NULL COMMENT '证件号码',
  QUERY_REASON varchar(2) DEFAULT NULL COMMENT '查询原因',
  QUERY_VERSION varchar(2) DEFAULT NULL COMMENT '查询版本',
  WARRANT_MATURITY_DATE varchar(20) DEFAULT NULL COMMENT '授权书到期日',
  CUST_MANAGER varchar(50) DEFAULT NULL COMMENT '客户经理',
  QUERY_TYPE varchar(2) DEFAULT NULL COMMENT '查询类型',
  AUDITORS varchar(50) DEFAULT NULL COMMENT '授权审核人员',
  REMARKS varchar(50) DEFAULT NULL COMMENT '备注',
  BUSINESS_STATUS varchar(10) DEFAULT NULL COMMENT '业务办理状态',
  QUERYORGCODE varchar(100) DEFAULT NULL COMMENT '查询机构代码',
  USERNAME varchar(100) DEFAULT NULL COMMENT '系统用户名',
  ORIGINATEORGCODE varchar(100) DEFAULT NULL COMMENT '发起机构代码',
  ORIGINATEUSERCODE varchar(100) DEFAULT NULL COMMENT '发起用户代码',
  SERVICECODE varchar(100) DEFAULT NULL COMMENT '服务代码',
  REPORTNAME varchar(100) DEFAULT NULL COMMENT '信用报告文件名称',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY IDX_CIFM_PERSON_INFO_HIS_INDEX (ID,CLIENT_NAME) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='征信查询个人信息历史表';

-- ----------------------------
-- Table structure for cifm_product
-- ----------------------------
DROP TABLE IF EXISTS cifm_product;
CREATE TABLE cifm_product (
  product_id varchar(20) DEFAULT NULL COMMENT '产品id',
  product_name varchar(100) DEFAULT NULL COMMENT '产品名称',
  product_status varchar(10) DEFAULT NULL COMMENT '产品状态',
  product_describe varchar(100) DEFAULT NULL COMMENT '产品描述',
  company varchar(100) DEFAULT NULL COMMENT '机构',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  YWLB varchar(2) DEFAULT NULL COMMENT '业务类别',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品表';

-- ----------------------------
-- Table structure for cifm_query_date_operator
-- ----------------------------
DROP TABLE IF EXISTS cifm_query_date_operator;
CREATE TABLE cifm_query_date_operator (
  PARA_TYPE varchar(20) NOT NULL COMMENT '参数类型(1个人，2企业)',
  LIMT_DATE varchar(50) DEFAULT NULL COMMENT '时间(单位：天)',
  COMPANY varchar(10) DEFAULT NULL COMMENT '法人',
  ORG_ID varchar(100) DEFAULT NULL COMMENT '机构ID',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='查询时限设置表';

-- ----------------------------
-- Table structure for cifm_query_date_operator1
-- ----------------------------
DROP TABLE IF EXISTS cifm_query_date_operator1;
CREATE TABLE cifm_query_date_operator1 (
  PARA_TYPE varchar(20) NOT NULL COMMENT '参数类型(1个人，2企业)',
  LIMT_DATE varchar(50) DEFAULT NULL COMMENT '时间(单位：天)',
  COMPANY varchar(10) DEFAULT NULL COMMENT '法人',
  ORG_ID varchar(100) DEFAULT NULL COMMENT '机构ID',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='查询时限设置表';

-- ----------------------------
-- Table structure for cifm_query_frequency
-- ----------------------------
DROP TABLE IF EXISTS cifm_query_frequency;
CREATE TABLE cifm_query_frequency (
  USERNAME varchar(20) DEFAULT NULL COMMENT '用户登录名',
  QUERY_MIN_COUNT int(11) DEFAULT NULL COMMENT '平均查询笔数下限值',
  QUERY_MULTIPLE decimal(10,0) DEFAULT NULL COMMENT '查询激增预警倍数',
  QUERY_MONTH varchar(6) DEFAULT NULL COMMENT '当前月份',
  QUERY_COUNT int(11) DEFAULT NULL COMMENT '本月查询次数',
  AVG_QUERY_COUNT int(11) DEFAULT NULL COMMENT '前三个月查询平均次数',
  COMPANY varchar(10) DEFAULT NULL COMMENT '法人编码',
  USER_ID varchar(32) DEFAULT NULL COMMENT '用户ID',
  USER_TYPE varchar(5) DEFAULT NULL COMMENT '用户类型(1:个人，2:企业)',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户查询次数设置表';

-- ----------------------------
-- Table structure for cifm_user_query_count
-- ----------------------------
DROP TABLE IF EXISTS cifm_user_query_count;
CREATE TABLE cifm_user_query_count (
  ORG_ID varchar(50) DEFAULT NULL COMMENT '机构号',
  USER_ID varchar(255) DEFAULT NULL COMMENT '用户名称',
  APPLICATION_TIME datetime DEFAULT NULL COMMENT '申请日期',
  ENTER_QUERY_COUNT varchar(32) DEFAULT NULL COMMENT '企业查询次数',
  PERSONAL_QUERY_COUNT varchar(32) DEFAULT NULL COMMENT '个人查询次数',
  TOTAL varchar(32) DEFAULT NULL COMMENT '总计',
  ORG_CODE varchar(50) DEFAULT NULL COMMENT 'ORG_CODE',
  ORG_NAME varchar(50) DEFAULT NULL COMMENT 'ORG_NAME',
  USER_CODE varchar(50) DEFAULT NULL COMMENT 'USER_CODE',
  USER_NAME varchar(50) DEFAULT NULL COMMENT 'USER_NAME',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户查询量统计表';

-- ----------------------------
-- Table structure for cip_data_reportid
-- ----------------------------
DROP TABLE IF EXISTS cip_data_reportid;
CREATE TABLE cip_data_reportid (
  NAME varchar(50) DEFAULT NULL COMMENT '被查询人姓名',
  ID_NO varchar(50) DEFAULT NULL COMMENT '证件号码',
  PHONE varchar(50) DEFAULT NULL COMMENT '电话号码',
  CREATE_TIME varchar(50) DEFAULT NULL COMMENT '查询时间',
  REPORT_ID varchar(64) DEFAULT NULL COMMENT '报告编号',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='cip数据对比结果表';

-- ----------------------------
-- Table structure for com_actual_controller
-- ----------------------------
DROP TABLE IF EXISTS com_actual_controller;
CREATE TABLE com_actual_controller (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  TYPE_IDENTITY_NUM varchar(100) DEFAULT NULL COMMENT '实际控制人身份标识号码',
  TYPE_IDENTITY varchar(100) DEFAULT NULL COMMENT '实际控制人身份类型',
  NAME_IDENTITY varchar(150) DEFAULT NULL COMMENT '实际控制人名称',
  TYPE_IDENTITY_LOGO varchar(100) DEFAULT NULL COMMENT '实际控制人身份标识类型',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='实际控制人信息';

-- ----------------------------
-- Table structure for com_adva_pay_detail
-- ----------------------------
DROP TABLE IF EXISTS com_adva_pay_detail;
CREATE TABLE com_adva_pay_detail (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL_NO varchar(64) DEFAULT NULL COMMENT '流水号',
  CREDIT_ORG varchar(30) DEFAULT NULL COMMENT '授信机构',
  CURRENCY varchar(10) DEFAULT NULL COMMENT '币种',
  ADVA_PAY_SUM varchar(15) DEFAULT NULL COMMENT '垫款金额',
  ADVA_PAY_BALANCE varchar(15) DEFAULT NULL COMMENT '垫款余额',
  ADVA_PAY_DATE varchar(20) DEFAULT NULL COMMENT '垫款日期',
  ADVA_SETTLE_DATE varchar(20) DEFAULT NULL COMMENT '结清日期',
  FIVE_TYPE varchar(10) DEFAULT NULL COMMENT '五级分类',
  ORIG_BUSS varchar(50) DEFAULT NULL COMMENT '原业务',
  SETTLE_STATUS varchar(5) DEFAULT NULL COMMENT '结清状态(0：未结清,1：已结清)',
  REMARKS varchar(200) DEFAULT NULL COMMENT '备注',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='垫款明细';

-- ----------------------------
-- Table structure for com_asset_disp_debt_detail
-- ----------------------------
DROP TABLE IF EXISTS com_asset_disp_debt_detail;
CREATE TABLE com_asset_disp_debt_detail (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL_NO varchar(64) DEFAULT NULL COMMENT '流水号',
  DISP_ORG varchar(30) DEFAULT NULL COMMENT '处置机构',
  CURRENCY varchar(10) DEFAULT NULL COMMENT '币种',
  ORIG_AMOUNT varchar(15) DEFAULT NULL COMMENT '原始金额',
  REC_DATE varchar(20) DEFAULT NULL COMMENT '接收日期',
  balance varchar(20) DEFAULT NULL COMMENT '余额',
  LAST_DISP_DATE varchar(20) DEFAULT NULL COMMENT '最近一次处置日期',
  SETTLE_STATUS varchar(2) DEFAULT NULL COMMENT '结清状态(0：未结清,1：已结清)',
  REMARKS varchar(200) DEFAULT NULL COMMENT '备注',
  CURRENCY2 varchar(10) DEFAULT NULL COMMENT 'CURRENCY2',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='资产公司处置债务明细';

-- ----------------------------
-- Table structure for com_bad_assets_disp_summ
-- ----------------------------
DROP TABLE IF EXISTS com_bad_assets_disp_summ;
CREATE TABLE com_bad_assets_disp_summ (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  BAD_ASSETS_TYPE varchar(5) DEFAULT NULL COMMENT '不良资产类型(01：有资产管理公司处置的债务,02：欠息,03：垫款,04：担保代偿或第三方代偿的债务,05：不良资产剥离（不存在未结清状态）)',
  BAD_ASSETS_NUM varchar(20) DEFAULT NULL COMMENT '笔数',
  BAD_ASSETS_BALANCE varchar(15) DEFAULT NULL COMMENT '余额',
  LAST_DISPOSAL_DATE varchar(20) DEFAULT NULL COMMENT '最后一次处置日期',
  SETTLE_STATUS varchar(20) DEFAULT NULL COMMENT '结清状态(0:未结清，1：已结清)',
  BAD_ASSETS_TYPE2 varchar(5) DEFAULT NULL COMMENT 'BAD_ASSETS_TYPE2',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='未结清不良资产处置信息概要';

-- ----------------------------
-- Table structure for com_bank_acc_attacged_info
-- ----------------------------
DROP TABLE IF EXISTS com_bank_acc_attacged_info;
CREATE TABLE com_bank_acc_attacged_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL_NO varchar(64) DEFAULT NULL COMMENT '流水号',
  CREDIT_ORG varchar(50) DEFAULT NULL COMMENT '授信机构',
  BANK_ACC_NUM varchar(20) DEFAULT NULL COMMENT '笔数',
  TH_BALANCE varchar(15) DEFAULT NULL COMMENT '30天余额',
  SIX_BALANCE varchar(15) DEFAULT NULL COMMENT '60天余额',
  NI_BALANCE varchar(15) DEFAULT NULL COMMENT '90天余额',
  MOR_NI_BALANCE varchar(15) DEFAULT NULL COMMENT '90+天余额',
  REMARKS varchar(200) DEFAULT NULL COMMENT '备注',
  TOTAL varchar(20) DEFAULT NULL COMMENT '总和',
  HIS_RECORD varchar(100) DEFAULT NULL COMMENT '历史记录',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='银承附加信息';

-- ----------------------------
-- Table structure for com_borrom_repay
-- ----------------------------
DROP TABLE IF EXISTS com_borrom_repay;
CREATE TABLE com_borrom_repay (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  NUM_OTHER_TRANS_BORROW varchar(100) DEFAULT NULL COMMENT '其他借贷交易账户数',
  BALANCE_NUM_OTHER_TRANS_BORROW varchar(100) DEFAULT NULL COMMENT '其他借贷交易账户余额',
  TYPE_RESPON varchar(100) DEFAULT NULL COMMENT '责任类型',
  AMOUNT_REPAY_RECOVER varchar(100) DEFAULT NULL COMMENT '被追偿账户的还款责任金额',
  BALANCE_NUM_OTHER_BAD varchar(100) DEFAULT NULL COMMENT '其他借贷交易账户不良类余额',
  NUM_AMONUT_ACCOUNT varchar(100) DEFAULT NULL COMMENT '被追偿账户数',
  BALANCE_NUM_RECOVER varchar(100) DEFAULT NULL COMMENT '被追偿账户余额',
  AMOUNT_REPAY_RECOVER_OTHERS varchar(100) DEFAULT NULL COMMENT '其他借贷交易的还款责任金额',
  BALANCE_NUM_OTHER_FOCUS varchar(100) DEFAULT NULL COMMENT '其他借贷交易账户关注类余额',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='借贷交易相关还款责任汇总信';

-- ----------------------------
-- Table structure for com_bor_discount
-- ----------------------------
DROP TABLE IF EXISTS com_bor_discount;
CREATE TABLE com_bor_discount (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  DIS_ORG_ID varchar(100) DEFAULT NULL COMMENT '贴现账户分机构汇总信息编号',
  REPAY_RESP_BALA varchar(100) DEFAULT NULL COMMENT '相关还款责任金额',
  OVER_PRINCIPAL varchar(100) DEFAULT NULL COMMENT '逾期本金',
  FIVE_CLA varchar(100) DEFAULT NULL COMMENT '五级分类',
  SMART_BUS varchar(100) DEFAULT NULL COMMENT '业务种类细分',
  REPAY_RESP_TYPE varchar(100) DEFAULT NULL COMMENT '相关还款责任类型',
  TYPE_ORG varchar(100) DEFAULT NULL COMMENT '业务管理机构类型',
  BALANCE_NUM varchar(100) DEFAULT NULL COMMENT '余额',
  LEN_SUM varchar(100) DEFAULT NULL COMMENT '借款金额',
  NUM_GUAR_CONTRA varchar(100) DEFAULT NULL COMMENT '保证合同编号',
  CODE_ORG varchar(100) DEFAULT NULL COMMENT '业务管理机构代码',
  OVER_SUM varchar(100) DEFAULT NULL COMMENT '逾期总额',
  NUM_ACCOUNT varchar(100) DEFAULT NULL COMMENT '账户数',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='相关还款责任贴现账户分机构汇总信息单元';

-- ----------------------------
-- Table structure for com_bor_undiscount
-- ----------------------------
DROP TABLE IF EXISTS com_bor_undiscount;
CREATE TABLE com_bor_undiscount (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  NUM_GUAR_CONTRA varchar(100) DEFAULT NULL COMMENT '保证合同编号',
  CRED_ID varchar(100) DEFAULT NULL COMMENT '账户编号',
  CODE_ORG varchar(100) DEFAULT NULL COMMENT '业务管理机构代码',
  FIVE_CLA varchar(100) DEFAULT NULL COMMENT '五级分类',
  STAT_REPAY varchar(100) DEFAULT NULL COMMENT '还款状态',
  TYPE_BUSINESS varchar(100) DEFAULT NULL COMMENT '业务种类',
  LEN_SUM varchar(100) DEFAULT NULL COMMENT '借款金额',
  SMART_BUS varchar(100) DEFAULT NULL COMMENT '业务种类细分',
  LINE_CREDIT varchar(100) DEFAULT NULL COMMENT '信用额度',
  TYPE_BOR varchar(100) DEFAULT NULL COMMENT '主借款人身份类别',
  CURRENCY varchar(100) DEFAULT NULL COMMENT '币种',
  OVER_SUM varchar(100) DEFAULT NULL COMMENT '逾期总额',
  TYPE_REPAY_PES varchar(100) DEFAULT NULL COMMENT '相关还款责任人类型',
  TYPE_ORG varchar(100) DEFAULT NULL COMMENT '业务管理机构类型',
  OVER_MONTH varchar(100) DEFAULT NULL COMMENT '逾期月数',
  NUM_MONTH_REMAIN varchar(100) DEFAULT NULL COMMENT '剩余还款月数',
  TYPE_ACC varchar(100) DEFAULT NULL COMMENT '账户类型',
  CURRENCY_REPAY varchar(100) DEFAULT NULL COMMENT '币种（相关还款责任金额）',
  DUE_TIME_DATE varchar(100) DEFAULT NULL COMMENT '到期日期',
  OVER_PRINCIPAL varchar(100) DEFAULT NULL COMMENT '逾期本金',
  DATE_INFO_REPORT varchar(100) DEFAULT NULL COMMENT '信息报告日期',
  REPAY_RESP_BALA varchar(100) DEFAULT NULL COMMENT '相关还款责任金额',
  DATE_OPEN varchar(100) DEFAULT NULL COMMENT '开立日期',
  BALANCE_NUM varchar(100) DEFAULT NULL COMMENT '余额',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='相关还款责任借贷账户（不含贴现）信息单元';

-- ----------------------------
-- Table structure for com_car_ass_lia_ns_info
-- ----------------------------
DROP TABLE IF EXISTS com_car_ass_lia_ns_info;
CREATE TABLE com_car_ass_lia_ns_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  NUM_ORG varchar(40) DEFAULT NULL COMMENT '业务管理机构代码',
  REPORT_TYPE varchar(40) DEFAULT NULL COMMENT '报表类型',
  MATERIAL varchar(40) DEFAULT NULL COMMENT '材料',
  SET_ASIDE_FUNDS varchar(40) DEFAULT NULL COMMENT '拨出经费',
  OUT_CAR varchar(40) DEFAULT NULL COMMENT '事业支出',
  PAY_BUS varchar(40) DEFAULT NULL COMMENT '经营支出',
  PAY_OUT_TOP varchar(40) DEFAULT NULL COMMENT '上缴上级支出',
  SUM_ASSET_CLASS varchar(40) DEFAULT NULL COMMENT '资产部类总计',
  SHOULD_BUDGET_PAR varchar(40) DEFAULT NULL COMMENT '应缴预算款',
  LIA_SUM varchar(40) DEFAULT NULL COMMENT '负债合计',
  DRA_FUN_SO varchar(40) DEFAULT NULL COMMENT '一般基金',
  INCOME_SUM varchar(40) DEFAULT NULL COMMENT '收入合计',
  FINA_ID varchar(40) DEFAULT NULL COMMENT '财务报表编号',
  MONEY varchar(40) DEFAULT NULL COMMENT '现金',
  PAY_SPEFUN varchar(40) DEFAULT NULL COMMENT '专款支出',
  CARR_FOR_SEL_INFRAS varchar(40) DEFAULT NULL COMMENT '结转自筹基建',
  BALA_MANG varchar(40) DEFAULT NULL COMMENT '经营结余',
  SUM_SET varchar(40) DEFAULT NULL COMMENT '净资产合计',
  DIA_INTO_SPEFUND varchar(40) DEFAULT NULL COMMENT '拨入专款',
  NUM_FINA varchar(40) DEFAULT NULL COMMENT '业务管理机构',
  SMART_TYPE_REPORT varchar(40) DEFAULT NULL COMMENT '报表类型细分',
  OTHER_SHOULD_PAR varchar(40) DEFAULT NULL COMMENT '其他应收款',
  DIA_OUT_SPEFUN varchar(40) DEFAULT NULL COMMENT '拨出专款',
  TAX_SALE varchar(40) DEFAULT NULL COMMENT '销售税金',
  RECORD_BORROW varchar(40) DEFAULT NULL COMMENT '借记款项',
  DEFE_REVEN varchar(40) DEFAULT NULL COMMENT '预收账款',
  DRA_FUN varchar(40) DEFAULT NULL COMMENT '事业基金',
  TOP_IN_FIS varchar(40) DEFAULT NULL COMMENT '上级补助收入',
  REPORT_YEAR varchar(40) DEFAULT NULL COMMENT '报表年份',
  ASSET_SUM varchar(40) DEFAULT NULL COMMENT '资产合计',
  BALA_CAR varchar(40) DEFAULT NULL COMMENT '事业结余',
  SHOULD_PAPER varchar(40) DEFAULT NULL COMMENT '应收票据',
  SHOULD_PAR varchar(40) DEFAULT NULL COMMENT '应付账款',
  PAY_SUM varchar(40) DEFAULT NULL COMMENT '支出合计',
  MON_SPE varchar(40) DEFAULT NULL COMMENT '专用基金',
  INCOME_BUS varchar(40) DEFAULT NULL COMMENT '经营收入',
  INCOME_OTHERS varchar(40) DEFAULT NULL COMMENT '其他收入',
  IN_FIS_SUB varchar(40) DEFAULT NULL COMMENT '财政补助收入',
  OTH_SHOULD_PAY varchar(40) DEFAULT NULL COMMENT '其他应付款',
  SHOULD_CAR_PARA varchar(40) DEFAULT NULL COMMENT '应缴财政专户款',
  INVEST_FUND varchar(40) DEFAULT NULL COMMENT '投资基金',
  FIXED_FUND varchar(40) DEFAULT NULL COMMENT '固定基金',
  BANK_DEPOSIT varchar(40) DEFAULT NULL COMMENT '银行存款',
  FINISH_GOODS varchar(40) DEFAULT NULL COMMENT '产成品',
  FIS_ASSET varchar(40) DEFAULT NULL COMMENT '固定资产',
  UN_ASSET varchar(40) DEFAULT NULL COMMENT '无形资产',
  IN_CAR varchar(40) DEFAULT NULL COMMENT '事业收入',
  IN_AFF_PAY varchar(40) DEFAULT NULL COMMENT '附属单位缴款',
  PRE_PAR varchar(40) DEFAULT NULL COMMENT '预付账款',
  FOREIGN_INVEST varchar(40) DEFAULT NULL COMMENT '对外投资',
  THE_COST varchar(40) DEFAULT NULL COMMENT '成本费用',
  SHOULD_PAY_TAX varchar(40) DEFAULT NULL COMMENT '应交税金',
  SUM_LIA varchar(40) DEFAULT NULL COMMENT '负债部类总计',
  DETACH_SUBSIDY varchar(20) DEFAULT NULL COMMENT '对附属单位补助',
  SHOULD_REPAR varchar(20) DEFAULT NULL COMMENT 'SHOULD_REPAR',
  SHOULD_RE_ACC varchar(20) DEFAULT NULL COMMENT '应收账款',
  SHOULD_PAY_BILL varchar(20) DEFAULT NULL COMMENT '应付票据',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='事业单位资产负债表（1997 版）信息单元';

-- ----------------------------
-- Table structure for com_car_ass_lia_ot_info
-- ----------------------------
DROP TABLE IF EXISTS com_car_ass_lia_ot_info;
CREATE TABLE com_car_ass_lia_ot_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  LINE_CAR_SHOULD varchar(40) DEFAULT NULL COMMENT '财政应返还额度',
  UNACTIV_SUM varchar(40) DEFAULT NULL COMMENT '非流动负债合计',
  BAL_SET_SUM varchar(40) DEFAULT NULL COMMENT '负债和净资产总计',
  FINA_ID varchar(40) DEFAULT NULL COMMENT '财务报表编号',
  SHORT_TERM_INVES varchar(40) DEFAULT NULL COMMENT '短期投资',
  SHOULD_PAPER varchar(40) DEFAULT NULL COMMENT '应付票据',
  UNFINA_BALA varchar(40) DEFAULT NULL COMMENT '非财政补助结余',
  BALA_MANG varchar(40) DEFAULT NULL COMMENT '经营结余',
  SUM_SET varchar(40) DEFAULT NULL COMMENT '净资产合计',
  REPORT_YEAR varchar(40) DEFAULT NULL COMMENT '报表年份',
  REPORT_TYPE varchar(40) DEFAULT NULL COMMENT '报表类型',
  FLOW_ASSET_SUM varchar(40) DEFAULT NULL COMMENT '流动资产合计',
  PRICE_FIX_ASSET varchar(40) DEFAULT NULL COMMENT '固定资产原价',
  SHOULD_SALARY varchar(40) DEFAULT NULL COMMENT '应付职工薪酬',
  FLOW_LIA_SUM varchar(40) DEFAULT NULL COMMENT '流动负债合计',
  BORR_LONGTIM varchar(40) DEFAULT NULL COMMENT '长期借款',
  UNACTIV_MONY varchar(40) DEFAULT NULL COMMENT '非流动资产基金',
  FINA_AID varchar(40) DEFAULT NULL COMMENT '财政补助结转',
  INVENTORY varchar(40) DEFAULT NULL COMMENT '存货',
  OTHER_FLOW_ASSET varchar(40) DEFAULT NULL COMMENT '其他流动资产',
  UN_ASSET_PRICE varchar(40) DEFAULT NULL COMMENT '无形资产原价',
  UNFLOW_ASSET_SUM varchar(40) DEFAULT NULL COMMENT '非流动资产合计',
  SHOULD_CONTR_PARA varchar(40) DEFAULT NULL COMMENT '应缴国库款',
  SHOULD_REVEN varchar(40) DEFAULT NULL COMMENT '应付账款',
  ENGINEERING varchar(40) DEFAULT NULL COMMENT '在建工程',
  SUM_SELL varchar(40) DEFAULT NULL COMMENT '累计摊销',
  SHOULD_PAY_TAX varchar(40) DEFAULT NULL COMMENT '应缴税费',
  PAY_LONGTIM varchar(40) DEFAULT NULL COMMENT '长期应付款',
  SUM_LIA varchar(40) DEFAULT NULL COMMENT '负债合计',
  NUM_FINA varchar(40) DEFAULT NULL COMMENT '业务管理机构',
  LONG_TERM_INVEST varchar(40) DEFAULT NULL COMMENT '长期投资',
  FIS_ASSET varchar(40) DEFAULT NULL COMMENT '固定资产',
  UN_ASSET varchar(40) DEFAULT NULL COMMENT '无形资产',
  WAIT_ASSET_CAUS varchar(40) DEFAULT NULL COMMENT '待处置资产损溢',
  SHORT_TIME_BORR varchar(40) DEFAULT NULL COMMENT '短期借款',
  DRA_FUN varchar(40) DEFAULT NULL COMMENT '事业基金',
  MON_SPE varchar(40) DEFAULT NULL COMMENT '专用基金',
  FINA_BALA varchar(40) DEFAULT NULL COMMENT '财政补助结余',
  BALA_CAR varchar(40) DEFAULT NULL COMMENT '事业结余',
  NUM_ORG varchar(40) DEFAULT NULL COMMENT '业务管理机构代码',
  MONEY_FUND varchar(40) DEFAULT NULL COMMENT '货币资金',
  SHOULD_PAR varchar(40) DEFAULT NULL COMMENT '应收账款',
  PRE_PAR varchar(40) DEFAULT NULL COMMENT '预付账款',
  SUM_DIS_OLD varchar(40) DEFAULT NULL COMMENT '累计折旧',
  SUM_ASSET varchar(40) DEFAULT NULL COMMENT '资产总计',
  SHOULD_CAR_PARA varchar(40) DEFAULT NULL COMMENT '应缴财政专户款',
  DEFE_REVEN varchar(40) DEFAULT NULL COMMENT '预收账款',
  UNFINA_AID varchar(40) DEFAULT NULL COMMENT '非财政补助结转',
  SMART_TYPE_REPORT varchar(40) DEFAULT NULL COMMENT '报表类型细分',
  OTHER_SHOULD_PAR varchar(40) DEFAULT NULL COMMENT '其他应收款',
  OTH_SHOULD_PAY varchar(40) DEFAULT NULL COMMENT '其他应付款',
  OTH_FLOW_LIA varchar(40) DEFAULT NULL COMMENT '其他流动负债',
  SHOULD_RE_BILL varchar(20) DEFAULT NULL COMMENT '应收票据',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='事业单位资产负债表（2013 版）信息单元';

-- ----------------------------
-- Table structure for com_car_ass_out_ns_info
-- ----------------------------
DROP TABLE IF EXISTS com_car_ass_out_ns_info;
CREATE TABLE com_car_ass_out_ns_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  NUM_FINA varchar(40) DEFAULT NULL COMMENT '业务管理机构',
  PAY_BUS varchar(40) DEFAULT NULL COMMENT '经营支出',
  SHOULD_PAY_TAX varchar(40) DEFAULT NULL COMMENT '应交所得税',
  NUM_ORG varchar(40) DEFAULT NULL COMMENT '业务管理机构代码',
  IN_CAR varchar(40) DEFAULT NULL COMMENT '事业收入',
  INCOME_OTHERS varchar(40) DEFAULT NULL COMMENT '其他收入',
  SMA_DIAINTO_SPEFUN varchar(40) DEFAULT NULL COMMENT '拨入专款小计',
  PAY_NOBUDG_OUT varchar(40) DEFAULT NULL COMMENT '预算外资金支出',
  PAY_SPEFUN varchar(40) DEFAULT NULL COMMENT '专款支出',
  NORMAL_BALANCE varchar(40) DEFAULT NULL COMMENT '正常收入结余',
  BUSS_SUM varchar(40) DEFAULT NULL COMMENT '经营结余',
  WITH_DRA_FUN varchar(40) DEFAULT NULL COMMENT '提取专用基金    ',
  REPORT_TYPE varchar(40) DEFAULT NULL COMMENT '报表类型',
  OUT_CAR varchar(40) DEFAULT NULL COMMENT '事业支出',
  SUM_SPEFUN varchar(40) DEFAULT NULL COMMENT '专款小计',
  PAY_LAST_YEAR_CAR varchar(40) DEFAULT NULL COMMENT '收回以前年度事业支出',
  SMA_INCOME_BUS varchar(40) DEFAULT NULL COMMENT '经营收入小计',
  DIA_INTO_SPEFUND varchar(40) DEFAULT NULL COMMENT '拨入专款',
  PAY_OUT_TOP varchar(40) DEFAULT NULL COMMENT '上缴上级支出',
  BUS_SMAR_SUM varchar(40) DEFAULT NULL COMMENT '经营支出小计',
  PAY_SUM varchar(40) DEFAULT NULL COMMENT '支出总计',
  REPORT_YEAR varchar(40) DEFAULT NULL COMMENT '报表年份',
  IN_AFF_PAY varchar(40) DEFAULT NULL COMMENT '附属单位缴款',
  INCOME_NOTBUDG_OUT varchar(40) DEFAULT NULL COMMENT '预算外资金收入',
  INCOME_BUS varchar(40) DEFAULT NULL COMMENT '经营收入',
  INCOME_SUM varchar(40) DEFAULT NULL COMMENT '收入总计',
  SET_ASIDE_FUNDS varchar(40) DEFAULT NULL COMMENT '拨出经费',
  TAX_SALE varchar(40) DEFAULT NULL COMMENT '销售税金',
  BALAN_DIS varchar(40) DEFAULT NULL COMMENT '结余分配',
  SMA_SUM_CAR varchar(40) DEFAULT NULL COMMENT '事业收入小计',
  BEFOR_YEAR_BUSLOSS varchar(40) DEFAULT NULL COMMENT '以前年度经营亏损',
  BALA_OTHER_DIS varchar(40) DEFAULT NULL COMMENT '其他结余分配    ',
  IN_FIS_SUB_IN varchar(40) DEFAULT NULL COMMENT '财政补助收入',
  PAY_CAR_FIS varchar(40) DEFAULT NULL COMMENT '财政补助支出',
  CARR_FOR_SEL_INFRAS varchar(40) DEFAULT NULL COMMENT '结转自筹基建',
  PAY_CAR_SUM varchar(40) DEFAULT NULL COMMENT '事业支出小计',
  DIA_OUT_SPEFUN varchar(40) DEFAULT NULL COMMENT '拨出专款',
  CAR_BALANCE varchar(40) DEFAULT NULL COMMENT '事业结余',
  OUT_DRA_FUN varchar(40) DEFAULT NULL COMMENT '转入事业基金    ',
  FINA_ID varchar(40) DEFAULT NULL COMMENT '财务报表编号',
  SMART_TYPE_REPORT varchar(40) DEFAULT NULL COMMENT '报表类型细分',
  TOP_IN_FIS varchar(40) DEFAULT NULL COMMENT '上级补助收入',
  IN_FIS_SUB varchar(40) DEFAULT NULL COMMENT '对附属单位补助',
  TAX_SALE_IN varchar(40) DEFAULT NULL COMMENT '销售税金',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='事业单位收入支出表（1997 版）信息单元';

-- ----------------------------
-- Table structure for com_car_ass_out_ot_info
-- ----------------------------
DROP TABLE IF EXISTS com_car_ass_out_ot_info;
CREATE TABLE com_car_ass_out_ot_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  FINA_ID varchar(60) DEFAULT NULL COMMENT '财务报表编号',
  OUT_CAR varchar(60) DEFAULT NULL COMMENT '事业类支出',
  BALA_BEFOR_YEAR varchar(60) DEFAULT NULL COMMENT '弥补以前年度亏损后的经营结余',
  REPORT_YEAR varchar(60) DEFAULT NULL COMMENT '报表年份',
  OUT_FIS_SUB varchar(60) DEFAULT NULL COMMENT '事业支出（财政补助支出）',
  INCOM_DONA varchar(60) DEFAULT NULL COMMENT '（其他收入科目下）捐赠收入',
  PAY_OUT_TOP varchar(60) DEFAULT NULL COMMENT '上缴上级支出',
  REPORT_TYPE varchar(60) DEFAULT NULL COMMENT '报表类型',
  BALA_FIS_SUB varchar(60) DEFAULT NULL COMMENT '本期财政补助结转结余',
  BALA_BUS_ISS varchar(60) DEFAULT NULL COMMENT '本期经营结余',
  SMART_TYPE_REPORT varchar(60) DEFAULT NULL COMMENT '报表类型细分',
  INCOME_OTHERS varchar(60) DEFAULT NULL COMMENT '其他收入',
  OUT_AFF_PAY varchar(60) DEFAULT NULL COMMENT '对附属单位补助支出',
  PAY_BUS varchar(60) DEFAULT NULL COMMENT '经营支出',
  BALA_IN_YEAR varchar(60) DEFAULT NULL COMMENT '本年非财政补助结转结余',
  OUT_DRA_FUN varchar(60) DEFAULT NULL COMMENT '转入事业基金',
  IN_FIS_SUB varchar(60) DEFAULT NULL COMMENT '财政补助收入',
  IN_CAR varchar(60) DEFAULT NULL COMMENT '事业收入',
  IN_AFF_PAY varchar(60) DEFAULT NULL COMMENT '附属单位上缴收入',
  IN_CAR_CLAS varchar(60) DEFAULT NULL COMMENT '事业类收入',
  TOP_IN_FIS varchar(60) DEFAULT NULL COMMENT '上级补助收入',
  OUT_CAR_UNFIS varchar(60) DEFAULT NULL COMMENT '事业支出（非财政补助支出）',
  BALA_UNFIS varchar(60) DEFAULT NULL COMMENT '非财政补助结转',
  BALA_FIS_ONYEAR varchar(60) DEFAULT NULL COMMENT '本年非财政补助结余',
  SHOULD_PAY_TAX varchar(60) DEFAULT NULL COMMENT '应缴企业所得税',
  WITH_DRA_FUN varchar(60) DEFAULT NULL COMMENT '提取专用基金',
  NUM_FINA varchar(60) DEFAULT NULL COMMENT '业务管理机构',
  NUM_ORG varchar(60) DEFAULT NULL COMMENT '业务管理机构代码',
  BALA_CAR_ISS varchar(60) DEFAULT NULL COMMENT '本期事业结转结余',
  OUT_OTHERS varchar(60) DEFAULT NULL COMMENT '其他支出',
  INCOME_BUS varchar(60) DEFAULT NULL COMMENT '经营收入',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='事业单位收入支出表（2013 版）信息单元';

-- ----------------------------
-- Table structure for com_cash_flow_seven_info
-- ----------------------------
DROP TABLE IF EXISTS com_cash_flow_seven_info;
CREATE TABLE com_cash_flow_seven_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  TAX_RECEIVE_OTHERS varchar(30) DEFAULT NULL COMMENT '收到其他与经营活动有关的现金',
  BUS_ACTI_CASH_FOLW varchar(30) DEFAULT NULL COMMENT '经营活动产生的现金流量净额',
  CASH_BUS_COMPANY varchar(30) DEFAULT NULL COMMENT '处置子公司及其他营业单位收到的现金净额',
  CASH_LONG_TERM varchar(30) DEFAULT NULL COMMENT '购建固定资产无形资产和其他长期资产所支付的现金',
  SMART_SUM_CA_INVEST varchar(30) DEFAULT NULL COMMENT '投资活动现金流出小计',
  RECE_OTHER_AC_CASH varchar(30) DEFAULT NULL COMMENT '收到其他与筹资活动有关的现金',
  PAY_OTHERS_CASH varchar(30) DEFAULT NULL COMMENT '支付其他与筹资活动有关的现金',
  IMPACT_EXCHANGE_RATE varchar(30) DEFAULT NULL COMMENT '汇率变动对现金及现金等价物的影响',
  SEME_CASH_BAL varchar(30) DEFAULT NULL COMMENT '现金及现金等价物净增加额',
  NET_PROFIT varchar(30) DEFAULT NULL COMMENT '净利润',
  INVEST_LOSS varchar(30) DEFAULT NULL COMMENT '投资损失',
  REDUCE_TAX varchar(30) DEFAULT NULL COMMENT '递延所得税资产减少',
  BUSS_SHOULD_REDUCE varchar(30) DEFAULT NULL COMMENT '经营性应收项目的减少',
  DEBT_CAPITAL varchar(30) DEFAULT NULL COMMENT '债务转为资本',
  CASH_BALA_STAR varchar(30) DEFAULT NULL COMMENT '现金的期初余额',
  OTHERS_NO varchar(30) DEFAULT NULL COMMENT '（不涉及现金收支的投资和筹资活动科目下）其他',
  SMART_TYPE_REPORT varchar(30) DEFAULT NULL COMMENT '报表类型细分',
  BUY_CASH varchar(30) DEFAULT NULL COMMENT '购买商品、接受劳务支付的现金',
  RECE_COMP_BUS_CASH varchar(30) DEFAULT NULL COMMENT '取得子公司及其他营业单位支付的现金净额',
  ASSET_PREPARE varchar(30) DEFAULT NULL COMMENT '资产减值准备',
  DEPRECIATION varchar(30) DEFAULT NULL COMMENT '固定资产折旧、油气资产折耗、生产性生物资产折旧',
  PUBLIC_LOSS varchar(30) DEFAULT NULL COMMENT '公允价值变动损失',
  REDUCE_INVENT varchar(30) DEFAULT NULL COMMENT '存货的减少',
  OTHERS varchar(30) DEFAULT NULL COMMENT '（净利润调节为经营活动现金流量科目下）其他',
  FINA_ID varchar(30) DEFAULT NULL COMMENT '财务报表编号',
  TAX_RECEIVE varchar(30) DEFAULT NULL COMMENT '收到的税费返还',
  LONG_TERM_INVEST varchar(30) DEFAULT NULL COMMENT '处置固定资产无形资产和其他长期资产所收回的现金净额',
  INVEST_CASH_NET varchar(30) DEFAULT NULL COMMENT '投资活动产生的现金流量净额',
  SMART_SUM_ACTI varchar(30) DEFAULT NULL COMMENT '筹资活动现金流入小计',
  START_SEME_CASH_BAL varchar(30) DEFAULT NULL COMMENT '期初现金及现金等价物余额',
  AMORTIZATION varchar(30) DEFAULT NULL COMMENT '无形资产摊销',
  LONG_TERM_AMOR varchar(30) DEFAULT NULL COMMENT '长期待摊费用摊销',
  FINA_CHAR varchar(30) DEFAULT NULL COMMENT '财务费用',
  INCRES_TAX varchar(30) DEFAULT NULL COMMENT '递延所得税负债增加',
  INVEST_RECE_CASH varchar(30) DEFAULT NULL COMMENT '取得投资收益所收到的现金',
  REPAY_PAY_CASH varchar(30) DEFAULT NULL COMMENT '偿还债务所支付的现金',
  PAY_CASH varchar(30) DEFAULT NULL COMMENT '分配股利、利润或偿付利息所支付的现金',
  RAISE_ACTI_FLOW varchar(30) DEFAULT NULL COMMENT '筹资活动现金流出小计',
  RAISE_ACTI_LINE varchar(30) DEFAULT NULL COMMENT '筹集活动产生的现金流量净额',
  AMORTIZATION_REDUCE varchar(30) DEFAULT NULL COMMENT '待摊费用减少',
  FIX_LOSS varchar(30) DEFAULT NULL COMMENT '固定资产报废损失',
  INCREAS_IN varchar(30) DEFAULT NULL COMMENT '现金及现金等价物净增加额',
  NUM_FINA varchar(30) DEFAULT NULL COMMENT '业务管理机构',
  CASH varchar(30) DEFAULT NULL COMMENT '销售商品和提供劳务收到的现金',
  SUM_INVE_CASH_IN varchar(30) DEFAULT NULL COMMENT '投资活动现金流入小计',
  REPORT_YEAR varchar(30) DEFAULT NULL COMMENT '报表年份',
  REPORT_TYPE varchar(30) DEFAULT NULL COMMENT '报表类型',
  RECE_INVEST_CASH varchar(30) DEFAULT NULL COMMENT '收回投资所收到的现金',
  PAY_OTHER_CASH varchar(30) DEFAULT NULL COMMENT '支付其他与投资活动有关的现金',
  BUSS_SHOULD_INCRES varchar(30) DEFAULT NULL COMMENT '经营性应付项目的增加',
  CASH_BALA_END varchar(30) DEFAULT NULL COMMENT '现金的期末余额',
  CASH_STAR_BA varchar(30) DEFAULT NULL COMMENT '现金等价物的期初余额',
  NUM_ORG varchar(30) DEFAULT NULL COMMENT '业务管理机构代码',
  SUM_BUSS_CASH_IN varchar(30) DEFAULT NULL COMMENT '经营活动现金流入小计',
  PAY_SOME_TAX varchar(30) DEFAULT NULL COMMENT '支付的各项税费',
  RECE_INST_CASH_OTHER varchar(30) DEFAULT NULL COMMENT '收到其他与投资活动有关的现金',
  TAKE_BORRO_RECE_CASH varchar(30) DEFAULT NULL COMMENT '取得借款收到的现金',
  INCREAS_WITHHOLDING varchar(30) DEFAULT NULL COMMENT '预提费用增加',
  BUS_ACTIV_CASH varchar(30) DEFAULT NULL COMMENT '经营活动产生的现金流量净额',
  ASSET_FIX_CAP varchar(30) DEFAULT NULL COMMENT '融资租入固定资产',
  PAY_EMPLOY_CASH varchar(30) DEFAULT NULL COMMENT '支付给职工以及为职工支付的现金',
  PAY_BUSS_OTHER_CASH varchar(30) DEFAULT NULL COMMENT '支付其他与经营活动有关的现金',
  SUM_BUSS_CASH_OUT varchar(30) DEFAULT NULL COMMENT '经营活动现金流出小计',
  INVEST_PAY_CASH varchar(30) DEFAULT NULL COMMENT '投资所支付的现金',
  CASH_INVE_ABSOR varchar(30) DEFAULT NULL COMMENT '吸收投资收到的现金',
  END_SEME_CASH_BAL varchar(30) DEFAULT NULL COMMENT '期末现金及现金等价物余额',
  ASSET_LOSS varchar(30) DEFAULT NULL COMMENT '处置固定资产无形资产和其他长期资产的损失',
  YEAR_COMPANY_DEBT varchar(30) DEFAULT NULL COMMENT '一年内到期的可转换公司债券',
  CASH_END_BA varchar(30) DEFAULT NULL COMMENT '现金等价物的期末余额',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='企业现金流量表（2007 版）信息单元';

-- ----------------------------
-- Table structure for com_cash_flow_two_info
-- ----------------------------
DROP TABLE IF EXISTS com_cash_flow_two_info;
CREATE TABLE com_cash_flow_two_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  FIXED_FUND_OLD varchar(40) DEFAULT NULL COMMENT '固定资产拆旧',
  SUM_BUSS_CASH_IN varchar(40) DEFAULT NULL COMMENT '经营活动现金流入小计',
  SUM_BUSS_CASH_OUT varchar(40) DEFAULT NULL COMMENT '经营活动现金流出小计',
  LONG_TERM_INVEST varchar(40) DEFAULT NULL COMMENT '处置固定资产无形资产和其他长期资产所收回的现金净额',
  SUM_INVE_CASH_IN varchar(40) DEFAULT NULL COMMENT '投资活动现金流入小计',
  REPAY_PAY_CASH varchar(40) DEFAULT NULL COMMENT '偿还债务所支付的现金',
  IMPACT_EXCHANGE_RATE varchar(40) DEFAULT NULL COMMENT '汇率变动对现金的影响',
  NET_PROFIT varchar(40) DEFAULT NULL COMMENT '净利润',
  INCREAS_WITHHOLDING varchar(40) DEFAULT NULL COMMENT '预提费用增加',
  FINA_CHAR varchar(40) DEFAULT NULL COMMENT '财务费用',
  OTHERS_NO varchar(40) DEFAULT NULL COMMENT '（不涉及现金收支的投资和筹资活动科目下）其他',
  CASH_STAR_BA varchar(40) DEFAULT NULL COMMENT '现金等价物的期初余额',
  RECE_INVEST_CASH varchar(40) DEFAULT NULL COMMENT '收回投资所收到的现金',
  SMART_SUM_CA_INVEST varchar(40) DEFAULT NULL COMMENT '投资活动现金流出小计',
  RAISE_ACTI_LINE varchar(40) DEFAULT NULL COMMENT '筹集活动产生的现金流量净额',
  SEME_CASH_BAL varchar(40) DEFAULT NULL COMMENT '现金及现金等价物净增加额',
  AMORTIZATION_REDUCE varchar(40) DEFAULT NULL COMMENT '待摊费用减少',
  REDUCE_INVENT varchar(40) DEFAULT NULL COMMENT '存货的减少',
  BUSS_SHOULD_REDUCE varchar(40) DEFAULT NULL COMMENT '经营性应收项目的减少',
  CASH_BALA_END varchar(40) DEFAULT NULL COMMENT '现金的期末余额',
  RECE_OTHER_AC_CASH varchar(40) DEFAULT NULL COMMENT '收到的其他与经营活动有关的现金',
  BUY_CASH varchar(40) DEFAULT NULL COMMENT '购买商品、接受劳务支付的现金',
  PAY_SOME_TAX varchar(40) DEFAULT NULL COMMENT '支付的各项税费',
  PAY_OTHERS_CASH_BU varchar(40) DEFAULT NULL COMMENT '支付的其他与经营活动有关的现金',
  INVEST_RECE_CASH varchar(40) DEFAULT NULL COMMENT '取得投资收益所收到的现金',
  RECEIVE_OTHER_CASH varchar(40) DEFAULT NULL COMMENT '收到的其他与投资活动有关的现金',
  RECE_OTHER_AC_CASH_I varchar(40) DEFAULT NULL COMMENT '收到的其他与筹资活动有关的现金',
  ASSET_REDUCE varchar(40) DEFAULT NULL COMMENT '计提的资产减值准备',
  LONG_TERM_AMOR varchar(40) DEFAULT NULL COMMENT '长期待摊费用摊销',
  BUS_ACTI_CASH_FO varchar(40) DEFAULT NULL COMMENT '经营活动产生的现金流量净额',
  CASH_BALA_STAR varchar(40) DEFAULT NULL COMMENT '现金的期初余额',
  FINA_ID varchar(40) DEFAULT NULL COMMENT '财务报表编号',
  CASH_LONG_TERM varchar(40) DEFAULT NULL COMMENT '购建固定资产无形资产和其他长期资产所支付的现金',
  BORR_RECE_CASH varchar(40) DEFAULT NULL COMMENT '借款所收到的现金',
  DEFE_TAX_CREDIT varchar(40) DEFAULT NULL COMMENT '递延税款贷项',
  OTHERS varchar(40) DEFAULT NULL COMMENT '（净利润调节为经营活动现金流量科目下）其他',
  REPORT_YEAR varchar(40) DEFAULT NULL COMMENT '报表年份',
  CASH_GOOD varchar(40) DEFAULT NULL COMMENT '销售商品和提供劳务收到的现金',
  TAX_RECEIVE varchar(40) DEFAULT NULL COMMENT '收到的税费返还',
  PAY_OTHERS_CASH_BUSS varchar(40) DEFAULT NULL COMMENT '支付的其他与筹资活动有关的现金',
  FIX_LOSS varchar(40) DEFAULT NULL COMMENT '固定资产报废损失',
  DEBT_CAPITAL varchar(40) DEFAULT NULL COMMENT '债务转为资本',
  NUM_ORG varchar(40) DEFAULT NULL COMMENT '业务管理机构代码',
  REPORT_TYPE varchar(40) DEFAULT NULL COMMENT '报表类型',
  PAY_EMPLOY_CASH varchar(40) DEFAULT NULL COMMENT '支付给职工以及为职工支付的现金',
  BUS_ACTI_CASH_FOLW varchar(40) DEFAULT NULL COMMENT '经营活动产生的现金流量净额',
  INVEST_CASH_NET varchar(40) DEFAULT NULL COMMENT '投资活动产生的现金流量净额',
  SMART_SUM_ACTI varchar(40) DEFAULT NULL COMMENT '筹资活动现金流入小计',
  RAISE_ACTI_FLOW varchar(40) DEFAULT NULL COMMENT '筹资活动现金流出小计',
  ASSET_FIX_CAP varchar(40) DEFAULT NULL COMMENT '融资租入固定资产',
  SEME_CASH_BAL_IN varchar(40) DEFAULT NULL COMMENT '现金及现金等价物净增加额',
  NUM_FINA varchar(40) DEFAULT NULL COMMENT '业务管理机构',
  INVEST_PAY_CASH varchar(40) DEFAULT NULL COMMENT '投资所支付的现金',
  PAY_CASH varchar(40) DEFAULT NULL COMMENT '分配股利、利润或偿付利息所支付的现金',
  AMORTIZATION varchar(40) DEFAULT NULL COMMENT '无形资产摊销',
  ASSET_LOSS varchar(40) DEFAULT NULL COMMENT '处置固定资产无形资产和其他长期资产的损失',
  INVEST_LOSS varchar(40) DEFAULT NULL COMMENT '投资损失',
  BUSS_SHOULD_INCRES varchar(40) DEFAULT NULL COMMENT '经营性应付项目的增加',
  YEAR_COMPANY_DEBT varchar(40) DEFAULT NULL COMMENT '一年内到期的可转换公司债券',
  CASH_END_BA varchar(40) DEFAULT NULL COMMENT '现金等价物的期末余额',
  SMART_TYPE_REPORT varchar(40) DEFAULT NULL COMMENT '报表类型细分',
  INVE_OTHER_ACTI_CASH varchar(40) DEFAULT NULL COMMENT '支付的其他与投资活动有关的现金',
  CASH_INVE_ABSOR varchar(40) DEFAULT NULL COMMENT '吸收投资所收到的现金',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='企业现金流量表（2002 版）信息单元';

-- ----------------------------
-- Table structure for com_contro_person
-- ----------------------------
DROP TABLE IF EXISTS com_contro_person;
CREATE TABLE com_contro_person (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  CONTROL_NUM varchar(64) DEFAULT NULL COMMENT '主要组成人员个数',
  DATE_UPDATE_ACT varchar(64) DEFAULT NULL COMMENT '更新日期',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='主要成员表';

-- ----------------------------
-- Table structure for com_credit_basic_info
-- ----------------------------
DROP TABLE IF EXISTS com_credit_basic_info;
CREATE TABLE com_credit_basic_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  BORR_NAME varchar(300) DEFAULT NULL COMMENT '名称',
  REGI_ADDR varchar(400) DEFAULT NULL COMMENT '注册地址',
  REGI_TYPE varchar(200) DEFAULT NULL COMMENT '登记注册类型',
  REGI_NO varchar(200) DEFAULT NULL COMMENT '登记注册号',
  REGI_DATE varchar(200) DEFAULT NULL COMMENT '登记注册日期',
  LICENSE_DATE varchar(50) DEFAULT NULL,
  MECH_CODE varchar(70) DEFAULT NULL COMMENT '组织机构代码/统一社会信用代码',
  CHINA_CREDIT_CODE varchar(70) DEFAULT NULL COMMENT '中征码',
  COUNTRY_TAX_REGI_NO varchar(70) DEFAULT NULL COMMENT '国税登记号',
  LAND_TEX_REGI_NO varchar(70) DEFAULT NULL COMMENT '地税登记号',
  NUM_REPAY_LIA_DB varchar(70) DEFAULT NULL COMMENT '还款责任类型数量（担保）',
  NUM_REPAY_RECORD varchar(70) DEFAULT NULL COMMENT '还款表现记录条数',
  TYPE_ECONOMIC varchar(70) DEFAULT NULL COMMENT '经济类型',
  ADDRE_BUSS varchar(300) DEFAULT NULL COMMENT '办公/经营地址',
  NUM_SPE_TRANS varchar(70) DEFAULT NULL COMMENT '特定交易个数',
  SUB_INDUSTRY varchar(70) DEFAULT NULL COMMENT '所属行业',
  NUM_REPAY_LIA varchar(70) DEFAULT NULL COMMENT '还款责任类型数量(借贷)',
  TYPE_ORGAN varchar(70) DEFAULT NULL COMMENT '组织机构类型',
  SCALE_ENT varchar(70) DEFAULT NULL COMMENT '企业规模',
  ADDRESS_EDI varchar(300) DEFAULT NULL COMMENT '登记地址',
  YEAR_SETUP varchar(70) DEFAULT NULL COMMENT '成立年份',
  STATE_CX varchar(70) DEFAULT NULL COMMENT '存续状态',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='相关还款责任汇总信息单元';

-- ----------------------------
-- Table structure for com_credit_declare
-- ----------------------------
DROP TABLE IF EXISTS com_credit_declare;
CREATE TABLE com_credit_declare (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  CREDIT_DECLARE varchar(100) DEFAULT NULL COMMENT '征信中心说明',
  CREDIT_DECLARE_DATE varchar(20) DEFAULT NULL COMMENT '添加日期',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='征信中心说明';

-- ----------------------------
-- Table structure for com_credit_dissent
-- ----------------------------
DROP TABLE IF EXISTS com_credit_dissent;
CREATE TABLE com_credit_dissent (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  CREDIT_DISSENT varchar(100) DEFAULT NULL COMMENT '异议标注',
  CREDIT_DISSENT_DATE varchar(20) DEFAULT NULL COMMENT '添加日期',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='异议标注';

-- ----------------------------
-- Table structure for com_credit_grant_sum
-- ----------------------------
DROP TABLE IF EXISTS com_credit_grant_sum;
CREATE TABLE com_credit_grant_sum (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  USE_TOTAL_NON_REV_CREDT varchar(100) DEFAULT NULL COMMENT '已使用的非循环信用额度合计',
  REMAIN_TOTAL_NON_REV_CREDT varchar(100) DEFAULT NULL COMMENT '剩余可用的非循环额度合计',
  TOTAL_REV_CREDT varchar(100) DEFAULT NULL COMMENT '循环信用额度合计',
  REMAIN_TOTAL_REV_CREDT varchar(100) DEFAULT NULL COMMENT '剩余可用的循环额度合计',
  WHET_CREDIT_LIMT varchar(100) DEFAULT NULL COMMENT '是否包含授信限额',
  TOTAL_NON_REV_CREDT varchar(100) DEFAULT NULL COMMENT '非循环信用额度合计',
  USE_TOTAL_REV_CREDT varchar(100) DEFAULT NULL COMMENT '已使用的循环信用额度合计',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='授信协议汇总信息单元';

-- ----------------------------
-- Table structure for com_credit_info_data
-- ----------------------------
DROP TABLE IF EXISTS com_credit_info_data;
CREATE TABLE com_credit_info_data (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  CR_CREDIT_SUM varchar(100) DEFAULT NULL COMMENT '授信额度',
  CR_USED_SUM varchar(100) DEFAULT NULL COMMENT '已用额度',
  CR_LIM varchar(100) DEFAULT NULL COMMENT '授信限额',
  CODE_ORG varchar(100) DEFAULT NULL COMMENT '业务管理机构代码',
  END_DATE varchar(100) DEFAULT NULL COMMENT '终止日期',
  DATE_INFO_REPORT varchar(100) DEFAULT NULL COMMENT '信息报告日期',
  EFFEC_DATE varchar(100) DEFAULT NULL COMMENT '生效日期',
  TYPE_ORG varchar(100) DEFAULT NULL COMMENT '业务管理机构类型',
  CURRENCY varchar(100) DEFAULT NULL COMMENT '币种',
  CRED_ID varchar(100) DEFAULT NULL COMMENT '授信协议编号',
  QUOTA_CYC_MARK varchar(100) DEFAULT NULL COMMENT '额度循环标志',
  TYPE_CERD varchar(100) DEFAULT NULL COMMENT '授信额度类型',
  CR_LIM_ID varchar(100) DEFAULT NULL COMMENT '授信限额编号',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='授信协议信息单元';

-- ----------------------------
-- Table structure for com_custorm_fast_track
-- ----------------------------
DROP TABLE IF EXISTS com_custorm_fast_track;
CREATE TABLE com_custorm_fast_track (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  EXEM_TYPE varchar(5) DEFAULT NULL COMMENT '免检类型(01：绿色通道,02：免检)',
  APPROVAL_ORG varchar(100) DEFAULT NULL COMMENT '批准部门',
  EXEM_MERCH_NAME varchar(200) DEFAULT NULL COMMENT '免检商品名称',
  EXEM_NO varchar(30) DEFAULT NULL COMMENT '免检号',
  END_DATE varchar(20) DEFAULT NULL COMMENT '截止日期',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='海关快速通道';

-- ----------------------------
-- Table structure for com_debt_change_hist_summ
-- ----------------------------
DROP TABLE IF EXISTS com_debt_change_hist_summ;
CREATE TABLE com_debt_change_hist_summ (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  CHANGE_DATE varchar(20) DEFAULT NULL COMMENT '日期',
  ALL_DEBT_BALANCE varchar(15) DEFAULT NULL COMMENT '全部负债余额',
  bad_debt_balance varchar(20) DEFAULT NULL COMMENT '余额',
  MONTH varchar(100) DEFAULT NULL COMMENT '月份',
  NUM_OVER_DEBT varchar(100) DEFAULT NULL COMMENT '逾期账户数',
  NUM_OVER_PRINCIPAL varchar(100) DEFAULT NULL COMMENT '逾期本金账户数',
  OVER_PRINCIPAL varchar(100) DEFAULT NULL COMMENT '逾期本金',
  NUM_FOCUS_DEBT_BALANCE varchar(100) DEFAULT NULL COMMENT '关注类负债账户数',
  ALL_NUM_DEBT_BALANCE varchar(100) DEFAULT NULL COMMENT '全部负债账户数',
  OVER_SUM varchar(100) DEFAULT NULL COMMENT '逾期总额',
  FOCUS_DEBT_BALANCE varchar(100) DEFAULT NULL COMMENT '关注类负债余额',
  NUM_ACCOUNT_BAD_DEBT varchar(100) DEFAULT NULL COMMENT '不良类负债账户数',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='负债变化历史概要';

-- ----------------------------
-- Table structure for com_debt_hist_info
-- ----------------------------
DROP TABLE IF EXISTS com_debt_hist_info;
CREATE TABLE com_debt_hist_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SHORT_TERM_INVES varchar(20) DEFAULT NULL COMMENT '短期投资',
  SHOULD_PAPER_IN varchar(20) DEFAULT NULL COMMENT '应收票据',
  INVENTORY_MATER varchar(20) DEFAULT NULL COMMENT '存货原材料',
  MERGER_PRICE varchar(20) DEFAULT NULL COMMENT '合并价差',
  ENGINEERING varchar(20) DEFAULT NULL COMMENT '在建工程',
  DEFERR_ASSET_REPAIR varchar(20) DEFAULT NULL COMMENT '（递延资产科目下）固定资产修理',
  DEFE_REVEN varchar(20) DEFAULT NULL COMMENT '预收账款',
  SHOULD_WAGE varchar(20) DEFAULT NULL COMMENT '应付工资',
  SHOULD_PAY_TAX varchar(20) DEFAULT NULL COMMENT '应交税金',
  WITHHOLDING varchar(20) DEFAULT NULL COMMENT '预提费用',
  COLLE_CAPITAL varchar(20) DEFAULT NULL COMMENT '集体资本',
  FOREIGN_CAPITAL varchar(20) DEFAULT NULL COMMENT '外商资本',
  SURPLUS_RESERVES varchar(20) DEFAULT NULL COMMENT '盈余公积',
  REPORT_TYPE varchar(20) DEFAULT NULL COMMENT '报表类型',
  SM_REPORT_TY varchar(20) DEFAULT NULL COMMENT '报表类型细分',
  SHOULD_INTERST varchar(20) DEFAULT NULL COMMENT '应收利息',
  PRE_PAR varchar(20) DEFAULT NULL COMMENT '预付账款',
  INVENTORT_PRD varchar(20) DEFAULT NULL COMMENT '存货产成品',
  WAIT_ASSET_LOSS varchar(20) DEFAULT NULL COMMENT '待处理流动资产净损失',
  FLOW_ASSET_SUM varchar(20) DEFAULT NULL COMMENT '流动资产合计',
  FIX_ASSET_PRI varchar(20) DEFAULT NULL COMMENT '固定资产原价',
  FIX_ASSET_CLEAN varchar(20) DEFAULT NULL COMMENT '固定资产清理',
  OTHER_LON_GOODS varchar(20) DEFAULT NULL COMMENT '（其他长期资产科目下）特准储备物资',
  DEFE_TAX_CREDIT varchar(20) DEFAULT NULL COMMENT '递延税款贷项',
  PRIVATE_CAPITAL varchar(20) DEFAULT NULL COMMENT '个人资本',
  NUM_ORG varchar(20) DEFAULT NULL COMMENT '业务管理机构代码',
  SHOULD_DIVI varchar(20) DEFAULT NULL COMMENT '应收股利',
  FUT_MARGIN varchar(20) DEFAULT NULL COMMENT '期货保证金',
  SHOULD_SUB_ACC varchar(20) DEFAULT NULL COMMENT '应收补贴款',
  SUM_DIS varchar(20) DEFAULT NULL COMMENT '固定资产净值',
  FIX_ASSET_PRI_REDU varchar(20) DEFAULT NULL COMMENT '固定资产值减值准备',
  LAND_USE_RIGHT varchar(20) DEFAULT NULL COMMENT '无形资产科目下）土地使用权',
  SPE_STORAGE_FUND varchar(20) DEFAULT NULL COMMENT '（其他长期负债科目下）特准储备基金',
  SURPLUS_RE_G varchar(20) DEFAULT NULL COMMENT '（盈余公积科目下）公益金',
  MONEY_FUND varchar(20) DEFAULT NULL COMMENT '货币资金',
  SHOULD_ACCOUNT varchar(20) DEFAULT NULL COMMENT '应收账款',
  OTHER_SHOULD_PAR_S varchar(20) DEFAULT NULL COMMENT '其他应收款',
  AMOR varchar(20) DEFAULT NULL COMMENT '待摊费用',
  LONG_TERM_IN varchar(20) DEFAULT NULL COMMENT '一年内到期的长期债权投资',
  LONG_TERM_EQUI_INVE varchar(20) DEFAULT NULL COMMENT '长期股权投资',
  FIX_ASSET_LOSS varchar(20) DEFAULT NULL COMMENT '待处理固定资产净损失',
  UN_ASSET varchar(20) DEFAULT NULL COMMENT '无形资产',
  SHORT_TIME_BORR varchar(20) DEFAULT NULL COMMENT '短期借款',
  PAY_LONGTIM varchar(20) DEFAULT NULL COMMENT '长期应付款',
  SPE_SHOULD_PAR varchar(20) DEFAULT NULL COMMENT '专项应付款',
  OTHERS_LONG_TDEBT varchar(20) DEFAULT NULL COMMENT '其他长期负债',
  LIA_SUM varchar(20) DEFAULT NULL COMMENT '负债合计',
  PAID_IN_CAPITAL varchar(20) DEFAULT NULL COMMENT '实收资本',
  SURPLUS_RE_CAP varchar(20) DEFAULT NULL COMMENT '（盈余公积科目下）法定盈余公积',
  NUM_FIND varchar(20) DEFAULT NULL COMMENT '业务管理机构',
  OTHER_FLOW_ASSET varchar(20) DEFAULT NULL COMMENT '其他流动资产',
  LONG_TERM_SUM varchar(20) DEFAULT NULL COMMENT '长期投资合计',
  FIX_ASSET_WORTH varchar(20) DEFAULT NULL COMMENT '固定资产净额',
  DEFERR_ASSET varchar(20) DEFAULT NULL COMMENT '递延资产',
  DEFERR_BORR_TAX varchar(20) DEFAULT NULL COMMENT '递延税款借项',
  SHOULD_PAPER varchar(20) DEFAULT NULL COMMENT '应付票据',
  SHOULD_PAR varchar(20) DEFAULT NULL COMMENT '应付账款',
  OTHER_SHOULD_PAR varchar(20) DEFAULT NULL COMMENT '其他应交款',
  FLOW_LIA_SUM varchar(20) DEFAULT NULL COMMENT '流动负债合计',
  SHOULD_DEBT varchar(20) DEFAULT NULL COMMENT '应付债券',
  UNDIS_PROFIT varchar(20) DEFAULT NULL COMMENT '未分配利润',
  DEFERR_ASSET_PAY varchar(20) DEFAULT NULL COMMENT '（递延资产科目下）固定资产改良支出',
  OTHER_LONG_INVEST varchar(20) DEFAULT NULL COMMENT '其他长期资产',
  SUM_ASSET varchar(20) DEFAULT NULL COMMENT '资产总计',
  TOTAL_DEBT_OWNER_SUM varchar(20) DEFAULT NULL COMMENT '负债和所有者权益总计',
  FIND_ID varchar(20) DEFAULT NULL COMMENT '财务报表编号',
  REPORT_YEAR varchar(20) DEFAULT NULL COMMENT '报表年份',
  SHOULD_EXPO_TAX varchar(20) DEFAULT NULL COMMENT '应收出口退税',
  INVENTORY varchar(20) DEFAULT NULL COMMENT '存货',
  LONG_TERM_CRED_INVE varchar(20) DEFAULT NULL COMMENT '长期债权投资',
  ENGIN_MATER varchar(20) DEFAULT NULL COMMENT '工程物资',
  SHOULD_WELFARE varchar(20) DEFAULT NULL COMMENT '应付福利费',
  OTHER_SHOULD_FU_PA varchar(20) DEFAULT NULL COMMENT '其他应付款',
  ESTIMA_DEBT varchar(20) DEFAULT NULL COMMENT '预计负债',
  YEAR_LONG_TERM_DEBT varchar(20) DEFAULT NULL COMMENT '一年内到期的长期负债',
  OTH_FLOW_LIA varchar(20) DEFAULT NULL COMMENT '其他流动负债',
  BORR_LONGTIM varchar(20) DEFAULT NULL COMMENT '长期借款',
  SUM_LONG_TERM_DEBT varchar(20) DEFAULT NULL COMMENT '长期负债合计',
  MINORITY_EQUITY varchar(20) DEFAULT NULL COMMENT '少数股东权益',
  STATE_CAPITAL varchar(20) DEFAULT NULL COMMENT '国家资本',
  CORPOR_CAPITAL varchar(20) DEFAULT NULL COMMENT '法人资本',
  CON_STATE_CAPITAL varchar(20) DEFAULT NULL COMMENT '（法人资本科目下）国有法人资本',
  CON_COLL_CAPITAL varchar(20) DEFAULT NULL COMMENT '（法人资本科目下）集体法人资本',
  CAPITAL_RESERVES varchar(20) DEFAULT NULL COMMENT '资本公积',
  SURPLUS_RE_B varchar(20) DEFAULT NULL COMMENT '未确认的投资损失',
  FOREIGN_TRANS_DIFF varchar(20) DEFAULT NULL COMMENT '外币报表折算差额',
  LONG_TERM_INVEST varchar(20) DEFAULT NULL COMMENT '长期投资',
  SUM_DIS_OLD varchar(20) DEFAULT NULL COMMENT '累计折旧',
  SUM_FIX_ASSET varchar(20) DEFAULT NULL COMMENT '固定资产合计',
  UN_ASSET_SUM varchar(20) DEFAULT NULL COMMENT '无形及其他资产合计',
  SHOULD_PROFIT varchar(20) DEFAULT NULL COMMENT '应付利润',
  TOTAL_OWNER_EQUITY varchar(20) DEFAULT NULL COMMENT '所有者权益合计',
  SUPP_CAPITAL varchar(20) DEFAULT NULL COMMENT '（盈余公积科目下）补充流动资本',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='企业资产负债表（2002 版）信息单元';

-- ----------------------------
-- Table structure for com_decl_info
-- ----------------------------
DROP TABLE IF EXISTS com_decl_info;
CREATE TABLE com_decl_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  CONTENTS varchar(500) DEFAULT NULL COMMENT '内容',
  DECL_OBJ varchar(100) DEFAULT NULL COMMENT '声明主体',
  ADD_DATE varchar(20) DEFAULT NULL COMMENT '添加日期',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='声明信息';

-- ----------------------------
-- Table structure for com_direct_conn_others
-- ----------------------------
DROP TABLE IF EXISTS com_direct_conn_others;
CREATE TABLE com_direct_conn_others (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  COM_NAME varchar(300) DEFAULT NULL COMMENT '企业名称',
  CHINA_CREDIT_CODE varchar(200) DEFAULT NULL COMMENT '中征码',
  REALTION varchar(200) DEFAULT NULL COMMENT '关系',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='有直接关联关系的其他企业';

-- ----------------------------
-- Table structure for com_enforce_record
-- ----------------------------
DROP TABLE IF EXISTS com_enforce_record;
CREATE TABLE com_enforce_record (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  COURT_FILING varchar(200) DEFAULT NULL COMMENT '立案法院',
  FILING_DATE varchar(20) DEFAULT NULL COMMENT '立案日期',
  EXE_CASE varchar(200) DEFAULT NULL COMMENT '执行案由',
  CASE_NUM varchar(50) DEFAULT NULL COMMENT '案号',
  APP_EXE_SUB varchar(100) DEFAULT NULL COMMENT '申请执行标的',
  APP_EXE_SUM varchar(15) DEFAULT NULL COMMENT '申请执行金额',
  CASE_STATUS varchar(100) DEFAULT NULL COMMENT '案件状态',
  CLOSE_STYLE varchar(50) DEFAULT NULL COMMENT '结案方式',
  EXE_SUB varchar(100) DEFAULT NULL COMMENT '执行标的',
  EXE_SUM varchar(15) DEFAULT NULL COMMENT '执行金额',
  EXE_TYPE varchar(5) DEFAULT NULL COMMENT '执行类别(01:强制执行；02:行政处罚)',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='执行记录';

-- ----------------------------
-- Table structure for com_enter_qual
-- ----------------------------
DROP TABLE IF EXISTS com_enter_qual;
CREATE TABLE com_enter_qual (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  QUAL_TYPE varchar(5) DEFAULT NULL COMMENT '资质类型(01：许可,02：认证,03：资质,04：奖励)',
  GRANT_ORG varchar(200) DEFAULT NULL COMMENT '发放机关',
  QUAL_NAME varchar(200) DEFAULT NULL COMMENT '资质名称',
  GRANT_DATE varchar(20) DEFAULT NULL COMMENT '发放日期',
  END_DATE varchar(20) DEFAULT NULL COMMENT '截止日期',
  CONTENT varchar(200) DEFAULT NULL COMMENT '内容',
  QUAL_TYPE2 varchar(5) DEFAULT NULL COMMENT 'QUAL_TYPE2',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='企业资质';

-- ----------------------------
-- Table structure for com_extend_detail
-- ----------------------------
DROP TABLE IF EXISTS com_extend_detail;
CREATE TABLE com_extend_detail (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL_NO varchar(64) DEFAULT NULL COMMENT '流水号',
  EXTEND_START_DATE varchar(20) DEFAULT NULL COMMENT '展期起始日期',
  EXTEND_END_DATE varchar(20) DEFAULT NULL COMMENT '展期到期日期',
  EXTEND_SUM varchar(15) DEFAULT NULL COMMENT '展期金额',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='展期明细';

-- ----------------------------
-- Table structure for com_exter_guar
-- ----------------------------
DROP TABLE IF EXISTS com_exter_guar;
CREATE TABLE com_exter_guar (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL_NO varchar(64) DEFAULT NULL COMMENT '流水号',
  MAIN_BUSS_TYPE varchar(10) DEFAULT NULL COMMENT '主业务类型(01：贷款,02：类贷款,03：贸易融资,04：保理,05：票据贴现,06：银承,07：信用证,08：包含)',
  CURRENCY varchar(20) DEFAULT NULL COMMENT '币种',
  GUAR_SUM varchar(20) DEFAULT NULL COMMENT '金额',
  GUAR_BALANCE varchar(20) DEFAULT NULL COMMENT '余额',
  START_DATE varchar(20) DEFAULT NULL COMMENT '开始日期',
  END_DATE varchar(20) DEFAULT NULL COMMENT '结束日期',
  MINOR_BUSS_TYPE varchar(100) DEFAULT NULL COMMENT '次级业务类型',
  FIVE_TYPE varchar(20) DEFAULT NULL COMMENT '五级分类',
  CONTRACT_VALID varchar(15) DEFAULT NULL COMMENT '合同是否有效',
  MAIN_BUSS_TYPE2 varchar(10) DEFAULT NULL COMMENT 'MAIN_BUSS_TYPE2',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='对外担保';

-- ----------------------------
-- Table structure for com_financial_report_form
-- ----------------------------
DROP TABLE IF EXISTS com_financial_report_form;
CREATE TABLE com_financial_report_form (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  REPORT_TYPE varchar(20) DEFAULT NULL COMMENT '报表类型(01：资产负债表,02：利润分配表,03：现金流量表)',
  DATE_RANGE varchar(20) DEFAULT NULL COMMENT '时间范围(01：年报,02：上半年,03：下半年,04：一季度,05：二季度,06：三季度,07：四季度)',
  REPORT_YEAR varchar(20) DEFAULT NULL COMMENT '年份',
  ENTERPRISE_RANGE varchar(20) DEFAULT NULL COMMENT '企业范围(01：合并,02：本部)',
  SUB_NO varchar(20) DEFAULT NULL COMMENT '科目号',
  GEGIN_BALANCE varchar(20) DEFAULT NULL COMMENT '期初余额',
  END_BALANCE varchar(20) DEFAULT NULL COMMENT '期末余额',
  DATE_RANGE2 varchar(20) DEFAULT NULL COMMENT 'DATE_RANGE2',
  ENTERPRISE_RANGE2 varchar(20) DEFAULT NULL COMMENT 'ENTERPRISE_RANGE2',
  REPORT_TYPE2 varchar(20) DEFAULT NULL COMMENT 'REPORT_TYPE2',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='财务报表';

-- ----------------------------
-- Table structure for com_financial_seven_info
-- ----------------------------
DROP TABLE IF EXISTS com_financial_seven_info;
CREATE TABLE com_financial_seven_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  REPORT_YEAR varchar(40) DEFAULT NULL COMMENT '报表年份',
  SHOULD_PAPER_IN varchar(40) DEFAULT NULL COMMENT '应收票据',
  SHOULD_INTERST varchar(40) DEFAULT NULL COMMENT '应收利息',
  PAY_DEP varchar(40) DEFAULT NULL COMMENT '开发支出',
  LONG_TERM_AMOR varchar(40) DEFAULT NULL COMMENT '长期待摊费用',
  TRANS_INFO_DEBT varchar(40) DEFAULT NULL COMMENT '交易性金融负债',
  SHOULD_PAY_TAX varchar(40) DEFAULT NULL COMMENT '应交税费',
  YEARS_UNFLOWS_DEBT varchar(40) DEFAULT NULL COMMENT '一年内到期的非流动负债',
  FLOW_LIA_SUM varchar(40) DEFAULT NULL COMMENT '流动负债合计',
  INCRES_DY varchar(40) DEFAULT NULL COMMENT '递延所得税负债',
  OTHERS_UNFLOWS_DEBT varchar(40) DEFAULT NULL COMMENT '其他非流动负债',
  SUM_DEBT varchar(40) DEFAULT NULL COMMENT '负债合计',
  REDUCE_DIV varchar(40) DEFAULT NULL COMMENT '减：库存股',
  SHOULD_ACCOUNT varchar(40) DEFAULT NULL COMMENT '应收账款',
  ENGIN_MATER varchar(40) DEFAULT NULL COMMENT '工程物资',
  SHOULD_PAR varchar(40) DEFAULT NULL COMMENT '应付账款',
  TOTAL_DEBT_OWNER_SUM varchar(40) DEFAULT NULL COMMENT '负债和所有者权益合计',
  SMART_TYPE_REPORT varchar(40) DEFAULT NULL COMMENT '报表类型细分',
  SHOULD_DIVI_IN varchar(40) DEFAULT NULL COMMENT '应收股利',
  UNFLOW_ASSET_END varchar(40) DEFAULT NULL COMMENT '一年内到期的非流动资产',
  OTHER_FLOW_ASSET varchar(40) DEFAULT NULL COMMENT '其他流动资产',
  FLOW_ASSET_SUM varchar(40) DEFAULT NULL COMMENT '流动资产合计',
  LONG_TERM_EQUI_INVE varchar(40) DEFAULT NULL COMMENT '长期股权投资',
  LONG_TERM_RECE varchar(40) DEFAULT NULL COMMENT '长期应收款',
  GOODWILL varchar(40) DEFAULT NULL COMMENT '商誉',
  OTHER_UNFLOW_ASSET varchar(40) DEFAULT NULL COMMENT '其他非流动资产',
  SUM_ASSET varchar(40) DEFAULT NULL COMMENT '资产总计',
  RECEIVE_MONEY varchar(40) DEFAULT NULL COMMENT '实收资本（或股本）',
  UNDIS_PROFIT varchar(40) DEFAULT NULL COMMENT '未分配利润',
  FIX_ASSET varchar(40) DEFAULT NULL COMMENT '固定资产',
  ENGINEERING varchar(40) DEFAULT NULL COMMENT '在建工程',
  ASSET_PRODUC_BIOLO varchar(40) DEFAULT NULL COMMENT '生产性生物资产',
  SHOULD_WAGE varchar(40) DEFAULT NULL COMMENT '应付职工薪酬',
  OTHER_SHOULD_FU_PA varchar(40) DEFAULT NULL COMMENT '其他应付款',
  BORR_LONGTIM varchar(40) DEFAULT NULL COMMENT '长期借款',
  NUM_FINA varchar(40) DEFAULT NULL COMMENT '业务管理机构',
  NUM_ORG varchar(40) DEFAULT NULL COMMENT '业务管理机构代码',
  REPORT_TYPE varchar(40) DEFAULT NULL COMMENT '报表类型',
  INVEST_BUILD varchar(40) DEFAULT NULL COMMENT '投资性房地产',
  FIX_ASSET_CLEAN varchar(40) DEFAULT NULL COMMENT '固定资产清理',
  OIL_GAS_ASSET varchar(40) DEFAULT NULL COMMENT '油气资产',
  UN_ASSET varchar(40) DEFAULT NULL COMMENT '无形资产',
  SHOULD_PROFIT varchar(40) DEFAULT NULL COMMENT '应付利息',
  SHOULD_DIVI varchar(40) DEFAULT NULL COMMENT '应付股利',
  SHOULD_DEBT varchar(40) DEFAULT NULL COMMENT '应付债券',
  PAY_LONGTIM varchar(40) DEFAULT NULL COMMENT '长期应付款',
  TRANS_ASSET_FIX varchar(40) DEFAULT NULL COMMENT '交易性金融资产',
  ASSET_MARK_FINA varchar(40) DEFAULT NULL COMMENT '可供出售的金融资产',
  REDUCE_ASSET varchar(40) DEFAULT NULL COMMENT '递延所得税资产',
  SHORT_TIME_BORR varchar(40) DEFAULT NULL COMMENT '短期借款',
  FINA_ID varchar(40) DEFAULT NULL COMMENT '财务报表编号',
  INVENTORY varchar(40) DEFAULT NULL COMMENT '存货',
  SHOULD_PAPER varchar(40) DEFAULT NULL COMMENT '应付票据',
  SPE_SHOULD_PAR varchar(40) DEFAULT NULL COMMENT '专项应付款',
  ESTIMA_DEBT varchar(40) DEFAULT NULL COMMENT '预计负债',
  FLOW_LIA_SUM_UN varchar(40) DEFAULT NULL COMMENT '非流动负债合计',
  CAPITAL_RESERVES varchar(40) DEFAULT NULL COMMENT '资本公积',
  SURPLUS_RESERVES varchar(40) DEFAULT NULL COMMENT '盈余公积',
  TOTAL_OWNER_EQUITY varchar(40) DEFAULT NULL COMMENT '所有者权益合计',
  MONEY_FUND varchar(40) DEFAULT NULL COMMENT '货币资金',
  PRE_PAR varchar(40) DEFAULT NULL COMMENT '预付账款',
  OTHER_SHOULD_PAR varchar(40) DEFAULT NULL COMMENT '其他应收款',
  END_DATE_INVEST varchar(40) DEFAULT NULL COMMENT '持有至到期投资',
  UNFLOW_ASSET varchar(40) DEFAULT NULL COMMENT '非流动资产合计',
  DEFE_REVEN varchar(40) DEFAULT NULL COMMENT '预收账款',
  OTH_FLOW_LIA varchar(40) DEFAULT NULL COMMENT '其他流动负债',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='企业资产负债表（2007 版）信息单元';

-- ----------------------------
-- Table structure for com_finan_scal
-- ----------------------------
DROP TABLE IF EXISTS com_finan_scal;
CREATE TABLE com_finan_scal (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SUB_LIST varchar(100) DEFAULT NULL COMMENT '所属名录',
  TYPE_CONTR_SCAL varchar(100) DEFAULT NULL COMMENT '融资控制类型',
  INFO_ID varchar(100) DEFAULT NULL COMMENT '信息编号',
  THE_SIZE varchar(100) DEFAULT NULL COMMENT '规模',
  YEARS varchar(100) DEFAULT NULL COMMENT '年度',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='融资规模控制信息单元';

-- ----------------------------
-- Table structure for com_fore_guar_summ
-- ----------------------------
DROP TABLE IF EXISTS com_fore_guar_summ;
CREATE TABLE com_fore_guar_summ (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  GUAR_TYPE varchar(10) DEFAULT NULL COMMENT '担保类型(01：保证,02：抵押,03：质押)',
  GUAR_NUM varchar(20) DEFAULT NULL COMMENT '笔数',
  GUAR_SUM varchar(15) DEFAULT NULL COMMENT '担保金额',
  NOR_GUAR_BALANCE varchar(15) DEFAULT NULL COMMENT '所担保主业务余额（正常）',
  ATTEN_GUAR_BALANCE varchar(15) DEFAULT NULL COMMENT '所担保主业务余额（关注）',
  BAD_GUAR_BALANCE varchar(15) DEFAULT NULL COMMENT '所担保主业务余额（不良）',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='对外担保概要';

-- ----------------------------
-- Table structure for com_guarantee_det
-- ----------------------------
DROP TABLE IF EXISTS com_guarantee_det;
CREATE TABLE com_guarantee_det (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  GUAR_TRANS_SPECIES_NICHE varchar(100) DEFAULT NULL COMMENT '担保交易业务种类细分',
  NUM_OUTSTAND_ACCOUNT varchar(100) DEFAULT NULL COMMENT '未结清账户数',
  IN_SIXTY_DAY_BAL_NUM varchar(100) DEFAULT NULL COMMENT '60 天内到期的余额',
  TYPE_ORG varchar(100) DEFAULT NULL COMMENT '业务管理机构类型',
  CODE_ORG varchar(100) DEFAULT NULL COMMENT '业务管理机构代码',
  GUAR_ACCOUT_ID varchar(100) DEFAULT NULL COMMENT '担保账户分机构汇总信息编号',
  AFTER_NINETY_DAY_BAL_NUM varchar(100) DEFAULT NULL COMMENT '90 天后到期的余额',
  FIVE_CLA varchar(100) DEFAULT NULL COMMENT '五级分类',
  NUM_ACC_SETTLE varchar(100) DEFAULT NULL COMMENT '已结清账户数',
  BALANCE_NUM varchar(100) DEFAULT NULL COMMENT '余额',
  IN_THIRTY_DAY_BAL_NUM varchar(100) DEFAULT NULL COMMENT '30 天内到期的余额',
  IN_NINETY_DAY_BAL_NUM varchar(100) DEFAULT NULL COMMENT '90 天内到期的余额',
  ADVANCES varchar(100) DEFAULT NULL COMMENT '垫款标志',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='担保账户分机构汇总信息单元';

-- ----------------------------
-- Table structure for com_guar_acct_info
-- ----------------------------
DROP TABLE IF EXISTS com_guar_acct_info;
CREATE TABLE com_guar_acct_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  NUM_CRED_AGREE varchar(100) DEFAULT NULL COMMENT '授信协议编号',
  DATE_OPEN varchar(100) DEFAULT NULL COMMENT '开立日期',
  DUE_TIME_DATE varchar(100) DEFAULT NULL COMMENT '到期日期',
  GUAR_TRANS_SPECIES_NICHE varchar(100) DEFAULT NULL COMMENT '担保交易业务种类细分',
  TYPE_ACC_GUAR varchar(100) DEFAULT NULL COMMENT '担保账户类型',
  TYPE_ORG varchar(100) DEFAULT NULL COMMENT '业务管理机构类型',
  CODE_ORG varchar(100) DEFAULT NULL COMMENT '业务管理机构代码',
  GUAR_ACCOUT_ID varchar(100) DEFAULT NULL COMMENT '担保账户编号',
  BALANCE_NUM varchar(100) DEFAULT NULL COMMENT '金额',
  WAY_COUNTER_GUAR varchar(100) DEFAULT NULL COMMENT '反担保方式',
  OTHERS_REPAY_ENSURE_WAY varchar(100) DEFAULT NULL COMMENT '其他还款保证方式',
  MARGIN_PERCENT varchar(100) DEFAULT NULL COMMENT '保证金比例',
  CURRENCY varchar(100) DEFAULT NULL COMMENT '币种',
  DATE_REPORT_INFO_ZB varchar(100) DEFAULT NULL COMMENT '在报信息报告日期',
  STATE_LEND_ACCOU_ZB varchar(100) DEFAULT NULL COMMENT '在报账户活动状态',
  BALANCE_NUM_ZB varchar(100) DEFAULT NULL COMMENT '在报余额',
  FIVE_CLA_ZB varchar(100) DEFAULT NULL COMMENT '五级分类',
  EXPOSURE_TO_ZB varchar(100) DEFAULT NULL COMMENT '在报风险敞口',
  ADVANCES_ZB varchar(100) DEFAULT NULL COMMENT '在报代偿（垫款）标志',
  COMMON_DEBT_INDENTI_ZB varchar(100) DEFAULT NULL COMMENT '在报共同债务标识',
  DATE_CLOSE_ZB varchar(100) DEFAULT NULL COMMENT '在报关闭日期',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='担保账户信息单元';

-- ----------------------------
-- Table structure for com_guar_comp_detail
-- ----------------------------
DROP TABLE IF EXISTS com_guar_comp_detail;
CREATE TABLE com_guar_comp_detail (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL_NO varchar(64) DEFAULT NULL COMMENT '流水号',
  COMP_ORG varchar(100) DEFAULT NULL COMMENT '代偿机构',
  LAST_COMP_DATE varchar(20) DEFAULT NULL COMMENT '最近代偿日期',
  TATAL_COMP_SUM varchar(15) DEFAULT NULL COMMENT '累计代偿金额',
  COMP_BALANCE varchar(15) DEFAULT NULL COMMENT '代偿余额(已结清的余额为0)',
  LAST_REPAY_DATE varchar(20) DEFAULT NULL COMMENT '最近还款日期',
  ORIG_GUSS varchar(100) DEFAULT NULL COMMENT '原业务',
  SETTLE_STATUS varchar(5) DEFAULT NULL COMMENT '结清状态(0：未结清,1：已结清)',
  REMARKS varchar(200) DEFAULT NULL COMMENT '备注',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='担保及第三方代偿业务明细';

-- ----------------------------
-- Table structure for com_guar_detail_info
-- ----------------------------
DROP TABLE IF EXISTS com_guar_detail_info;
CREATE TABLE com_guar_detail_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL_NO varchar(64) DEFAULT NULL COMMENT '流水号',
  GUAR_TYPE varchar(10) DEFAULT NULL COMMENT '类型',
  GUARANTOR varchar(200) DEFAULT NULL COMMENT '被担保人',
  GUAR_CRED_TYPE varchar(20) DEFAULT NULL COMMENT '证件类型',
  GUAR_CRED_NUM varchar(30) DEFAULT NULL COMMENT '证件号码',
  GUAR_CURRENCY varchar(10) DEFAULT NULL COMMENT '担保币种',
  GUAR_SUM varchar(15) DEFAULT NULL COMMENT '担保金额',
  GUAR_STYLE varchar(100) DEFAULT NULL COMMENT '担保形式',
  MAIN_BUSS varchar(100) DEFAULT NULL COMMENT '主业务',
  REMARKS varchar(200) DEFAULT NULL COMMENT '备注',
  GUAR_TYPE2 varchar(10) DEFAULT NULL COMMENT 'GUAR_TYPE2',
  GUAR_CURRENCY2 varchar(10) DEFAULT NULL COMMENT 'GUAR_CURRENCY2',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='担保明细';

-- ----------------------------
-- Table structure for com_guar_trans_in
-- ----------------------------
DROP TABLE IF EXISTS com_guar_trans_in;
CREATE TABLE com_guar_trans_in (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  NUM_SECURED_NOTRANS varchar(100) DEFAULT NULL COMMENT '担保交易分类汇总条目数量(已结清)',
  NUM_SECURED_TRANS_CAT varchar(100) DEFAULT NULL COMMENT '担保交易分类汇总条目数量(未结清)',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='担保交易汇总信息单元';

-- ----------------------------
-- Table structure for com_guar_trans_info_outs
-- ----------------------------
DROP TABLE IF EXISTS com_guar_trans_info_outs;
CREATE TABLE com_guar_trans_info_outs (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  ASSET_QUALITY_CLAS varchar(100) DEFAULT NULL COMMENT '资产质量分类',
  NUM_ACCOUNT varchar(100) DEFAULT NULL COMMENT '账户数 ',
  BALANCE_NUM varchar(100) DEFAULT NULL COMMENT '余额',
  BUSS_TYPE varchar(100) DEFAULT NULL COMMENT '业务类型',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='未结清担保交易汇总信息';

-- ----------------------------
-- Table structure for com_guar_trans_info_set
-- ----------------------------
DROP TABLE IF EXISTS com_guar_trans_info_set;
CREATE TABLE com_guar_trans_info_set (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  ASSET_QUALITY_CLA varchar(100) DEFAULT NULL COMMENT '资产质量分类',
  BUSS_TYPE varchar(100) DEFAULT NULL COMMENT '业务类型',
  NUM_ACCOUNT varchar(100) DEFAULT NULL COMMENT '账户数 ',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='已结清担保交易汇总信息';

-- ----------------------------
-- Table structure for com_guar_trans_respon_info
-- ----------------------------
DROP TABLE IF EXISTS com_guar_trans_respon_info;
CREATE TABLE com_guar_trans_respon_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  TYPE_RESPON varchar(100) DEFAULT NULL COMMENT '责任类型',
  BALANCE_NUM_FOCUS_BAD varchar(100) DEFAULT NULL COMMENT '不良类余额',
  AMOUNT_REPAY_RECOVER varchar(100) DEFAULT NULL COMMENT '还款责任金额',
  BALANCE_NUM_FOCUS varchar(100) DEFAULT NULL COMMENT '关注类余额',
  NUM_ACCOUNT varchar(100) DEFAULT NULL COMMENT '账户数',
  BALANCE_NUM varchar(100) DEFAULT NULL COMMENT '余额',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='担保交易相关还款责任汇总信息';

-- ----------------------------
-- Table structure for com_ident_basic
-- ----------------------------
DROP TABLE IF EXISTS com_ident_basic;
CREATE TABLE com_ident_basic (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  TYPE_ENT_IDENT varchar(100) DEFAULT NULL COMMENT '企业身份标识类型',
  NUM_ENT_INDENT varchar(100) DEFAULT NULL COMMENT '企业身份标识号码',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='企业身份信息';

-- ----------------------------
-- Table structure for com_imex_supervision
-- ----------------------------
DROP TABLE IF EXISTS com_imex_supervision;
CREATE TABLE com_imex_supervision (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SUPER_ORG varchar(100) DEFAULT NULL COMMENT '监管部门名称',
  SUPER_COUNCIL varchar(100) DEFAULT NULL COMMENT '管辖直属局',
  SUPER_LEVEL varchar(100) DEFAULT NULL COMMENT '监管级别',
  START_DATE varchar(20) DEFAULT NULL COMMENT '生效日期',
  END_DATE varchar(20) DEFAULT NULL COMMENT '截至日期',
  INFO_ID varchar(100) DEFAULT NULL COMMENT '信息编号',
  SUPER_LEVEL2 varchar(100) DEFAULT NULL COMMENT '监管级别2',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='进出口商品检验分类监管信息单元';

-- ----------------------------
-- Table structure for com_info_credit
-- ----------------------------
DROP TABLE IF EXISTS com_info_credit;
CREATE TABLE com_info_credit (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  FIRST_REPAY_LIAB_YEAR varchar(100) DEFAULT NULL COMMENT '首次有相关还款责任的年份',
  RECOVER_CURRENT_DEBT varchar(100) DEFAULT NULL COMMENT '被追偿的借贷交易余额',
  FOCUS_CURRENT_DEBT varchar(100) DEFAULT NULL COMMENT '关注类借贷交易余额',
  SECURED_OVER_DEBT varchar(100) DEFAULT NULL COMMENT '不良类担保交易余额',
  TAX_ARRENS_NUM varchar(100) DEFAULT NULL COMMENT '欠税记录条数',
  NUM_ENFORCE_RECORD varchar(100) DEFAULT NULL COMMENT '强制执行记录条数',
  FIRST_TRADE_YEAR varchar(100) DEFAULT NULL COMMENT '首次有信贷交易的年份',
  NUM_NO_CRET_TRA_ACC varchar(100) DEFAULT NULL COMMENT '非信贷交易账户数',
  UNCLEAR_ORG varchar(100) DEFAULT NULL COMMENT '当前有未结清信贷交易的机构数',
  SECURED_TRANS_BALANCE varchar(100) DEFAULT NULL COMMENT '担保交易余额',
  FOCUS_SEC_TRANS_BA varchar(100) DEFAULT NULL COMMENT '关注类担保交易余额',
  NUM_JUDG_RECORD varchar(100) DEFAULT NULL COMMENT '民事判决记录条数',
  RELATION_ORG varchar(100) DEFAULT NULL COMMENT '发生信贷交易的机构数',
  CURRENT_DEBT varchar(100) DEFAULT NULL COMMENT '借贷交易余额',
  NUM_ADMINI_PUNI varchar(100) DEFAULT NULL COMMENT '行政处罚记录条数',
  OVER_DEBT varchar(100) DEFAULT NULL COMMENT '不良类借贷交易余额',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='信用提示信息单元';

-- ----------------------------
-- Table structure for com_info_summary
-- ----------------------------
DROP TABLE IF EXISTS com_info_summary;
CREATE TABLE com_info_summary (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  FIRST_TRADE_YEAR varchar(30) DEFAULT NULL COMMENT '首次交易年',
  RELATION_ORG varchar(30) DEFAULT NULL COMMENT '办理过信贷业务的金融机构数量',
  UNCLEAR_ORG varchar(30) DEFAULT NULL COMMENT '未结清的金融机构数量',
  CURRENT_DEBT varchar(200) DEFAULT NULL COMMENT '负责余额',
  OVER_DEBT varchar(200) DEFAULT NULL COMMENT '不良和违约负债余额',
  ORG_NUM varchar(20) DEFAULT NULL COMMENT '报数机构说明条数',
  CREDIT_FLAG_NUM varchar(20) DEFAULT NULL COMMENT '征信中心标注条数',
  INFO_STATEMENT_NUM varchar(20) DEFAULT NULL COMMENT '信息主体声明条数',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='信息概要';

-- ----------------------------
-- Table structure for com_inner_buss_detail
-- ----------------------------
DROP TABLE IF EXISTS com_inner_buss_detail;
CREATE TABLE com_inner_buss_detail (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL_NO varchar(64) DEFAULT NULL COMMENT '流水号',
  CREDIT_ORG varchar(30) DEFAULT NULL COMMENT '授信机构',
  TYPE varchar(30) DEFAULT NULL COMMENT '种类',
  CURRENCY varchar(10) DEFAULT NULL COMMENT '币种',
  BUSS_SUM varchar(15) DEFAULT NULL COMMENT '金额',
  BUSS_BALANCE varchar(15) DEFAULT NULL COMMENT '余额',
  START_DATE varchar(20) DEFAULT NULL COMMENT '起始日期',
  STOP_DATE varchar(20) DEFAULT NULL COMMENT '到期日期',
  FIVE_TYPE varchar(10) DEFAULT NULL COMMENT '五级分类',
  LOAN_TYPE varchar(100) DEFAULT NULL COMMENT '贷款形式',
  IS_GUAR varchar(5) DEFAULT NULL COMMENT '担保',
  EXTENSION varchar(5) DEFAULT NULL COMMENT '展期/延期',
  HIS_RECORD varchar(100) DEFAULT NULL COMMENT '历史记录',
  SETTLE_DATE varchar(20) DEFAULT NULL COMMENT '结清日期',
  SETTLE_STYLE varchar(15) DEFAULT NULL COMMENT '结清方式',
  BUSS_TYPE varchar(5) DEFAULT NULL COMMENT '业务类型(01：贷款,02：类贷款,03：贸易融资)',
  ATTEN_STATUS varchar(5) DEFAULT NULL COMMENT '关注状态(01：正常,02：关注,03：不良)',
  SETTLE_STATUS varchar(5) DEFAULT NULL COMMENT '结清状态(0：未结清,1：已结清)',
  REMARKS varchar(200) DEFAULT NULL COMMENT '备注',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='表内业务明细';

-- ----------------------------
-- Table structure for com_inner_buss_nor_his_record
-- ----------------------------
DROP TABLE IF EXISTS com_inner_buss_nor_his_record;
CREATE TABLE com_inner_buss_nor_his_record (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL_NO varchar(64) DEFAULT NULL COMMENT '流水号',
  BUSS_OCCUR_DATE varchar(20) DEFAULT NULL COMMENT '业务发生日期',
  BALANCE_CHANGE_DATE varchar(20) DEFAULT NULL COMMENT '余额改变日期',
  balance varchar(20) DEFAULT NULL COMMENT '余额',
  FIVE_TYPE varchar(15) DEFAULT NULL COMMENT '五级分类',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='表内业务正常类历史记录';

-- ----------------------------
-- Table structure for com_insp_mjgoods
-- ----------------------------
DROP TABLE IF EXISTS com_insp_mjgoods;
CREATE TABLE com_insp_mjgoods (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  MJ_NAME varchar(100) DEFAULT NULL COMMENT '免验商品名称',
  MJ_ID varchar(100) DEFAULT NULL COMMENT '免验号',
  APPR_DEPART_NAME varchar(100) DEFAULT NULL COMMENT '批准部门名称',
  DATE_END varchar(100) DEFAULT NULL COMMENT '截至日期',
  INFO_ID varchar(100) DEFAULT NULL COMMENT '信息编号',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='进出口商品免验信息单元';

-- ----------------------------
-- Table structure for com_insp_quara
-- ----------------------------
DROP TABLE IF EXISTS com_insp_quara;
CREATE TABLE com_insp_quara (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  EXP_COM_NAME varchar(100) DEFAULT NULL COMMENT '出口商品名称',
  QUARA_ID varchar(100) DEFAULT NULL COMMENT '信息编号',
  DATE_EFFE varchar(100) DEFAULT NULL COMMENT '生效日期',
  APPR_DEPART_NAME varchar(100) DEFAULT NULL COMMENT '批准部门名称',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='出入境检验检疫绿色通道信息单元';

-- ----------------------------
-- Table structure for com_investor
-- ----------------------------
DROP TABLE IF EXISTS com_investor;
CREATE TABLE com_investor (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  REIG_CAPITAL varchar(64) DEFAULT NULL COMMENT '注册资本（折人民币合计）',
  NUM_INVEST varchar(64) DEFAULT NULL COMMENT '主要出资人个数',
  DATE_UPDATE_INVEST varchar(64) DEFAULT NULL COMMENT '更新日期(注册人)',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='注册资本表';

-- ----------------------------
-- Table structure for com_investor_info
-- ----------------------------
DROP TABLE IF EXISTS com_investor_info;
CREATE TABLE com_investor_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  INVE_NAME varchar(300) DEFAULT NULL COMMENT '出资方名称',
  INVE_CRED_TYPE varchar(100) DEFAULT NULL COMMENT '出资证件类型',
  INVE_CRED_NUM varchar(200) DEFAULT NULL COMMENT '出资证件号码',
  INVE_PERCENT varchar(100) DEFAULT NULL COMMENT '出资比例',
  TYPE_INVEST varchar(100) DEFAULT NULL COMMENT '出资人类型',
  TYPE_INVEST_IDENT varchar(100) DEFAULT NULL COMMENT '出资人身份类别',
  INVE_CRED_TYPE2 varchar(100) DEFAULT NULL COMMENT '出资证件类型2',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='出资人信息';

-- ----------------------------
-- Table structure for com_judge_record
-- ----------------------------
DROP TABLE IF EXISTS com_judge_record;
CREATE TABLE com_judge_record (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  COURT_FILING varchar(100) DEFAULT NULL COMMENT '立案法院名称',
  FILING_DATE varchar(20) DEFAULT NULL COMMENT '立案日期',
  LITIG_STATUS varchar(100) DEFAULT NULL COMMENT '诉讼地位',
  CASE_NUM varchar(50) DEFAULT NULL COMMENT '案号',
  LITIG_PRO varchar(100) DEFAULT NULL COMMENT '审判程序',
  LITIG_SUB varchar(200) DEFAULT NULL COMMENT '诉讼标的',
  LITIG_SUM varchar(15) DEFAULT NULL COMMENT '诉讼标的金额',
  CLOSE_STYLE varchar(100) DEFAULT NULL COMMENT '结案方式',
  JUDGE_START_DATE varchar(20) DEFAULT NULL COMMENT '判决/调解生效日期',
  JUDGE_RESULT varchar(300) DEFAULT NULL COMMENT '判决/调解结果',
  LITIG_REASON varchar(50) DEFAULT NULL COMMENT '案由',
  SERIAL varchar(100) DEFAULT NULL COMMENT '民事判决记录编号',
  CLOSE_STYLE2 varchar(100) DEFAULT NULL COMMENT '结案方式2',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='民事判决记录信息单元';

-- ----------------------------
-- Table structure for com_lack_interest
-- ----------------------------
DROP TABLE IF EXISTS com_lack_interest;
CREATE TABLE com_lack_interest (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL_NO varchar(64) DEFAULT NULL COMMENT '流水号',
  CREDIT_ORG varchar(200) DEFAULT NULL COMMENT '授信机构',
  CURRENCY varchar(10) DEFAULT NULL COMMENT '币种',
  LACK_INTE_BALANCE varchar(15) DEFAULT NULL COMMENT '欠息余额',
  BALANCE_CHANGE_DATE varchar(20) DEFAULT NULL COMMENT '余额变化日期',
  LACK_INTE_TYPE varchar(20) DEFAULT NULL COMMENT '欠息类型',
  HIS_MAX_LACK_INTE varchar(15) DEFAULT NULL COMMENT '历史最高欠息金额（元）',
  FIRST_LACK_INTE_DATE varchar(20) DEFAULT NULL COMMENT '首次欠息发生日期',
  LAST_SETTLE_DATE varchar(20) DEFAULT NULL COMMENT '最近一次结清日期',
  SETTLE_STATUS varchar(10) DEFAULT NULL COMMENT '结清状态(0：未结清,1：已结清)',
  REMARKS varchar(200) DEFAULT NULL COMMENT '备注',
  TYPE_ORG varchar(100) DEFAULT NULL COMMENT '业务管理机构类型',
  CODE_ORG varchar(100) DEFAULT NULL COMMENT '业务管理机构代码',
  NUM_LACK varchar(100) DEFAULT NULL COMMENT '欠息信息编号',
  DATE_REPORT varchar(100) DEFAULT NULL COMMENT '信息报告日期',
  CURRENCY2 varchar(10) DEFAULT NULL COMMENT '币种2',
  LACK_INTE_TYPE2 varchar(20) DEFAULT NULL COMMENT '欠息类型2',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='欠息信息单元';

-- ----------------------------
-- Table structure for com_lend_account
-- ----------------------------
DROP TABLE IF EXISTS com_lend_account;
CREATE TABLE com_lend_account (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SMART_LEND_BUS varchar(100) DEFAULT NULL COMMENT '借贷业务种类细分',
  NUM_CRED_AGREE varchar(100) DEFAULT NULL COMMENT '授信协议编号',
  BIG_LEND_BUS varchar(100) DEFAULT NULL COMMENT '借贷业务种类大类',
  NUM_LEND_ACCOUNT varchar(100) DEFAULT NULL COMMENT '借贷账户编号',
  OTHER_REPAY_WAY varchar(100) DEFAULT NULL COMMENT '其他还款保证方式',
  ISSUE_WAY varchar(100) DEFAULT NULL COMMENT '发放形式',
  DATE_CLOSE varchar(100) DEFAULT NULL COMMENT '关闭日期',
  TYPE_ACCOUNT_LEND varchar(100) DEFAULT NULL COMMENT '借贷账户类型',
  TYPE_BUS_MANA_ORG varchar(100) DEFAULT NULL COMMENT '业务管理机构类型',
  CODE_BUS_MANA_ORG varchar(100) DEFAULT NULL COMMENT '业务管理机构代码',
  LEN_SUM varchar(100) DEFAULT NULL COMMENT '借款金额',
  DATE_INFO_REPORT varchar(100) DEFAULT NULL COMMENT '信息报告日期',
  TIME_LIM_LEN varchar(100) DEFAULT NULL COMMENT '借款期限',
  DATE_ACCOUNT_OPEN varchar(100) DEFAULT NULL COMMENT '开户日期',
  CRED_LINE varchar(100) DEFAULT NULL COMMENT '信用额度',
  DUE_TIME varchar(100) DEFAULT NULL COMMENT '到期日期',
  JIO_LOAN_MARK varchar(100) DEFAULT NULL COMMENT '共同借款标识',
  STATE_LEND_ACCOUNT_ACT varchar(100) DEFAULT NULL COMMENT '账户活动状态',
  CURRENCY varchar(100) DEFAULT NULL COMMENT '币种',
  GUAR_WAY varchar(100) DEFAULT NULL COMMENT '担保方式',
  NUM_REPAY_RECORD varchar(100) DEFAULT NULL COMMENT '还款表现记录条数',
  NUM_SPE_TRANS varchar(100) DEFAULT NULL COMMENT '特定交易个数',
  SERIAL varchar(100) DEFAULT NULL COMMENT '编号',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='借贷账户信息单元';

-- ----------------------------
-- Table structure for com_lend_trans
-- ----------------------------
DROP TABLE IF EXISTS com_lend_trans;
CREATE TABLE com_lend_trans (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  YASSETS_DISP_NUM varchar(100) DEFAULT NULL COMMENT '已结清资产处置业务账户数  ',
  NUM_MONTH_FZ varchar(100) DEFAULT NULL COMMENT '月份数(负债)',
  LAST_DISP_DATE varchar(100) DEFAULT NULL COMMENT '最近一次处置日期',
  OVER_SUM varchar(100) DEFAULT NULL COMMENT '逾期总额',
  OVER_PRINCIPAL varchar(100) DEFAULT NULL COMMENT '逾期本金',
  YNUM_ADVANCES_ACCOUNT varchar(100) DEFAULT NULL COMMENT '垫款业务账户数  ',
  NUM_OTHER_TRANS varchar(100) DEFAULT NULL COMMENT '其他借贷交易分类汇总条目数量',
  YASSETS_DISP_BALANCE varchar(100) DEFAULT NULL COMMENT '资产处置业务金额  ',
  YNUM_OTHER_TRANS_YJ varchar(100) DEFAULT NULL COMMENT '其他借贷交易分类汇总条目数量',
  ASSETS_DISP_BALANCE varchar(100) DEFAULT NULL COMMENT '资产处置业务余额',
  NUM_ADVANCES_ACCOUNT varchar(100) DEFAULT NULL COMMENT '垫款业务账户数',
  OVER_INTERST_OTHER varchar(100) DEFAULT NULL COMMENT '逾期利息及其他',
  YDATE_COMPLETION varchar(100) DEFAULT NULL COMMENT '处置完成日期  ',
  ASSETS_DISP_NUM varchar(100) DEFAULT NULL COMMENT '未结清资产处置业务账户数',
  ADVAES_ACC_BALANCE varchar(100) DEFAULT NULL COMMENT '垫款业务余额',
  YADVANCES_ACCOUNT_BALANCE varchar(100) DEFAULT NULL COMMENT '垫款业务金额  ',
  LAST_ADS_ACC_DATE varchar(100) DEFAULT NULL COMMENT '垫款最近一次还款日期',
  YDATE_SETTLEMENT varchar(100) DEFAULT NULL COMMENT '结清日期  ',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='借贷交易汇总信息单元';

-- ----------------------------
-- Table structure for com_lend_trans_other
-- ----------------------------
DROP TABLE IF EXISTS com_lend_trans_other;
CREATE TABLE com_lend_trans_other (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  BUSS_TYPE varchar(100) DEFAULT NULL COMMENT '业务类型',
  ASSET_QUALITY_CLAS varchar(100) DEFAULT NULL COMMENT '资产质量分类',
  NUM_ACCOUNT varchar(100) DEFAULT NULL COMMENT '账户数',
  BALANCE_NUM varchar(100) DEFAULT NULL COMMENT '余额',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='未结清其他借贷交易分类汇总信息';

-- ----------------------------
-- Table structure for com_lend_trans_se_type
-- ----------------------------
DROP TABLE IF EXISTS com_lend_trans_se_type;
CREATE TABLE com_lend_trans_se_type (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  ASSET_QUALITY_CLASSIFICATION varchar(100) DEFAULT NULL COMMENT '资产质量分类',
  BUSS_TYPE varchar(100) DEFAULT NULL COMMENT '业务类型',
  NUM_ACCOUNT varchar(100) DEFAULT NULL COMMENT '账户数 ',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='已结清其他借贷交易分类汇总信息';

-- ----------------------------
-- Table structure for com_listed_corpor
-- ----------------------------
DROP TABLE IF EXISTS com_listed_corpor;
CREATE TABLE com_listed_corpor (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  REPORT_ORG varchar(100) DEFAULT NULL COMMENT '上报机构',
  MATTER varchar(200) DEFAULT NULL COMMENT '或有事项',
  INFO_DATE varchar(20) DEFAULT NULL COMMENT '信息日期',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='上市公司或有事项';

-- ----------------------------
-- Table structure for com_main_member
-- ----------------------------
DROP TABLE IF EXISTS com_main_member;
CREATE TABLE com_main_member (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  NUM_PEPL varchar(64) DEFAULT NULL COMMENT '主要组成人员个数',
  DATE_UPDATE_SENIOR varchar(64) DEFAULT NULL COMMENT '更新日期',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='主要成员表';

-- ----------------------------
-- Table structure for com_obtain_certifi
-- ----------------------------
DROP TABLE IF EXISTS com_obtain_certifi;
CREATE TABLE com_obtain_certifi (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  CERTIFI_TYPE varchar(100) DEFAULT NULL COMMENT '认证类型',
  CONTENT_CERTIFI varchar(200) DEFAULT NULL COMMENT '认证内容',
  CERTIFI_ID varchar(100) DEFAULT NULL COMMENT '认证记录编号',
  CERTIFI_DATE varchar(100) DEFAULT NULL COMMENT '认证日期',
  DATE_END varchar(100) DEFAULT NULL COMMENT '截止日期',
  CERTIFI_NAME varchar(100) DEFAULT NULL COMMENT '认证部门名称',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='获得认证记录信息单元';

-- ----------------------------
-- Table structure for com_obtain_license
-- ----------------------------
DROP TABLE IF EXISTS com_obtain_license;
CREATE TABLE com_obtain_license (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  OBTAIN_NAME varchar(100) DEFAULT NULL COMMENT '许可部门名称',
  DATE_END varchar(100) DEFAULT NULL COMMENT '截止日期',
  TYPE_OBTAIN varchar(100) DEFAULT NULL COMMENT '许可类型',
  DATE_OBTAIN varchar(100) DEFAULT NULL COMMENT '许可日期',
  OBTAIN_ID varchar(100) DEFAULT NULL COMMENT '许可记录编号',
  CONTENT_LICENSE varchar(1000) DEFAULT NULL COMMENT '许可内容',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='获得许可记录信息单元';

-- ----------------------------
-- Table structure for com_obtain_qual
-- ----------------------------
DROP TABLE IF EXISTS com_obtain_qual;
CREATE TABLE com_obtain_qual (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  APP_DATE varchar(100) DEFAULT NULL COMMENT '批准日期',
  CONTENT_QUAL varchar(200) DEFAULT NULL COMMENT '资质内容',
  QUAL_ID varchar(100) DEFAULT NULL COMMENT '资质记录编号',
  QUAL_TYPE varchar(100) DEFAULT NULL COMMENT '资质类型',
  QUAL_NAME varchar(100) DEFAULT NULL COMMENT '认定部门名称',
  DATE_END varchar(100) DEFAULT NULL COMMENT '截止日期',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='获得资质记录信息单元';

-- ----------------------------
-- Table structure for com_obtain_reward
-- ----------------------------
DROP TABLE IF EXISTS com_obtain_reward;
CREATE TABLE com_obtain_reward (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  CONTENT_REWARD varchar(200) DEFAULT NULL COMMENT '奖励事实',
  REWARD_NAME varchar(100) DEFAULT NULL COMMENT '奖励名称',
  REWARD_ID varchar(100) DEFAULT NULL COMMENT '奖励记录编号',
  REWARD_ORG_NAME varchar(100) DEFAULT NULL COMMENT '奖励部门名称',
  DATE_START varchar(100) DEFAULT NULL COMMENT '授予日期',
  DATE_END varchar(100) DEFAULT NULL COMMENT '截止日期',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='获得奖励记录信息单元';

-- ----------------------------
-- Table structure for com_outer_buss_detail
-- ----------------------------
DROP TABLE IF EXISTS com_outer_buss_detail;
CREATE TABLE com_outer_buss_detail (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL_NO varchar(64) DEFAULT NULL COMMENT '流水号',
  CREDIT_ORG varchar(100) DEFAULT NULL COMMENT '授信机构',
  TYPE varchar(10) DEFAULT NULL COMMENT '种类',
  CURRENCY varchar(10) DEFAULT NULL COMMENT '币种',
  BUSS_SUM varchar(15) DEFAULT NULL COMMENT '金额',
  BUSS_BALANCE varchar(15) DEFAULT NULL COMMENT '余额',
  START_DATE varchar(20) DEFAULT NULL COMMENT '起始日期',
  STOP_DATE varchar(20) DEFAULT NULL COMMENT '到期日期',
  FIVE_TYPE varchar(10) DEFAULT NULL COMMENT '五级分类',
  IS_GUAR varchar(5) DEFAULT NULL COMMENT '担保',
  IS_ADVA varchar(5) DEFAULT NULL COMMENT '垫款',
  MARGIN_PERCENT varchar(10) DEFAULT NULL COMMENT '保证金比例',
  HIS_RECORD varchar(100) DEFAULT NULL COMMENT '历史记录',
  BUSS_TYPE varchar(5) DEFAULT NULL COMMENT '业务类型(04：保理,05：票据贴现,06：银承,07：信用证,08：包含)',
  ATTEN_STATUS varchar(5) DEFAULT NULL COMMENT '关注状态(01：正常,02：关注,03：不良)',
  SETTLE_STATUS varchar(5) DEFAULT NULL COMMENT '结清状态(0：未结清,1：已结清)',
  REMARKS varchar(200) DEFAULT NULL COMMENT '备注',
  ACC_NUM varchar(10) DEFAULT NULL COMMENT '笔数',
  SETTLE_DATE varchar(20) DEFAULT NULL COMMENT '结清日期',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='表外业务明细';

-- ----------------------------
-- Table structure for com_patent_case
-- ----------------------------
DROP TABLE IF EXISTS com_patent_case;
CREATE TABLE com_patent_case (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  PATENT_NAME varchar(200) DEFAULT NULL COMMENT '专利名称',
  PATENT_NO varchar(100) DEFAULT NULL COMMENT '专利号',
  APP_DATE varchar(20) DEFAULT NULL COMMENT '申请日期',
  GRANT_DATE varchar(20) DEFAULT NULL COMMENT '授予日期',
  EFFECTIVE_YEAR varchar(20) DEFAULT NULL COMMENT '专利有效期',
  INFO_ID varchar(100) DEFAULT NULL COMMENT '信息编号',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='拥有专利情况信息单元';

-- ----------------------------
-- Table structure for com_penalties
-- ----------------------------
DROP TABLE IF EXISTS com_penalties;
CREATE TABLE com_penalties (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  RECONSIDERATION_RESULT varchar(200) DEFAULT NULL COMMENT '行政复议结果',
  PENALTIES_COMAPNY varchar(100) DEFAULT NULL COMMENT '处罚机构名称',
  PENALTIES_ID varchar(100) DEFAULT NULL COMMENT '处罚决定书文号',
  SERIAL varchar(100) DEFAULT NULL COMMENT '行政处罚记录编号',
  PENALTIES_SUM varchar(100) DEFAULT NULL COMMENT '处罚金额',
  START_DATE varchar(100) DEFAULT NULL COMMENT '处罚日期',
  PENALTIES_SITATION varchar(500) DEFAULT NULL COMMENT '处罚执行情况',
  ILEHAL_BEHAVIOR varchar(500) DEFAULT NULL COMMENT '违法行为',
  PENALTIES_DECIDION varchar(500) DEFAULT NULL COMMENT '处罚决定',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='行政处罚记录信息单元';

-- ----------------------------
-- Table structure for com_pledge
-- ----------------------------
DROP TABLE IF EXISTS com_pledge;
CREATE TABLE com_pledge (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL_NO varchar(64) DEFAULT NULL COMMENT '流水号',
  PLEDGE_TYPE varchar(5) DEFAULT NULL COMMENT '抵质押物类型(01：抵押,02：质押)',
  PLEDGE_OWNER varchar(200) DEFAULT NULL COMMENT '抵押物所有人',
  PLEDGE_SPECIES varchar(200) DEFAULT NULL COMMENT '抵押物种类',
  CURRENCY varchar(15) DEFAULT NULL COMMENT '币种',
  ASSESS_SUM varchar(15) DEFAULT NULL COMMENT '估值金额',
  ASSESS_DATE varchar(20) DEFAULT NULL COMMENT '评估日期',
  GUAR_SUM varchar(15) DEFAULT NULL COMMENT '担保金额',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='抵/质押物';

-- ----------------------------
-- Table structure for com_profit_info_seven_info
-- ----------------------------
DROP TABLE IF EXISTS com_profit_info_seven_info;
CREATE TABLE com_profit_info_seven_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  INCOME_BUS varchar(100) DEFAULT NULL COMMENT '营业收入',
  FINA_COST varchar(100) DEFAULT NULL COMMENT '财务费用',
  UNFLOW_LOSS varchar(100) DEFAULT NULL COMMENT '非流动资产损失（其中：非流动资产处置损失)',
  FINA_ID varchar(100) DEFAULT NULL COMMENT '财务报表编号',
  SALE_COST varchar(100) DEFAULT NULL COMMENT '销售费用',
  MANA_COST varchar(100) DEFAULT NULL COMMENT '管理费用',
  INVES_INCOME varchar(100) DEFAULT NULL COMMENT '投资净收益',
  BUSS_OTHER_INCOM varchar(100) DEFAULT NULL COMMENT '营业外收入',
  DILU_EAR_PER_SHARE varchar(100) DEFAULT NULL COMMENT '稀释每股收益',
  REPORT_YEAR varchar(100) DEFAULT NULL COMMENT '报表年份',
  INCOME_COST varchar(100) DEFAULT NULL COMMENT '营业成本',
  BUSS_OTHER_PAY varchar(100) DEFAULT NULL COMMENT '营业外支出',
  BUS_TAX_OTHER varchar(100) DEFAULT NULL COMMENT '营业税金及附加',
  BUSS_PROFITS varchar(100) DEFAULT NULL COMMENT '营业利润',
  REPORT_TYPE varchar(100) DEFAULT NULL COMMENT '报表类型',
  SMART_TYPE_REPORT varchar(100) DEFAULT NULL COMMENT '报表类型细分',
  LOSS_REDU varchar(100) DEFAULT NULL COMMENT '资产减值损失',
  SUM_PROFITS varchar(100) DEFAULT NULL COMMENT '利润总额',
  INCOM_JOIN_VENTURE varchar(100) DEFAULT NULL COMMENT '对联营企业和合营企业的投资收益',
  INCOME_TAX varchar(100) DEFAULT NULL COMMENT '所得税费用',
  NET_PROFIT varchar(100) DEFAULT NULL COMMENT '净利润',
  NUM_FINA varchar(100) DEFAULT NULL COMMENT '业务管理机构',
  NUM_ORG varchar(100) DEFAULT NULL COMMENT '业务管理机构代码',
  CHANG_INCOM varchar(100) DEFAULT NULL COMMENT '公允价值变动净收益',
  EVERY_NET_INCOME varchar(100) DEFAULT NULL COMMENT '基本每股收益',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='企业利润及利润分配表（2007 版）信息单元';

-- ----------------------------
-- Table structure for com_profit_info_two_info
-- ----------------------------
DROP TABLE IF EXISTS com_profit_info_two_info;
CREATE TABLE com_profit_info_two_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  LOSS_FIX_ASSET varchar(30) DEFAULT NULL COMMENT '（营业外支出科目下）处置固定资产净损失',
  UNCOMFI_INVES_LOSS varchar(30) DEFAULT NULL COMMENT '未确认的投资损失',
  STAR_YEAR_UNDOPROFIT varchar(30) DEFAULT NULL COMMENT '年初未分配利润',
  ASSIGEN_PROFIT varchar(30) DEFAULT NULL COMMENT '可供分配的利润',
  PROFIT_INVEST varchar(30) DEFAULT NULL COMMENT '利润归还投资',
  EXTRA_YYGJ varchar(30) DEFAULT NULL COMMENT '提取任意盈余公积',
  NET_BUSS varchar(30) DEFAULT NULL COMMENT '主营业务收入净额',
  INCOME_OTHER varchar(30) DEFAULT NULL COMMENT '其他（收入）',
  NON_MONEY_BENEFITS varchar(30) DEFAULT NULL COMMENT '（营业外收入科目下）非货币性交易收益',
  PROFITS_BEFOR varchar(30) DEFAULT NULL COMMENT '（其他科目下）用以前年度含量工资节余弥补利润',
  LOSS_DEBT varchar(30) DEFAULT NULL COMMENT '（营业外支出科目下）债务重组损失',
  EXTRA_DEVELOP_FUND varchar(30) DEFAULT NULL COMMENT '提取企业发展基金',
  OTHERS_KFP varchar(30) DEFAULT NULL COMMENT '（可供分配的利润科目下）其他',
  PAY_DIVI_PT varchar(30) DEFAULT NULL COMMENT '应付普通股股利',
  FINA_ID varchar(30) DEFAULT NULL COMMENT '财务报表编号',
  NUM_FINA varchar(30) DEFAULT NULL COMMENT '业务管理机构',
  NUM_ORG varchar(30) DEFAULT NULL COMMENT '业务管理机构代码',
  SMART_TYPE_REPORT varchar(30) DEFAULT NULL COMMENT '报表类型细分',
  DISCOUNT varchar(30) DEFAULT NULL COMMENT '销售折扣与折让',
  OPERATING_EXPENSE varchar(30) DEFAULT NULL COMMENT '经营费用',
  OPERATING_EXPEN varchar(30) DEFAULT NULL COMMENT '营业费用',
  MANA_COST varchar(30) DEFAULT NULL COMMENT '管理费用',
  FINE_INCOME varchar(30) DEFAULT NULL COMMENT '（营业外收入科目下）罚款净收入',
  FINE_COST varchar(30) DEFAULT NULL COMMENT '（营业外支出科目下）罚款支出',
  EXTRA_SUR_MONEY varchar(30) DEFAULT NULL COMMENT '提取法定公益金',
  OTHER_INVEST_PROFITS varchar(30) DEFAULT NULL COMMENT '（可供投资者分配的利润科目下）其他',
  COST_BUSS varchar(30) DEFAULT NULL COMMENT '主营业务成本',
  INCOME_INVEST varchar(30) DEFAULT NULL COMMENT '投资收益',
  INCOME_FUTURE varchar(30) DEFAULT NULL COMMENT '期货收益',
  INCOME_BUSS_YYW varchar(30) DEFAULT NULL COMMENT '营业外收入',
  INCOME_ASSET_SHYI varchar(30) DEFAULT NULL COMMENT '（营业外收入科目下）处置固定资产净收益',
  BUSS_PAY varchar(30) DEFAULT NULL COMMENT '营业外支出',
  DONATE_COST varchar(30) DEFAULT NULL COMMENT '（营业外支出科目下）捐赠支出',
  SUR_RES_LOSS varchar(30) DEFAULT NULL COMMENT '盈余公积补亏',
  SUPP_FLOWS_ASSET varchar(30) DEFAULT NULL COMMENT '补充流动资本',
  EXTRA_RESERVE varchar(30) DEFAULT NULL COMMENT '提取储备基金',
  REPORT_YEAR varchar(30) DEFAULT NULL COMMENT '报表年份',
  OTHERS varchar(30) DEFAULT NULL COMMENT '其他（业务成本）',
  BUSS_PROFITS_Z varchar(30) DEFAULT NULL COMMENT '主营业务利润',
  BUSS_PROFITS varchar(30) DEFAULT NULL COMMENT '营业利润',
  OTHER_ADJUST_REASON varchar(30) DEFAULT NULL COMMENT '其他调整因素',
  SINGLE_RETEN_PROF varchar(30) DEFAULT NULL COMMENT '单项留用的利润',
  INCOME_BUS varchar(30) DEFAULT NULL COMMENT '主营业务收入',
  BUSS_OTHER_PROFITS varchar(30) DEFAULT NULL COMMENT '其他业务利润',
  OTHERS_COST varchar(30) DEFAULT NULL COMMENT '其他（费用）',
  INCOME_SUBSIDIES varchar(30) DEFAULT NULL COMMENT '补贴收入',
  PROFITS_LOSS_MIN varchar(30) DEFAULT NULL COMMENT '少数股东损益',
  NET_PROFIT varchar(30) DEFAULT NULL COMMENT '净利润',
  PROFITS_INVEST_FP varchar(30) DEFAULT NULL COMMENT '可供投资者分配的利润',
  EXP_PRD_COST varchar(30) DEFAULT NULL COMMENT '（主营业务成本科目下）出口产品销售成本',
  DEFE_INCOME varchar(30) DEFAULT NULL COMMENT '递延收益',
  INCOME_COMPANY_KS varchar(30) DEFAULT NULL COMMENT '（补贴收入科目下）补贴前亏损的企业补贴收入',
  INCOME_SALE_ASSET varchar(30) DEFAULT NULL COMMENT '（营业外收入科目下）出售无形资产收益',
  OTHERS_PROFITS varchar(30) DEFAULT NULL COMMENT '其他（利润）',
  OTHER_PAY varchar(30) DEFAULT NULL COMMENT '其他支出',
  TAX varchar(30) DEFAULT NULL COMMENT '所得税',
  DIVI_PAY_PREFER varchar(30) DEFAULT NULL COMMENT '应付优先股股利',
  PAY_DIV_ASSET varchar(30) DEFAULT NULL COMMENT '转作资本的普通股股利',
  UNDIS_PROFIT varchar(30) DEFAULT NULL COMMENT '未分配利润',
  LOSS_TAX_BEFOR varchar(30) DEFAULT NULL COMMENT '（未分配利润科目下）应由以后年度税前利润弥补的亏损',
  EXP_INCOME_PRD varchar(30) DEFAULT NULL COMMENT '（主营业务收入科目下）出口产品销售收入',
  IN_INCOME_PRD varchar(30) DEFAULT NULL COMMENT '（主营业务收入科目下）进口产品销售收入',
  BUS_TAX_OTHER varchar(30) DEFAULT NULL COMMENT '主营业务税金及附加',
  FINA_COST varchar(30) DEFAULT NULL COMMENT '财务费用',
  WAGE_CARRY_FORWARD varchar(30) DEFAULT NULL COMMENT '（其他支出）结转的含量工资包干节余',
  SUM_PROFITS varchar(30) DEFAULT NULL COMMENT '利润总额',
  EXTRA_SUR_RES varchar(30) DEFAULT NULL COMMENT '提取法定盈余公积',
  EXTRA_EMPLY_WEFARE varchar(30) DEFAULT NULL COMMENT '提取职工奖励及福利基金',
  REPORT_TYPE varchar(30) DEFAULT NULL COMMENT '报表类型',
  INCOME_DG varchar(30) DEFAULT NULL COMMENT '代购代销收入',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='企业利润及利润分配表（2002 版）信息单元';

-- ----------------------------
-- Table structure for com_provid_fund_pay_record
-- ----------------------------
DROP TABLE IF EXISTS com_provid_fund_pay_record;
CREATE TABLE com_provid_fund_pay_record (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL_NO varchar(64) DEFAULT NULL COMMENT '流水号',
  STATISTIC_DATE varchar(10) DEFAULT NULL COMMENT '保险类别',
  FIRST_PAY_DATE varchar(10) DEFAULT NULL COMMENT '初缴年月',
  EMPLOY_NUM varchar(10) DEFAULT NULL COMMENT '缴费基数',
  BASE_PAY varchar(15) DEFAULT NULL COMMENT '缴费基数',
  LAST_PAY_DATE varchar(20) DEFAULT NULL COMMENT '缴费状态',
  PAY_TO_DATE varchar(10) DEFAULT NULL COMMENT '缴至年月',
  PAY_STATUS varchar(15) DEFAULT NULL COMMENT '缴费状态',
  TOTAL_ARREAR_SUM varchar(15) DEFAULT NULL COMMENT '累计欠费金额',
  DATE_PAY_RECENT varchar(100) DEFAULT NULL COMMENT '最近一次缴费日期',
  PAY_RECOD_NUM_PROVID varchar(100) DEFAULT NULL COMMENT '缴费记录条数',
  STATIC_DATE varchar(100) DEFAULT NULL COMMENT '统计年月',
  SERIAL varchar(100) DEFAULT NULL COMMENT '编号',
  NUM_PEP varchar(100) DEFAULT NULL COMMENT '职工人数',
  SER_NO varchar(100) DEFAULT NULL COMMENT '账户编号',
  PAY_STATUS2 varchar(15) DEFAULT NULL COMMENT '缴费状态2',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='住房公积金缴费记录信息单元';

-- ----------------------------
-- Table structure for com_provid_pay_record_year
-- ----------------------------
DROP TABLE IF EXISTS com_provid_pay_record_year;
CREATE TABLE com_provid_pay_record_year (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  LAST_PAY_DATE varchar(100) DEFAULT NULL COMMENT '缴费状态',
  STATIC_DATE varchar(100) DEFAULT NULL COMMENT '统计年月',
  CUR_SHOULD_PAY varchar(100) DEFAULT NULL COMMENT '本月应缴金额',
  TOTAL_ARREAR_SUM varchar(100) DEFAULT NULL COMMENT '累计欠费金额',
  SERIAL varchar(100) DEFAULT NULL COMMENT '编号',
  CUR_ACTUAL_PAY varchar(100) DEFAULT NULL COMMENT '本月实缴金额',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='住房公积金缴费情况信息';

-- ----------------------------
-- Table structure for com_public_info_detail
-- ----------------------------
DROP TABLE IF EXISTS com_public_info_detail;
CREATE TABLE com_public_info_detail (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL_NO varchar(64) DEFAULT NULL COMMENT '流水号',
  STATIC_DATE varchar(15) DEFAULT NULL COMMENT '统计年月',
  CUR_SHOULD_PAY varchar(15) DEFAULT NULL COMMENT '本月应缴金额',
  CUR_ACTUAL_PAY varchar(15) DEFAULT NULL COMMENT '本月实缴金额',
  PAY_STATUS varchar(20) DEFAULT NULL COMMENT '缴费状态',
  TOTAL_ARREAR_SUM varchar(15) DEFAULT NULL COMMENT '累计欠费金额',
  SERIAL varchar(100) DEFAULT NULL COMMENT '编号',
  PAY_STATUS2 varchar(20) DEFAULT NULL COMMENT 'PAY_STATUS2',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公共事业缴费情况信息';

-- ----------------------------
-- Table structure for com_pub_cost_pay_record
-- ----------------------------
DROP TABLE IF EXISTS com_pub_cost_pay_record;
CREATE TABLE com_pub_cost_pay_record (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL_NO varchar(64) DEFAULT NULL COMMENT '流水号',
  PUB_COM_NAME varchar(200) DEFAULT NULL COMMENT '公用事业单位名称',
  INFO_TYPE varchar(20) DEFAULT NULL COMMENT '信息类型',
  STATIC_DATE varchar(15) DEFAULT NULL COMMENT '统计年月',
  PAY_STATUS varchar(20) DEFAULT NULL COMMENT '缴费状态',
  LAST_PAY_DATE varchar(20) DEFAULT NULL COMMENT '最近一次缴费日期',
  TOTAL_ARREAR_SUM varchar(20) DEFAULT NULL COMMENT '累计欠费金额',
  MAX_ARREAR_OCCUR_DATE varchar(20) DEFAULT NULL COMMENT '最高欠费发生日期',
  MAX_ARREAR_SUM varchar(20) DEFAULT NULL COMMENT '最高欠费金额',
  TYPE_BUSINESS varchar(100) DEFAULT NULL COMMENT '业务类型',
  SERIAL varchar(100) DEFAULT NULL COMMENT '编号',
  PUB_PAY_ID varchar(100) DEFAULT NULL COMMENT '公用事业缴费账户编号',
  PAY_RECOD_NUM_PUB varchar(100) DEFAULT NULL COMMENT '缴费记录条数',
  PAY_STATUS2 varchar(20) DEFAULT NULL COMMENT '缴费状态2',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公共事业缴费信息明细单元';

-- ----------------------------
-- Table structure for com_rat_info
-- ----------------------------
DROP TABLE IF EXISTS com_rat_info;
CREATE TABLE com_rat_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  RAT_RES varchar(100) DEFAULT NULL COMMENT '评级结果',
  RAT_DATE varchar(100) DEFAULT NULL COMMENT '评级日期',
  RAT_ID varchar(100) DEFAULT NULL COMMENT '评级信息编号',
  RAT_NAME varchar(100) DEFAULT NULL COMMENT '评级机构名称',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评级信息单元';

-- ----------------------------
-- Table structure for com_rat_info_obj
-- ----------------------------
DROP TABLE IF EXISTS com_rat_info_obj;
CREATE TABLE com_rat_info_obj (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  STA_TYPE varchar(100) DEFAULT NULL COMMENT '标注及声明类型',
  STA_CONT varchar(400) DEFAULT NULL COMMENT '标注或声明内容',
  OBJ_TYPE varchar(100) DEFAULT NULL COMMENT '对象类型',
  DATE_T varchar(100) DEFAULT NULL COMMENT '添加日期',
  OBJ_LOGO varchar(100) DEFAULT NULL COMMENT '对象标识',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='声明及异议标注信息单元';

-- ----------------------------
-- Table structure for com_repay_guar
-- ----------------------------
DROP TABLE IF EXISTS com_repay_guar;
CREATE TABLE com_repay_guar (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  GUAR_ACCOUT_ID varchar(100) DEFAULT NULL COMMENT '担保账户分机构汇总信息编号',
  FIVE_CLA varchar(100) DEFAULT NULL COMMENT '五级分类',
  NUM_ACCOUNT varchar(100) DEFAULT NULL COMMENT '账户数',
  REPAY_RESP_TYPE varchar(100) DEFAULT NULL COMMENT '相关还款责任类型',
  BALANCE_NUM varchar(100) DEFAULT NULL COMMENT '余额',
  REPAY_RESP_BALA varchar(100) DEFAULT NULL COMMENT '相关还款责任金额',
  GUAR_SUM varchar(100) DEFAULT NULL COMMENT '担保金额',
  SMART_BUS varchar(100) DEFAULT NULL COMMENT '业务种类细分',
  TYPE_ORG varchar(100) DEFAULT NULL COMMENT '业务管理机构类型',
  CODE_ORG varchar(100) DEFAULT NULL COMMENT '业务管理机构代码',
  NUM_GUAR_CONTRA varchar(100) DEFAULT NULL COMMENT '保证合同编号',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='相关还款责任担保账户分机构汇总信息单元';

-- ----------------------------
-- Table structure for com_repay_info
-- ----------------------------
DROP TABLE IF EXISTS com_repay_info;
CREATE TABLE com_repay_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  RECE_REPAY_ONECE_FORM varchar(100) DEFAULT NULL COMMENT '最近一次还款形式',
  OVER_PRINCIPAL varchar(100) DEFAULT NULL COMMENT '逾期本金',
  OVER_MONTH varchar(100) DEFAULT NULL COMMENT '逾期月数',
  BALANCE_NUM_DATE_CHANGE varchar(100) DEFAULT NULL COMMENT '余额变化日期',
  RECE_REPAY_SUM varchar(100) DEFAULT NULL COMMENT '最近一次应还总额',
  OVER_SUM varchar(100) DEFAULT NULL COMMENT '逾期总额',
  NUM_MONTH_REMAIN varchar(100) DEFAULT NULL COMMENT '剩余还款月数',
  SERIAL varchar(100) DEFAULT NULL COMMENT '编号',
  DATE_REPORT_INFO varchar(100) DEFAULT NULL COMMENT '信息报告日期',
  FIVE_CLA varchar(100) DEFAULT NULL COMMENT '五级分类',
  DATE_FIVE_CLA varchar(100) DEFAULT NULL COMMENT '五级分类认定日期',
  RECE_REPAY_ONECE_TIME varchar(100) DEFAULT NULL COMMENT '最近一次实际还款日期',
  RECE_REPAY_ONECE_SUM varchar(100) DEFAULT NULL COMMENT '最近一次实际还款总额',
  BALANCE_NUM varchar(100) DEFAULT NULL COMMENT '余额',
  RECE_REPAY_ONECE_CONVE_DATE varchar(100) DEFAULT NULL COMMENT '最近一次约定还款日期',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='还款表现信息';

-- ----------------------------
-- Table structure for com_repay_rep_num
-- ----------------------------
DROP TABLE IF EXISTS com_repay_rep_num;
CREATE TABLE com_repay_rep_num (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  NUM_REPAY_LIA varchar(64) DEFAULT NULL COMMENT '还款责任类型数量(借贷)',
  NUM_REPAY_LIA_DB varchar(64) DEFAULT NULL COMMENT '还款责任类型数量（担保）',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='相关还款责任表';

-- ----------------------------
-- Table structure for com_report_info
-- ----------------------------
DROP TABLE IF EXISTS com_report_info;
CREATE TABLE com_report_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  ORG_CODE varchar(200) DEFAULT NULL COMMENT '机构信用代码（查询机构代码）',
  CHINA_CREDIT_CODE varchar(200) DEFAULT NULL COMMENT '中征码',
  REPORT_DATE varchar(150) DEFAULT NULL COMMENT '报告日期',
  QUERY_REASON varchar(150) DEFAULT NULL COMMENT '查询原因',
  QUERY_OPERATOR varchar(200) DEFAULT NULL COMMENT '查询操作员',
  REPORT_TIME varchar(100) DEFAULT NULL COMMENT '报告生成时间',
  SUM_ENT_IDENT varchar(100) DEFAULT NULL COMMENT '企业身份标识个数',
  RATE_EXCHANGE varchar(100) DEFAULT NULL COMMENT '美元折人民币汇率',
  EFFE_DATE_RATE varchar(100) DEFAULT NULL COMMENT '汇率有效日期',
  ENT_NAME varchar(150) DEFAULT NULL COMMENT '企业名称',
  OBJ_LAB_ITEM varchar(100) DEFAULT NULL COMMENT '异议标注数目',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='报告头信息单元';

-- ----------------------------
-- Table structure for com_secur_pay_record
-- ----------------------------
DROP TABLE IF EXISTS com_secur_pay_record;
CREATE TABLE com_secur_pay_record (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL_NO varchar(64) DEFAULT NULL COMMENT '流水号',
  SECUR_TYPE varchar(10) DEFAULT NULL COMMENT '保险类别',
  INSURE_DATE varchar(20) DEFAULT NULL COMMENT '参保日期',
  STATISTIC_DATE varchar(10) DEFAULT NULL COMMENT '缴费基数',
  BASE_PAY varchar(15) DEFAULT NULL COMMENT '缴费基数',
  PAY_STATUS varchar(15) DEFAULT NULL COMMENT '缴费状态',
  TOTAL_ARREAR_SUM varchar(15) DEFAULT NULL COMMENT '累计欠费金额',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='社保缴费记录';

-- ----------------------------
-- Table structure for com_senior_manager_info
-- ----------------------------
DROP TABLE IF EXISTS com_senior_manager_info;
CREATE TABLE com_senior_manager_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SENIOR_DUTIES varchar(200) DEFAULT NULL COMMENT '职位',
  SENIOR_NAME varchar(300) DEFAULT NULL COMMENT '姓名',
  SNEIOR_CRED_TYPE varchar(100) DEFAULT NULL COMMENT '证件类型',
  SNEIOR_CRED_NUM varchar(200) DEFAULT NULL COMMENT '证件号码',
  SNEIOR_CRED_TYPE2 varchar(100) DEFAULT NULL COMMENT '证件类型2',
  SENIOR_DUTIES2 varchar(200) DEFAULT NULL COMMENT 'SENIOR_DUTIES2',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='主要组成人员信息';

-- ----------------------------
-- Table structure for com_spetrans_info
-- ----------------------------
DROP TABLE IF EXISTS com_spetrans_info;
CREATE TABLE com_spetrans_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  TRANS_INFO varchar(200) DEFAULT NULL COMMENT '交易明细信息',
  SERIAL varchar(100) DEFAULT NULL COMMENT '编号',
  DATE_TRANS varchar(100) DEFAULT NULL COMMENT '交易日期',
  TRANS_SUM varchar(100) DEFAULT NULL COMMENT '交易金额',
  MONTH_CHANGE_DUE_TIME varchar(100) DEFAULT NULL COMMENT '到期日期变更月数',
  TYPE_TRANS varchar(100) DEFAULT NULL COMMENT '交易类型',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='特定交易信息';

-- ----------------------------
-- Table structure for com_sup_org
-- ----------------------------
DROP TABLE IF EXISTS com_sup_org;
CREATE TABLE com_sup_org (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  HIGHT_NUM varchar(100) DEFAULT NULL COMMENT '上级机构身份标识号码',
  HIGHT_INSTI_TYPE varchar(100) DEFAULT NULL COMMENT '上级机构类型',
  HIGHT_INSTI_NAME varchar(100) DEFAULT NULL COMMENT '上级机构名称',
  HIGHT_INTI_IDET_TYPE varchar(100) DEFAULT NULL COMMENT '上级机构身份标识类型',
  DATE_UPDATE_HIGHT varchar(100) DEFAULT NULL COMMENT '更新日期',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='上级机构信息单元';

-- ----------------------------
-- Table structure for com_tax_arrears_record
-- ----------------------------
DROP TABLE IF EXISTS com_tax_arrears_record;
CREATE TABLE com_tax_arrears_record (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  TAX_AUTHORITIES varchar(200) DEFAULT NULL COMMENT '主管税务机关名称',
  TAX_ARREARS_SUM varchar(50) DEFAULT NULL COMMENT '欠税总额',
  TAX_ARREARS_DATE varchar(20) DEFAULT NULL COMMENT '欠税统计时间',
  TAX_ARRENS_ID varchar(100) DEFAULT NULL COMMENT '欠税记录编号',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='欠税记录信息单元';

-- ----------------------------
-- Table structure for com_tx_acc_org
-- ----------------------------
DROP TABLE IF EXISTS com_tx_acc_org;
CREATE TABLE com_tx_acc_org (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  TYPE_ORG varchar(100) DEFAULT NULL COMMENT '业务管理机构类型',
  NUM_ACC_SETTLE_SUM varchar(100) DEFAULT NULL COMMENT '已结清账户贴现金额合计',
  CODE_ORG varchar(100) DEFAULT NULL COMMENT '业务管理机构代码',
  NUM_ACC_SETTLE varchar(100) DEFAULT NULL COMMENT '已结清账户数',
  TYPE_BUSINESS varchar(100) DEFAULT NULL COMMENT '业务种类',
  FIVE_TYPE varchar(100) DEFAULT NULL COMMENT '五级分类',
  NUM_ORG_INFO varchar(100) DEFAULT NULL COMMENT '贴现账户分机构汇总信息编号',
  NUM_OUTSTAND_ACCOUNT varchar(100) DEFAULT NULL COMMENT '未结清账户数',
  OVER_PRINCIPAL_SUM varchar(100) DEFAULT NULL COMMENT '逾期本金合计',
  BALANCE_NUM_SUM varchar(100) DEFAULT NULL COMMENT '余额合计',
  OVER_SUM varchar(100) DEFAULT NULL COMMENT '逾期总额合计',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='贴现账户分机构汇总信息单元';

-- ----------------------------
-- Table structure for com_unclear_credit_type_summ
-- ----------------------------
DROP TABLE IF EXISTS com_unclear_credit_type_summ;
CREATE TABLE com_unclear_credit_type_summ (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  BUSS_TYPE varchar(5) DEFAULT NULL COMMENT '业务类型(01:贷款,02:类贷款,03:贸易融资,04:保理,05:票据贴现,06:银行承兑汇票,07:信用证,08:保函)',
  ATTENT_STATUS varchar(5) DEFAULT NULL COMMENT '关注状态(01：正常,02：关注,03：不良)',
  BUSS_NUM int(11) DEFAULT NULL COMMENT '笔数',
  BUSS_BALANCE varchar(15) DEFAULT NULL COMMENT '余额',
  SETTLE_STATUS varchar(2) DEFAULT NULL COMMENT '结清状态',
  BUSS_TYPE2 varchar(5) DEFAULT NULL COMMENT 'BUSS_TYPE2',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='未结清信贷业务分类信息概要';

-- ----------------------------
-- Table structure for com_verdict
-- ----------------------------
DROP TABLE IF EXISTS com_verdict;
CREATE TABLE com_verdict (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  LITIG_REASON varchar(100) DEFAULT NULL COMMENT '执行案由',
  APPLY_SYM varchar(200) DEFAULT NULL COMMENT '申请执行标的',
  RESULT varchar(100) DEFAULT NULL COMMENT '案件状态',
  SETTLE_STYLE varchar(100) DEFAULT NULL COMMENT '结案方式',
  REGISTER_DATE varchar(100) DEFAULT NULL COMMENT '立案日期',
  APPLY_SYM_SUM varchar(100) DEFAULT NULL COMMENT '申请执行标的金额',
  GOAL_SYM_SUM varchar(100) DEFAULT NULL COMMENT '已执行标的金额',
  SERIAL varchar(100) DEFAULT NULL COMMENT '强制执行记录编号',
  COURT_NAME varchar(100) DEFAULT NULL COMMENT '执行法院名称',
  GOAL_SYM varchar(200) DEFAULT NULL COMMENT '已执行标的',
  CASE_NUM varchar(100) DEFAULT NULL COMMENT '案号',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='强制执行记录信息单元';

-- ----------------------------
-- Table structure for com_was_guar
-- ----------------------------
DROP TABLE IF EXISTS com_was_guar;
CREATE TABLE com_was_guar (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL_NO varchar(64) DEFAULT NULL COMMENT '流水号',
  GUARANTOR varchar(200) DEFAULT NULL COMMENT '担保人',
  GUAR_DATE varchar(20) DEFAULT NULL COMMENT '担保日期',
  CURRENCY varchar(15) DEFAULT NULL COMMENT '币种',
  GUAR_SUM varchar(15) DEFAULT NULL COMMENT '担保金额',
  GUAR_STYLE varchar(100) DEFAULT NULL COMMENT '担保形式',
  CURRENCY2 varchar(15) DEFAULT NULL COMMENT 'CURRENCY2',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='被担保';

-- ----------------------------
-- Table structure for crq_customerauthordoc
-- ----------------------------
DROP TABLE IF EXISTS crq_customerauthordoc;
CREATE TABLE crq_customerauthordoc (
  SERIALNO varchar(96) NOT NULL COMMENT '编号',
  CUSTOMERID varchar(120) DEFAULT NULL COMMENT '客户编号',
  CUSTOMERNAME varchar(240) DEFAULT NULL COMMENT '客户名称',
  CERTTYPE varchar(60) DEFAULT NULL COMMENT '证件类型',
  CERTID varchar(120) DEFAULT NULL COMMENT '证件编号',
  INPUTUSERID varchar(96) DEFAULT NULL COMMENT '用户编号',
  INPUTORGID varchar(96) DEFAULT NULL COMMENT '机构编号',
  INPUTDATE varchar(30) DEFAULT NULL COMMENT '新增日期',
  UPDATEUSERID varchar(96) DEFAULT NULL COMMENT '修改用户编号',
  UPDATEORGID varchar(96) DEFAULT NULL COMMENT '修改机构编号',
  UPDATEDATE varchar(30) DEFAULT NULL COMMENT '更新时间',
  DOCNAME varchar(180) DEFAULT NULL COMMENT '编号名称',
  REMARK text COMMENT '备注',
  STATUS varchar(30) DEFAULT NULL COMMENT '状态',
  APPROVEDETAIL text COMMENT '查询明细',
  ATTTYPE varchar(120) DEFAULT NULL COMMENT '查询类型',
  PRIMARY KEY (SERIALNO) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='本地记录表';

-- ----------------------------
-- Table structure for crq_doc_attachment
-- ----------------------------
DROP TABLE IF EXISTS crq_doc_attachment;
CREATE TABLE crq_doc_attachment (
  DOCNO varchar(96) DEFAULT NULL COMMENT '影像编号',
  ATTACHMENTNO varchar(96) NOT NULL COMMENT '文件编号',
  FILENAME varchar(750) DEFAULT NULL COMMENT '文件名称',
  CONTENTTYPE varchar(96) DEFAULT NULL COMMENT '类型',
  CONTENTLENGTH varchar(96) DEFAULT NULL COMMENT '长度',
  CONTENTSTATUS varchar(54) DEFAULT NULL COMMENT '状态',
  BEGINTIME varchar(60) DEFAULT NULL COMMENT '开始时间',
  ENDTIME varchar(60) DEFAULT NULL COMMENT '结束时间',
  DOCCONTENT blob COMMENT '文件',
  INPUTUSER varchar(96) DEFAULT NULL COMMENT '用户',
  INPUTORG varchar(96) DEFAULT NULL COMMENT '机构',
  INPUTTIME varchar(60) DEFAULT NULL COMMENT '新增时间',
  UPDATEUSER varchar(96) DEFAULT NULL COMMENT '修改用户',
  UPDATETIME varchar(60) DEFAULT NULL COMMENT '修改时间',
  REMARK varchar(750) DEFAULT NULL COMMENT '备注',
  FILEPATH varchar(360) DEFAULT NULL COMMENT '文件路径',
  FULLPATH varchar(600) DEFAULT NULL COMMENT '文件全路径',
  FILESAVEMODE varchar(54) DEFAULT NULL COMMENT '保存模式',
  ATTTYPE varchar(120) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (ATTACHMENTNO) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='影像地址表';

-- ----------------------------
-- Table structure for crq_imageinfo
-- ----------------------------
DROP TABLE IF EXISTS crq_imageinfo;
CREATE TABLE crq_imageinfo (
  SERIALNO varchar(32) NOT NULL COMMENT '影像流水号',
  OBJECTNO varchar(32) NOT NULL COMMENT '关联影像编号',
  URLTYPE varchar(10) DEFAULT NULL COMMENT '影像地址类型',
  IMAGEURL varchar(640) DEFAULT NULL COMMENT '影像地址',
  REMARK varchar(250) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (SERIALNO) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='影像信息';

-- ----------------------------
-- Table structure for crq_query_history
-- ----------------------------
DROP TABLE IF EXISTS crq_query_history;
CREATE TABLE crq_query_history (
  QUERYID varchar(32) NOT NULL COMMENT '查询编号',
  QUERYMODE varchar(18) DEFAULT NULL COMMENT '查询模式',
  REPORTTYPE varchar(6) DEFAULT NULL COMMENT '信用报告类型',
  QUERYSTRATEGY varchar(18) DEFAULT NULL COMMENT '查询策略',
  QUERYSTATUS varchar(18) DEFAULT NULL COMMENT '查询状态',
  QUERYDETAIL text COMMENT '查询详情',
  QUERYACCOUNT varchar(32) DEFAULT NULL COMMENT '查询账号',
  CERTTYPE varchar(18) DEFAULT NULL COMMENT '证件类型',
  CERTID varchar(32) DEFAULT NULL COMMENT '证件号码',
  CUSTOMERNAME varchar(80) DEFAULT NULL COMMENT '被查询人名称',
  QUERYREASON varchar(18) DEFAULT NULL COMMENT '查询原因',
  REPORTMODELTYPE varchar(18) DEFAULT NULL COMMENT '报告类型',
  QUERYTIME varchar(20) DEFAULT NULL COMMENT '查询时间',
  REQUESTADDR varchar(20) DEFAULT NULL COMMENT 'IP地址',
  QUERYSOURCE varchar(18) DEFAULT NULL COMMENT '请求来源',
  ISQUERYPOOL varchar(1) DEFAULT NULL COMMENT '是否查询池',
  REPORTNO varchar(32) DEFAULT NULL COMMENT '报告编号',
  OPERATEUSERID varchar(32) DEFAULT NULL COMMENT '查询操作人',
  OPERATEORGID varchar(10) DEFAULT NULL COMMENT '查询操作人所在机构',
  APPROVESTATUS varchar(2) DEFAULT NULL COMMENT '批复状态',
  BATCHNO varchar(16) DEFAULT NULL COMMENT '批次号',
  LOANCARDPWD varchar(40) DEFAULT NULL COMMENT '贷款卡密码',
  QUERYTYPE varchar(10) DEFAULT NULL COMMENT '查询类型',
  ORGCODE varchar(12) DEFAULT NULL COMMENT '金融机构码',
  REPORTVALIDDAYS decimal(65,30) DEFAULT NULL COMMENT '本地信用报告有效期',
  REPORTSOURCE varchar(10) DEFAULT NULL COMMENT '信用报告来源',
  QUERYACCESSSTRATEGY varchar(12) DEFAULT NULL COMMENT '查询访问策略',
  REPORTPATH varchar(200) DEFAULT NULL COMMENT '报告路径',
  ENCRYPTPWD varchar(200) DEFAULT NULL COMMENT '加密密码',
  EXPIREDFLAG char(1) DEFAULT NULL COMMENT '是否作废',
  ARCHIVEFLAG char(1) DEFAULT NULL COMMENT '是否完成授权档案上传',
  REPORTVILADDAYS varchar(200) DEFAULT NULL COMMENT '有效期',
  QUERYACCOUNTPWD varchar(200) DEFAULT NULL COMMENT '人行账户密码',
  POSTADDR varchar(200) DEFAULT NULL COMMENT '邮箱',
  CRTNO varchar(200) DEFAULT NULL COMMENT 'CRT编码',
  UPDAY varchar(200) DEFAULT NULL COMMENT '更新日',
  DERECTCR varchar(200) DEFAULT NULL COMMENT '查询目录',
  CRQORGID varchar(200) DEFAULT NULL COMMENT '查询机构编码',
  PRIMARY KEY (QUERYID) USING BTREE,
  KEY IDX_CQH_INDEX (CERTTYPE,CERTID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='查询历史';

-- ----------------------------
-- Table structure for crq_query_relative
-- ----------------------------
DROP TABLE IF EXISTS crq_query_relative;
CREATE TABLE crq_query_relative (
  SERIALNO varchar(32) NOT NULL COMMENT '本次查询申请编号',
  CHANNEL varchar(32) NOT NULL COMMENT '渠道号',
  OBJECTNO varchar(32) NOT NULL COMMENT '关联报告编号',
  APPLYNO varchar(32) NOT NULL COMMENT '业务申请编号',
  IMAGEURL varchar(320) DEFAULT NULL COMMENT '授权书影像地址',
  QUERYUSERID varchar(32) DEFAULT NULL COMMENT '查询申请人编号',
  QUERYUSERNAME varchar(32) DEFAULT NULL COMMENT '查询申请名称',
  CHECKUSERID varchar(20) DEFAULT NULL COMMENT '查询复核人编号',
  CHECKUSERNAME varchar(32) DEFAULT NULL COMMENT '查询复核人名称',
  IP varchar(16) DEFAULT NULL COMMENT '查询申请IP',
  CHANNELNO varchar(16) DEFAULT NULL COMMENT '产品渠道号',
  TRANNO varchar(32) DEFAULT NULL COMMENT '交易流水号',
  CUSTOMERNAME varchar(80) DEFAULT NULL COMMENT '客户名称',
  CERTTYPE varchar(16) DEFAULT NULL COMMENT '证件类型',
  CERTID varchar(32) DEFAULT NULL COMMENT '证件编号',
  REASON varchar(5) DEFAULT NULL COMMENT '查询原因',
  STATUS varchar(5) DEFAULT NULL COMMENT '查询结果',
  date varchar(20) DEFAULT NULL COMMENT '查询时间',
  QUERYID varchar(32) DEFAULT NULL COMMENT '查询编号',
  PRIMARY KEY (SERIALNO,CHANNEL) USING BTREE,
  KEY crq_query_relative_queryid_idx (QUERYID) USING BTREE,
  KEY IDX_CRQ_QUERY_RELATIVE (APPLYNO) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='征信查询记录';

-- ----------------------------
-- Table structure for crq_reportbaseinfo
-- ----------------------------
DROP TABLE IF EXISTS crq_reportbaseinfo;
CREATE TABLE crq_reportbaseinfo (
  REPORTNO varchar(32) NOT NULL COMMENT '报告编号',
  REPORTTYPE varchar(32) DEFAULT NULL COMMENT '报告类型',
  OPERATEUSER varchar(100) DEFAULT NULL COMMENT '查询操作员',
  OPERATEORG varchar(100) DEFAULT NULL COMMENT '查询机构',
  QUERYREASON varchar(100) DEFAULT NULL COMMENT '查询原因',
  NAME varchar(100) DEFAULT NULL COMMENT '被查询者姓名',
  CERTTYPE varchar(100) DEFAULT NULL COMMENT '被查询者证件类型',
  CERTNO varchar(100) DEFAULT NULL COMMENT '被查询者证件号码',
  QUERYTIME varchar(20) DEFAULT NULL COMMENT '查询请求时间',
  REPORTCREATETIME varchar(20) DEFAULT NULL COMMENT '报告生成时间',
  QUERYMODE varchar(100) DEFAULT NULL COMMENT '查询模式',
  REPORTPATH varchar(200) DEFAULT NULL COMMENT '原始报告路径',
  PARSEORSAVEFAILED varchar(1) DEFAULT NULL COMMENT '解析或保存失败',
  NOREQUIREDREPORT varchar(1) DEFAULT NULL COMMENT '抓取成功但人行无此人信用报告',
  ENCRYPTPWD text COMMENT '原始报告加密加压存储密码',
  REPORTDEFVERSIONNO varchar(40) DEFAULT NULL COMMENT '信用报告定义模板版本号',
  REPORTPRINTNUM decimal(65,30) DEFAULT NULL COMMENT '征信报告打印次数',
  PRIMARY KEY (REPORTNO) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='报告基本信息';

-- ----------------------------
-- Table structure for data_to_history_log
-- ----------------------------
DROP TABLE IF EXISTS data_to_history_log;
CREATE TABLE data_to_history_log (
  EXECUTE_TIME date DEFAULT NULL COMMENT '执行时间',
  PROC_NAME varchar(20) DEFAULT NULL COMMENT '存储过程名称',
  STEP decimal(3,0) DEFAULT NULL COMMENT '执行步骤',
  STATUS decimal(1,0) DEFAULT NULL COMMENT '执行状态（0-失败 1-成功）',
  EXECUTE_RESULT varchar(500) DEFAULT NULL COMMENT '执行结果',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='数据移至历史表日志';

-- ----------------------------
-- Table structure for dict_col_mapping
-- ----------------------------
DROP TABLE IF EXISTS dict_col_mapping;
CREATE TABLE dict_col_mapping (
  D_NUM varchar(5) DEFAULT NULL COMMENT 'D_NUM',
  TABLE_NAME varchar(50) DEFAULT NULL COMMENT '表名',
  COLUMN_NAME varchar(50) DEFAULT NULL COMMENT '列名',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='dict_col_mapping';

-- ----------------------------
-- Table structure for dict_col_mapping1
-- ----------------------------
DROP TABLE IF EXISTS dict_col_mapping1;
CREATE TABLE dict_col_mapping1 (
  D_NUM varchar(5) DEFAULT NULL COMMENT 'D_NUM',
  TABLE_NAME varchar(50) DEFAULT NULL COMMENT '表名',
  COLUMN_NAME varchar(50) DEFAULT NULL COMMENT '列名',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='dict_col_mapping';

-- ----------------------------
-- Table structure for dict_col_mapping_1124
-- ----------------------------
DROP TABLE IF EXISTS dict_col_mapping_1124;
CREATE TABLE dict_col_mapping_1124 (
  D_NUM varchar(5) DEFAULT NULL COMMENT 'D_NUM',
  TABLE_NAME varchar(50) DEFAULT NULL COMMENT '表名',
  COLUMN_NAME varchar(50) DEFAULT NULL COMMENT '列名',
  sgcid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '自增主键'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for dict_col_mapping_temp
-- ----------------------------
DROP TABLE IF EXISTS dict_col_mapping_temp;
CREATE TABLE dict_col_mapping_temp (
  D_NUM varchar(5) DEFAULT NULL COMMENT 'D_NUM',
  TABLE_NAME varchar(50) DEFAULT NULL COMMENT '表名',
  COLUMN_NAME varchar(50) DEFAULT NULL COMMENT '列名',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='dict_col_mapping';

-- ----------------------------
-- Table structure for fund_table
-- ----------------------------
DROP TABLE IF EXISTS fund_table;
CREATE TABLE fund_table (
  ID varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '编号',
  NAME varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '姓名',
  ID_CARD varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '身份证',
  AUTH_NUM varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '贷前授权码',
  STATE varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '请求结果标识',
  TYPE varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '操作类型',
  ERRORCODE varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '失败代码',
  ERRORMSG varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '失败描述',
  DHCODE varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '贷后授权码',
  RESULT varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '公积金查询结果的对象形式',
  XMLRESULT longtext CHARACTER SET utf8 COMMENT 'XML格式',
  JSONRESULT longtext CHARACTER SET utf8 COMMENT 'json格式',
  PRIMARY KEY (ID),
  KEY fund_table_index_auth_num (AUTH_NUM),
  KEY fund_table_index_id_card (ID_CARD)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for fyftmx_temp1
-- ----------------------------
DROP TABLE IF EXISTS fyftmx_temp1;
CREATE TABLE fyftmx_temp1 (
  MXNO int(11) NOT NULL AUTO_INCREMENT COMMENT 'MXNO',
  TRADE_NO varchar(100) DEFAULT NULL COMMENT 'TRADE_NO',
  DATA_DATE varchar(32) DEFAULT NULL COMMENT 'DATA_DATE',
  CLIENT_TYPE int(11) DEFAULT NULL COMMENT 'CLIENT_TYPE',
  ORG_ID varchar(32) DEFAULT NULL COMMENT 'ORG_ID',
  user_info varchar(100) DEFAULT NULL COMMENT 'user_info',
  PRIMARY KEY (MXNO) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='fyftmx_temp1';

-- ----------------------------
-- Table structure for fyftmx_temp2
-- ----------------------------
DROP TABLE IF EXISTS fyftmx_temp2;
CREATE TABLE fyftmx_temp2 (
  MXNO int(11) NOT NULL AUTO_INCREMENT COMMENT 'MXNO',
  DATA_DATE varchar(32) DEFAULT NULL COMMENT 'DATA_DATE',
  ORG_ID varchar(32) DEFAULT NULL COMMENT 'ORG_ID',
  pro_id varchar(20) DEFAULT NULL COMMENT 'pro_id',
  user_info varchar(100) DEFAULT NULL COMMENT 'user_info',
  PRIMARY KEY (MXNO) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='fyftmx_temp2';

-- ----------------------------
-- Table structure for id_url
-- ----------------------------
DROP TABLE IF EXISTS id_url;
CREATE TABLE id_url (
  ID varchar(64) DEFAULT NULL COMMENT '查询编号',
  APPLICATION_TYPE varchar(2) DEFAULT NULL COMMENT '影像资料类型',
  APPLICATION_URL varchar(1000) DEFAULT NULL COMMENT '影像资料地址',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '插入时间',
  FILENAME varchar(100) DEFAULT NULL COMMENT '来源文件名',
  QUERY_NO varchar(64) DEFAULT NULL COMMENT '流水号',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='影像资料';

-- ----------------------------
-- Table structure for important_message_info
-- ----------------------------
DROP TABLE IF EXISTS important_message_info;
CREATE TABLE important_message_info (
  REQUEST_NO int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '上传文件代码',
  import_message_name varchar(50) DEFAULT NULL COMMENT '上传文件名',
  org_code varchar(30) DEFAULT NULL COMMENT '本机构业务管理机构代码',
  NAME varchar(20) DEFAULT NULL COMMENT '借款人姓名',
  card_type int(11) DEFAULT NULL COMMENT '证件类型',
  card_no varchar(20) DEFAULT NULL COMMENT '证件号码',
  info_no varchar(10) DEFAULT NULL COMMENT '信息代码',
  create_time date DEFAULT NULL COMMENT '提示信息生成时间',
  PRIMARY KEY (REQUEST_NO) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='重要提示信息明细表';

-- ----------------------------
-- Table structure for importinfo_col_mapping
-- ----------------------------
DROP TABLE IF EXISTS importinfo_col_mapping;
CREATE TABLE importinfo_col_mapping (
  XML_TAG varchar(10) DEFAULT NULL COMMENT 'XML_TAG',
  TABLE_NAME varchar(50) DEFAULT NULL COMMENT '表名',
  TABLE_COMMENTS varchar(100) DEFAULT NULL COMMENT '表名中文名称',
  COLUMN_NAME varchar(50) DEFAULT NULL COMMENT '列名',
  COMMENT_NAME varchar(300) DEFAULT NULL COMMENT '列名中文名称',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='重要信息提示所需表信息';

-- ----------------------------
-- Table structure for obj_add_remark
-- ----------------------------
DROP TABLE IF EXISTS obj_add_remark;
CREATE TABLE obj_add_remark (
  ID varchar(64) DEFAULT NULL COMMENT 'ID',
  RESULTCODE varchar(100) DEFAULT NULL COMMENT '处理结果代码',
  RESULTDESC varchar(1000) DEFAULT NULL COMMENT '处理结果描述',
  SERVICERETURNCODE varchar(100) DEFAULT NULL COMMENT '业务回执代码',
  USER_ID varchar(64) DEFAULT NULL COMMENT '用户id',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='添加标注';

-- ----------------------------
-- Table structure for obj_check_item
-- ----------------------------
DROP TABLE IF EXISTS obj_check_item;
CREATE TABLE obj_check_item (
  ID varchar(64) DEFAULT NULL COMMENT 'ID',
  RESULTCODE varchar(100) DEFAULT NULL COMMENT '处理结果代码',
  RESULTDESC varchar(1000) DEFAULT NULL COMMENT '处理结果描述',
  BEGINDATE varchar(30) DEFAULT NULL COMMENT '开始日期',
  ENDDATE varchar(30) DEFAULT NULL COMMENT '结束日期',
  TOCHECKNM varchar(100) DEFAULT NULL COMMENT '异议事项单个数',
  ORG_ID varchar(100) DEFAULT NULL COMMENT '异议处理机构',
  RELATIVE_ENDDATE varchar(30) DEFAULT NULL COMMENT '相对结束日期（=开始日期+5天）',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='获取待核查异议事项';

-- ----------------------------
-- Table structure for obj_check_item_att
-- ----------------------------
DROP TABLE IF EXISTS obj_check_item_att;
CREATE TABLE obj_check_item_att (
  ID varchar(64) DEFAULT NULL COMMENT 'ID',
  RESULTCODE varchar(100) DEFAULT NULL COMMENT '处理结果代码',
  RESULTDESC varchar(1000) DEFAULT NULL COMMENT '处理结果描述',
  OBJCHECKID varchar(100) DEFAULT NULL COMMENT '异议事项号',
  ENCLOSUREFLAG varchar(100) DEFAULT NULL COMMENT '是否存在附件',
  ENCLOSUREINF varchar(100) DEFAULT NULL COMMENT '附件信息',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='获取待核查异议事项附件信息';

-- ----------------------------
-- Table structure for obj_handler_result
-- ----------------------------
DROP TABLE IF EXISTS obj_handler_result;
CREATE TABLE obj_handler_result (
  ID varchar(64) NOT NULL COMMENT 'ID',
  ATT_CNT decimal(2,0) DEFAULT NULL COMMENT '附件个数',
  RESULT_DESC varchar(4000) DEFAULT NULL COMMENT '处理结果',
  PRIMARY KEY (ID) USING BTREE,
  KEY IDX_OBJ_HANDLER_RESULT_INDEX (ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='异议处理结果填写表';

-- ----------------------------
-- Table structure for obj_handler_result_att
-- ----------------------------
DROP TABLE IF EXISTS obj_handler_result_att;
CREATE TABLE obj_handler_result_att (
  HR_ID varchar(64) NOT NULL COMMENT '异议处理结果表id',
  ATT_NAME varchar(100) NOT NULL COMMENT '附件名称',
  ATT_PATH varchar(200) NOT NULL COMMENT '附件在ftp的路径',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY IDX_OBJ_HANDLER_RESULT_ATT_INDEX (HR_ID,ATT_NAME) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='异议处理结果附件表';

-- ----------------------------
-- Table structure for obj_historicalcheckinf
-- ----------------------------
DROP TABLE IF EXISTS obj_historicalcheckinf;
CREATE TABLE obj_historicalcheckinf (
  T_OBJCHECKID varchar(64) DEFAULT NULL COMMENT '异议事项单信息ObjCheckID(关联OBJ_TOCHECKINF的ObjCheckID)',
  CHECKTIME varchar(100) DEFAULT NULL COMMENT '处理核查时间',
  CHECKRESULT varchar(1000) DEFAULT NULL COMMENT '核查结果',
  CHECKRESULTDESC varchar(100) DEFAULT NULL COMMENT '核查结果描述',
  CHECKORGCODE varchar(100) DEFAULT NULL COMMENT '核查机构代码',
  CHECKUSERCODE varchar(100) DEFAULT NULL COMMENT '核查用户代码',
  PHONENUM varchar(100) DEFAULT NULL COMMENT '有效联系电话',
  CHECKACCEPTFLAG varchar(100) DEFAULT NULL COMMENT '是否接受核查结果',
  CHECKOPINION varchar(100) DEFAULT NULL COMMENT '核查处理意见',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='历史核查信息';

-- ----------------------------
-- Table structure for obj_tocheckinf
-- ----------------------------
DROP TABLE IF EXISTS obj_tocheckinf;
CREATE TABLE obj_tocheckinf (
  CI_ID varchar(64) DEFAULT NULL COMMENT '待核查异议事项id(关联OBJ_CHECK_ITEM的id)',
  OBJCHECKID varchar(70) DEFAULT NULL COMMENT '异议事项号',
  OBJCHECKNUM varchar(70) DEFAULT NULL COMMENT '异议事项流水号',
  CHECKBEGINDATE varchar(70) DEFAULT NULL COMMENT '核查开始日期',
  NAME varchar(70) DEFAULT NULL COMMENT '姓名(企业名称)',
  IDTYPE varchar(70) DEFAULT NULL COMMENT '证件类型(企业身份标识类型)',
  IDNUM varchar(70) DEFAULT NULL COMMENT '证件号码(企业身份标识号码)',
  PHONENUM varchar(70) DEFAULT NULL COMMENT '有效联系电话',
  OBJITEMINF varchar(70) DEFAULT NULL COMMENT '异议事项信息',
  OBJITEMDESC varchar(700) DEFAULT NULL COMMENT '异议说明',
  DATAPROVIDERORGCODE varchar(70) DEFAULT NULL COMMENT '数据提供机构代码',
  DATAOCCURORGCODE varchar(70) DEFAULT NULL COMMENT '数据发生机构代码',
  BUSINESSCODE varchar(70) DEFAULT NULL COMMENT '业务标识号',
  BUSINESSTYPE varchar(70) DEFAULT NULL COMMENT '业务种类',
  CHECKFINALDATE varchar(70) DEFAULT NULL COMMENT '核查到期日期',
  DATAOCCURDATE varchar(70) DEFAULT NULL COMMENT '数据发生日期',
  DATAOCCURAMOUNT varchar(70) DEFAULT NULL COMMENT '数据发生金额',
  ENCLOSUREFLAG varchar(70) DEFAULT NULL COMMENT '是否存在附件',
  HISTORICALCHECKINF varchar(70) DEFAULT NULL COMMENT 'HISTORICALCHECKINF',
  ORG_ID varchar(64) DEFAULT NULL COMMENT '被分配处理机构',
  RESULT_PHONENUM varchar(70) DEFAULT NULL COMMENT '有效联系电话（个人异议事项核查结果）',
  RESULT_CHECKRESULT varchar(70) DEFAULT NULL COMMENT '核查结果（个人异议事项核查结果）',
  RESULT_CHECKRESULTDESC varchar(70) DEFAULT NULL COMMENT '异议核查结果描述（个人异议事项核查结果）',
  CORRECTRESULT varchar(70) DEFAULT NULL COMMENT '异议更正结果',
  CORRECTDESC varchar(70) DEFAULT NULL COMMENT '异议更正结果描述',
  CORRECT_ENCLOSUREINF varchar(70) DEFAULT NULL COMMENT '异议更正上传附件名称',
  RELATIVE_ENDDATE varchar(70) DEFAULT NULL COMMENT '相对检查到期时间=（检查开始时间+5天）',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='异议事项单信息';

-- ----------------------------
-- Table structure for obj_universal_result
-- ----------------------------
DROP TABLE IF EXISTS obj_universal_result;
CREATE TABLE obj_universal_result (
  ID varchar(64) DEFAULT NULL COMMENT 'ID',
  RESULTCODE varchar(100) DEFAULT NULL COMMENT '处理结果代码',
  RESULTDESC varchar(1000) DEFAULT NULL COMMENT '处理结果描述',
  USER_ID varchar(64) DEFAULT NULL COMMENT '处理用户名',
  REPORT_TYPE varchar(1) DEFAULT NULL COMMENT '报告类型（1-获取个人待核查异议事项 2-获取个人待核查异议事项附件信息 3-反馈个人异议事项核查结果 4-反馈个人异议事项更正结果 5-查询个人异议事项更正结果接受情况 6-添加个人标注 7-删除个人标注）',
  OBJCHECKID varchar(20) DEFAULT NULL COMMENT 'OBJCHECKID',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='通用应答报文';

-- ----------------------------
-- Table structure for obj_update_result_accept
-- ----------------------------
DROP TABLE IF EXISTS obj_update_result_accept;
CREATE TABLE obj_update_result_accept (
  ID varchar(64) DEFAULT NULL COMMENT 'ID',
  RESULTCODE varchar(100) DEFAULT NULL COMMENT '处理结果代码',
  RESULTDESC varchar(1000) DEFAULT NULL COMMENT '处理结果描述',
  CORRECTACCEPTFLAG varchar(100) DEFAULT NULL COMMENT '是否接受更正结果',
  CORRECTOPINION varchar(100) DEFAULT NULL COMMENT '更正处理意见',
  USER_ID varchar(64) DEFAULT NULL COMMENT '用户id',
  OBJCHECKID varchar(20) DEFAULT NULL COMMENT 'OBJCHECKID',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='查询异议事项更正结果接受情况';

-- ----------------------------
-- Table structure for one_dict
-- ----------------------------
DROP TABLE IF EXISTS one_dict;
CREATE TABLE one_dict (
  ID varchar(100) DEFAULT NULL COMMENT 'ID',
  TABLE_NAME varchar(100) DEFAULT NULL COMMENT '表名',
  TABLE_COMMENT varchar(100) DEFAULT NULL COMMENT 'TABLE_COMMENT',
  COLUMN_NAME varchar(100) DEFAULT NULL COMMENT 'COLUMN_NAME',
  COLUMN_COMMENT varchar(1000) DEFAULT NULL COMMENT 'COLUMN_COMMENT',
  IS_ADD_NEW_COL varchar(1) DEFAULT NULL COMMENT 'IS_ADD_NEW_COL',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='one_dict';

-- ----------------------------
-- Table structure for one_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS one_dictionaries;
CREATE TABLE one_dictionaries (
  D_NUM varchar(5) DEFAULT NULL COMMENT '编号',
  CODE varchar(10) DEFAULT NULL COMMENT '编码',
  NAME varchar(100) DEFAULT NULL COMMENT '名称',
  D_DESC varchar(300) DEFAULT NULL COMMENT '字典描述',
  NOTE varchar(200) DEFAULT NULL COMMENT '备注',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='一代标签字典表';

-- ----------------------------
-- Table structure for one_dictname
-- ----------------------------
DROP TABLE IF EXISTS one_dictname;
CREATE TABLE one_dictname (
  ID varchar(100) DEFAULT NULL COMMENT '字典编号',
  TABLE_NAME varchar(100) DEFAULT NULL COMMENT 'TABLE_NAME',
  TABLE_COMMENT varchar(100) DEFAULT NULL COMMENT 'TABLE_COMMENT',
  COLUMN_NAME varchar(100) DEFAULT NULL COMMENT 'COLUMN_NAME',
  COLUMN_COMMENT varchar(1000) DEFAULT NULL COMMENT 'COLUMN_COMMENT',
  IS_ONE varchar(1) DEFAULT NULL COMMENT '是否一代专用 1-一代专用，0-一二代通用',
  WHERESQL varchar(500) DEFAULT NULL COMMENT 'WHERESQL',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='一代字典列';

-- ----------------------------
-- Table structure for password_list
-- ----------------------------
DROP TABLE IF EXISTS password_list;
CREATE TABLE password_list (
  PWD_CODE varchar(10) DEFAULT NULL COMMENT '密码编号',
  PASSWORD varchar(50) DEFAULT NULL COMMENT '密码明文',
  PWD_ENCRYPT varchar(500) DEFAULT NULL COMMENT '密码加密',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='密码存放列表';

-- ----------------------------
-- Table structure for perbank_username_interface
-- ----------------------------
DROP TABLE IF EXISTS perbank_username_interface;
CREATE TABLE perbank_username_interface (
  USERNAME varchar(100) NOT NULL COMMENT '人行账号',
  PREVIOUS_PASSWORD varchar(100) DEFAULT NULL COMMENT '原密码',
  CURRENT_PASSWORD varchar(100) DEFAULT NULL COMMENT '新密码',
  UPDATE_TIME varchar(20) DEFAULT NULL COMMENT '更新密码时间',
  RESULTCODE varchar(100) DEFAULT NULL COMMENT '处理结果代码',
  RESULTDESC varchar(100) DEFAULT NULL COMMENT '处理结果描述',
  MODIFRESULTCODE varchar(10) DEFAULT NULL COMMENT '修改结果代码',
  ERRDESC varchar(200) DEFAULT NULL COMMENT '错误原因描述',
  PRIMARY KEY (USERNAME) USING BTREE,
  KEY IDX_PERBANK_USERNAME_INTERFACE_INDEX (USERNAME) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='接口用户人行账户密码信息';

-- ----------------------------
-- Table structure for per_admini_reward
-- ----------------------------
DROP TABLE IF EXISTS per_admini_reward;
CREATE TABLE per_admini_reward (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL varchar(10) DEFAULT NULL COMMENT '编号',
  REWARD_COMPANY varchar(200) DEFAULT NULL COMMENT '奖励机构',
  REWARD_CONTENTS varchar(200) DEFAULT NULL COMMENT '奖励内容',
  REWARD_EFFECTIVE_DATE varchar(20) DEFAULT NULL COMMENT '生效年月',
  STOP_DATE varchar(20) DEFAULT NULL COMMENT '截止年月',
  LABEL_CNT varchar(100) DEFAULT NULL COMMENT '标注及声明个数',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_ADMINI_REWARD (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='行政奖励记录信息段';

-- ----------------------------
-- Table structure for per_after_pay_info
-- ----------------------------
DROP TABLE IF EXISTS per_after_pay_info;
CREATE TABLE per_after_pay_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  PAY_COST_STATUS varchar(100) DEFAULT NULL COMMENT '当前缴费状态',
  PAY_COST_RECORD varchar(100) DEFAULT NULL COMMENT '最近 24 个月缴费记录',
  ORG_TYPE varchar(100) DEFAULT NULL COMMENT '业务类型',
  OWE_SUM varchar(100) DEFAULT NULL COMMENT '当前欠费金额',
  ORG_NAME varchar(100) DEFAULT NULL COMMENT '机构名称',
  CHG_ACC_YM varchar(100) DEFAULT NULL COMMENT '记账年月',
  ACC_TYPE varchar(100) DEFAULT NULL COMMENT '后付费账户类型',
  OPEN_DATE varchar(100) DEFAULT NULL COMMENT '业务开通日期',
  LABEL_CNT varchar(100) DEFAULT NULL COMMENT '标注及声明个数',
  SERIAL varchar(100) DEFAULT NULL COMMENT 'SERIAL',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_AFTER_PAY_INFO (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后付费业务信息段';

-- ----------------------------
-- Table structure for per_after_pay_owe_info
-- ----------------------------
DROP TABLE IF EXISTS per_after_pay_owe_info;
CREATE TABLE per_after_pay_owe_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  ARRE_ACC_NUM varchar(100) DEFAULT NULL COMMENT '欠费账户数',
  BUSS_TYPE varchar(100) DEFAULT NULL COMMENT '后付费业务类型',
  ARRE_SUM varchar(100) DEFAULT NULL COMMENT '欠费金额',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_AFTER_PAY_OWE_INFO (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后付费业务欠费信息';

-- ----------------------------
-- Table structure for per_assets_disposal
-- ----------------------------
DROP TABLE IF EXISTS per_assets_disposal;
CREATE TABLE per_assets_disposal (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL varchar(10) DEFAULT NULL COMMENT '编号',
  INFO_TYPE varchar(5) DEFAULT NULL COMMENT '类型(0:资产处置；1:保证人代偿)',
  COMPANY_NAME varchar(200) DEFAULT NULL COMMENT '机构名称',
  RECEIVE_DATE varchar(20) DEFAULT NULL COMMENT '接收/代偿日期',
  AGGREGATE_AMOUNT varchar(20) DEFAULT NULL COMMENT '金额',
  LAST_REPAY_DATE varchar(20) DEFAULT NULL COMMENT '最近一次还款日期',
  BALANCE varchar(20) DEFAULT NULL COMMENT '余额',
  INFO_TYPE2 varchar(5) DEFAULT NULL COMMENT 'INFO_TYPE2',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY idx_reportId (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=131298 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='资产处置/保证人代偿信息';

-- ----------------------------
-- Table structure for per_basic
-- ----------------------------
DROP TABLE IF EXISTS per_basic;
CREATE TABLE per_basic (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  CLIENT_NAME varchar(70) DEFAULT NULL COMMENT '被查询者姓名',
  CREDENTIALS_TYPE varchar(10) DEFAULT NULL COMMENT '被查询者证件类型',
  CREDENTIALS_NO varchar(70) DEFAULT NULL COMMENT '被查询者证件号码',
  CLIENT_SEX varchar(10) DEFAULT NULL COMMENT '性别',
  CLIENT_BIRTHDAY varchar(70) DEFAULT NULL COMMENT '出生日期',
  MARITAL_STATUS varchar(10) DEFAULT NULL COMMENT '婚姻状况',
  PHONE_NUM varchar(20) DEFAULT NULL COMMENT '手机号码',
  COMPANY_TEL varchar(20) DEFAULT NULL COMMENT '单位电话',
  FAMILY_TEL varchar(20) DEFAULT NULL COMMENT '住宅电话',
  EDUCATION varchar(50) DEFAULT NULL COMMENT '学历',
  DEGREE varchar(15) DEFAULT NULL COMMENT '学位',
  MAILING_ADDRESS varchar(300) DEFAULT NULL COMMENT '通讯地址',
  RESIDENCE_ADDRESS varchar(300) DEFAULT NULL COMMENT '户籍地址',
  WHOLE_LABEL_CNT varchar(70) DEFAULT NULL COMMENT '标注及声明类型个数(整体)',
  NATIONALITY varchar(70) DEFAULT NULL COMMENT '国籍',
  AFTER_PAY_CNT varchar(70) DEFAULT NULL COMMENT '后付费业务类型数量',
  QUERY_ORG_CODE varchar(70) DEFAULT NULL COMMENT '查询机构代码',
  CH_SIGN varchar(70) DEFAULT NULL COMMENT '防欺诈警示标志',
  WORK_STATUS varchar(70) DEFAULT NULL COMMENT '就业状况',
  CH_PHONE varchar(20) DEFAULT NULL COMMENT '防欺诈警示联系电话',
  CH_SDATE varchar(20) DEFAULT NULL COMMENT '防欺诈警示生效日期',
  CH_EDATE varchar(20) DEFAULT NULL COMMENT '防欺诈警示截止日期 ',
  WHOLE_LABEL_OBJ_TYPE varchar(70) DEFAULT NULL COMMENT '对象类型(整体)',
  IDE_CNT varchar(70) DEFAULT NULL COMMENT '身份标识个数',
  PUBLIC_INFO_CNT varchar(70) DEFAULT NULL COMMENT '公共信息类型数量',
  WHOLE_LABEL_OBJ_SIGN varchar(70) DEFAULT NULL COMMENT '对象标识(整体)',
  QUERY_REASON_CODE varchar(70) DEFAULT NULL COMMENT '查询原因代码',
  OBJECTION_NUM varchar(70) DEFAULT NULL COMMENT '异议标注数目',
  EMAIL varchar(70) DEFAULT NULL COMMENT '电子邮箱',
  PHONE_CNT varchar(70) DEFAULT NULL COMMENT '手机号码个数',
  REPORT_TIME varchar(70) DEFAULT NULL COMMENT '报告时间',
  SERIAL varchar(70) DEFAULT NULL COMMENT 'SERIAL',
  DIGITAL_INTERPRE varchar(70) DEFAULT NULL COMMENT '数字解读',
  DIGITAL_INTERPRE_DES varchar(70) DEFAULT NULL COMMENT '分数说明',
  DIGITAL_INTERPRE_DES_CNT varchar(70) DEFAULT NULL COMMENT '分数说明条数',
  RELATIVE_POSITIONT varchar(70) DEFAULT NULL COMMENT '相对位置',
  CREDENTIALS_TYPE2 varchar(50) DEFAULT NULL COMMENT '被查询者证件类型2',
  DEGREE2 varchar(15) DEFAULT NULL COMMENT '学位2',
  EDUCATION2 varchar(50) DEFAULT NULL COMMENT '学历2',
  MARITAL_STATUS2 varchar(10) DEFAULT NULL COMMENT 'MARITAL_STATUS2',
  CLIENT_SEX2 varchar(10) DEFAULT NULL COMMENT 'CLIENT_SEX2',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_BASIC (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1058441 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='标注及声明信息单元';

-- ----------------------------
-- Table structure for per_borrow_detail
-- ----------------------------
DROP TABLE IF EXISTS per_borrow_detail;
CREATE TABLE per_borrow_detail (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  BUSS_ORG_TYPE varchar(40) DEFAULT NULL COMMENT '业务管理机构类型',
  CRED_SERIAL varchar(40) DEFAULT NULL COMMENT '授信协议编号',
  REPAY_NUM varchar(40) DEFAULT NULL COMMENT '还款期数',
  CESSION_REPAY_STATUS varchar(40) DEFAULT NULL COMMENT '债权转移时的还款状态',
  NEW_FIVE_TYPE varchar(40) DEFAULT NULL COMMENT '五级分类',
  CUR_REST_REPAY_NUM varchar(40) DEFAULT NULL COMMENT '剩余还款期数',
  CUR_ACTUAL_REPAY_AMOUT varchar(40) DEFAULT NULL COMMENT '本月实还款',
  CUR_CUR_OVER_NUM varchar(40) DEFAULT NULL COMMENT '当前逾期期数',
  CUR_Y5_SDATE varchar(40) DEFAULT NULL COMMENT '起始年月(最近5年)',
  CREATE_DATE varchar(40) DEFAULT NULL COMMENT '开立日期',
  CURRENCY varchar(40) DEFAULT NULL COMMENT '币种',
  LOAN_SUM varchar(40) DEFAULT NULL COMMENT '借款金额',
  ACC_CRED_QUOTA varchar(40) DEFAULT NULL COMMENT '账户授信额度',
  NEW_ACC_STATUS varchar(40) DEFAULT NULL COMMENT '账户状态',
  NEW_INFO_REPORT_DATE varchar(40) DEFAULT NULL COMMENT '信息报告日期',
  CUR_L_N_REPAY_PRINCIPAL varchar(40) DEFAULT NULL COMMENT '逾期 180 天以上未还本金',
  LABEL_CNT varchar(40) DEFAULT NULL COMMENT '标注及声明个数',
  SERIAL varchar(40) DEFAULT NULL COMMENT '账户编号',
  SHARE_CRED_QUOTA varchar(40) DEFAULT NULL COMMENT '共享授信额度',
  EXPIRY_DATE varchar(40) DEFAULT NULL COMMENT '到期日期',
  REPAY_FREQ varchar(40) DEFAULT NULL COMMENT '还款频率',
  LOAN_DISTRI_FORM varchar(40) DEFAULT NULL COMMENT '贷款发放形式',
  NEW_LAST_REPAY_DATE varchar(40) DEFAULT NULL COMMENT '最近一次还款日期',
  CUR_FIVE_TYPE varchar(40) DEFAULT NULL COMMENT '五级分类',
  CUR_PLAN_REPAY_DATE varchar(40) DEFAULT NULL COMMENT '结算/应还款日',
  CUR_CUR_OVER_AMOUNT varchar(40) DEFAULT NULL COMMENT '当前逾期总额',
  CUR_MAX_USE_QUOTA varchar(40) DEFAULT NULL COMMENT '最大使用额度',
  CUR_M24_SDATE varchar(40) DEFAULT NULL COMMENT '起始年月(最近 24 个月还款状态)',
  CUR_LARGE_DIVIDE_CNT varchar(40) DEFAULT NULL COMMENT '大额专项分期笔数',
  BUSS_ORG_CODE varchar(40) DEFAULT NULL COMMENT '业务管理机构代码',
  VOUCHTYPE varchar(40) DEFAULT NULL COMMENT '担保方式',
  NEW_LAST_REPAY_SUM varchar(40) DEFAULT NULL COMMENT '最近一次还款金额',
  CUR_P_MONTH varchar(40) DEFAULT NULL COMMENT '月份',
  CUR_NO_ISSUED_BALANC varchar(40) DEFAULT NULL COMMENT '未出单的大额专项分期余额',
  CUR_AVG_USE_QUOTA varchar(40) DEFAULT NULL COMMENT '最近 6 个月平均使用额度',
  CUR_Y5_EDATE varchar(40) DEFAULT NULL COMMENT '截止年月(最近5年)',
  REPAY_WAY varchar(40) DEFAULT NULL COMMENT '还款方式',
  NEW_REPAY_STATUE varchar(40) DEFAULT NULL COMMENT '还款状态',
  CUR_CUR_REPAY_AMOUT varchar(40) DEFAULT NULL COMMENT '本月应还款',
  CUR_LAST_REPAY_DATE varchar(40) DEFAULT NULL COMMENT '最近一次还款日期',
  CUR_N_N_REPAY_PRINCIPAL varchar(40) DEFAULT NULL COMMENT '逾期 91－180 天未还本金',
  CUR_M24_EDATE varchar(40) DEFAULT NULL COMMENT '截止年月(最近 24 个月还款状态)',
  CUR_Y5_MONTH_CNT varchar(40) DEFAULT NULL COMMENT '月数(最近5年)',
  ACCOUNT_TYPE varchar(40) DEFAULT NULL COMMENT '账户类型',
  ACCOUNT_SIGN varchar(40) DEFAULT NULL COMMENT '账户标识',
  BUSS_CATEGORY varchar(40) DEFAULT NULL COMMENT '业务种类',
  COMMON_LOAN_SIGN varchar(40) DEFAULT NULL COMMENT '共同借款标志',
  NEW_BALANCE varchar(40) DEFAULT NULL COMMENT '余额',
  CUR_S_N_REPAY_PRINCIPAL varchar(40) DEFAULT NULL COMMENT '逾期 61－90 天未还本金',
  CUR_L_OVERDRAFT_PRINCIPAL varchar(40) DEFAULT NULL COMMENT '透支 180 天以上未付余额',
  NEW_CLOSE_DATE varchar(40) DEFAULT NULL COMMENT '关闭日期',
  CUR_INFO_REPORT_DATE varchar(40) DEFAULT NULL COMMENT '信息报告日期',
  CUR_SPECIAL_TRADE_CNT varchar(40) DEFAULT NULL COMMENT '特殊交易个数',
  NEW_OUT_MONTH varchar(40) DEFAULT NULL COMMENT '转出月份',
  CUR_ACC_STATUS varchar(40) DEFAULT NULL COMMENT '账户状态',
  CUR_BALANCE varchar(40) DEFAULT NULL COMMENT '余额',
  CUR_USED_SUM varchar(40) DEFAULT NULL COMMENT '已用额度',
  CUR_T_N_REPAY_PRINCIPAL varchar(40) DEFAULT NULL COMMENT '逾期 31—60 天未还本金',
  CUR_AVG_OVERDRAFT_BALANCE varchar(40) DEFAULT NULL COMMENT '最近 6 个月平均透支余额',
  CUR_MAX_OVERDRAFT_BALANCE varchar(40) DEFAULT NULL COMMENT '最大透支余额',
  CUR_SPECIAL_CASE_CNT varchar(40) DEFAULT NULL COMMENT '特殊事件说明个数',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY idx_reportId (REPORT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='大额专项分期信息段';

-- ----------------------------
-- Table structure for per_career
-- ----------------------------
DROP TABLE IF EXISTS per_career;
CREATE TABLE per_career (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL varchar(10) DEFAULT NULL COMMENT '编号',
  COMPANY_NAME varchar(300) DEFAULT NULL COMMENT '工作单位',
  COMPANY_ADDRESS varchar(300) DEFAULT NULL COMMENT '单位地址',
  CAREER varchar(50) DEFAULT NULL COMMENT '职业',
  INDUSTRY varchar(50) DEFAULT NULL COMMENT '行业',
  DUTIES varchar(150) DEFAULT NULL COMMENT '职务',
  JOB_TITLE varchar(100) DEFAULT NULL COMMENT '职称',
  ENTER_YEAR varchar(10) DEFAULT NULL COMMENT '进入本单位年份',
  UPDATE_TIME varchar(20) DEFAULT NULL COMMENT '信息更新日期',
  WORK_STATUS varchar(100) DEFAULT NULL COMMENT '就业状况',
  COMPANY_TEL varchar(100) DEFAULT NULL COMMENT '单位电话',
  COMPANY_NATURE varchar(100) DEFAULT NULL COMMENT '单位性质',
  DUTIES2 varchar(100) DEFAULT NULL COMMENT '职务2',
  INDUSTRY2 varchar(50) DEFAULT NULL COMMENT '行业2',
  JOB_TITLE2 varchar(100) DEFAULT NULL COMMENT '职称2',
  CAREER2 varchar(50) DEFAULT NULL COMMENT 'CAREER2',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_CAREER (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3915945 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='职业信息表';

-- ----------------------------
-- Table structure for per_credit_detail
-- ----------------------------
DROP TABLE IF EXISTS per_credit_detail;
CREATE TABLE per_credit_detail (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL_NUMBER varchar(64) DEFAULT NULL COMMENT 'SERIAL_NUMBER',
  SERIAL varchar(10) DEFAULT NULL COMMENT '编号',
  CR_REL_CARD_DATE varchar(20) DEFAULT NULL COMMENT '发卡日期',
  BUSSID varchar(40) DEFAULT NULL COMMENT '业务号',
  VOUCHTYPE varchar(200) DEFAULT NULL COMMENT '担保方式',
  CURRENCYTYPE varchar(100) DEFAULT NULL COMMENT '币种',
  CARDTYPE varchar(18) DEFAULT NULL COMMENT '卡类型',
  CR_REL_CARD_ORG varchar(300) DEFAULT NULL COMMENT '发卡机构',
  CR_CREDIT_SUM varchar(20) DEFAULT NULL COMMENT '授信额度',
  CR_SHARE_CREDIT_SUM varchar(20) DEFAULT NULL COMMENT '共享授信额度',
  CR_STOP_DATE varchar(20) DEFAULT NULL COMMENT '截止日期',
  CR_ACC_STATUS varchar(20) DEFAULT NULL COMMENT '账户状态',
  CR_USED_SUM varchar(20) DEFAULT NULL COMMENT '已用额度',
  CR_AVG_USED_SUM varchar(20) DEFAULT NULL COMMENT '最近6个月平均使用额度',
  CR_USED_MAX_SUM varchar(20) DEFAULT NULL COMMENT '最大使用额度',
  CR_SHOULD_REPAY_AMOUT varchar(20) DEFAULT NULL COMMENT '本月应还款',
  CR_BILL_DATE varchar(20) DEFAULT NULL COMMENT '账单日',
  CR_ACTUAL_REPAY_AMOUT varchar(20) DEFAULT NULL COMMENT '本月实还款',
  CR_LAST_REPAY_DATE varchar(20) DEFAULT NULL COMMENT '最近一次还款日期',
  CR_CUR_OVER_NUM varchar(20) DEFAULT NULL COMMENT '当前逾期期数',
  CR_CUR_OVER_AMOUT varchar(20) DEFAULT NULL COMMENT '当前逾期期数',
  STATEBTIME varchar(20) DEFAULT NULL COMMENT '24期开始日期',
  STATEETIME varchar(20) DEFAULT NULL COMMENT '24期截止日期',
  CR_REPAY_RECORD varchar(100) DEFAULT NULL COMMENT '最近24个月还款记录',
  OVERDUE_BDATE varchar(20) DEFAULT NULL COMMENT '逾期开始日期',
  OVERDUE_EDATE varchar(20) DEFAULT NULL COMMENT '逾期截止日期',
  SPECIAL_TRADE_TYPE varchar(50) DEFAULT NULL COMMENT '特殊交易类型',
  OCCUR_DATE varchar(20) DEFAULT NULL COMMENT '发生日期',
  CHANGE_MONTH varchar(10) DEFAULT NULL COMMENT '变更月数',
  OCCUR_SUM varchar(20) DEFAULT NULL COMMENT '发生金额',
  OVERDUE_DETAIL varchar(100) DEFAULT NULL COMMENT '明细记录',
  balance varchar(20) DEFAULT NULL COMMENT '余额',
  BANK_TYPE varchar(200) DEFAULT NULL COMMENT '银行类型',
  VOUCHTYPE2 varchar(200) DEFAULT NULL COMMENT 'VOUCHTYPE2',
  CARDTYPE2 varchar(18) DEFAULT NULL COMMENT 'CARDTYPE2',
  BANK_TYPE2 varchar(200) DEFAULT NULL COMMENT 'BANK_TYPE2',
  CURRENCYTYPE2 varchar(100) DEFAULT NULL COMMENT 'CURRENCYTYPE2',
  CR_ACC_STATUS2 varchar(20) DEFAULT NULL COMMENT 'CR_ACC_STATUS2',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY idx_reportId (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6096309 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='贷记卡交易明细表';

-- ----------------------------
-- Table structure for per_cred_base_info
-- ----------------------------
DROP TABLE IF EXISTS per_cred_base_info;
CREATE TABLE per_cred_base_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  BUSS_ORG_CODE varchar(100) DEFAULT NULL COMMENT '业务管理机构',
  CRED_QUOTA_USE varchar(100) DEFAULT NULL COMMENT '授信额度用途',
  CRED_QUOTA varchar(100) DEFAULT NULL COMMENT '授信额度',
  CRED_STATUS varchar(100) DEFAULT NULL COMMENT '授信协议状态',
  CRED_LIMIT varchar(100) DEFAULT NULL COMMENT '授信限额',
  LABEL_CNT varchar(100) DEFAULT NULL COMMENT '标注及声明个数',
  BUSS_ORG_TYPE varchar(100) DEFAULT NULL COMMENT '业务管理机构类型',
  EXPI_DATE varchar(100) DEFAULT NULL COMMENT '到期日期',
  CRED_LIMIT_NUM varchar(100) DEFAULT NULL COMMENT '授信限额编号',
  CRED_SIGN varchar(100) DEFAULT NULL COMMENT '授信协议标识',
  CURRENCY varchar(100) DEFAULT NULL COMMENT '币种',
  EFFE_DATE varchar(100) DEFAULT NULL COMMENT '生效日期',
  USED_QUOTA varchar(100) DEFAULT NULL COMMENT '已用额度',
  CRED_NUM varchar(100) DEFAULT NULL COMMENT '授信协议编号',
  SERIAL varchar(100) DEFAULT NULL COMMENT 'SERIAL',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_CRED_BASE_INFO (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6903341 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='授信协议基本信息段';

-- ----------------------------
-- Table structure for per_cur_m24_show_info
-- ----------------------------
DROP TABLE IF EXISTS per_cur_m24_show_info;
CREATE TABLE per_cur_m24_show_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL varchar(100) DEFAULT NULL COMMENT '账户编号',
  REPAY_STATUS varchar(100) DEFAULT NULL COMMENT '还款状态',
  P_MONTH varchar(100) DEFAULT NULL COMMENT '月份',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_CUR_M24_SHOW_INFO (REPORT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='最近 24 个月还款状态信息';

-- ----------------------------
-- Table structure for per_cur_y5_show_info
-- ----------------------------
DROP TABLE IF EXISTS per_cur_y5_show_info;
CREATE TABLE per_cur_y5_show_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL varchar(100) DEFAULT NULL COMMENT '账户编号',
  REPAY_STATUS varchar(100) DEFAULT NULL COMMENT '还款状态',
  P_MONTH varchar(100) DEFAULT NULL COMMENT '月份',
  OVERDRAFT_SUM varchar(100) DEFAULT NULL COMMENT '逾期（透支） 总额',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_CUR_Y5_SHOW_INFO (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=815120902 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='最近 5 年内的历史表现';

-- ----------------------------
-- Table structure for per_external_guarantee_detail
-- ----------------------------
DROP TABLE IF EXISTS per_external_guarantee_detail;
CREATE TABLE per_external_guarantee_detail (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL varchar(10) DEFAULT NULL COMMENT '编号',
  LOAN_GRANT_ORG varchar(100) DEFAULT NULL COMMENT '担保贷款发放机构',
  LOAN_CONTRACT_SUM varchar(20) DEFAULT NULL COMMENT '担保贷款合同金额',
  LOAN_GRANT_DATE varchar(20) DEFAULT NULL COMMENT '担保贷款发放日期',
  LOAN_STOP_DATE varchar(20) DEFAULT NULL COMMENT '担保贷款到期日期',
  GUARANTEE_SUM varchar(20) DEFAULT NULL COMMENT '担保金额',
  GUARANTEE_BALANCE varchar(20) DEFAULT NULL COMMENT '担保贷款本金余额',
  LOAN_FIVE_CALSS varchar(20) DEFAULT NULL COMMENT '担保贷款五级分类',
  SETTLE_ACCOUNT_DATE varchar(20) DEFAULT NULL COMMENT '结算日期',
  LOAN_TYPE varchar(5) DEFAULT NULL COMMENT '担保类型(0:贷款，1:信用卡)',
  LOAN_TYPE2 varchar(5) DEFAULT NULL COMMENT 'LOAN_TYPE2',
  LOAN_FIVE_CALSS2 varchar(20) DEFAULT NULL COMMENT 'LOAN_FIVE_CALSS2',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY idx_reportId (REPORT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='对外担保信息明细';

-- ----------------------------
-- Table structure for per_inforce
-- ----------------------------
DROP TABLE IF EXISTS per_inforce;
CREATE TABLE per_inforce (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SETTLE_STYLE varchar(100) DEFAULT NULL COMMENT '结案方式',
  APPLY_SYM_VALUE varchar(100) DEFAULT NULL COMMENT '申请执行标的金额',
  LABEL_CNT varchar(100) DEFAULT NULL COMMENT '标注及声明个数',
  REGISTER_DATE varchar(100) DEFAULT NULL COMMENT '立案日期',
  CAUSE varchar(100) DEFAULT NULL COMMENT '执行案由',
  APPLY_SYM varchar(200) DEFAULT NULL COMMENT '申请执行标的',
  GOAL_SYM varchar(200) DEFAULT NULL COMMENT '已执行标的',
  RESULT varchar(100) DEFAULT NULL COMMENT '案件状态',
  GOAL_SYM_SUM varchar(100) DEFAULT NULL COMMENT '已执行标的金额',
  SETTLE_DATE varchar(100) DEFAULT NULL COMMENT '结案日期',
  SERIAL varchar(100) DEFAULT NULL COMMENT 'SERIAL',
  EXEC_COURT varchar(100) DEFAULT NULL COMMENT 'EXEC_COURT',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_INFORCE (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2825 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='强制执行记录信息段';

-- ----------------------------
-- Table structure for per_label_info
-- ----------------------------
DROP TABLE IF EXISTS per_label_info;
CREATE TABLE per_label_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  L_CONTENT varchar(200) DEFAULT NULL COMMENT '标注或声明内容',
  ADD_DATE varchar(100) DEFAULT NULL COMMENT '添加日期',
  PER_TYPE varchar(100) DEFAULT NULL COMMENT '标注类型（1-整体 2-借贷账户 3-授信协议 4-相关还款责任 5-后付费业务 6-欠税记录 7-民事判决 8-强制执行 9-行政处罚 10-住房公积金 11-低保 12-执业资格 13-行政奖励）',
  L_TYPE varchar(200) DEFAULT NULL COMMENT '标注及声明类型',
  SERIAL varchar(100) DEFAULT NULL COMMENT '编号',
  L_CONTENT2 varchar(100) DEFAULT NULL COMMENT 'L_CONTENT2',
  PER_TYPE2 varchar(100) DEFAULT NULL COMMENT 'PER_TYPE2',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_LABEL_INFO (REPORT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='标注及声明信息(整体)';

-- ----------------------------
-- Table structure for per_large_divide_info
-- ----------------------------
DROP TABLE IF EXISTS per_large_divide_info;
CREATE TABLE per_large_divide_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  EXPI_DATE varchar(100) DEFAULT NULL COMMENT '分期额度到期日期',
  EFFE_DATE varchar(100) DEFAULT NULL COMMENT '分期额度生效日期',
  USED_SUM varchar(100) DEFAULT NULL COMMENT '已用分期金额',
  SERIAL varchar(100) DEFAULT NULL COMMENT '账户编号',
  DIV_QUOTA varchar(100) DEFAULT NULL COMMENT '大额专项分期额度',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_LARGE_DIVIDE_INFO (REPORT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='大额专项分期信息';

-- ----------------------------
-- Table structure for per_live
-- ----------------------------
DROP TABLE IF EXISTS per_live;
CREATE TABLE per_live (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL varchar(10) DEFAULT NULL COMMENT '编号',
  RESIDENTIAL_ADDRESS varchar(300) DEFAULT NULL COMMENT '居住地址',
  RESIDENTIAL_CONDITION varchar(50) DEFAULT NULL COMMENT '居住状况',
  UPDATE_TIME varchar(20) DEFAULT NULL COMMENT '信息更新日期',
  HOUSE_TEL varchar(100) DEFAULT NULL COMMENT '住宅电话',
  RESIDENTIAL_CONDITION2 varchar(50) DEFAULT NULL COMMENT 'RESIDENTIAL_CONDITION2',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_LIVE (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4751757 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='居住信息表';

-- ----------------------------
-- Table structure for per_loan_detail
-- ----------------------------
DROP TABLE IF EXISTS per_loan_detail;
CREATE TABLE per_loan_detail (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL_NUMBER varchar(64) DEFAULT NULL COMMENT '流水号',
  SERIAL varchar(10) DEFAULT NULL COMMENT '编号',
  LOANS_DATE varchar(10) DEFAULT NULL COMMENT '放款日期',
  BUSSID varchar(50) DEFAULT NULL COMMENT '业务号',
  VOUCHTYPE varchar(100) DEFAULT NULL COMMENT '担保方式',
  CURRENCYTYPE varchar(10) DEFAULT NULL COMMENT '币种',
  LOANS_ORG varchar(100) DEFAULT NULL COMMENT '放款机构(我行:1 他行:0)',
  LOANS_AMOUNT varchar(10) DEFAULT NULL COMMENT '放款金额',
  LOANS_USE varchar(50) DEFAULT NULL COMMENT '放款用途',
  REPAY_NUM varchar(10) DEFAULT NULL COMMENT '还款期数',
  REPAY_TYPE varchar(50) DEFAULT NULL COMMENT '还款类型',
  EXPIRY_DATE varchar(10) DEFAULT NULL COMMENT '到期日',
  STOP_DATE varchar(10) DEFAULT NULL COMMENT '截止日',
  ACC_STATUS varchar(10) DEFAULT NULL COMMENT '账户状态',
  FIVE_TYPE varchar(10) DEFAULT NULL COMMENT '五级分类',
  PRINCIPAL_BALANCE varchar(10) DEFAULT NULL COMMENT '本金余额',
  REST_REPAY_NUM varchar(10) DEFAULT NULL COMMENT '剩余还款期数',
  CUR_REPAY_AMOUT varchar(10) DEFAULT NULL COMMENT '本月应还款',
  PLAN_REPAY_DATE varchar(10) DEFAULT NULL COMMENT '应还款日',
  ACTUAL_REPAY_AMOUT varchar(10) DEFAULT NULL COMMENT '本月实还款',
  LAST_REPAY_DATE varchar(10) DEFAULT NULL COMMENT '最近一次还款日期',
  CUR_OVER_NUM varchar(10) DEFAULT NULL COMMENT '当前逾期期数',
  CUR_OVER_AMOUNT varchar(10) DEFAULT NULL COMMENT '当前逾期金额',
  T_N_REPAY_PRINCIPAL varchar(10) DEFAULT NULL COMMENT '逾期31-60天未还本金',
  S_N_REPAY_PRINCIPAL varchar(10) DEFAULT NULL COMMENT '逾期61-90天未还本金',
  N_N_REPAY_PRINCIPAL varchar(10) DEFAULT NULL COMMENT '逾期91-180天未还本金',
  L_N_REPAY_PRINCIPAL varchar(10) DEFAULT NULL COMMENT '逾期180天以上未还本金',
  STATEBTIME varchar(10) DEFAULT NULL COMMENT '24期开始日期',
  STATEETIME varchar(10) DEFAULT NULL COMMENT '24期截止日期',
  REPAY_RECORD varchar(10) DEFAULT NULL COMMENT '最近24个月还款记录',
  OVERDUE_BDATE varchar(10) DEFAULT NULL COMMENT '逾期开始日期',
  OVERDUE_EDATE varchar(10) DEFAULT NULL COMMENT '逾期截止日期',
  SPECIAL_TRADE_TYPE varchar(50) DEFAULT NULL COMMENT '特殊交易类型',
  OCCUR_DATE varchar(10) DEFAULT NULL COMMENT '发生日期',
  CHANGE_MONTH varchar(10) DEFAULT NULL COMMENT '变更月数',
  occur_sum varchar(20) DEFAULT NULL COMMENT '发生金额',
  OVERDUE_DETAIL varchar(10) DEFAULT NULL COMMENT '明细记录',
  balance varchar(20) DEFAULT NULL COMMENT '余额',
  BANK_TYPE varchar(100) DEFAULT NULL COMMENT '银行类型',
  n_cr_card_avg_used_sum varchar(20) DEFAULT NULL COMMENT '最近 6 个月平均使用额度',
  n_cr_card_max_cred_sum varchar(20) DEFAULT NULL COMMENT '单家行最高授信额',
  nq_cr_card_cred_sum varchar(20) DEFAULT NULL COMMENT '授信总额',
  nq_cr_card_max_cred_sum varchar(20) DEFAULT NULL COMMENT '单家行最高授信额',
  nq_cr_card_avg_used_sum varchar(20) DEFAULT NULL COMMENT '最近 6 个月平均透支余额',
  n_cr_card_used_sum varchar(20) DEFAULT NULL COMMENT '已用额度',
  NQ_CR_CARD_COMPANY_ORG_NUM varchar(10) DEFAULT NULL COMMENT '发卡机构数',
  nq_cr_card_overdraft_balance varchar(20) DEFAULT NULL COMMENT '透支余额',
  N_CR_CARD_ORG_NUM varchar(10) DEFAULT NULL COMMENT '发卡机构数',
  n_cr_card_cred_sum varchar(20) DEFAULT NULL COMMENT '授信总额',
  NQ_CR_CARD_ACC_NUM varchar(10) DEFAULT NULL COMMENT '账户数',
  nq_cr_card_min_cred_sum varchar(20) DEFAULT NULL COMMENT '单家行最低授信额',
  N_CR_CARD_ACC_NUM varchar(10) DEFAULT NULL COMMENT '账户数',
  REPAYER_CNT varchar(10) DEFAULT NULL COMMENT '相关还款责任个数',
  BAD_DEBT_NUM varchar(10) DEFAULT NULL COMMENT '账户数',
  bad_debt_balance varchar(20) DEFAULT NULL COMMENT '余额',
  n_cr_card_min_cred_sum varchar(20) DEFAULT NULL COMMENT '单家行最低授信额',
  CIRC_ACC_ACC_SUM varchar(10) DEFAULT NULL COMMENT '账户数',
  circ_acc_balance varchar(20) DEFAULT NULL COMMENT '余额',
  circ_acc_cred_sum varchar(20) DEFAULT NULL COMMENT '授信总额',
  CIRC_ACC_MANA_ORG_CNT varchar(10) DEFAULT NULL COMMENT '管理机构数',
  circ_acc_repay_avg6 varchar(20) DEFAULT NULL COMMENT '最近 6 个月平均应还款',
  CIRC_QUO_ACC_SUM varchar(10) DEFAULT NULL COMMENT '账户数',
  circ_quo_balance varchar(20) DEFAULT NULL COMMENT '余额',
  circ_quo_cred_sum varchar(20) DEFAULT NULL COMMENT '授信总额',
  CIRC_QUO_MANA_ORG_CNT varchar(10) DEFAULT NULL COMMENT '管理机构数',
  circ_quo_repay_avg6 varchar(20) DEFAULT NULL COMMENT '最近 6 个月平均应还款',
  NON_REV_ACC_SUM varchar(10) DEFAULT NULL COMMENT '账户数',
  non_rev_balance varchar(20) DEFAULT NULL COMMENT '余额',
  non_rev_cred_sum varchar(20) DEFAULT NULL COMMENT '授信总额',
  NON_REV_MANAGER_ORG_CNT varchar(10) DEFAULT NULL COMMENT '管理机构数',
  non_rev_repay_avg6 varchar(20) DEFAULT NULL COMMENT '最近 6 个月平均应还款',
  OVERDUE_ACC_TYPE_CNT varchar(10) DEFAULT NULL COMMENT '账户类型数量(逾期（透支）汇总)',
  PRO_ACC_TOTAL varchar(10) DEFAULT NULL COMMENT '账户数合计',
  PRO_BUSI_TYPE_CNT varchar(10) DEFAULT NULL COMMENT '业务类型数量',
  REC_ACC_TOTAL varchar(10) DEFAULT NULL COMMENT '账户数合计',
  rec_balance_total varchar(20) DEFAULT NULL COMMENT '余额合计',
  REC_BUSS_TYPE_CNT varchar(10) DEFAULT NULL COMMENT '业务类型数量',
  ACCOUNT_SIGN varchar(60) DEFAULT NULL COMMENT '账户标识',
  ACCOUNT_TYPE varchar(10) DEFAULT NULL COMMENT '账户类型',
  acc_cred_quota varchar(20) DEFAULT NULL COMMENT '账户授信额度',
  BUSS_CATEGORY varchar(20) DEFAULT NULL COMMENT '业务种类',
  buss_org_code varchar(14) DEFAULT NULL COMMENT '业务管理机构代码',
  BUSS_ORG_TYPE varchar(10) DEFAULT NULL COMMENT '业务管理机构类型',
  CESSION_REPAY_STATUS varchar(10) DEFAULT NULL COMMENT '债权转移时的还款状态',
  COMMON_LOAN_SIGN varchar(10) DEFAULT NULL COMMENT '共同借款标志',
  CREATE_DATE varchar(10) DEFAULT NULL COMMENT '开立日期',
  CRED_SERIAL varchar(10) DEFAULT NULL COMMENT '授信协议编号',
  CURRENCY varchar(10) DEFAULT NULL COMMENT '币种',
  CUR_ACC_STATUS varchar(10) DEFAULT NULL COMMENT '账户状态(最近一次月度)',
  cur_actual_repay_amout varchar(20) DEFAULT NULL COMMENT '本月实还款',
  cur_avg_overdraft_balance varchar(20) DEFAULT NULL COMMENT '最近 6 个月平均透支余额',
  cur_avg_use_quota varchar(20) DEFAULT NULL COMMENT '最近 6 个月平均使用额度',
  cur_balance varchar(20) DEFAULT NULL COMMENT '余额(最近一次月度表现)',
  cur_cur_over_amount varchar(20) DEFAULT NULL COMMENT '当前逾期总额',
  CUR_CUR_OVER_NUM varchar(10) DEFAULT NULL COMMENT '当前逾期期数',
  cur_cur_repay_amout varchar(20) DEFAULT NULL COMMENT '本月应还款',
  CUR_FIVE_TYPE varchar(10) DEFAULT NULL COMMENT '五级分类(最近一次月度表现)',
  CUR_INFO_REPORT_DATE varchar(10) DEFAULT NULL COMMENT '信息报告日期',
  CUR_LARGE_DIVIDE_CNT varchar(10) DEFAULT NULL COMMENT '大额专项分期笔数',
  CUR_LAST_REPAY_DATE varchar(10) DEFAULT NULL COMMENT '最近一次还款日期(最近一次月度)',
  cur_l_n_repay_principal varchar(20) DEFAULT NULL COMMENT '逾期 180 天以上未还本金',
  cur_l_overdraft_principal varchar(20) DEFAULT NULL COMMENT '透支 180 天以上未付余额',
  CUR_M24_EDATE varchar(10) DEFAULT NULL COMMENT '截止年月(最近 24 个月还款状态)',
  CUR_M24_SDATE varchar(10) DEFAULT NULL COMMENT '起始年月(最近 24 个月还款状态)',
  cur_max_overdraft_balance varchar(20) DEFAULT NULL COMMENT '最大透支余额',
  cur_max_use_quota varchar(20) DEFAULT NULL COMMENT '最大使用额度',
  cur_no_issued_balanc varchar(20) DEFAULT NULL COMMENT '未出单的大额专项分期余额',
  cur_n_n_repay_principal varchar(20) DEFAULT NULL COMMENT '逾期 91－180 天未还本金',
  CUR_PLAN_REPAY_DATE varchar(10) DEFAULT NULL COMMENT '结算/应还款日',
  CUR_P_MONTH varchar(10) DEFAULT NULL COMMENT '月份',
  CUR_REST_REPAY_NUM varchar(10) DEFAULT NULL COMMENT '剩余还款期数',
  CUR_SPECIAL_CASE_CNT varchar(10) DEFAULT NULL COMMENT '特殊事件说明个数',
  CUR_SPECIAL_TRADE_CNT varchar(10) DEFAULT NULL COMMENT '特殊交易个数',
  cur_s_n_repay_principal varchar(20) DEFAULT NULL COMMENT '逾期 61－90 天未还本金',
  cur_t_n_repay_principal varchar(20) DEFAULT NULL COMMENT '逾期 31—60 天未还本金',
  cur_used_sum varchar(20) DEFAULT NULL COMMENT '已用额度',
  CUR_Y5_EDATE varchar(10) DEFAULT NULL COMMENT '截止年月(最近5年)',
  CUR_Y5_MONTH_CNT varchar(10) DEFAULT NULL COMMENT '月数(最近5年)',
  CUR_Y5_SDATE varchar(10) DEFAULT NULL COMMENT '起始年月(最近5年)',
  LABEL_CNT varchar(10) DEFAULT NULL COMMENT '标注及声明个数',
  LOAN_DISTRI_FORM varchar(10) DEFAULT NULL COMMENT '贷款发放形式',
  loan_sum varchar(20) DEFAULT NULL COMMENT '借款金额',
  NEW_ACC_STATUS varchar(10) DEFAULT NULL COMMENT '账户状态(最新表现)',
  new_balance varchar(20) DEFAULT NULL COMMENT '余额(最新表现)',
  NEW_CLOSE_DATE varchar(10) DEFAULT NULL COMMENT '关闭日期',
  NEW_FIVE_TYPE varchar(10) DEFAULT NULL COMMENT '五级分类(最新表现信息)',
  NEW_INFO_REPORT_DATE varchar(10) DEFAULT NULL COMMENT '信息报告日期',
  NEW_LAST_REPAY_DATE varchar(10) DEFAULT NULL COMMENT '最近一次还款日期(最新表现信息)',
  new_last_repay_sum varchar(20) DEFAULT NULL COMMENT '剩余还款期数',
  NEW_OUT_MONTH varchar(10) DEFAULT NULL COMMENT '转出月份',
  NEW_REPAY_STATUE varchar(10) DEFAULT NULL COMMENT '还款状态',
  REPAY_FREQ varchar(10) DEFAULT NULL COMMENT '还款频率',
  REPAY_WAY varchar(20) DEFAULT NULL COMMENT '还款方式',
  share_cred_quota varchar(20) DEFAULT NULL COMMENT '共享授信额度',
  FIVE_TYPE2 varchar(10) DEFAULT NULL COMMENT 'FIVE_TYPE2',
  VOUCHTYPE2 varchar(100) DEFAULT NULL COMMENT '担保方式2',
  CURRENCYTYPE2 varchar(10) DEFAULT NULL COMMENT 'CURRENCYTYPE2',
  SPECIAL_TRADE_TYPE2 varchar(50) DEFAULT NULL COMMENT 'SPECIAL_TRADE_TYPE2',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_LOAN_DETAIL (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28818987 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='准贷记卡账户汇总信息段';

-- ----------------------------
-- Table structure for per_loan_detail_uncommon
-- ----------------------------
DROP TABLE IF EXISTS per_loan_detail_uncommon;
CREATE TABLE per_loan_detail_uncommon (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL varchar(10) DEFAULT NULL COMMENT '编号',
  LOAN_ORG_CODE varchar(50) DEFAULT NULL COMMENT '贷款机构代码',
  REPORT_FILE_NAME varchar(100) DEFAULT NULL COMMENT '报文文件名称',
  UPDATE_TIME varchar(20) DEFAULT NULL COMMENT '信息更新日期',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY idx_reportId (REPORT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='异议版报告贷款';

-- ----------------------------
-- Table structure for per_loan_prompt_detail
-- ----------------------------
DROP TABLE IF EXISTS per_loan_prompt_detail;
CREATE TABLE per_loan_prompt_detail (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  BUSI_TYPE varchar(100) DEFAULT NULL COMMENT '业务类型',
  FIR_BUSS_MONTH varchar(100) DEFAULT NULL COMMENT '首笔业务发放月份',
  BUSI_MAJOR_CLASS varchar(100) DEFAULT NULL COMMENT '业务大类',
  ACC_SUM varchar(100) DEFAULT NULL COMMENT '账户数',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_LOAN_PROMPT_DETAIL (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7554374 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='信贷交易提示信息';

-- ----------------------------
-- Table structure for per_loan_repayer
-- ----------------------------
DROP TABLE IF EXISTS per_loan_repayer;
CREATE TABLE per_loan_repayer (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  REPAY_TYPE varchar(100) DEFAULT NULL COMMENT '还款责任类型',
  ACC_SUM varchar(100) DEFAULT NULL COMMENT '账户数',
  BORROWER_CATEGORY varchar(100) DEFAULT NULL COMMENT '借款人身份类别',
  BALANCE varchar(100) DEFAULT NULL COMMENT '余额',
  REPAY_SUM varchar(100) DEFAULT NULL COMMENT '还款责任金额',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_LOAN_REPAYER (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110559 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='相关还款责任汇总信息';

-- ----------------------------
-- Table structure for per_loan_summary
-- ----------------------------
DROP TABLE IF EXISTS per_loan_summary;
CREATE TABLE per_loan_summary (
  REPORT_ID varchar(30) NOT NULL COMMENT '	报告编号					 ',
  SERIAL varchar(20) DEFAULT NULL COMMENT '	编号					 ',
  COMPANY_NAME varchar(20) DEFAULT NULL COMMENT '	代偿机构					 ',
  RECEIVE_DATE varchar(20) DEFAULT NULL COMMENT '	最近一次代偿日期					 ',
  AGGREGATE_AMOUNT varchar(20) DEFAULT NULL COMMENT '	累计代偿金额					 ',
  LAST_REPAY_DATE varchar(20) DEFAULT NULL COMMENT '	最近一次还款日期					 ',
  RECEIVE_BALANCE varchar(20) DEFAULT NULL COMMENT '	余额					 ',
  GUARANTEE_NUM varchar(20) DEFAULT NULL COMMENT '	担保笔数					 ',
  GUARANTEE_SUM varchar(20) DEFAULT NULL COMMENT '	担保金额					 ',
  GUARANTEE_BALANCE varchar(20) DEFAULT NULL COMMENT '	担保本金余额					 ',
  N_NQ_CR_CARD_COMPANY_ORG_NUM varchar(20) DEFAULT NULL COMMENT '	发卡法人机构数					 ',
  N_NQ_CR_CARD_ORG_NUM varchar(20) DEFAULT NULL COMMENT '	发卡机构数					 ',
  N_NQ_CR_CARD_ACC_NUM varchar(20) DEFAULT NULL COMMENT '	账户数					 ',
  N_NQ_CR_CARD_CRED_SUM varchar(40) DEFAULT NULL COMMENT '	授信总额					 ',
  N_NQ_CR_CARD_MAX_CRED_SUM varchar(20) DEFAULT NULL COMMENT '	单家行最高授信额					 ',
  N_NQ_CR_CARD_MIN_CRED_SUM varchar(20) DEFAULT NULL COMMENT '	单家行最低授信额					 ',
  N_NQ_CR_CARD_OVERDRAFT_BALANCE varchar(20) DEFAULT NULL COMMENT '	透支余额					 ',
  N_NQ_CR_CARD_AVG_USED_SUM varchar(20) DEFAULT NULL COMMENT '	最近6个月平均透支余额					 ',
  BORROWER_CATEGORY varchar(20) DEFAULT NULL COMMENT '	借款人身份类别					 ',
  REPAY_TYPE varchar(20) DEFAULT NULL COMMENT '	还款责任类型					 ',
  REPAY_ACC_SUM varchar(20) DEFAULT NULL COMMENT '	账户数					 ',
  REPAY_SUM varchar(20) DEFAULT NULL COMMENT '	还款责任金额					 ',
  REPAY_BALANCE varchar(20) DEFAULT NULL COMMENT '	余额					 ',
  NQ_CR_CARD_ORG_NUM varchar(20) DEFAULT NULL COMMENT '	发卡机构数					 ',
  NQ_CR_CARD_ACC_NUM varchar(20) DEFAULT NULL COMMENT '	账户数					 ',
  NQ_CR_CARD_CRED_SUM varchar(20) DEFAULT NULL COMMENT '	授信总额					 ',
  NQ_CR_CARD_MAX_CRED_SUM varchar(20) DEFAULT NULL COMMENT '	单家机构最高授信额					 ',
  NQ_CR_CARD_MIN_CRED_SUM varchar(20) DEFAULT NULL COMMENT '	单家机构最低授信额					 ',
  NQ_CR_CARD_OVERDRAFT_BALANCE varchar(20) DEFAULT NULL COMMENT '	透支余额					 ',
  NQ_CR_CARD_AVG_USED_SUM varchar(20) DEFAULT NULL COMMENT '	最近6个月平均透支余额					 ',
  N_CR_CARD_ORG_NUM varchar(20) DEFAULT NULL COMMENT '	发卡机构数					 ',
  N_CR_CARD_ACC_NUM varchar(20) DEFAULT NULL COMMENT '	账户数					 ',
  N_CR_CARD_CRED_SUM varchar(20) DEFAULT NULL COMMENT '	授信总额					 ',
  N_CR_CARD_MAX_CRED_SUM varchar(20) DEFAULT NULL COMMENT '	单家机构最高授信额					 ',
  N_CR_CARD_MIN_CRED_SUM varchar(20) DEFAULT NULL COMMENT '	单家机构最低授信额					 ',
  N_CR_CARD_USED_SUM varchar(20) DEFAULT NULL COMMENT '	已用额度					 ',
  N_CR_CARD_AVG_USED_SUM varchar(20) DEFAULT NULL COMMENT '	最近6个月平均使用额度					 ',
  CIRC_ACC_MANA_ORG_CNT varchar(20) DEFAULT NULL COMMENT '	管理机构数					 ',
  CIRC_ACC_ACC_SUM varchar(20) DEFAULT NULL COMMENT '	账户数					 ',
  CIRC_ACC_CRED_SUM varchar(20) DEFAULT NULL COMMENT '	授信总额					 ',
  CIRC_ACC_BALANCE varchar(20) DEFAULT NULL COMMENT '	余额					 ',
  CIRC_ACC_REPAY_AVG6 varchar(20) DEFAULT NULL COMMENT '	最近6个月平均应还款					 ',
  CIRC_QUO_MANA_ORG_CNT varchar(20) DEFAULT NULL COMMENT '	管理机构数					 ',
  CIRC_QUO_ACC_SUM varchar(20) DEFAULT NULL COMMENT '	账户数					 ',
  CIRC_QUO_CRED_SUM varchar(20) DEFAULT NULL COMMENT '	授信总额					 ',
  CIRC_QUO_BALANCE varchar(20) DEFAULT NULL COMMENT '	余额					 ',
  CIRC_QUO_REPAY_AVG6 varchar(20) DEFAULT NULL COMMENT '	最近6个月平均应还款					 ',
  NON_REV_MANAGER_ORG_CNT varchar(20) DEFAULT NULL COMMENT '	管理机构数					 ',
  NON_REV_ACC_SUM varchar(20) DEFAULT NULL COMMENT '	账户数					 ',
  NON_REV_CRED_SUM varchar(20) DEFAULT NULL COMMENT '	授信总额					 ',
  NON_REV_BALANCE varchar(20) DEFAULT NULL COMMENT '	余额					 ',
  NON_REV_REPAY_AVG6 varchar(20) DEFAULT NULL COMMENT '	最近6个月平均应还款					 ',
  LOAN_NUM varchar(20) DEFAULT NULL COMMENT '	笔数0					 ',
  LOAN_MON_NUM varchar(20) DEFAULT NULL COMMENT '	月份数1					 ',
  LOAN_MON_OVER_SUM varchar(20) DEFAULT NULL COMMENT '	单月最高逾期总额2					 ',
  LOAN_OVER_MON_NUM varchar(20) DEFAULT NULL COMMENT '	最长逾期月数3					 ',
  CR_CARD_OVER_ACC_NUM varchar(20) DEFAULT NULL COMMENT '	账户数4					 ',
  CR_CARD_OVER_MON_NUM varchar(40) DEFAULT NULL COMMENT '	月份数5					 ',
  CR_CARD_MON_OVER_SUM varchar(40) DEFAULT NULL COMMENT '	单月最高逾期总额6					 ',
  CR_CARD_OVER_LONG_MON_NUM varchar(40) DEFAULT NULL COMMENT '	最长逾期月数7					 ',
  Q_CR_CARD_OVER_ACC_NUM varchar(40) DEFAULT NULL COMMENT '	账户数8					 ',
  Q_CR_CARD_OVER_MON_NUM varchar(40) DEFAULT NULL COMMENT '	月份数9					 ',
  Q_CR_CARD_OVER_MON_BALANCE varchar(40) DEFAULT NULL COMMENT '	单月最高透支余额10	6	个月平均应还款(循环贷账户)			 ',
  Q_CR_CARD_OVER_LONG_MON_NUM varchar(40) DEFAULT NULL COMMENT '	最长透支月数11					 ',
  ACCOUNT_TYPE varchar(40) DEFAULT NULL COMMENT '	逾期账户类型					 ',
  ACCOUNT_SUM varchar(40) DEFAULT NULL COMMENT '	逾期账户数					 ',
  MONTH_CNT varchar(40) DEFAULT NULL COMMENT '	月份数					 ',
  SINGLE_MONTH_MAX_AMOUNT varchar(40) DEFAULT NULL COMMENT '	单月最高逾期/透支总额	6	个月平均应还款(循环额度下分账户)			 ',
  MAX_MONTH_CNT varchar(40) DEFAULT NULL COMMENT '	最长逾期/透支月数					 ',
  LOAN_BAD_DEBT_NUM varchar(40) DEFAULT NULL COMMENT '	笔数0					 ',
  LOAN_BAD_DEBT_BALANCE varchar(40) DEFAULT NULL COMMENT '	余额1					 ',
  ASSET_NUM varchar(40) DEFAULT NULL COMMENT '	笔数2					 ',
  ASSET_BALANCE varchar(40) DEFAULT NULL COMMENT '	余额3	6	个月平均应还款(非循环贷账户)			 ',
  ASSURER_NUM varchar(40) DEFAULT NULL COMMENT '	笔数4					 ',
  ASSURER_BALANCE varchar(40) DEFAULT NULL COMMENT '	余额5					 ',
  DIGITAL_INTERPRE varchar(40) DEFAULT NULL COMMENT '	数字解读					 ',
  RELATIVE_POSITIONT varchar(40) DEFAULT NULL COMMENT '	相对位置					 ',
  DIGITAL_INTERPRE_DES varchar(40) DEFAULT NULL COMMENT '	说明					 ',
  PER_HOUSE_LOAN_NUM varchar(40) DEFAULT NULL COMMENT '	个人住房贷款笔数					 ',
  PER_COMME_LOAN_NUM varchar(40) DEFAULT NULL COMMENT '	个人商用房（包括商住两用）贷款笔数					 ',
  OTHER_LOAN_NUM varchar(40) DEFAULT NULL COMMENT '	其他贷款笔数					 ',
  FIRST_LOAN_REL_MON varchar(40) DEFAULT NULL COMMENT '	首笔贷款发放月份					 ',
  CR_CARD_ACC_NUM varchar(40) DEFAULT NULL COMMENT '	贷记卡账户数					 ',
  FIRST_CARD_REL_MON varchar(40) DEFAULT NULL COMMENT '	首张贷记卡发卡月份					 ',
  Q_CR_CARD_ACC_NUM varchar(40) DEFAULT NULL COMMENT '	准贷记卡账户数					 ',
  Q_FIRST_CARD_REL_MON varchar(40) DEFAULT NULL COMMENT '	首张准贷记卡发卡月份					 ',
  DECLART_NUM varchar(40) DEFAULT NULL COMMENT '	本人声明数目					 ',
  OBJECTION_NUM varchar(40) DEFAULT NULL COMMENT '	异议标注数目					 ',
  BAD_DEBT_NUM varchar(40) DEFAULT NULL COMMENT '	呆账账户数					 ',
  BAD_DEBT_BALANCE varchar(40) DEFAULT NULL COMMENT '	呆账余额					 ',
  RECOVER_BUSS_TYPE varchar(40) DEFAULT NULL COMMENT '	被追偿业务类型					 ',
  RECOVER_ACC_SUM varchar(40) DEFAULT NULL COMMENT '	被追偿账户数					 ',
  RECOVER_BALANCE varchar(40) DEFAULT NULL COMMENT '	被追偿余额					 ',
  BUSI_MAJOR_CLASS varchar(40) DEFAULT NULL COMMENT '	业务大类					 ',
  BUSI_TYPE varchar(40) DEFAULT NULL COMMENT '	业务类型					 ',
  ACC_SUM varchar(40) DEFAULT NULL COMMENT '	账户数					 ',
  FIR_BUSS_MONTH varchar(40) DEFAULT NULL COMMENT '	首笔业务发放月份					 ',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_LOAN_SUMMARY (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1093092 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='贷款概要信息表';

-- ----------------------------
-- Table structure for per_low_security
-- ----------------------------
DROP TABLE IF EXISTS per_low_security;
CREATE TABLE per_low_security (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL varchar(10) DEFAULT NULL COMMENT '编号',
  PERSONNEL_TYPE varchar(30) DEFAULT NULL COMMENT '人员类别',
  LOCATION varchar(30) DEFAULT NULL COMMENT '所在地',
  COMPANY varchar(200) DEFAULT NULL COMMENT '工作单位',
  HOUSE_MON_INCOME varchar(20) DEFAULT NULL COMMENT '家庭月收入',
  APPLY_DATE varchar(20) DEFAULT NULL COMMENT '申请日期',
  APPROVAL_DATE varchar(20) DEFAULT NULL COMMENT '批准日期',
  UPDATE_TIME varchar(20) DEFAULT NULL COMMENT '信息更新日期',
  LABEL_CNT varchar(100) DEFAULT NULL COMMENT '标注及声明个数',
  PERSONNEL_TYPE2 varchar(30) DEFAULT NULL COMMENT '人员类别2',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_LOW_SECURITY (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='低保救助信息记录信息段';

-- ----------------------------
-- Table structure for per_other_identity
-- ----------------------------
DROP TABLE IF EXISTS per_other_identity;
CREATE TABLE per_other_identity (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  CREDENTIALS_TYPE varchar(100) DEFAULT NULL COMMENT '证件类型',
  CREDENTIALS_NO varchar(100) DEFAULT NULL COMMENT '证件号码',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_OTHER_IDENTITY (REPORT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='其他身份标识信息段';

-- ----------------------------
-- Table structure for per_overdue_summary
-- ----------------------------
DROP TABLE IF EXISTS per_overdue_summary;
CREATE TABLE per_overdue_summary (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL varchar(10) DEFAULT NULL COMMENT '编号',
  SERIAL_NUMBER varchar(64) DEFAULT NULL COMMENT '流水号',
  CART_TYPE varchar(10) DEFAULT NULL COMMENT '卡类型(0:贷款，1:贷记卡，2:准贷记卡)',
  OVER_MONTH varchar(20) DEFAULT NULL COMMENT '逾期/透支月份',
  OVER_MONTH_NUM varchar(20) DEFAULT NULL COMMENT '逾期/透支持续月数',
  OVER_SUM varchar(20) DEFAULT NULL COMMENT '逾期/透支金额',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY idx_reportId (REPORT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='贷款/贷记卡/准贷记卡逾期记录';

-- ----------------------------
-- Table structure for per_overdue_summary_info
-- ----------------------------
DROP TABLE IF EXISTS per_overdue_summary_info;
CREATE TABLE per_overdue_summary_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  MONTH_CNT varchar(100) DEFAULT NULL COMMENT '月份数',
  SINGLE_MONTH_MAX_AMOUNT varchar(100) DEFAULT NULL COMMENT '单月最高逾期（透支）总额',
  ACCOUNT_TYPE varchar(100) DEFAULT NULL COMMENT '账户类型',
  ACC_SUM varchar(100) DEFAULT NULL COMMENT '账户数',
  MAX_MONTH_CNT varchar(100) DEFAULT NULL COMMENT '最长逾期（透支）月数',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_OVERDUE_SUMMARY_INFO (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2543020 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='逾期（透支）汇总信息';

-- ----------------------------
-- Table structure for per_owe_taxes
-- ----------------------------
DROP TABLE IF EXISTS per_owe_taxes;
CREATE TABLE per_owe_taxes (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL varchar(10) DEFAULT NULL COMMENT '编号',
  TAX_AUTHORITY varchar(80) DEFAULT NULL COMMENT '主管税务机关',
  owe_tax_sum varchar(20) DEFAULT NULL COMMENT '欠税总额',
  OWE_TAX_DATE varchar(20) DEFAULT NULL COMMENT '欠税统计日期',
  LABEL_CNT varchar(100) DEFAULT NULL COMMENT '标注及声明个数',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_OWE_TAXES (REPORT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='欠税记录信息段';

-- ----------------------------
-- Table structure for per_penalties
-- ----------------------------
DROP TABLE IF EXISTS per_penalties;
CREATE TABLE per_penalties (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL varchar(10) DEFAULT NULL COMMENT '编号',
  PENALTIES_COMAPNY varchar(100) DEFAULT NULL COMMENT '处罚机构',
  PENALTIES_CONTENTS varchar(200) DEFAULT NULL COMMENT '处罚内容',
  PENALTIES_SUM varchar(20) DEFAULT NULL COMMENT '处罚金额',
  START_DATE varchar(20) DEFAULT NULL COMMENT '处罚生效日期',
  STOP_DATE varchar(20) DEFAULT NULL COMMENT '处罚截止日期',
  RECONSIDERATION_RESULT varchar(100) DEFAULT NULL COMMENT '行政复议结果',
  LABEL_CNT varchar(100) DEFAULT NULL COMMENT '标注及声明个数',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_PENALTIES (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='行政处罚记录信息段';

-- ----------------------------
-- Table structure for per_pensio_pay
-- ----------------------------
DROP TABLE IF EXISTS per_pensio_pay;
CREATE TABLE per_pensio_pay (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL varchar(10) DEFAULT NULL COMMENT '编号',
  INSURED_PLACE varchar(50) DEFAULT NULL COMMENT '参保地',
  INSURED_DATE varchar(20) DEFAULT NULL COMMENT '参保日期',
  PAY_MON_SUM varchar(20) DEFAULT NULL COMMENT '累计缴费月数',
  START_WORK_MON varchar(20) DEFAULT NULL COMMENT '参加工作月份',
  PAY_STATUS varchar(20) DEFAULT NULL COMMENT '缴费状态',
  PER_PAY_BASE varchar(10) DEFAULT NULL COMMENT '个人缴费基数',
  PAY_AMOUT_MON varchar(10) DEFAULT NULL COMMENT '本月缴费金额',
  UPDATE_TIME varchar(10) DEFAULT NULL COMMENT '信息更新日期',
  PAY_COM_NAME varchar(200) DEFAULT NULL COMMENT '缴费单位',
  SOPT_PAY_REASON varchar(100) DEFAULT NULL COMMENT '中断或终止缴费原因',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY idx_reportId (REPORT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='养老缴费表';

-- ----------------------------
-- Table structure for per_pensio_release
-- ----------------------------
DROP TABLE IF EXISTS per_pensio_release;
CREATE TABLE per_pensio_release (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL varchar(10) DEFAULT NULL COMMENT '编号',
  REL_PLACE varchar(100) DEFAULT NULL COMMENT '发放地',
  RETIRED_TYPE varchar(50) DEFAULT NULL COMMENT '离退休类别',
  RETIRED_MONTH varchar(20) DEFAULT NULL COMMENT '离退休月份',
  START_WORK_MON varchar(20) DEFAULT NULL COMMENT '参加工作月份',
  REL_SUM_CUR_MON varchar(20) DEFAULT NULL COMMENT '本月实发养老金',
  STOP_REL_REASON varchar(100) DEFAULT NULL COMMENT '停发原因',
  ORIGINAL_COMAPNY varchar(200) DEFAULT NULL COMMENT '原单位名称',
  UPDATE_TIME varchar(20) DEFAULT NULL COMMENT '信息更新日期',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY idx_reportId (REPORT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='养老保险金发放记录';

-- ----------------------------
-- Table structure for per_phone_info
-- ----------------------------
DROP TABLE IF EXISTS per_phone_info;
CREATE TABLE per_phone_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '鎶ュ憡缂栧彿',
  PHONE_NUM varchar(100) DEFAULT NULL COMMENT '鎵嬫満鍙风爜',
  UPDATE_DATE varchar(100) DEFAULT NULL COMMENT '淇℃伅鏇存柊鏃ユ湡',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_PHONE_INFO (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1926879 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='鎵嬫満鍙风爜淇℃伅';

-- ----------------------------
-- Table structure for per_provident_fund_pay
-- ----------------------------
DROP TABLE IF EXISTS per_provident_fund_pay;
CREATE TABLE per_provident_fund_pay (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL varchar(10) DEFAULT NULL COMMENT '编号',
  PAY_PLACE varchar(50) DEFAULT NULL COMMENT '参缴地',
  PAY_DATE varchar(20) DEFAULT NULL COMMENT '参缴日期',
  START_PAY_MON varchar(20) DEFAULT NULL COMMENT '初缴月份',
  STOP_PAY_MON varchar(20) DEFAULT NULL COMMENT '缴至月份',
  PAY_STATUS varchar(20) DEFAULT NULL COMMENT '缴费状态',
  pay_mon_amout varchar(20) DEFAULT NULL COMMENT '月缴存额',
  PER_PAY_PERCENT varchar(10) DEFAULT NULL COMMENT '个人缴存比例',
  COM_PAY_PERCENT varchar(10) DEFAULT NULL COMMENT '单位缴存比例',
  pay_com_name varchar(240) DEFAULT NULL COMMENT '缴费单位',
  UPDATE_TIME varchar(20) DEFAULT NULL COMMENT '信息更新日期',
  LABEL_CNT varchar(100) DEFAULT NULL COMMENT '标注及声明个数',
  PAY_STATUS2 varchar(20) DEFAULT NULL COMMENT '缴费状态2',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_PROVIDENT_FUND_PAY (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=356332 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='住房公积金参缴记录信息段';

-- ----------------------------
-- Table structure for per_public_summary_info
-- ----------------------------
DROP TABLE IF EXISTS per_public_summary_info;
CREATE TABLE per_public_summary_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  PUBLIC_INFO_TYPE varchar(100) DEFAULT NULL COMMENT '公共信息类型',
  RECORD_NUM varchar(100) DEFAULT NULL COMMENT '记录数',
  INVOLVE_SUM varchar(100) DEFAULT NULL COMMENT '涉及金额',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_PUBLIC_SUMMARY_INFO (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公共信息概要信息';

-- ----------------------------
-- Table structure for per_qualification
-- ----------------------------
DROP TABLE IF EXISTS per_qualification;
CREATE TABLE per_qualification (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL varchar(10) DEFAULT NULL COMMENT '编号',
  QUAL_NAME varchar(100) DEFAULT NULL COMMENT '执业资格名称',
  QUAL_LEVEL varchar(200) DEFAULT NULL COMMENT '等级',
  QUAL_OBTAIN_DATE varchar(20) DEFAULT NULL COMMENT '获得年月',
  MATURITY_DATE varchar(20) DEFAULT NULL COMMENT '到期年月',
  REVOKE_DATE varchar(20) DEFAULT NULL COMMENT '吊销年月',
  ISSUED_COMAPNY varchar(100) DEFAULT NULL COMMENT '颁发机构',
  COMPANY_LOCATION varchar(100) DEFAULT NULL COMMENT '机构所在地',
  LABEL_CNT varchar(100) DEFAULT NULL COMMENT '标注及声明个数',
  QUAL_LEVEL2 varchar(200) DEFAULT NULL COMMENT '等级2',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_QUALIFICATION (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='执业资格记录信息段';

-- ----------------------------
-- Table structure for per_query_detail
-- ----------------------------
DROP TABLE IF EXISTS per_query_detail;
CREATE TABLE per_query_detail (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL varchar(10) DEFAULT NULL COMMENT '编号',
  CR_QUERY_TIME varchar(20) DEFAULT NULL COMMENT '查询时间',
  CR_QUERY_OPERATOR varchar(50) DEFAULT NULL COMMENT '操作员',
  CR_QUERY_REASON varchar(50) DEFAULT NULL COMMENT '查询原因',
  QUERY_ORG_TYPE varchar(100) DEFAULT NULL COMMENT '查询机构类型',
  QUERY_ORG_CODE varchar(100) DEFAULT NULL COMMENT '查询机构',
  QUERY_REASON varchar(100) DEFAULT NULL COMMENT '查询原因',
  QUERY_TIME varchar(100) DEFAULT NULL COMMENT '查询日期',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_QUERY_DETAIL (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32133583 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='查询记录信息单元';

-- ----------------------------
-- Table structure for per_query_summary
-- ----------------------------
DROP TABLE IF EXISTS per_query_summary;
CREATE TABLE per_query_summary (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  MON_LOAN_QUERY_ORG_NUM varchar(30) DEFAULT NULL COMMENT '最近 1 个月内的查询机构数(贷款审批)',
  MON_CREDIT_QUERY_ORG_NUM varchar(30) DEFAULT NULL COMMENT '最近 1 个月内的查询机构数(信用卡审批)',
  MON_LOAN_QUERY_NUM varchar(30) DEFAULT NULL COMMENT '最近 1 个月内的查询次数(贷款审批)',
  MON_CREDIT_QUERY_NUM varchar(30) DEFAULT NULL COMMENT '最近 1 个月内的查询次数(信用卡审批)',
  MON_OWN_QUERY_NUM varchar(30) DEFAULT NULL COMMENT '最近 1 个月内的查询次数(本人查询)',
  YEAR_LOAN_QUERY_NUM varchar(30) DEFAULT NULL COMMENT '最近两年内查询次数（贷款）',
  YEAR_OWN_QUERY_NUM varchar(30) DEFAULT NULL COMMENT '最近两年内查询次数（信用卡）',
  YEAR_SPECIAL_QUERY_NUM varchar(30) DEFAULT NULL COMMENT '最近 2 年内的查询次数(特约商户实名审查)',
  YEAR_AFTER_LOAN_QUERY_NUM varchar(100) DEFAULT NULL COMMENT '最近 2 年内的查询次数(贷后管理)',
  LR_QUERY_ORG_REASON varchar(100) DEFAULT NULL COMMENT '上一次查询原因',
  LR_QUERY_ORG_CODE varchar(100) DEFAULT NULL COMMENT '上一次查询机构代码',
  YEAR_ASSURE_QUERY_NUM varchar(100) DEFAULT NULL COMMENT '最近 2 年内的查询次数(担保资格审查)',
  LR_QUERY_TIME varchar(100) DEFAULT NULL COMMENT '上一次查询日期',
  LR_QUERY_ORG_TYPE varchar(100) DEFAULT NULL COMMENT '上一次查询机构机构类型',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY index_PER_QUERY_SUMMARY (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1090286 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='查询记录概要信息段';

-- ----------------------------
-- Table structure for per_q_credit_detail
-- ----------------------------
DROP TABLE IF EXISTS per_q_credit_detail;
CREATE TABLE per_q_credit_detail (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL_NUMBER varchar(64) DEFAULT NULL COMMENT '流水号',
  SERIAL varchar(10) DEFAULT NULL COMMENT '编号',
  Q_CR_REL_CARD_DATE varchar(20) DEFAULT NULL COMMENT '发卡日期',
  Q_CR_REL_CARD_ORG varchar(30) DEFAULT NULL COMMENT '发卡机构',
  BUSSID varchar(40) DEFAULT NULL COMMENT '业务号',
  VOUCHTYPE varchar(200) DEFAULT NULL COMMENT '担保方式',
  CURRENCYTYPE varchar(100) DEFAULT NULL COMMENT '币种',
  CARDTYPE varchar(18) DEFAULT NULL COMMENT '卡类型',
  Q_CR_CREDIT_SUM varchar(20) DEFAULT NULL COMMENT '授信额度',
  Q_CR_SHARE_CREDIT_SUM varchar(20) DEFAULT NULL COMMENT '共享授信额度',
  Q_CR_STOP_DATE varchar(20) DEFAULT NULL COMMENT '截止日期',
  Q_CR_ACC_STATUS varchar(10) DEFAULT NULL COMMENT '账户状态',
  Q_CR_USED_SUM varchar(20) DEFAULT NULL COMMENT '已用额度',
  Q_CR_AVG_USED_SUM varchar(20) DEFAULT NULL COMMENT '最近6个月平均使用额度',
  Q_CR_USED_MAX_SUM varchar(20) DEFAULT NULL COMMENT '最大使用额度',
  Q_CR_SHOULD_REPAY_AMOUT varchar(20) DEFAULT NULL COMMENT '本月应还款',
  Q_CR_BILL_DATE varchar(20) DEFAULT NULL COMMENT '账单日',
  Q_CR_ACTUAL_REPAY_AMOUT varchar(20) DEFAULT NULL COMMENT '本月实还款',
  Q_CR_LAST_REPAY_DATE varchar(20) DEFAULT NULL COMMENT '最近一次还款日期',
  UNREPAY_BALANCE varchar(20) DEFAULT NULL COMMENT '透支180天以上未付余额',
  Q_CR_CUR_OVER_NUM varchar(20) DEFAULT NULL COMMENT '当前逾期期数',
  Q_CR_CUR_OVER_AMOUT varchar(20) DEFAULT NULL COMMENT '当前逾期期数',
  STATEBTIME varchar(20) DEFAULT NULL COMMENT '24期开始日期',
  STATEETIME varchar(20) DEFAULT NULL COMMENT '24期截止日期',
  Q_CR_REPAY_RECORD varchar(100) DEFAULT NULL COMMENT '最近24个月还款记录',
  OVERDUE_BDATE varchar(20) DEFAULT NULL COMMENT '逾期开始日期',
  OVERDUE_EDATE varchar(20) DEFAULT NULL COMMENT '逾期截止日期',
  SPECIAL_TRADE_TYPE varchar(50) DEFAULT NULL COMMENT '特殊交易类型',
  OCCUR_DATE varchar(20) DEFAULT NULL COMMENT '发生日期',
  CHANGE_MONTH varchar(10) DEFAULT NULL COMMENT '变更月数',
  OCCUR_SUM varchar(20) DEFAULT NULL COMMENT '发生金额',
  OVERDUE_DETAIL varchar(100) DEFAULT NULL COMMENT '明细记录',
  balance varchar(20) DEFAULT NULL COMMENT '余额',
  BANK_TYPE varchar(200) DEFAULT NULL COMMENT '银行类型',
  CURRENCYTYPE2 varchar(100) DEFAULT NULL COMMENT 'CURRENCYTYPE2',
  BANK_TYPE2 varchar(200) DEFAULT NULL COMMENT 'BANK_TYPE2',
  VOUCHTYPE2 varchar(200) DEFAULT NULL COMMENT 'VOUCHTYPE2',
  CARDTYPE2 varchar(18) DEFAULT NULL COMMENT 'CARDTYPE2',
  Q_CR_ACC_STATUS2 varchar(10) DEFAULT NULL COMMENT 'Q_CR_ACC_STATUS2',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY idx_reportId (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23103 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='准贷记卡交易明细表';

-- ----------------------------
-- Table structure for per_recover_info_detail
-- ----------------------------
DROP TABLE IF EXISTS per_recover_info_detail;
CREATE TABLE per_recover_info_detail (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  BALANCE varchar(100) DEFAULT NULL COMMENT '余额',
  BUSS_TYPE varchar(100) DEFAULT NULL COMMENT '业务类型',
  ACC_SUM varchar(100) DEFAULT NULL COMMENT '账户数',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_RECOVER_INFO_DETAIL (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=105280 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='被追偿汇总信息';

-- ----------------------------
-- Table structure for per_repayer
-- ----------------------------
DROP TABLE IF EXISTS per_repayer;
CREATE TABLE per_repayer (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  BUSS_CATEGORY varchar(100) DEFAULT NULL COMMENT '业务种类',
  CONTRACT_NUM varchar(100) DEFAULT NULL COMMENT '保证合同编号',
  OVERDRAFT_MONTH_CNT varchar(100) DEFAULT NULL COMMENT '逾期月数',
  BORROWER_CATEGORY varchar(100) DEFAULT NULL COMMENT '主借款人身份类别',
  CREATE_DATE varchar(100) DEFAULT NULL COMMENT '开立日期',
  BALANCE varchar(100) DEFAULT NULL COMMENT '余额',
  BUSS_ORG_CODE varchar(100) DEFAULT NULL COMMENT '业务管理机构',
  FIVE_TYPE varchar(100) DEFAULT NULL COMMENT '五级分类',
  INFO_REPORT_DATE varchar(100) DEFAULT NULL COMMENT '信息报告日期',
  BUSS_ORG_TYPE varchar(100) DEFAULT NULL COMMENT '业务管理机构类型',
  REPAYER_TYPE varchar(100) DEFAULT NULL COMMENT '相关还款责任人类型',
  REPAY_SUM varchar(100) DEFAULT NULL COMMENT '相关还款责任金额',
  ACC_TYPE varchar(100) DEFAULT NULL COMMENT '账户类型',
  LABEL_CNT varchar(100) DEFAULT NULL COMMENT '标注及声明个数',
  CURRENCY varchar(100) DEFAULT NULL COMMENT '币种',
  EXPI_DATE varchar(100) DEFAULT NULL COMMENT '到期日期',
  REPAY_STATUS varchar(100) DEFAULT NULL COMMENT '还款状态',
  SERIAL varchar(100) DEFAULT NULL COMMENT 'SERIAL',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_REPAYER (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101582 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='相关还款责任信息段';

-- ----------------------------
-- Table structure for per_report_info
-- ----------------------------
DROP TABLE IF EXISTS per_report_info;
CREATE TABLE per_report_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  QUERY_TIME varchar(20) DEFAULT NULL COMMENT '查询时间',
  REPORT_TIME varchar(20) DEFAULT NULL COMMENT '报告时间',
  QUERY_OPERATOR varchar(50) DEFAULT NULL COMMENT '查询操作员',
  QUERY_REASON varchar(50) DEFAULT NULL COMMENT '查询原因',
  CHECK_CODE varchar(64) DEFAULT NULL COMMENT '校验列',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY idx_reportId (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1093300 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='报告信息表';

-- ----------------------------
-- Table structure for per_special_case_info
-- ----------------------------
DROP TABLE IF EXISTS per_special_case_info;
CREATE TABLE per_special_case_info (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  CASE_TYPE varchar(100) DEFAULT NULL COMMENT '特殊事件类型',
  S_HEPP_MONTH varchar(100) DEFAULT NULL COMMENT '特殊事件发生月份',
  SERIAL varchar(100) DEFAULT NULL COMMENT '账户编号',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_SPECIAL_CASE_INFO (REPORT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='特殊事件说明信息';

-- ----------------------------
-- Table structure for per_special_trade
-- ----------------------------
DROP TABLE IF EXISTS per_special_trade;
CREATE TABLE per_special_trade (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL varchar(10) DEFAULT NULL COMMENT '账户编号',
  SERIAL_NUMBER varchar(64) DEFAULT NULL COMMENT '流水号',
  CART_TYPE varchar(10) DEFAULT NULL COMMENT '类型((0:贷款，1:贷记卡，2:准贷记卡)',
  SPECIAL_TRADE_TYPE varchar(50) DEFAULT NULL COMMENT '特殊交易类型',
  OCCUR_DATE varchar(20) DEFAULT NULL COMMENT '特殊交易发生日期',
  CHANGE_MONTH varchar(10) DEFAULT NULL COMMENT '到期日期变更月数',
  OCCUR_SUM varchar(20) DEFAULT NULL COMMENT '特殊交易发生金额',
  OVERDUE_DETAIL varchar(200) DEFAULT NULL COMMENT '特殊交易明细记录',
  SPECIAL_TRADE_TYPE2 varchar(50) DEFAULT NULL COMMENT '特殊交易类型2',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_SPECIAL_TRADE (REPORT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='特殊交易信息';

-- ----------------------------
-- Table structure for per_spou
-- ----------------------------
DROP TABLE IF EXISTS per_spou;
CREATE TABLE per_spou (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SPOU_NAME varchar(150) DEFAULT NULL COMMENT '配偶姓名',
  SPOU_CREDENTIALS_TYPE varchar(20) DEFAULT NULL COMMENT '配偶证件类型',
  SPOU_CREDENTIALS_NO varchar(150) DEFAULT NULL COMMENT '配偶证件号码',
  SPOU_COMPANY varchar(200) DEFAULT NULL COMMENT '配偶工作单位',
  SPOU_TEL varchar(150) DEFAULT NULL COMMENT '配偶联系电话',
  MARITAL_STATUS varchar(100) DEFAULT NULL COMMENT '婚姻状况',
  SPOU_CREDENTIALS_TYPE2 varchar(100) DEFAULT NULL COMMENT '配偶证件类型2',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_SPOU (REPORT_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=598512 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='配偶信息表';

-- ----------------------------
-- Table structure for per_statement
-- ----------------------------
DROP TABLE IF EXISTS per_statement;
CREATE TABLE per_statement (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL varchar(10) DEFAULT NULL COMMENT '编号',
  SERIAL_NUMBER varchar(64) DEFAULT NULL COMMENT '流水号',
  CART_TYPE varchar(10) DEFAULT NULL COMMENT '类型((0:贷款，1:贷记卡，2:准贷记卡，3:本人声明，4:异议标注))',
  ORG_DES varchar(200) DEFAULT NULL COMMENT '贷款/发卡机构说明(已废除)',
  ORG_DES_DATE varchar(20) DEFAULT NULL COMMENT '添加日期（已废除）',
  OWNER_DECLARE varchar(200) DEFAULT NULL COMMENT '本人声明（已废除）',
  OWNER_DECLARE_DATE varchar(20) DEFAULT NULL COMMENT '添加日期（已废除）',
  OBJECTIONS varchar(200) DEFAULT NULL COMMENT '异议标注（已废除）',
  OBJECTIONS_DATE varchar(20) DEFAULT NULL COMMENT '添加日期（已废除）',
  INSTRUCTION_TYPE varchar(2) DEFAULT NULL COMMENT '说明类型（0:贷款/发卡机构说明，1:本人声明，2:异议标注）',
  INSTRUCTION varchar(255) DEFAULT NULL COMMENT '说明内容',
  ADD_DATE varchar(24) DEFAULT NULL COMMENT '添加日期',
  INSTRUCTION_TYPE2 varchar(2) DEFAULT NULL COMMENT 'INSTRUCTION_TYPE2',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY idx_reportId (REPORT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='说明/声明/标注信息表';

-- ----------------------------
-- Table structure for per_tel_pay
-- ----------------------------
DROP TABLE IF EXISTS per_tel_pay;
CREATE TABLE per_tel_pay (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL varchar(10) DEFAULT NULL COMMENT '编号',
  TEL_OPERATORS varchar(50) DEFAULT NULL COMMENT '电信运营商',
  BUSINESS_TYPE varchar(100) DEFAULT NULL COMMENT '业务类型',
  BUSINESS_OPEN_DATE varchar(20) DEFAULT NULL COMMENT '业务开通日期',
  CUR_PAY_STATUS varchar(20) DEFAULT NULL COMMENT '当前缴费状态',
  CUR_ARREAR_STATUS varchar(20) DEFAULT NULL COMMENT '当前欠费金额',
  CUR_ARREAR_MON_NUM varchar(100) DEFAULT NULL COMMENT '当前欠费月数',
  ACCOUNT_DATE varchar(20) DEFAULT NULL COMMENT '记账年月',
  PAY_RECORD varchar(100) DEFAULT NULL COMMENT '最近24个月缴费记录',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY idx_reportId (REPORT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='电信缴费记录';

-- ----------------------------
-- Table structure for per_vehicle_transaction
-- ----------------------------
DROP TABLE IF EXISTS per_vehicle_transaction;
CREATE TABLE per_vehicle_transaction (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL varchar(10) DEFAULT NULL COMMENT '编号',
  PLATE_NUM varchar(100) DEFAULT NULL COMMENT '车牌号码',
  ENGINE_NUM varchar(100) DEFAULT NULL COMMENT '发动机号',
  BRAND varchar(20) DEFAULT NULL COMMENT '品牌',
  VEHICLE_TYPE varchar(20) DEFAULT NULL COMMENT '车辆类型',
  USED_TYPE varchar(30) DEFAULT NULL COMMENT '使用性质',
  VEHICLE_STATUS varchar(30) DEFAULT NULL COMMENT '车辆状态',
  MORTGAGE_MARK varchar(15) DEFAULT NULL COMMENT '抵押标记',
  UPDATE_TIME varchar(20) DEFAULT NULL COMMENT '信息更新日期',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY idx_reportId (REPORT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='车辆交易和抵押记录';

-- ----------------------------
-- Table structure for per_verdict
-- ----------------------------
DROP TABLE IF EXISTS per_verdict;
CREATE TABLE per_verdict (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL varchar(10) DEFAULT NULL COMMENT '编号',
  TYPE varchar(10) DEFAULT NULL COMMENT '类型(0:民事判决，1:强制执行)',
  COURT_NAME varchar(100) DEFAULT NULL COMMENT '立案法院',
  CAUSE varchar(200) DEFAULT NULL COMMENT '案由',
  REGISTER_DATE varchar(20) DEFAULT NULL COMMENT '立案日期',
  SETTLE_STYLE varchar(50) DEFAULT NULL COMMENT '结案方式',
  RESULT varchar(200) DEFAULT NULL COMMENT '判决/调解结果',
  SETTLE_DATE varchar(20) DEFAULT NULL COMMENT '判决/调解生效日期',
  APPLY_SYM varchar(50) DEFAULT NULL COMMENT '申请执行标的',
  APPLY_SYM_VALUE varchar(20) DEFAULT NULL COMMENT '申请执行标的价值',
  GOAL_SYM varchar(200) DEFAULT NULL COMMENT '诉讼标的',
  GOAL_SYM_SUM varchar(20) DEFAULT NULL COMMENT '诉讼标的金额',
  LABEL_CNT varchar(100) DEFAULT NULL COMMENT '标注及声明个数',
  SETTLE_STYLE2 varchar(50) DEFAULT NULL COMMENT '结案方式2',
  SETTLE_STYLE3 varchar(50) DEFAULT NULL COMMENT 'SETTLE_STYLE3',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_VERDICT (REPORT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='民事判决信息段';

-- ----------------------------
-- Table structure for per_verdict_hist
-- ----------------------------
DROP TABLE IF EXISTS per_verdict_hist;
CREATE TABLE per_verdict_hist (
  REPORT_ID varchar(30) NOT NULL COMMENT '报告编号',
  SERIAL varchar(10) DEFAULT NULL COMMENT '编号',
  TYPE varchar(10) DEFAULT NULL COMMENT '类型(0:民事判决，1:强制执行)',
  COURT_NAME varchar(100) DEFAULT NULL COMMENT '立案法院',
  CAUSE varchar(200) DEFAULT NULL COMMENT '案由',
  REGISTER_DATE varchar(20) DEFAULT NULL COMMENT '立案日期',
  SETTLE_STYLE varchar(50) DEFAULT NULL COMMENT '结案方式',
  RESULT varchar(200) DEFAULT NULL COMMENT '判决/调解结果',
  SETTLE_DATE varchar(20) DEFAULT NULL COMMENT '判决/调解生效日期',
  APPLY_SYM varchar(50) DEFAULT NULL COMMENT '申请执行标的',
  APPLY_SYM_VALUE varchar(20) DEFAULT NULL COMMENT '申请执行标的价值',
  GOAL_SYM varchar(200) DEFAULT NULL COMMENT '诉讼标的',
  GOAL_SYM_SUM varchar(20) DEFAULT NULL COMMENT '诉讼标的金额',
  LABEL_CNT varchar(100) DEFAULT NULL COMMENT '标注及声明个数',
  SETTLE_STYLE2 varchar(50) DEFAULT NULL COMMENT '结案方式2',
  SETTLE_STYLE3 varchar(50) DEFAULT NULL COMMENT 'SETTLE_STYLE3',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY idx_reportId (REPORT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='民事判决信息段历史';

-- ----------------------------
-- Table structure for per_whole_label_info
-- ----------------------------
DROP TABLE IF EXISTS per_whole_label_info;
CREATE TABLE per_whole_label_info (
  REPORT_ID varchar(30) NOT NULL COMMENT 'REPORT_ID',
  SERIAL varchar(100) DEFAULT NULL COMMENT 'SERIAL',
  WHOLE_LABEL_CNT varchar(100) DEFAULT NULL COMMENT '标注及声明类型个数',
  WHOLE_LABEL_OBJ_SIGN varchar(100) DEFAULT NULL COMMENT '对象标识',
  WHOLE_LABEL_OBJ_TYPE varchar(100) DEFAULT NULL COMMENT '对象类型',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE,
  KEY index_PER_WHOLE_LABEL_INFO (REPORT_ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='标注及声明信息';

-- ----------------------------
-- Table structure for report_check_time
-- ----------------------------
DROP TABLE IF EXISTS report_check_time;
CREATE TABLE report_check_time (
  USER_ID varchar(64) DEFAULT NULL COMMENT '审核用户id',
  USERNAME_PERBANK varchar(64) DEFAULT NULL COMMENT '审核用户对应的人行用户',
  FLOW_ID varchar(64) DEFAULT NULL COMMENT '流程id',
  CHECK_TIME datetime DEFAULT NULL COMMENT '审核时间',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='记录审核信息';

-- ----------------------------
-- Table structure for restart_executor_info
-- ----------------------------
DROP TABLE IF EXISTS restart_executor_info;
CREATE TABLE restart_executor_info (
  ID varchar(100) DEFAULT NULL COMMENT 'ID',
  EXECUTOR_TYPE varchar(50) DEFAULT NULL COMMENT '线程池类型',
  PD_STR varchar(4000) DEFAULT NULL COMMENT '线程传入数据pd',
  TYPE varchar(20) DEFAULT NULL COMMENT '接口类型（1-个人，2-企业，3-个人信贷，4企业信贷）',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='重启系统所需线程池任务信息';

-- ----------------------------
-- Table structure for server_message_info
-- ----------------------------
DROP TABLE IF EXISTS server_message_info;
CREATE TABLE server_message_info (
  ID varchar(64) NOT NULL COMMENT '数据ID',
  VALUE varchar(200) DEFAULT NULL COMMENT 'VALUE',
  CHN varchar(200) DEFAULT NULL COMMENT '中文名',
  CODE varchar(2000) DEFAULT NULL COMMENT '编码',
  DATA_DESC varchar(200) DEFAULT NULL COMMENT '描述信息',
  PRIMARY KEY (ID) USING BTREE,
  KEY IDX_SERVER_MESSAGE_INFO_INDEX (ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='应用系统参数表';

-- ----------------------------
-- Table structure for sys_company
-- ----------------------------
DROP TABLE IF EXISTS sys_company;
CREATE TABLE sys_company (
  COMP_CODE varchar(10) NOT NULL COMMENT '法人代码',
  COMP_SHORT varchar(20) DEFAULT NULL COMMENT '法人简称',
  COMP_NAME varchar(50) DEFAULT NULL COMMENT '法人名称',
  USER_CODE varchar(20) DEFAULT NULL COMMENT '法人管理员',
  LOGO_PATH varchar(100) DEFAULT NULL COMMENT '法人logo',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY IDX_SYS_COMPANY_INDEX (COMP_CODE) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='法人机构表';

-- ----------------------------
-- Table structure for sys_company_rongxinyun
-- ----------------------------
DROP TABLE IF EXISTS sys_company_rongxinyun;
CREATE TABLE sys_company_rongxinyun (
  COMP_CODE varchar(10) NOT NULL COMMENT 'COMP_CODE',
  COMP_SHORT varchar(20) DEFAULT NULL COMMENT 'COMP_SHORT',
  COMP_NAME varchar(50) DEFAULT NULL COMMENT 'COMP_NAME',
  USER_CODE varchar(20) DEFAULT NULL COMMENT 'USER_CODE',
  LOGO_PATH varchar(100) DEFAULT NULL COMMENT 'LOGO_PATH',
  CLAWER_IP varchar(100) DEFAULT NULL COMMENT 'CLAWER_IP',
  CLAWER_PORT varchar(100) DEFAULT NULL COMMENT 'CLAWER_PORT',
  SEND_URL varchar(100) DEFAULT NULL COMMENT 'SEND_URL',
  COMP_PROVINCE varchar(100) DEFAULT NULL COMMENT 'COMP_PROVINCE',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='sys_company_rongxinyun';

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS sys_dict;
CREATE TABLE sys_dict (
  DIC_CODE varchar(50) NOT NULL COMMENT '字典编码',
  DIC_DES varchar(100) DEFAULT NULL COMMENT '字典名称',
  DIC_TYPE varchar(1) DEFAULT NULL COMMENT '字典类型,0-独立表作为字典,1-字典来源于共同表中定义的特定数据',
  DIC_TBLNAME varchar(30) DEFAULT NULL COMMENT '字典来源表',
  DIC_ID_COLNAME varchar(30) DEFAULT NULL COMMENT '字典对应的过滤条件列',
  DIC_IDVALUE varchar(35) DEFAULT NULL COMMENT '字典列对应的过滤条件列取值',
  DIC_VAL_COLNAME varchar(30) DEFAULT NULL COMMENT '字典列对应的取值列',
  DIC_DES_COLNAME varchar(30) DEFAULT NULL COMMENT '字典列对应的描述列',
  REMARK varchar(100) DEFAULT NULL COMMENT '备注',
  DIC_SORT_COLNAME varchar(30) DEFAULT NULL COMMENT '排序字段',
  DIC_DYNAMIC_SIGN varchar(1) DEFAULT NULL COMMENT '是否动态获取，默认为0。0-非动态获取；1-动态获取；',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统字典表';

-- ----------------------------
-- Table structure for sys_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS sys_dictionaries;
CREATE TABLE sys_dictionaries (
  DICTIONARIES_ID varchar(32) DEFAULT NULL COMMENT '字典编码',
  NAME varchar(50) DEFAULT NULL COMMENT '名称',
  NAME_EN varchar(50) DEFAULT NULL COMMENT '英文',
  DICT_CODE varchar(32) DEFAULT NULL COMMENT '编码',
  ORDER_BY int(11) DEFAULT NULL COMMENT '排序',
  PARENT_ID varchar(32) DEFAULT NULL COMMENT '上级ID',
  BZ varchar(100) DEFAULT NULL COMMENT '备注',
  TBSNAME varchar(50) DEFAULT NULL COMMENT '排查表',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=399 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典表';

-- ----------------------------
-- Table structure for sys_info
-- ----------------------------
DROP TABLE IF EXISTS sys_info;
CREATE TABLE sys_info (
  SYS_NO varchar(3) DEFAULT NULL COMMENT '系统编号',
  SYS_STATUS varchar(3) DEFAULT NULL COMMENT '系统状态(0维护中，1正常)',
  SYS_NAME varchar(20) DEFAULT NULL COMMENT '系统名称',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统信息表';

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS sys_menu;
CREATE TABLE sys_menu (
  MENU_ID int(11) DEFAULT NULL COMMENT '菜单编码',
  MENU_NAME varchar(50) DEFAULT NULL COMMENT '菜单名称',
  MENU_NAME_EN varchar(50) DEFAULT NULL COMMENT 'MENU_NAME_EN',
  MENU_URL varchar(100) DEFAULT NULL COMMENT '菜单地址',
  PARENT_ID varchar(32) DEFAULT NULL COMMENT '上级菜单',
  ORDER_BY varchar(5) DEFAULT NULL COMMENT '菜单排序',
  MENU_ICON varchar(50) DEFAULT NULL COMMENT '菜单图片',
  MENU_TYPE varchar(50) DEFAULT NULL COMMENT '菜单类型',
  MENU_STATE int(11) DEFAULT NULL COMMENT '菜单状态',
  MENU_GROUP_ID varchar(32) DEFAULT NULL COMMENT '菜单组',
  TRAN_CODE varchar(10) DEFAULT NULL COMMENT '交易码',
  SYS_IND varchar(10) DEFAULT NULL COMMENT '所属系统',
  COMPANY varchar(10) DEFAULT NULL COMMENT '法人机构代码',
  MENU_CHANNEL varchar(10) DEFAULT NULL COMMENT '菜单渠道 PC ,MOBILE等',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单表';

-- ----------------------------
-- Table structure for sys_menu_fun
-- ----------------------------
DROP TABLE IF EXISTS sys_menu_fun;
CREATE TABLE sys_menu_fun (
  FUN_GROUP_ID varchar(32) DEFAULT NULL COMMENT '功能组编码',
  FUN_ID varchar(32) DEFAULT NULL COMMENT '功能编码',
  FUN_NAME varchar(50) DEFAULT NULL COMMENT '功能名称',
  FUN_NAME_EN varchar(50) DEFAULT NULL COMMENT '功能英文名称',
  FUN_DESC varchar(100) DEFAULT NULL COMMENT 'FUN_DESC',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单功能明细表';

-- ----------------------------
-- Table structure for sys_menu_fun_group
-- ----------------------------
DROP TABLE IF EXISTS sys_menu_fun_group;
CREATE TABLE sys_menu_fun_group (
  FUN_GROUP_ID varchar(32) DEFAULT NULL COMMENT '功能组编码',
  FUN_GROUP_NAME varchar(50) DEFAULT NULL COMMENT 'FUN_GROUP_NAME',
  FUN_GROUP_NAME_EN varchar(50) DEFAULT NULL COMMENT 'FUN_GROUP_NAME_EN',
  FUN_GROUP_DESC varchar(100) DEFAULT NULL COMMENT '功能组描述',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单功能组表';

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS sys_operation_log;
CREATE TABLE sys_operation_log (
  LOG_ID varchar(50) DEFAULT NULL COMMENT '日志流水号',
  USER_ID varchar(100) DEFAULT NULL COMMENT '访问者用户Key',
  USERNAME varchar(20) DEFAULT NULL COMMENT '访问者用户编码',
  NAME varchar(50) DEFAULT NULL COMMENT '访问者用户名称',
  ORG varchar(50) DEFAULT NULL COMMENT '访问者所属机构',
  IP varchar(20) DEFAULT NULL COMMENT '访问者IP地址',
  MAC varchar(50) DEFAULT NULL COMMENT '访问者MAC地址',
  OPERATION_URL varchar(200) DEFAULT NULL COMMENT '访问URL',
  OPERATION_TIME varchar(20) DEFAULT NULL COMMENT '操作时间，年月日 时分秒',
  OPERATION_DESC varchar(500) DEFAULT NULL COMMENT '具体操作的描述',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=725 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='平台操作日志表，记录操作平台各功能的信息';

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS sys_org;
CREATE TABLE sys_org (
  ORG_ID varchar(100) DEFAULT NULL COMMENT '唯一标识',
  NAME varchar(30) DEFAULT NULL COMMENT '名称',
  NAME_EN varchar(50) DEFAULT NULL COMMENT '英文',
  ORG_LEVEL int(11) DEFAULT NULL COMMENT '机构层级',
  ORG_CODE varchar(50) DEFAULT NULL COMMENT '机构编码',
  PARENT_ID varchar(100) DEFAULT NULL COMMENT '上级ID',
  ORG_DESC varchar(255) DEFAULT NULL COMMENT '备注',
  HEADMAN varchar(30) DEFAULT NULL COMMENT '负责人',
  TEL varchar(50) DEFAULT NULL COMMENT '电话',
  FUNCTIONS varchar(255) DEFAULT NULL COMMENT '部门职能',
  ADDRESS varchar(255) DEFAULT NULL COMMENT '地址',
  STATUS varchar(2) DEFAULT NULL COMMENT '状态',
  ORG_ORDER int(11) DEFAULT NULL COMMENT '机构排序',
  COMPANY varchar(10) DEFAULT NULL COMMENT '法人',
  REGIONALISM_CODE varchar(6) DEFAULT NULL COMMENT '行政区划代码',
  SIMPLENAME varchar(30) DEFAULT NULL COMMENT '机构简称',
  ORG_ID_PERBANK varchar(255) DEFAULT NULL COMMENT '上报机构代码(个人总)',
  ORG_ID_COMBANK varchar(100) DEFAULT NULL COMMENT '上报机构代码(企业总)',
  BRANCH_CODE_PERBANK varchar(50) DEFAULT NULL COMMENT '查询网点人行代码(个人)',
  BRANCH_CODE_COMBANK varchar(50) DEFAULT NULL COMMENT '查询网点人行代码(企业)',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY IDX_SYS_ORG_INDEX (ORG_ID,COMPANY) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='机构表';

-- ----------------------------
-- Table structure for sys_password
-- ----------------------------
DROP TABLE IF EXISTS sys_password;
CREATE TABLE sys_password (
  INITIAL_PASSWORD varchar(50) DEFAULT NULL COMMENT '初始密码明码',
  MAX_ERROR_LOGON int(11) DEFAULT NULL COMMENT '每天输错密码次数',
  EFFECT_DAYS int(11) DEFAULT NULL COMMENT '密码过期天数',
  MIN_LENGTH int(11) DEFAULT NULL COMMENT '密码最小长度',
  MAX_LENGTH int(11) DEFAULT NULL COMMENT '密码最大长度',
  REPEAT_NUM int(11) DEFAULT NULL COMMENT '密码不能重复次数',
  MODIFIED_RESTRICT_TIME int(11) DEFAULT NULL COMMENT '重复修改限制时间',
  ENCRYPT_TYPE varchar(20) DEFAULT NULL COMMENT '密码加密规则，默认采用MD5',
  PASSWORD_RULE varchar(50) DEFAULT NULL COMMENT '密码校验规则，采用正则表达式的形式存储，便于校验',
  PASSWORD_RULE_DESC varchar(100) DEFAULT NULL COMMENT '密码校验规则描述',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='密码参数表';

-- ----------------------------
-- Table structure for sys_pictures
-- ----------------------------
DROP TABLE IF EXISTS sys_pictures;
CREATE TABLE sys_pictures (
  PICTURES_ID varchar(100) DEFAULT NULL COMMENT '图片ID ',
  TITLE varchar(255) DEFAULT NULL COMMENT '标题',
  NAME varchar(255) DEFAULT NULL COMMENT '文件名',
  PATH varchar(255) DEFAULT NULL COMMENT '路径',
  CREATETIME varchar(100) DEFAULT NULL COMMENT '创建时间',
  MASTER_ID varchar(255) DEFAULT NULL COMMENT '属于',
  BZ varchar(255) DEFAULT NULL COMMENT '备注',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='图片信息表';

-- ----------------------------
-- Table structure for sys_policy
-- ----------------------------
DROP TABLE IF EXISTS sys_policy;
CREATE TABLE sys_policy (
  ROLE_ID varchar(32) DEFAULT NULL COMMENT '角色编码',
  MENU_ID varchar(10) DEFAULT NULL COMMENT '菜单编码',
  FUN_GROUP_ID varchar(32) DEFAULT NULL COMMENT '功能组编码',
  FUN_ID varchar(32) DEFAULT NULL COMMENT '功能编码',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色对应菜单及操作权限表';

-- ----------------------------
-- Table structure for sys_position
-- ----------------------------
DROP TABLE IF EXISTS sys_position;
CREATE TABLE sys_position (
  POSITI_ID varchar(32) DEFAULT NULL COMMENT '职位编码',
  POSITI_NAME varchar(50) DEFAULT NULL COMMENT '职位名称',
  POSITI_NAME_EN varchar(50) DEFAULT NULL COMMENT 'POSITI_NAME_EN',
  POSITI_DESC varchar(50) DEFAULT NULL COMMENT '职位名称描述',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户职位表';

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS sys_role;
CREATE TABLE sys_role (
  ROLE_ID varchar(32) DEFAULT NULL COMMENT '角色编码',
  ROLE_NAME varchar(50) DEFAULT NULL COMMENT '角色名称',
  ROLE_NAME_EN varchar(50) DEFAULT NULL COMMENT 'ROLE_NAME_EN',
  ROLE_DESC varchar(100) DEFAULT NULL COMMENT '角色描述',
  COMPANY varchar(32) DEFAULT NULL COMMENT '法人代码',
  ISVALID varchar(30) DEFAULT NULL COMMENT '是否有效',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色定义表';

-- ----------------------------
-- Table structure for sys_sms
-- ----------------------------
DROP TABLE IF EXISTS sys_sms;
CREATE TABLE sys_sms (
  SMS_ID varchar(100) NOT NULL COMMENT '站内信ID',
  CONTENT varchar(1000) DEFAULT NULL COMMENT '站内信内容',
  TYPE varchar(5) DEFAULT NULL COMMENT '站内信类型',
  TO_USERNAME varchar(255) DEFAULT NULL COMMENT '收信人',
  FROM_USERNAME varchar(255) DEFAULT NULL COMMENT '发信人',
  SEND_TIME varchar(100) DEFAULT NULL COMMENT '发信时间',
  STATUS varchar(5) DEFAULT NULL COMMENT '状态',
  SANME_ID varchar(100) DEFAULT NULL COMMENT 'SANME_ID',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='站内信';

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS sys_user;
CREATE TABLE sys_user (
  USER_ID varchar(100) DEFAULT NULL COMMENT '用户编码',
  USERNAME varchar(255) DEFAULT NULL COMMENT '登录编码',
  PASSWORD varchar(255) DEFAULT NULL COMMENT '密码',
  NAME varchar(255) DEFAULT NULL COMMENT '用户名称',
  LAST_LOGIN varchar(255) DEFAULT NULL COMMENT '最近登录时间',
  IP varchar(100) DEFAULT NULL COMMENT '登录ip',
  SKIN varchar(100) DEFAULT NULL COMMENT '皮肤',
  EMAIL varchar(32) DEFAULT NULL COMMENT 'email',
  TELLER_NUMBER varchar(100) DEFAULT NULL COMMENT '柜员号',
  PHONE varchar(32) DEFAULT NULL COMMENT '电话号码',
  PWD_ALTER_TIME varchar(20) DEFAULT NULL COMMENT '密码修改日期',
  DEPT_CODE varchar(32) DEFAULT NULL COMMENT '部门编码',
  STATE varchar(2) DEFAULT NULL COMMENT '有效状态',
  ERR_TIMES int(11) DEFAULT NULL COMMENT '出错次数',
  LOCK_STATUS varchar(2) DEFAULT NULL COMMENT '用户状态:0-无效，1-正常，2-睡眠户，3-锁定',
  COMPANY varchar(10) DEFAULT NULL COMMENT '法人编码',
  DEPARTMENT varchar(20) DEFAULT NULL COMMENT 'DEPARTMENT',
  MAC varchar(32) DEFAULT NULL COMMENT 'MAC',
  USERNAME_PERBANK varchar(255) DEFAULT NULL COMMENT '人行登录账号(个人)',
  USERNAME_PERBANK_ORG varchar(255) DEFAULT NULL COMMENT '人行登录账号(企业)',
  IS_ONLINE_USER varchar(255) DEFAULT NULL COMMENT '否线上查询用户(0:否,1:是)',
  UPDATE_TIME datetime DEFAULT NULL COMMENT '用户修改时间',
  CHANNEL_ID varchar(20) DEFAULT NULL COMMENT '渠道编号',
  LOCK_REASON varchar(200) DEFAULT NULL COMMENT '用户锁定的原因',
  PRODUCT_ID varchar(20) DEFAULT NULL COMMENT '产品编号',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表 ';

-- ----------------------------
-- Table structure for sys_user_org
-- ----------------------------
DROP TABLE IF EXISTS sys_user_org;
CREATE TABLE sys_user_org (
  USER_ID varchar(32) DEFAULT NULL COMMENT '用户ID',
  ORG_ID varchar(32) DEFAULT NULL COMMENT '机构ID',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY IDX_SYS_USER_ORG_INDEX (ORG_ID,USER_ID) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户对应机构表';

-- ----------------------------
-- Table structure for sys_user_pro
-- ----------------------------
DROP TABLE IF EXISTS sys_user_pro;
CREATE TABLE sys_user_pro (
  user_id varchar(32) DEFAULT NULL COMMENT 'user_id',
  pro_id varchar(32) DEFAULT NULL COMMENT 'pro_id',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户产品表';

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS sys_user_role;
CREATE TABLE sys_user_role (
  USER_ID varchar(32) DEFAULT NULL COMMENT '用户ID',
  ROLE_ID varchar(32) DEFAULT NULL COMMENT '角色ID',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户对应机构表';

-- ----------------------------
-- Table structure for table_col_encrypt
-- ----------------------------
DROP TABLE IF EXISTS table_col_encrypt;
CREATE TABLE table_col_encrypt (
  TABLE_NAME varchar(100) DEFAULT NULL COMMENT '需要加密的表名',
  COL_NAME varchar(100) DEFAULT NULL COMMENT '需要加密的字段名',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY IDX_TABLE_COL_ENCRYPT_INDEX (TABLE_NAME,COL_NAME) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='需要加密的表名和字段名';

-- ----------------------------
-- Table structure for tab_col_zxcx
-- ----------------------------
DROP TABLE IF EXISTS tab_col_zxcx;
CREATE TABLE tab_col_zxcx (
  TABLE_NAME varchar(100) DEFAULT NULL COMMENT '表名',
  TABLE_COMMENTS varchar(500) DEFAULT NULL COMMENT '表注释',
  COLUMN_NAME varchar(100) DEFAULT NULL COMMENT '字段名',
  COLUMN_COMMENTS varchar(500) DEFAULT NULL COMMENT '字段注释',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='一代征信表结构';

-- ----------------------------
-- Table structure for temp2_jzyj
-- ----------------------------
DROP TABLE IF EXISTS temp2_jzyj;
CREATE TABLE temp2_jzyj (
  userinfo varchar(100) DEFAULT NULL COMMENT '用户',
  username varchar(100) DEFAULT NULL COMMENT '用户',
  QUERY_MONTH varchar(100) DEFAULT NULL COMMENT '数量',
  PERSONQUERYTOPLIMIT varchar(100) DEFAULT NULL COMMENT '数量',
  ORGQUERYTOPLIMIT varchar(100) DEFAULT NULL COMMENT '数量',
  QUERYTOPLIMIT varchar(100) DEFAULT NULL COMMENT '数量',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='激增情况预警2';

-- ----------------------------
-- Table structure for temp_dyyj
-- ----------------------------
DROP TABLE IF EXISTS temp_dyyj;
CREATE TABLE temp_dyyj (
  DATADATE varchar(100) DEFAULT NULL COMMENT '机构',
  ORGNAME varchar(100) DEFAULT NULL COMMENT '用户',
  USERNAME varchar(100) DEFAULT NULL COMMENT '类型',
  USERREALNAME varchar(100) DEFAULT NULL COMMENT '数量',
  REGIONALISMCODE varchar(100) DEFAULT NULL COMMENT '数量',
  CLIENTNAME varchar(100) DEFAULT NULL COMMENT '数量',
  CHINACREDITCODE varchar(100) DEFAULT NULL COMMENT '数量',
  ORG_ID varchar(100) DEFAULT NULL COMMENT '数量',
  IS_ONLINE_USER varchar(100) DEFAULT NULL COMMENT '数量',
  userinfo varchar(100) DEFAULT NULL COMMENT '数量',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='激增情况预警';

-- ----------------------------
-- Table structure for temp_jzyj
-- ----------------------------
DROP TABLE IF EXISTS temp_jzyj;
CREATE TABLE temp_jzyj (
  ORGNAME varchar(100) DEFAULT NULL COMMENT '机构',
  USERNAME varchar(100) DEFAULT NULL COMMENT '用户',
  CLIENT_TYPE varchar(100) DEFAULT NULL COMMENT '类型',
  CNT varchar(100) DEFAULT NULL COMMENT '数量',
  userinfo varchar(100) DEFAULT NULL COMMENT '数量',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='激增情况预警';

-- ----------------------------
-- Table structure for temp_qtyj
-- ----------------------------
DROP TABLE IF EXISTS temp_qtyj;
CREATE TABLE temp_qtyj (
  ORGNAME varchar(100) DEFAULT NULL COMMENT '机构',
  USERREALNAME varchar(100) DEFAULT NULL COMMENT '用户',
  USERNAME varchar(100) DEFAULT NULL COMMENT '类型',
  ISOTHERREASON varchar(100) DEFAULT NULL COMMENT '数量',
  ORG_ID varchar(100) DEFAULT NULL COMMENT '数量',
  userinfo varchar(100) DEFAULT NULL COMMENT '数量',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='激增情况预警';

-- ----------------------------
-- Table structure for temp_sbyj
-- ----------------------------
DROP TABLE IF EXISTS temp_sbyj;
CREATE TABLE temp_sbyj (
  ORGNAME varchar(100) DEFAULT NULL COMMENT '机构',
  USERNAME varchar(100) DEFAULT NULL COMMENT '用户',
  CLIENT_TYPE varchar(100) DEFAULT NULL COMMENT '类型',
  CNT varchar(100) DEFAULT NULL COMMENT '数量',
  userinfo varchar(100) DEFAULT NULL COMMENT '数量',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='激增情况预警';

-- ----------------------------
-- Table structure for test_important_message
-- ----------------------------
DROP TABLE IF EXISTS test_important_message;
CREATE TABLE test_important_message (
  ID varchar(50) DEFAULT NULL COMMENT 'ID',
  M_DATE varchar(20) DEFAULT NULL COMMENT '日期',
  STATUS varchar(5) DEFAULT NULL COMMENT '状态',
  REPORT_ID varchar(50) DEFAULT NULL COMMENT '报告编号',
  MESSAGE varchar(1000) DEFAULT NULL COMMENT '信息说明',
  NAME varchar(50) DEFAULT NULL COMMENT '文件名称',
  sgcdb_prdid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcdb_prdid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='重要信息提示1';

-- ----------------------------
-- Table structure for time_record
-- ----------------------------
DROP TABLE IF EXISTS time_record;
CREATE TABLE time_record (
  SDATE decimal(20,0) DEFAULT NULL COMMENT 'SDATE',
  EDATE decimal(20,0) DEFAULT NULL COMMENT 'EDATE',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='time_record';

-- ----------------------------
-- Table structure for url_data
-- ----------------------------
DROP TABLE IF EXISTS url_data;
CREATE TABLE url_data (
  FILENAME varchar(100) DEFAULT NULL COMMENT '来源文件名',
  QUERY_NO varchar(64) DEFAULT NULL COMMENT '流水号',
  APPLICATION_TYPE varchar(2) DEFAULT NULL COMMENT '影像资料类型',
  APPLICATION_URL varchar(1000) DEFAULT NULL COMMENT '影像资料地址',
  ID varchar(64) DEFAULT NULL COMMENT '查询编号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '插入时间',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='影像资料数据表';

-- ----------------------------
-- Table structure for url_hist_data
-- ----------------------------
DROP TABLE IF EXISTS url_hist_data;
CREATE TABLE url_hist_data (
  FILENAME varchar(100) DEFAULT NULL COMMENT '来源文件名',
  CLIENT_NAME varchar(100) DEFAULT NULL COMMENT '被查询人姓名',
  CREDENTIALS_TYPE varchar(2) DEFAULT NULL COMMENT '证件类型',
  CREDENTIALS_NO varchar(50) DEFAULT NULL COMMENT '证件号码',
  APPLICATION_TIME varchar(40) DEFAULT NULL COMMENT '申请时间',
  APPLICATION_TYPE varchar(2) DEFAULT NULL COMMENT '影像资料类型',
  APPLICATION_URL varchar(1000) DEFAULT NULL COMMENT '影像资料地址',
  ID varchar(64) DEFAULT NULL COMMENT '查询编号',
  DATA_DATE varchar(20) DEFAULT NULL COMMENT '插入时间',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='影像资料历史数据表';

-- ----------------------------
-- Table structure for user_tab_cols
-- ----------------------------
DROP TABLE IF EXISTS user_tab_cols;
CREATE TABLE user_tab_cols (
  TABLE_NAME varchar(100) DEFAULT NULL COMMENT '表名',
  COLUMN_NAME varchar(3000) DEFAULT NULL COMMENT '字段名称',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='表对应字段明细';

-- ----------------------------
-- Table structure for webcrawler_dict
-- ----------------------------
DROP TABLE IF EXISTS webcrawler_dict;
CREATE TABLE webcrawler_dict (
  DICT_NAME varchar(100) DEFAULT NULL COMMENT '数据字典名称',
  O_CODE varchar(100) DEFAULT NULL COMMENT '系统字典Code',
  C_CODE varchar(100) DEFAULT NULL COMMENT '人行字典Code',
  CODE_CHN varchar(100) DEFAULT NULL COMMENT '字典中文名称',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='人行网页爬虫数据字典映照表';

-- ----------------------------
-- Table structure for web_crawler_info
-- ----------------------------
DROP TABLE IF EXISTS web_crawler_info;
CREATE TABLE web_crawler_info (
  URLACTION_NAME varchar(100) DEFAULT NULL COMMENT 'url中的action名字',
  CODE varchar(100) DEFAULT NULL COMMENT '参数名',
  VALUE varchar(2000) DEFAULT NULL COMMENT '参数值',
  CODE_CHN varchar(100) DEFAULT NULL COMMENT '参数中文名',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='人行网页爬虫页面参数信息表';

-- ----------------------------
-- Table structure for web_crawler_info2
-- ----------------------------
DROP TABLE IF EXISTS web_crawler_info2;
CREATE TABLE web_crawler_info2 (
  USER_CODE varchar(20) NOT NULL COMMENT '用户代码',
  USER_PWD varchar(300) DEFAULT NULL COMMENT '密码',
  LOCAL_CPU varchar(1000) DEFAULT NULL COMMENT '本地CPU',
  LOCAL_DISK varchar(1000) DEFAULT NULL COMMENT '本地DISK',
  LOCAL_NETWORK varchar(1000) DEFAULT NULL COMMENT '本地NETWORK',
  PER_STATEMENT varchar(10) DEFAULT NULL COMMENT '个人STATEMENT',
  PER_TOKEN varchar(50) DEFAULT NULL COMMENT '个人TOKEN',
  COM_STATEMENT varchar(10) DEFAULT NULL COMMENT '企业STATEMENT',
  COM_TOKEN varchar(50) DEFAULT NULL COMMENT '企业TOKEN',
  CREDIT_CODE varchar(20) DEFAULT NULL COMMENT '创建状态',
  app_sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (app_sgcid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='爬虫登录信息表';

-- ----------------------------
-- Table structure for xml_col_mapping
-- ----------------------------
DROP TABLE IF EXISTS xml_col_mapping;
CREATE TABLE xml_col_mapping (
  TABLE_NAME varchar(50) DEFAULT NULL COMMENT '表名',
  COLUMN_NAME varchar(50) DEFAULT NULL COMMENT '列名',
  COMMENT_NAME varchar(300) DEFAULT NULL COMMENT '中文名称',
  XML_TAG varchar(8) DEFAULT NULL COMMENT '人行返回的xml对应的标签名称',
  IS_NEW_TAB varchar(3) DEFAULT NULL COMMENT '是否新表',
  IS_NEW_COL varchar(3) DEFAULT NULL COMMENT '是否新字段',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY IDX_XML_COL_MAPPING_INDEX (TABLE_NAME,COLUMN_NAME,XML_TAG) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1442 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='表名';

-- ----------------------------
-- Table structure for xml_col_mapping_his
-- ----------------------------
DROP TABLE IF EXISTS xml_col_mapping_his;
CREATE TABLE xml_col_mapping_his (
  TABLE_NAME varchar(50) DEFAULT NULL COMMENT 'TABLE_NAME',
  COLUMN_NAME varchar(50) DEFAULT NULL COMMENT 'COLUMN_NAME',
  COMMENT_NAME varchar(300) DEFAULT NULL COMMENT 'COMMENT_NAME',
  XML_TAG varchar(8) DEFAULT NULL COMMENT 'XML_TAG',
  IS_NEW_TAB varchar(3) DEFAULT NULL COMMENT 'IS_NEW_TAB',
  IS_NEW_COL varchar(3) DEFAULT NULL COMMENT 'IS_NEW_COL',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1438 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='xml_col_mapping_his';

-- ----------------------------
-- Table structure for xml_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS xml_dictionaries;
CREATE TABLE xml_dictionaries (
  D_NUM varchar(5) DEFAULT NULL COMMENT '编号',
  CODE varchar(10) DEFAULT NULL COMMENT '编码',
  NAME varchar(100) DEFAULT NULL COMMENT '名称',
  D_DESC varchar(300) DEFAULT NULL COMMENT '字典描述',
  XML_TAG varchar(8) DEFAULT NULL COMMENT '人行返回的XML报文的标签名称',
  XML_TAG_SIGN_VAL varchar(50) DEFAULT NULL COMMENT '分类标签的值（如：账户分类，不同的账户类型对应的账户分类的字典不一样，此字段则为账户类型的值）',
  NOTE varchar(200) DEFAULT NULL COMMENT '备注',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY IDX_XML_DICTIONARIES_INDEX (D_NUM,CODE) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7296 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='标签字典表';

-- ----------------------------
-- Table structure for xml_dictionaries1
-- ----------------------------
DROP TABLE IF EXISTS xml_dictionaries1;
CREATE TABLE xml_dictionaries1 (
  D_NUM varchar(5) DEFAULT NULL COMMENT '编号',
  CODE varchar(10) DEFAULT NULL COMMENT '编码',
  NAME varchar(100) DEFAULT NULL COMMENT '名称',
  D_DESC varchar(300) DEFAULT NULL COMMENT '字典描述',
  XML_TAG varchar(8) DEFAULT NULL COMMENT '人行返回的XML报文的标签名称',
  XML_TAG_SIGN_VAL varchar(50) DEFAULT NULL COMMENT '分类标签的值（如：账户分类，不同的账户类型对应的账户分类的字典不一样，此字段则为账户类型的值）',
  NOTE varchar(200) DEFAULT NULL COMMENT '备注',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY IDX_XML_DICTIONARIES_INDEX (D_NUM,CODE) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='标签字典表';

-- ----------------------------
-- Table structure for xml_dictionaries_1124
-- ----------------------------
DROP TABLE IF EXISTS xml_dictionaries_1124;
CREATE TABLE xml_dictionaries_1124 (
  D_NUM varchar(5) DEFAULT NULL COMMENT '编号',
  CODE varchar(10) DEFAULT NULL COMMENT '编码',
  NAME varchar(100) DEFAULT NULL COMMENT '名称',
  D_DESC varchar(300) DEFAULT NULL COMMENT '字典描述',
  XML_TAG varchar(8) DEFAULT NULL COMMENT '人行返回的XML报文的标签名称',
  XML_TAG_SIGN_VAL varchar(50) DEFAULT NULL COMMENT '分类标签的值（如：账户分类，不同的账户类型对应的账户分类的字典不一样，此字段则为账户类型的值）',
  NOTE varchar(200) DEFAULT NULL COMMENT '备注',
  sgcid bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '自增主键'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for xml_dictionaries_temp
-- ----------------------------
DROP TABLE IF EXISTS xml_dictionaries_temp;
CREATE TABLE xml_dictionaries_temp (
  D_NUM varchar(5) DEFAULT NULL COMMENT '编号',
  CODE varchar(10) DEFAULT NULL COMMENT '编码',
  NAME varchar(100) DEFAULT NULL COMMENT '名称',
  D_DESC varchar(300) DEFAULT NULL COMMENT '字典描述',
  XML_TAG varchar(8) DEFAULT NULL COMMENT '人行返回的XML报文的标签名称',
  XML_TAG_SIGN_VAL varchar(50) DEFAULT NULL COMMENT '分类标签的值（如：账户分类，不同的账户类型对应的账户分类的字典不一样，此字段则为账户类型的值）',
  NOTE varchar(200) DEFAULT NULL COMMENT '备注',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE,
  KEY IDX_XML_DICTIONARIES_INDEX (D_NUM,CODE) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='标签字典表';

-- ----------------------------
-- Table structure for xml_meijuzhi
-- ----------------------------
DROP TABLE IF EXISTS xml_meijuzhi;
CREATE TABLE xml_meijuzhi (
  id varchar(100) DEFAULT NULL,
  mazhi varchar(100) DEFAULT NULL,
  name varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for xml_to_html_table
-- ----------------------------
DROP TABLE IF EXISTS xml_to_html_table;
CREATE TABLE xml_to_html_table (
  ID varchar(100) NOT NULL COMMENT '查询编号',
  QUERY_NAME varchar(50) DEFAULT NULL COMMENT '查询员',
  TYPE varchar(10) DEFAULT NULL COMMENT '查询类型；1-个人，2-企业',
  QUERY_TIME varchar(20) DEFAULT NULL COMMENT '查询时间',
  PRIMARY KEY (ID) USING BTREE,
  KEY IDX_XML_TO_HTML_TABLE_INDEX (ID) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='XML转HTML所需参数表';

-- ----------------------------
-- Table structure for xml_to_html_table_his
-- ----------------------------
DROP TABLE IF EXISTS xml_to_html_table_his;
CREATE TABLE xml_to_html_table_his (
  ID varchar(100) DEFAULT NULL COMMENT '查询编号',
  QUERY_NAME varchar(50) DEFAULT NULL COMMENT '查询员',
  TYPE varchar(10) DEFAULT NULL COMMENT '查询类型；1-个人，2-企业',
  QUERY_TIME varchar(20) DEFAULT NULL COMMENT '查询时间',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='XML转HTML所需参数历史表';

-- ----------------------------
-- Table structure for zxgl_tab_cols
-- ----------------------------
DROP TABLE IF EXISTS zxgl_tab_cols;
CREATE TABLE zxgl_tab_cols (
  TABLE_NAME varchar(30) NOT NULL COMMENT 'TABLE_NAME',
  COLUMN_NAME varchar(30) NOT NULL COMMENT 'COLUMN_NAME',
  DATA_TYPE varchar(106) DEFAULT NULL COMMENT 'DATA_TYPE',
  DATA_LENGTH decimal(10,0) NOT NULL COMMENT 'DATA_LENGTH',
  sgcid bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  PRIMARY KEY (sgcid) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='zxgl_tab_cols';
