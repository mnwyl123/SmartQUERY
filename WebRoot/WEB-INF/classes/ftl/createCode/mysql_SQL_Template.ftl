
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `${objectNameUpper}`
-- ----------------------------
DROP TABLE IF EXISTS `${objectNameUpper}`;
CREATE TABLE `${objectNameUpper}` (
<!--根据实际情况设置主键-->
	<#list fieldList as var>
		<#if var[1] == 'Integer'>
		`${var[0]}` int(${var[5]}) NOT NULL COMMENT '${var[2]}',
		<#else>
		`${var[0]}` varchar(${var[5]}) DEFAULT NULL COMMENT '${var[2]}',
		</#if>
	</#list>
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
