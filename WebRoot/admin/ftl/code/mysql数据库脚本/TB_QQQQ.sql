
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `TB_QQQQ`
-- ----------------------------
DROP TABLE IF EXISTS `TB_QQQQ`;
CREATE TABLE `TB_QQQQ` (
 		`QQ_ID` varchar(100) NOT NULL,
		`STR_NAME` varchar(255) DEFAULT NULL COMMENT '匿名',
  		PRIMARY KEY (`QQ_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
