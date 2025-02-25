<?xml version="1.0" encoding="gb2312"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:user="com.dcits.cq.util.XslUtil" extension-element-prefixes="user">
<!--<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:user="http://mycompany.com/mynamespace">
	自定义JS函数 
	<msxsl:script language="JScript" implements-prefix="user">
		var mcnt1 = 0;
		var mcnt2 = 0;
		function init(){
			mcnt1 = 0;
			mcnt2 = 0;
		}
		function addm(para1){
			mcnt2 = mcnt1;
			mcnt1 = para1;
			return mcnt1 - mcnt2;
		}
		function islast(para1){
			if(mcnt1 == para1)
			return true;
		}
		function isnull(){
			if(mcnt1 == 0)
			return true;
		}
	</msxsl:script>-->
	<!--表格边框样式-->
	<xsl:attribute-set name="myBorder">
		<xsl:attribute name="border" >
			solid 0.5pt #6f6f6f
		</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:template match="/Document">
	<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
		<fo:layout-master-set>
			<!--正文页面规格-->
			<fo:simple-page-master master-name="all" page-height="11.5in" page-width="8.5in" margin-top="0.5in" margin-bottom="1in" margin-left="0.75in" margin-right="0.75in">
				<fo:region-body margin-top="1in" margin-bottom="0.75in"/>
				<fo:region-before extent="0.75in"/>
				<fo:region-after extent="0.5in"/>
			</fo:simple-page-master>
			<!--报告说明页面规格-->
			<fo:simple-page-master master-name="note" page-height="11.5in" page-width="8.5in" margin-top="0.5in" margin-bottom="1in" margin-left="0.75in" margin-right="0.75in">
				<fo:region-body margin-top="1in" margin-bottom="0.75in"/>
				<fo:region-before extent="0.75in"/>
				<fo:region-after extent="0.5in"/>
			</fo:simple-page-master>
		</fo:layout-master-set>
		
		<fo:page-sequence master-reference="all" format="1">
			<!--页码展示-->
			<fo:static-content flow-name="xsl-region-after">
				<fo:block text-align="center" font-size="10pt" font-family="serif" line-height="10pt">
					<fo:page-number/>
				</fo:block>
			</fo:static-content>
			
			<fo:flow flow-name="xsl-region-body">
				<fo:block font-size="25pt" font-family="KaiTi" color="black" text-align="center">
					个人信用报告
				</fo:block>
				<fo:block font-size="15pt" font-family="KaiTi" space-after="15pt" color="black" text-align="center">
					(授信机构版)
				</fo:block>

<!-- 报告头信息 -->
				<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
					<fo:table-column column-width="proportional-column-width(1)"/>
					<fo:table-column column-width="proportional-column-width(1)"/>
					<fo:table-column column-width="proportional-column-width(1)"/>
					<fo:table-column column-width="proportional-column-width(1)"/>
					<fo:table-column column-width="proportional-column-width(1)"/>
				<fo:table-body>
					<fo:table-row >	
						<fo:table-cell number-columns-spanned="3">
							<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
								&#160;报告编号： <xsl:value-of select="PRH/PA01/PA01A/PA01AI01" />
							</fo:block>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="2">
							<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
								报告时间： <xsl:value-of select="PRH/PA01/PA01A/PA01AR01" />&#160;
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row >
						<fo:table-cell background-color="#A7E3F1" xsl:use-attribute-sets="myBorder">
							<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
								被查询者姓名
							</fo:block>
						</fo:table-cell>
						<fo:table-cell background-color="#A7E3F1" xsl:use-attribute-sets="myBorder">
							<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
								被查询者证件类型
							</fo:block>
						</fo:table-cell>	
						<fo:table-cell background-color="#A7E3F1" xsl:use-attribute-sets="myBorder">
							<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
								被查询者证件号码
							</fo:block>
						</fo:table-cell>
						<fo:table-cell background-color="#A7E3F1" xsl:use-attribute-sets="myBorder">
							<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
								查询机构
							</fo:block>
						</fo:table-cell>
						<fo:table-cell background-color="#A7E3F1" xsl:use-attribute-sets="myBorder">
							<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
								查询原因
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row >
						<fo:table-cell xsl:use-attribute-sets="myBorder">
							<fo:block text-align="center" space-before.optimum="3" font-size="8.5pt" font-family="Simsun">
								<xsl:value-of select="PRH/PA01/PA01B/PA01BQ01"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="myBorder">
							<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
								<xsl:value-of select="PRH/PA01/PA01B/PA01BD01" />
							</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="myBorder">
							<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
								<xsl:value-of select="PRH/PA01/PA01B/PA01BI01" />
							</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="myBorder">
							<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
								<xsl:value-of select="PRH/PA01/PA01B/PA01BI02"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="myBorder">
							<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
								<xsl:value-of select="PRH/PA01/PA01B/PA01BD02"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
				</fo:table>
				<!-- 其他证件信息 -->
				<xsl:if test="PRH/PA01/PA01C != ''">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">	
							<fo:table-cell number-columns-spanned="2">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									其他证件信息
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									证件类型
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									证件号码
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<xsl:for-each select="PRH/PA01/PA01C/PA01CH">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PA01CD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PA01CI01" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
					</fo:table>
				</xsl:if>
				<!-- 防欺诈警示 -->
				<xsl:if test="PRH/PA01/PA01D = '1'">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">	
							<fo:table-cell number-columns-spanned="2" background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									防欺诈警示
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">	
							<fo:table-cell number-columns-spanned="2">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									信息主体申请设置防欺诈警示，联系电话： <xsl:value-of select="PRH/PA01/PA01D/PA01DQ02"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									生效日期
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									截止日期
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PRH/PA01/PA01D/PA01DR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PRH/PA01/PA01D/PA01DR02" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
				</xsl:if>
				<!-- 异议信息提示 -->
				<xsl:if test="PRH/PA01/PA01E != '0'">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">	
							<fo:table-cell number-columns-spanned="2" background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									异议信息提示
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">	
							<fo:table-cell number-columns-spanned="2">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									信息主体对信用报告内容提出了 <xsl:value-of select="PRH/PA01/PA01E/PA01ES01"/> 笔异议且正在处理中，请浏览时注意阅读相关内容。
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						</fo:table-body>
					</fo:table>
				</xsl:if>
				
<!-- 一 个人基本信息 -->				
				<fo:block space-before="15pt" space-after="5pt" text-align="center" font-size="14pt" font-family="KaiTi">
					一 个人基本信息
				</fo:block>
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
					（一）身份信息
				</fo:block>
				<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">	
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									性别
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									出生日期
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									婚姻状况
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									学历
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									学位
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									就业状况
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									国籍
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									电子邮箱
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PIM/PB01/PB01A/PB01AD01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PIM/PB01/PB01A/PB01AR01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PMM/PB02/PB020D01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PIM/PB01/PB01A/PB01AD02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PIM/PB01/PB01A/PB01AD03"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PIM/PB01/PB01A/PB01AD04"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PIM/PB01/PB01A/PB01AD05"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PIM/PB01/PB01A/PB01AQ01"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">	
							<fo:table-cell number-columns-spanned="5" background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									通讯地址
								</fo:block>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="3" background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									户籍地址
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">	
							<fo:table-cell number-columns-spanned="5">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PIM/PB01/PB01A/PB01AQ02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="3">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PIM/PB01/PB01A/PB01AQ03"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">	
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									编号
								</fo:block>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="4" background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									手机号码
								</fo:block>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="3" background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									信息更新日期
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<xsl:for-each select="PIM/PB01/PB01B/PB01BH">
						<fo:table-row xsl:use-attribute-sets="myBorder">	
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:number value="position()"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="4" >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PB01BQ01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="3" >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PB01BR01"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
				</fo:table>
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					（二）配偶信息
				</fo:block>
				<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									姓名
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									证件类型
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									证件号码
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									工作单位
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									联系电话
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PMM/PB02/PB020Q01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PMM/PB02/PB020D02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PMM/PB02/PB020I01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PMM/PB02/PB020Q02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PMM/PB02/PB020Q03"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					（三）居住信息
				</fo:block>
				<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									编号
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									居住地址
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									住宅电话
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									居住状况
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									信息更新日期
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<xsl:for-each select="PRM/PB03">
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:number value="position()"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PB030D01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PB030Q01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PB030Q02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PB030R01"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
				</fo:table>
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					（四）职业信息
				</fo:block>
				<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									编号
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									工作单位
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									单位性质
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									单位地址
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									单位电话
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<xsl:for-each select="POM/PB04">
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:number value="position()"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PB040Q01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PB040D02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="3">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PB040Q02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PB040Q03"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						</xsl:for-each>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									编号
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									职业
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									行业
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									职务
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									职称
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									进入本单位年份
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									信息更新日期
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<xsl:for-each select="POM/PB04">
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:number value="position()"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PB040D04"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PB040D03"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PB040D05"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PB040D06"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PB040R01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PB040R02"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
				</fo:table>
<!-- 二 信息概要 -->
				<fo:block space-before="15pt" space-after="5pt" text-align="center" font-size="14pt" font-family="KaiTi">
					二 信息概要
				</fo:block>
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
					（一）个人信用报告“数字解读”
				</fo:block>
				<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									数字解读
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									相对位置
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									说明
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
									<xsl:value-of select="PSM/PC01/PC010Q01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PSM/PC01/PC010Q02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PSM/PC01/PC010D01"/>
								</fo:block>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PSM/PC01/PC010D01[2]"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					（二）信贷交易信息提示
				</fo:block>
				<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									业务类型
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									账户数
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									首笔业务发放月份
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<xsl:for-each select="PCO/PC02/PC02A/PC02AH">
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
									<xsl:value-of select="PC02AD02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PC02AD01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PC02AS03"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PC02AR01"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						</xsl:for-each>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell number-columns-spanned="2">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									合计
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PCO/PC02/PC02A/PC02AS01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									--
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					（三）信贷交易违约信息概要
				</fo:block>
				<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell number-columns-spanned="3">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									被追偿信息汇总
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									业务类型
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									账户数
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									余额
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<xsl:for-each select="PCO/PC02/PC02B/PC02BH">
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
									<xsl:value-of select="PC02BD01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PC02BS03"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PC02BJ02"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						</xsl:for-each>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									合计
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PCO/PC02/PC02B/PC02BS01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PCO/PC02/PC02B/PC02BJ01"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell number-columns-spanned="2">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									呆账信息汇总
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									账户数
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									余额
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
									<xsl:value-of select="PCO/PC02/PC02C/PC02CS01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PCO/PC02/PC02C/PC02CJ01"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell number-columns-spanned="5">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									逾期（透支）信息汇总
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									账户类型
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									账户数
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									月份数
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									单月最高逾期/透支总额
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									最长逾期/透支月数
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<xsl:for-each select="PCO/PC02/PC02D/PC02DH">
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
									<xsl:value-of select="PC02DD01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PC02DS02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
									<xsl:value-of select="PC02DS03"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PC02DJ01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
									<xsl:value-of select="PC02DS04"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						</xsl:for-each>						
					</fo:table-body>
				</fo:table>
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					（四）信贷交易授信及负债信息概要
				</fo:block>
				<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell number-columns-spanned="5">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									非循环贷账户信息汇总
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									管理机构数
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									账户数
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									授信总额
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									余额
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									最近 6 个月平均应还款
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
									<xsl:value-of select="PCO/PC02/PC02E/PC02ES01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PCO/PC02/PC02E/PC02ES02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PCO/PC02/PC02E/PC02EJ01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PCO/PC02/PC02E/PC02EJ02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PCO/PC02/PC02E/PC02EJ03"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell number-columns-spanned="5">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									循环额度下分账户信息汇总
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									管理机构数
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									账户数
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									授信总额
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									余额
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									最近 6 个月平均应还款
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
									<xsl:value-of select="PCO/PC02/PC02F/PC02FS01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PCO/PC02/PC02F/PC02FS02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PCO/PC02/PC02F/PC02FJ01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PCO/PC02/PC02F/PC02FJ02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PCO/PC02/PC02F/PC02FJ03"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell number-columns-spanned="5">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									循环贷账户信息汇总
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									管理机构数
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									账户数
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									授信总额
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									余额
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									最近 6 个月平均应还款
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
									<xsl:value-of select="PCO/PC02/PC02G/PC02GS01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PCO/PC02/PC02G/PC02GS02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PCO/PC02/PC02G/PC02GJ01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PCO/PC02/PC02G/PC02GJ02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PCO/PC02/PC02G/PC02GJ03"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell number-columns-spanned="7">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									贷记卡账户信息汇总
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									发卡机构数
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									账户数
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									授信总额
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									单家机构最高授信额
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									单家机构最低授信额
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									已用额度
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									最近 6 个月平均使用额度
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
									<xsl:value-of select="PCO/PC02/PC02H/PC02HS01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PCO/PC02/PC02H/PC02HS02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PCO/PC02/PC02H/PC02HJ01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PCO/PC02/PC02H/PC02HJ02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PCO/PC02/PC02H/PC02HJ03"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PCO/PC02/PC02H/PC02HJ04"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PCO/PC02/PC02H/PC02HJ05"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell number-columns-spanned="7">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									准贷记卡账户信息汇总
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									发卡机构数
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									账户数
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									授信总额
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									单家机构最高授信额
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									单家机构最低授信额
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									透支余额
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									最近 6 个月平均透支余额
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
									<xsl:value-of select="PCO/PC02/PC02I/PC02IS01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PCO/PC02/PC02I/PC02IS02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PCO/PC02/PC02I/PC02IJ01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PCO/PC02/PC02I/PC02IJ02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PCO/PC02/PC02I/PC02IJ03"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PCO/PC02/PC02I/PC02IJ04"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PCO/PC02/PC02I/PC02IJ05"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell number-columns-spanned="7" >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									相关还款责任信息汇总
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1" number-rows-spanned="3" display-align="center" >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									为个人
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									担保责任
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									其他相关还款责任
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									账户数
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									担保金额
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									余额
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									账户数
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									还款责任金额
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									余额
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<xsl:for-each select="PCO/PC02/PC02K/PC02KH">
							<xsl:if test="PC02KD01=1 and PC02KD02=1">
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PC02KS02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PC02KJ01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PC02KJ02"/>
								</fo:block>
							</fo:table-cell>
							</xsl:if>
							<xsl:if test="PC02KD01=1 and PC02KD02=9">
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PC02KS02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PC02KJ01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PC02KJ02"/>
								</fo:block>
							</fo:table-cell>
							</xsl:if>
							</xsl:for-each>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1" number-rows-spanned="3" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									为企业
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									担保责任
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									其他相关还款责任
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									账户数
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									担保金额
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									余额
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									账户数
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									还款责任金额
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									余额
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<xsl:for-each select="PCO/PC02/PC02K/PC02KH">
							<xsl:if test="PC02KD01=2 and PC02KD02=1">
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PC02KS02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PC02KJ01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PC02KJ02"/>
								</fo:block>
							</fo:table-cell>
							</xsl:if>
							<xsl:if test="PC02KD01=2 and PC02KD02=9">
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PC02KS02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PC02KJ01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PC02KJ02"/>
								</fo:block>
							</fo:table-cell>
							</xsl:if>
							</xsl:for-each>
						</fo:table-row>	
					</fo:table-body>
				</fo:table>
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					（五）非信贷交易信息概要
				</fo:block>
				<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell number-columns-spanned="3">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									后付费业务欠费信息汇总
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									业务类型
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									账户数
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									欠费金额
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<xsl:for-each select="PNO/PC03/PC030H">
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
									<xsl:value-of select="PC030D01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PC030S02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PC030J01"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
				</fo:table>
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					（六）公共信息概要
				</fo:block>
				<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell number-columns-spanned="3">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									公共信息汇总
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									信息类型
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									记录数
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									涉及金额
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<xsl:for-each select="PPO/PC04/PC040H">
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
									<xsl:value-of select="PC040D01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PC040S02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PC040J01"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
				</fo:table>
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					（七）查询记录概要
				</fo:block>
				<xsl:if test="PQO/PC05/PC05A != ''">
				<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									上一次查询记录
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
									<xsl:value-of select="PQO/PC05/PC05A/PC05AR01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PQO/PC05/PC05A/PC05AI01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PQO/PC05/PC05A/PC05AQ01"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				</xsl:if>
				<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell number-columns-spanned="2">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									最近 1 个月内的查询机构数
								</fo:block>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="3">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									最近 1 个月内的查询次数
								</fo:block>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="3">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									最近 2 年内的查询次数
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									贷款审批
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									信用卡审批
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									贷款审批
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									信用卡审批
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									本人查询
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									贷后管理
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									担保资格审查
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									特约商户&#10;实名审查
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
									<xsl:value-of select="PQO/PC05/PC05B/PC05BS01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PQO/PC05/PC05B/PC05BS02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PQO/PC05/PC05B/PC05BS03"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
									<xsl:value-of select="PQO/PC05/PC05B/PC05BS04"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PQO/PC05/PC05B/PC05BS05"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PQO/PC05/PC05B/PC05BS06"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
									<xsl:value-of select="PQO/PC05/PC05B/PC05BS07"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PQO/PC05/PC05B/PC05BS08"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
<!-- 三 信贷交易信息明细 -->
				<fo:block space-before="15pt" space-after="5pt" text-align="center" font-size="14pt" font-family="KaiTi">
					三 信贷交易信息明细
				</fo:block>
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
					（一）被追偿信息
				</fo:block>
				<xsl:for-each select="PDA/PD01[PD01A/PD01AD01 = 'C1']">
					<fo:block text-align="left" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						账户<xsl:value-of select="position()"/>
					</fo:block>
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										管理机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										业务种类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										债权接收日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										债权金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										债权转移时的还款状态
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01A/PD01AI02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AD03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01A/PD01AJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AD10"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										截至&#160;<xsl:value-of select="PD01B/PD01BR03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:if test="PD01B/PD01BD01 = 1">
							<!-- 催收 -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户状态
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次还款日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01B/PD01BJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01B/PD01BR02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:if>
							<xsl:if test="PD01B/PD01BD01 = 2">
							<!-- 关闭 -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户状态
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户关闭日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01B/PD01BR02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:if>
							<xsl:if test="PD01F/PD01FH != ''">
							<!-- 特殊交易信息 -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										特殊交易类型
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										发生日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										变更月数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										发生金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										明细记录
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="PD01F/PD01FH">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell>
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="PD01FD01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01FR01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01FS02"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01FJ01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01FQ01"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
							</xsl:if>
						</fo:table-body>
					</fo:table>
					<xsl:if test="PD01Z != ''">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="80%" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="20%" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<xsl:for-each select="PD01Z/PD01ZH">
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									&#160;<xsl:value-of select="PD01ZD01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									添加日期
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
									<xsl:value-of select="PD01ZQ01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PD01ZR01"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
					</fo:table>
					</xsl:if>
				</xsl:for-each>
				<!-- （二）非循环贷账户 -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					（二）非循环贷账户
				</fo:block>
				<xsl:for-each select="PDA/PD01[PD01A/PD01AD01 = 'D1']">
					<fo:block text-align="left" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						账户<xsl:value-of select="position()"/><xsl:if test="PD01A/PD01AI04 != ''">（授信协议标识：<xsl:value-of select="PD01A/PD01AI04"/>）</xsl:if>
					</fo:block>
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										管理机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户标识
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										开立日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										借款金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户币种
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01A/PD01AI02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AI03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01A/PD01AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AD04"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										业务种类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										担保方式
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款期数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款频率
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款方式
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										共同借款标志
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01A/PD01AD03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AD07"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AS01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01A/PD01AD06"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AD05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AD09"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="24">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										截至&#160;<xsl:value-of select="PD01B/PD01BR03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						<xsl:choose>
							<xsl:when test="PD01B/PD01BD01 = 4">
							<!-- 呆账 -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户状态
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次还款日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="8" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01B/PD01BJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="8" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01B/PD01BR02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:when>
							<xsl:when test="PD01B/PD01BD01 = 3 or PD01B/PD01BD01 = 5">
							<!-- 结清、转出 -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="12">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户状态
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="12">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户关闭日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="12">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="12" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01B/PD01BR02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:when>
							<xsl:when test="PD01B/PD01BD01 != 3 and PD01B/PD01BD01 != 4 and PD01B/PD01BD01 != 5">
							<!-- 持续更新 -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户状态
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										剩余还款期数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										本月应还款
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										应还款日
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										本月实还款
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次还款日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01C/PD01CD02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01C/PD01CS01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01C/PD01CR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01C/PD01CR03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										当前逾期期数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										当前逾期总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期 31-60 天未还本金
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期 61-90 天未还本金
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期 91-180 天未还本金
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期 180 天以上未还本金
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CS02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ06"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ07"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ08"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ09"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ10"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="24">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最新还款记录
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										当前还款状态
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BD03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BJ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BD04"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:when>
						</xsl:choose>
						</fo:table-body>
					</fo:table>
					<xsl:if test="PD01D != ''">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-body>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell number-columns-spanned="13">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01D/PD01DR01"/> - <xsl:value-of select="PD01D/PD01DR02"/> 还款状态
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell>
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											&#160;
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											1
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											2
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											3
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											4
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											5
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											6
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											7
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											8
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											9
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											10
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											11
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											12
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01D/PD01DR02,1,4)"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01D/PD01DH">
										<xsl:sort select="substring(PD01DR03,6,2)"/>
										<xsl:if test="substring(../PD01DR02,1,4) = substring(PD01DR03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01DR03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01DD01"/>												
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01D/PD01DH">
										<xsl:sort select="substring(PD01DR03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01DR02,1,4) = substring(PD01DR03,1,4) and user:islast(substring(PD01DR03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01DR03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<xsl:if test="substring(PD01D/PD01DR02,1,4) - substring(PD01D/PD01DR01,1,4) &gt;= 1">
									<fo:table-row xsl:use-attribute-sets="myBorder">
										<fo:table-cell background-color="#A7E3F1">
											<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
												<xsl:value-of select="substring(PD01D/PD01DR02,1,4)-1"/>
											</fo:block>
										</fo:table-cell>
										<xsl:value-of select="user:init()"/>
										<xsl:for-each select="PD01D/PD01DH">
											<xsl:sort select="substring(PD01DR03,6,2)"/>
											<xsl:if test="substring(../PD01DR02,1,4)-1 = substring(PD01DR03,1,4)">
												<xsl:call-template name="emptd">
													<xsl:with-param name="cnt" select="user:addm(substring(PD01DR03,6,2))"/>
												</xsl:call-template>
												<fo:table-cell >
													<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
														<xsl:value-of select="PD01DD01"/>
													</fo:block>
												</fo:table-cell>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="PD01D/PD01DH">
											<xsl:sort select="substring(PD01DR03,6,2)" order="descending"/>
											<xsl:if test="substring(../PD01DR02,1,4)-1 = substring(PD01DR03,1,4) and user:islast(substring(PD01DR03,6,2))">
												<xsl:call-template name="emptd">
													<xsl:with-param name="cnt" select="13 - substring(PD01DR03,6,2)"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="user:isnull()">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13"/>
											</xsl:call-template>
										</xsl:if>
									</fo:table-row>
								</xsl:if>
								<xsl:if test="substring(PD01D/PD01DR02,1,4) - substring(PD01D/PD01DR01,1,4) &gt;= 2">
									<fo:table-row xsl:use-attribute-sets="myBorder">
										<fo:table-cell background-color="#A7E3F1">
											<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
												<xsl:value-of select="substring(PD01D/PD01DR02,1,4)-2"/>
											</fo:block>
										</fo:table-cell>
										<xsl:value-of select="user:init()"/>
										<xsl:for-each select="PD01D/PD01DH">
											<xsl:sort select="substring(PD01DR03,6,2)"/>
											<xsl:if test="substring(../PD01DR02,1,4)-2 = substring(PD01DR03,1,4)">
												<xsl:call-template name="emptd">
													<xsl:with-param name="cnt" select="user:addm(substring(PD01DR03,6,2))"/>
												</xsl:call-template>
												<fo:table-cell >
													<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
														<xsl:value-of select="PD01DD01"/>
													</fo:block>
												</fo:table-cell>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="PD01D/PD01DH">
											<xsl:sort select="substring(PD01DR03,6,2)" order="descending"/>
											<xsl:if test="substring(../PD01DR02,1,4)-2 = substring(PD01DR03,1,4) and user:islast(substring(PD01DR03,6,2))">
												<xsl:call-template name="emptd">
													<xsl:with-param name="cnt" select="13 - substring(PD01DR03,6,2)"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="user:isnull()">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13"/>
											</xsl:call-template>
										</xsl:if>
									</fo:table-row>
								</xsl:if>
							</fo:table-body>
						</fo:table>
					</xsl:if>
					<xsl:if test="PD01E != ''">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-body>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell number-columns-spanned="13">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01E/PD01ER01"/> - <xsl:value-of select="PD01E/PD01ER02"/> 还款记录
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell>
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											&#160;
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											1
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											2
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											3
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											4
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											5
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											6
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											7
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											8
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											9
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											10
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											11
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											12
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4) = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>												
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4) = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4) = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>												
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4) = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<xsl:if test="substring(PD01E/PD01ER02,1,4) - substring(PD01E/PD01ER01,1,4) &gt;= 1">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)-1"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-1 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-1 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-1 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-1 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								</xsl:if>
								<xsl:if test="substring(PD01E/PD01ER02,1,4) - substring(PD01E/PD01ER01,1,4) &gt;= 2">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)-2"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-2 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-2 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-2 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-2 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								</xsl:if>
								<xsl:if test="substring(PD01E/PD01ER02,1,4) - substring(PD01E/PD01ER01,1,4) &gt;= 3">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)-3"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-3 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-3 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-3 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-3 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								</xsl:if>
								<xsl:if test="substring(PD01E/PD01ER02,1,4) - substring(PD01E/PD01ER01,1,4) &gt;= 4">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)-4"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-4 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-4 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-4 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-4 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								</xsl:if>
								<xsl:if test="substring(PD01E/PD01ER02,1,4) - substring(PD01E/PD01ER01,1,4) &gt;= 5">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)-5"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-5 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-5 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-5 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-5 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								</xsl:if>
							</fo:table-body>
						</fo:table>
					</xsl:if>
					<xsl:if test="PD01F != ''">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-body>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											特殊交易类型
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											发生日期
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											变更月数
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											发生金额
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											明细记录
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<xsl:for-each select="PD01F/PD01FH">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01FD01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01FR01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01FS02"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01FJ01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01FQ01"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								</xsl:for-each>
							</fo:table-body>
						</fo:table>		
					</xsl:if>
					<xsl:if test="PD01Z != ''">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="80%" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="20%" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<xsl:for-each select="PD01Z/PD01ZH">
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1" >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									&#160;<xsl:value-of select="PD01ZD01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									添加日期
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
									<xsl:value-of select="PD01ZQ01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PD01ZR01"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
					</fo:table>
					</xsl:if>
				</xsl:for-each>
				<!-- （三）循环额度下分账户 -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					（三）循环额度下分账户
				</fo:block>
				<xsl:for-each select="PDA/PD01[PD01A/PD01AD01 = 'R4']">
					<fo:block text-align="left" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						账户<xsl:value-of select="position()"/><xsl:if test="PD01A/PD01AI04 != ''">（授信协议标识：<xsl:value-of select="PD01A/PD01AI04"/>）</xsl:if>
					</fo:block>
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										管理机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户标识
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										开立日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										借款金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户币种
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01A/PD01AI02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AI03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01A/PD01AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AD04"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										业务种类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										担保方式
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款期数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款频率
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款方式
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										共同借款标志
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01A/PD01AD03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AD07"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AS01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01A/PD01AD06"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AD05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AD09"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="24">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										截至&#160;<xsl:value-of select="PD01B/PD01BR03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						<xsl:choose>
							<xsl:when test="PD01B/PD01BD01 = 4">
							<!-- 呆账 -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户状态
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次还款日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="8" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01B/PD01BJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="8" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01B/PD01BR02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:when>
							<xsl:when test="PD01B/PD01BD01 = 3">
							<!-- 结清 -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="12">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户状态
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="12">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户关闭日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="12">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="12" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01B/PD01BR02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:when>
							<xsl:when test="PD01B/PD01BD01 != 3 and PD01B/PD01BD01 != 4">
							<!-- 持续更新 -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户状态
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										剩余还款期数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										本月应还款
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										应还款日
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										本月实还款
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次还款日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01C/PD01CD02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01C/PD01CS01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01C/PD01CR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01C/PD01CR03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										当前逾期期数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										当前逾期总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期 31-60 天未还本金
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期 61-90 天未还本金
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期 91-180 天未还本金
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期 180 天以上未还本金
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CS02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ06"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ07"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ08"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ09"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ10"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="24">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最新还款记录
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										当前还款状态
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BD03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BJ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BD04"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:when>
						</xsl:choose>
						</fo:table-body>
					</fo:table>
					<xsl:if test="PD01D != ''">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-body>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell number-columns-spanned="13">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01D/PD01DR01"/> - <xsl:value-of select="PD01D/PD01DR02"/> 还款状态
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell>
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											&#160;
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											1
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											2
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											3
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											4
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											5
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											6
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											7
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											8
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											9
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											10
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											11
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											12
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01D/PD01DR02,1,4)"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01D/PD01DH">
										<xsl:sort select="substring(PD01DR03,6,2)"/>
										<xsl:if test="substring(../PD01DR02,1,4) = substring(PD01DR03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01DR03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01DD01"/>												
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01D/PD01DH">
										<xsl:sort select="substring(PD01DR03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01DR02,1,4) = substring(PD01DR03,1,4) and user:islast(substring(PD01DR03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01DR03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<xsl:if test="substring(PD01D/PD01DR02,1,4) - substring(PD01D/PD01DR01,1,4) &gt;= 1">
									<fo:table-row xsl:use-attribute-sets="myBorder">
										<fo:table-cell background-color="#A7E3F1">
											<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
												<xsl:value-of select="substring(PD01D/PD01DR02,1,4)-1"/>
											</fo:block>
										</fo:table-cell>
										<xsl:value-of select="user:init()"/>
										<xsl:for-each select="PD01D/PD01DH">
											<xsl:sort select="substring(PD01DR03,6,2)"/>
											<xsl:if test="substring(../PD01DR02,1,4)-1 = substring(PD01DR03,1,4)">
												<xsl:call-template name="emptd">
													<xsl:with-param name="cnt" select="user:addm(substring(PD01DR03,6,2))"/>
												</xsl:call-template>
												<fo:table-cell >
													<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
														<xsl:value-of select="PD01DD01"/>
													</fo:block>
												</fo:table-cell>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="PD01D/PD01DH">
											<xsl:sort select="substring(PD01DR03,6,2)" order="descending"/>
											<xsl:if test="substring(../PD01DR02,1,4)-1 = substring(PD01DR03,1,4) and user:islast(substring(PD01DR03,6,2))">
												<xsl:call-template name="emptd">
													<xsl:with-param name="cnt" select="13 - substring(PD01DR03,6,2)"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="user:isnull()">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13"/>
											</xsl:call-template>
										</xsl:if>
									</fo:table-row>
								</xsl:if>
								<xsl:if test="substring(PD01D/PD01DR02,1,4) - substring(PD01D/PD01DR01,1,4) &gt;= 2">
									<fo:table-row xsl:use-attribute-sets="myBorder">
										<fo:table-cell background-color="#A7E3F1">
											<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
												<xsl:value-of select="substring(PD01D/PD01DR02,1,4)-2"/>
											</fo:block>
										</fo:table-cell>
										<xsl:value-of select="user:init()"/>
										<xsl:for-each select="PD01D/PD01DH">
											<xsl:sort select="substring(PD01DR03,6,2)"/>
											<xsl:if test="substring(../PD01DR02,1,4)-2 = substring(PD01DR03,1,4)">
												<xsl:call-template name="emptd">
													<xsl:with-param name="cnt" select="user:addm(substring(PD01DR03,6,2))"/>
												</xsl:call-template>
												<fo:table-cell >
													<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
														<xsl:value-of select="PD01DD01"/>
													</fo:block>
												</fo:table-cell>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="PD01D/PD01DH">
											<xsl:sort select="substring(PD01DR03,6,2)" order="descending"/>
											<xsl:if test="substring(../PD01DR02,1,4)-2 = substring(PD01DR03,1,4) and user:islast(substring(PD01DR03,6,2))">
												<xsl:call-template name="emptd">
													<xsl:with-param name="cnt" select="13 - substring(PD01DR03,6,2)"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="user:isnull()">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13"/>
											</xsl:call-template>
										</xsl:if>
									</fo:table-row>
								</xsl:if>
							</fo:table-body>
						</fo:table>
					</xsl:if>
					<xsl:if test="PD01E != ''">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-body>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell number-columns-spanned="13">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01E/PD01ER01"/> - <xsl:value-of select="PD01E/PD01ER02"/> 还款记录
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell>
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											&#160;
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											1
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											2
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											3
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											4
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											5
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											6
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											7
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											8
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											9
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											10
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											11
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											12
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4) = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>												
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4) = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4) = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>												
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4) = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<xsl:if test="substring(PD01E/PD01ER02,1,4) - substring(PD01E/PD01ER01,1,4) &gt;= 1">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)-1"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-1 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-1 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-1 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-1 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								</xsl:if>
								<xsl:if test="substring(PD01E/PD01ER02,1,4) - substring(PD01E/PD01ER01,1,4) &gt;= 2">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)-2"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-2 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-2 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-2 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-2 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								</xsl:if>
								<xsl:if test="substring(PD01E/PD01ER02,1,4) - substring(PD01E/PD01ER01,1,4) &gt;= 3">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)-3"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-3 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-3 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-3 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-3 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								</xsl:if>
								<xsl:if test="substring(PD01E/PD01ER02,1,4) - substring(PD01E/PD01ER01,1,4) &gt;= 4">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)-4"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-4 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-4 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-4 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-4 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								</xsl:if>
								<xsl:if test="substring(PD01E/PD01ER02,1,4) - substring(PD01E/PD01ER01,1,4) &gt;= 5">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)-5"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-5 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-5 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-5 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-5 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								</xsl:if>
							</fo:table-body>
						</fo:table>
					</xsl:if>
					<xsl:if test="PD01F != ''">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-body>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											特殊交易类型
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											发生日期
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											变更月数
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											发生金额
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											明细记录
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<xsl:for-each select="PD01F/PD01FH">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01FD01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01FR01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01FS02"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01FJ01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01FQ01"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								</xsl:for-each>
							</fo:table-body>
						</fo:table>		
					</xsl:if>
					<xsl:if test="PD01Z != ''">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="80%" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="20%" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<xsl:for-each select="PD01Z/PD01ZH">
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									&#160;<xsl:value-of select="PD01ZD01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									添加日期
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
									<xsl:value-of select="PD01ZQ01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PD01ZR01"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
					</fo:table>
					</xsl:if>
				</xsl:for-each>
				<!-- （四）循环贷账户 -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					（四）循环贷账户
				</fo:block>
				<xsl:for-each select="PDA/PD01[PD01A/PD01AD01 = 'R1']">
					<fo:block text-align="left" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						账户<xsl:value-of select="position()"/><xsl:if test="PD01A/PD01AI04 != ''">（授信协议标识：<xsl:value-of select="PD01A/PD01AI04"/>）</xsl:if>
					</fo:block>
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										管理机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户标识
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										开立日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										借款金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户币种
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01A/PD01AI02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AI03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01A/PD01AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AD04"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										业务种类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										担保方式
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款期数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款频率
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款方式
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										共同借款标志
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01A/PD01AD03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AD07"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AS01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01A/PD01AD06"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AD05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AD09"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="24">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										截至&#160;<xsl:value-of select="PD01B/PD01BR03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						<xsl:choose>
							<xsl:when test="PD01B/PD01BD01 = 4">
							<!-- 呆账 -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户状态
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次还款日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="8" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01B/PD01BJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="8" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01B/PD01BR02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:when>
							<xsl:when test="PD01B/PD01BD01 = 3">
							<!-- 结清 -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="12">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户状态
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="12">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户关闭日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="12">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="12" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01B/PD01BR02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:when>
							<xsl:when test="PD01B/PD01BD01 != 3 and PD01B/PD01BD01 != 4">
							<!-- 持续更新 -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户状态
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										剩余还款期数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										本月应还款
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										应还款日
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										本月实还款
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次还款日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01C/PD01CD02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01C/PD01CS01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01C/PD01CR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01C/PD01CR03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										当前逾期期数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										当前逾期总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期 31-60 天未还本金
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期 61-90 天未还本金
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期 91-180 天未还本金
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期 180 天以上未还本金
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CS02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ06"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ07"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ08"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ09"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ10"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="24">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最新还款记录
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										当前还款状态
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BD03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BJ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BD04"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:when>
						</xsl:choose>
						</fo:table-body>
					</fo:table>
					<xsl:if test="PD01D != ''">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-body>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell number-columns-spanned="13">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01D/PD01DR01"/> - <xsl:value-of select="PD01D/PD01DR02"/> 还款状态
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell>
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											&#160;
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											1
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											2
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											3
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											4
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											5
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											6
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											7
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											8
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											9
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											10
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											11
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											12
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01D/PD01DR02,1,4)"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01D/PD01DH">
										<xsl:sort select="substring(PD01DR03,6,2)"/>
										<xsl:if test="substring(../PD01DR02,1,4) = substring(PD01DR03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01DR03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01DD01"/>												
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01D/PD01DH">
										<xsl:sort select="substring(PD01DR03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01DR02,1,4) = substring(PD01DR03,1,4) and user:islast(substring(PD01DR03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01DR03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<xsl:if test="substring(PD01D/PD01DR02,1,4) - substring(PD01D/PD01DR01,1,4) &gt;= 1">
									<fo:table-row xsl:use-attribute-sets="myBorder">
										<fo:table-cell background-color="#A7E3F1">
											<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
												<xsl:value-of select="substring(PD01D/PD01DR02,1,4)-1"/>
											</fo:block>
										</fo:table-cell>
										<xsl:value-of select="user:init()"/>
										<xsl:for-each select="PD01D/PD01DH">
											<xsl:sort select="substring(PD01DR03,6,2)"/>
											<xsl:if test="substring(../PD01DR02,1,4)-1 = substring(PD01DR03,1,4)">
												<xsl:call-template name="emptd">
													<xsl:with-param name="cnt" select="user:addm(substring(PD01DR03,6,2))"/>
												</xsl:call-template>
												<fo:table-cell >
													<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
														<xsl:value-of select="PD01DD01"/>
													</fo:block>
												</fo:table-cell>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="PD01D/PD01DH">
											<xsl:sort select="substring(PD01DR03,6,2)" order="descending"/>
											<xsl:if test="substring(../PD01DR02,1,4)-1 = substring(PD01DR03,1,4) and user:islast(substring(PD01DR03,6,2))">
												<xsl:call-template name="emptd">
													<xsl:with-param name="cnt" select="13 - substring(PD01DR03,6,2)"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="user:isnull()">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13"/>
											</xsl:call-template>
										</xsl:if>
									</fo:table-row>
								</xsl:if>
								<xsl:if test="substring(PD01D/PD01DR02,1,4) - substring(PD01D/PD01DR01,1,4) &gt;= 2">
									<fo:table-row xsl:use-attribute-sets="myBorder">
										<fo:table-cell background-color="#A7E3F1">
											<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
												<xsl:value-of select="substring(PD01D/PD01DR02,1,4)-2"/>
											</fo:block>
										</fo:table-cell>
										<xsl:value-of select="user:init()"/>
										<xsl:for-each select="PD01D/PD01DH">
											<xsl:sort select="substring(PD01DR03,6,2)"/>
											<xsl:if test="substring(../PD01DR02,1,4)-2 = substring(PD01DR03,1,4)">
												<xsl:call-template name="emptd">
													<xsl:with-param name="cnt" select="user:addm(substring(PD01DR03,6,2))"/>
												</xsl:call-template>
												<fo:table-cell >
													<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
														<xsl:value-of select="PD01DD01"/>
													</fo:block>
												</fo:table-cell>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="PD01D/PD01DH">
											<xsl:sort select="substring(PD01DR03,6,2)" order="descending"/>
											<xsl:if test="substring(../PD01DR02,1,4)-2 = substring(PD01DR03,1,4) and user:islast(substring(PD01DR03,6,2))">
												<xsl:call-template name="emptd">
													<xsl:with-param name="cnt" select="13 - substring(PD01DR03,6,2)"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="user:isnull()">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13"/>
											</xsl:call-template>
										</xsl:if>
									</fo:table-row>
								</xsl:if>
							</fo:table-body>
						</fo:table>
					</xsl:if>
					<xsl:if test="PD01E != ''">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-body>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell number-columns-spanned="13">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01E/PD01ER01"/> - <xsl:value-of select="PD01E/PD01ER02"/> 还款记录
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell>
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											&#160;
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											1
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											2
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											3
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											4
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											5
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											6
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											7
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											8
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											9
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											10
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											11
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											12
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4) = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>												
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4) = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4) = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>												
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4) = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<xsl:if test="substring(PD01E/PD01ER02,1,4) - substring(PD01E/PD01ER01,1,4) &gt;= 1">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)-1"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-1 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-1 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-1 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-1 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								</xsl:if>
								<xsl:if test="substring(PD01E/PD01ER02,1,4) - substring(PD01E/PD01ER01,1,4) &gt;= 2">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)-2"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-2 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-2 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-2 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-2 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								</xsl:if>
								<xsl:if test="substring(PD01E/PD01ER02,1,4) - substring(PD01E/PD01ER01,1,4) &gt;= 3">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)-3"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-3 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-3 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-3 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-3 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								</xsl:if>
								<xsl:if test="substring(PD01E/PD01ER02,1,4) - substring(PD01E/PD01ER01,1,4) &gt;= 4">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)-4"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-4 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-4 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-4 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-4 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								</xsl:if>
								<xsl:if test="substring(PD01E/PD01ER02,1,4) - substring(PD01E/PD01ER01,1,4) &gt;= 5">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)-5"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-5 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-5 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-5 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-5 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								</xsl:if>
							</fo:table-body>
						</fo:table>
					</xsl:if>
					<xsl:if test="PD01F != ''">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-body>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											特殊交易类型
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											发生日期
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											变更月数
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											发生金额
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											明细记录
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<xsl:for-each select="PD01F/PD01FH">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01FD01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01FR01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01FS02"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01FJ01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01FQ01"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								</xsl:for-each>
							</fo:table-body>
						</fo:table>		
					</xsl:if>
					<xsl:if test="PD01Z != ''">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="80%" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="20%" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<xsl:for-each select="PD01Z/PD01ZH">
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									&#160;<xsl:value-of select="PD01ZD01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									添加日期
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
									<xsl:value-of select="PD01ZQ01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PD01ZR01"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
					</fo:table>
					</xsl:if>
				</xsl:for-each>
				<!-- （五）贷记卡账户 -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					（五）贷记卡账户
				</fo:block>
				<xsl:for-each select="PDA/PD01[PD01A/PD01AD01 = 'R2']">
					<fo:block text-align="left" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						账户<xsl:value-of select="position()"/><xsl:if test="PD01A/PD01AI04 != ''">（授信协议标识：<xsl:value-of select="PD01A/PD01AI04"/>）</xsl:if>
					</fo:block>
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										管理机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户标识
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										开立日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										借款金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户币种
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01A/PD01AI02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AI03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01A/PD01AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AD04"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										业务种类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										担保方式
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款期数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款频率
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款方式
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										共同借款标志
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01A/PD01AD03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AD07"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AS01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01A/PD01AD06"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AD05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AD09"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="24">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										截至&#160;<xsl:value-of select="PD01B/PD01BR03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						<xsl:choose>
							<xsl:when test="PD01B/PD01BD01 = 5">
							<!-- 呆账 -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户状态
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次还款日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="8" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01B/PD01BJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="8" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01B/PD01BR02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:when>
							<xsl:when test="PD01B/PD01BD01 = 4">
							<!-- 销户 -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="12">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户状态
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="12">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户关闭日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="12">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="12" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01B/PD01BR02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:when>
							<xsl:when test="PD01B/PD01BD01 != 4 and PD01B/PD01BD01 != 5">
							<!-- 持续更新 -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户状态
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										剩余还款期数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										本月应还款
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										应还款日
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										本月实还款
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次还款日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01C/PD01CD02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01C/PD01CS01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01C/PD01CR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01C/PD01CR03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										当前逾期期数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										当前逾期总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期 31-60 天未还本金
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期 61-90 天未还本金
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期 91-180 天未还本金
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期 180 天以上未还本金
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CS02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ06"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ07"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ08"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ09"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ10"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="24">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最新还款记录
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										当前还款状态
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BD03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BJ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BD04"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:when>
						</xsl:choose>
						<xsl:if test="PD01H !=''">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="24">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										大额专项分期信息
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="6">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										大额专项分期额度
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="6">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										分期额度生效日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="6">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										分期额度到期日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="6">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										已用分期金额
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="PD01H/PD01HH">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="6">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01HJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="6">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01HR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="6">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01HR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="6">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01HJ02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</xsl:if>
						</fo:table-body>
					</fo:table>
					<xsl:if test="PD01D != ''">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-body>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell number-columns-spanned="13">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01D/PD01DR01"/> - <xsl:value-of select="PD01D/PD01DR02"/> 还款状态
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell>
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											&#160;
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											1
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											2
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											3
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											4
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											5
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											6
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											7
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											8
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											9
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											10
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											11
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											12
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01D/PD01DR02,1,4)"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01D/PD01DH">
										<xsl:sort select="substring(PD01DR03,6,2)"/>
										<xsl:if test="substring(../PD01DR02,1,4) = substring(PD01DR03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01DR03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01DD01"/>												
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01D/PD01DH">
										<xsl:sort select="substring(PD01DR03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01DR02,1,4) = substring(PD01DR03,1,4) and user:islast(substring(PD01DR03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01DR03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<xsl:if test="substring(PD01D/PD01DR02,1,4) - substring(PD01D/PD01DR01,1,4) &gt;= 1">
									<fo:table-row xsl:use-attribute-sets="myBorder">
										<fo:table-cell background-color="#A7E3F1">
											<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
												<xsl:value-of select="substring(PD01D/PD01DR02,1,4)-1"/>
											</fo:block>
										</fo:table-cell>
										<xsl:value-of select="user:init()"/>
										<xsl:for-each select="PD01D/PD01DH">
											<xsl:sort select="substring(PD01DR03,6,2)"/>
											<xsl:if test="substring(../PD01DR02,1,4)-1 = substring(PD01DR03,1,4)">
												<xsl:call-template name="emptd">
													<xsl:with-param name="cnt" select="user:addm(substring(PD01DR03,6,2))"/>
												</xsl:call-template>
												<fo:table-cell >
													<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
														<xsl:value-of select="PD01DD01"/>
													</fo:block>
												</fo:table-cell>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="PD01D/PD01DH">
											<xsl:sort select="substring(PD01DR03,6,2)" order="descending"/>
											<xsl:if test="substring(../PD01DR02,1,4)-1 = substring(PD01DR03,1,4) and user:islast(substring(PD01DR03,6,2))">
												<xsl:call-template name="emptd">
													<xsl:with-param name="cnt" select="13 - substring(PD01DR03,6,2)"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="user:isnull()">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13"/>
											</xsl:call-template>
										</xsl:if>
									</fo:table-row>
								</xsl:if>
								<xsl:if test="substring(PD01D/PD01DR02,1,4) - substring(PD01D/PD01DR01,1,4) &gt;= 2">
									<fo:table-row xsl:use-attribute-sets="myBorder">
										<fo:table-cell background-color="#A7E3F1">
											<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
												<xsl:value-of select="substring(PD01D/PD01DR02,1,4)-2"/>
											</fo:block>
										</fo:table-cell>
										<xsl:value-of select="user:init()"/>
										<xsl:for-each select="PD01D/PD01DH">
											<xsl:sort select="substring(PD01DR03,6,2)"/>
											<xsl:if test="substring(../PD01DR02,1,4)-2 = substring(PD01DR03,1,4)">
												<xsl:call-template name="emptd">
													<xsl:with-param name="cnt" select="user:addm(substring(PD01DR03,6,2))"/>
												</xsl:call-template>
												<fo:table-cell >
													<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
														<xsl:value-of select="PD01DD01"/>
													</fo:block>
												</fo:table-cell>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="PD01D/PD01DH">
											<xsl:sort select="substring(PD01DR03,6,2)" order="descending"/>
											<xsl:if test="substring(../PD01DR02,1,4)-2 = substring(PD01DR03,1,4) and user:islast(substring(PD01DR03,6,2))">
												<xsl:call-template name="emptd">
													<xsl:with-param name="cnt" select="13 - substring(PD01DR03,6,2)"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="user:isnull()">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13"/>
											</xsl:call-template>
										</xsl:if>
									</fo:table-row>
								</xsl:if>
							</fo:table-body>
						</fo:table>
					</xsl:if>
					<xsl:if test="PD01E != ''">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-body>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell number-columns-spanned="13">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01E/PD01ER01"/> - <xsl:value-of select="PD01E/PD01ER02"/> 还款记录
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell>
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											&#160;
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											1
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											2
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											3
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											4
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											5
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											6
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											7
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											8
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											9
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											10
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											11
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											12
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4) = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>												
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4) = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4) = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>												
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4) = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<xsl:if test="substring(PD01E/PD01ER02,1,4) - substring(PD01E/PD01ER01,1,4) &gt;= 1">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)-1"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-1 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-1 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-1 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-1 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								</xsl:if>
								<xsl:if test="substring(PD01E/PD01ER02,1,4) - substring(PD01E/PD01ER01,1,4) &gt;= 2">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)-2"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-2 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-2 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-2 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-2 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								</xsl:if>
								<xsl:if test="substring(PD01E/PD01ER02,1,4) - substring(PD01E/PD01ER01,1,4) &gt;= 3">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)-3"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-3 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-3 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-3 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-3 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								</xsl:if>
								<xsl:if test="substring(PD01E/PD01ER02,1,4) - substring(PD01E/PD01ER01,1,4) &gt;= 4">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)-4"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-4 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-4 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-4 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-4 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								</xsl:if>
								<xsl:if test="substring(PD01E/PD01ER02,1,4) - substring(PD01E/PD01ER01,1,4) &gt;= 5">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)-5"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-5 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-5 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-5 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-5 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								</xsl:if>
							</fo:table-body>
						</fo:table>
					</xsl:if>
					<xsl:if test="PD01F != ''">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-body>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											特殊交易类型
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											发生日期
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											变更月数
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											发生金额
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											明细记录
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<xsl:for-each select="PD01F/PD01FH">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01FD01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01FR01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01FS02"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01FJ01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01FQ01"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								</xsl:for-each>
							</fo:table-body>
						</fo:table>		
					</xsl:if>
					<xsl:if test="PD01G != ''">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1" >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									特殊事件说明
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<xsl:for-each select="PD01G/PD01GH">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01GD01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
					</fo:table>
					</xsl:if>
					<xsl:if test="PD01Z != ''">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="80%" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="20%" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<xsl:for-each select="PD01Z/PD01ZH">
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									&#160;<xsl:value-of select="PD01ZD01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									添加日期
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
									<xsl:value-of select="PD01ZQ01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PD01ZR01"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
					</fo:table>
					</xsl:if>
				</xsl:for-each>
				<!-- （六）准贷记卡账户 -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					（六）准贷记卡账户
				</fo:block>
				<xsl:for-each select="PDA/PD01[PD01A/PD01AD01 = 'R3']">
					<fo:block text-align="left" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						账户<xsl:value-of select="position()"/><xsl:if test="PD01A/PD01AI04 != ''">（授信协议标识：<xsl:value-of select="PD01A/PD01AI04"/>）</xsl:if>
					</fo:block>
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										管理机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户标识
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										开立日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										借款金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户币种
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01A/PD01AI02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AI03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01A/PD01AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AD04"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										业务种类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										担保方式
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款期数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款频率
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款方式
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										共同借款标志
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01A/PD01AD03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AD07"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AS01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01A/PD01AD06"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AD05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01A/PD01AD09"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="24">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										截至&#160;<xsl:value-of select="PD01B/PD01BR03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						<xsl:choose>
							<xsl:when test="PD01B/PD01BD01 = 5">
							<!-- 呆账 -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户状态
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次还款日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="8" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01B/PD01BJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="8" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01B/PD01BR02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:when>
							<xsl:when test="PD01B/PD01BD01 = 4">
							<!-- 销户 -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="12">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户状态
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="12">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户关闭日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="12">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="12" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01B/PD01BR02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:when>
							<xsl:when test="PD01B/PD01BD01 != 4 and PD01B/PD01BD01 != 5">
							<!-- 持续更新 -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户状态
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										剩余还款期数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										本月应还款
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										应还款日
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										本月实还款
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次还款日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										&#160;<xsl:value-of select="PD01C/PD01CD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01C/PD01CD02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01C/PD01CS01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01C/PD01CR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3" >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="PD01C/PD01CR03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										当前逾期期数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										当前逾期总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期 31-60 天未还本金
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期 61-90 天未还本金
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期 91-180 天未还本金
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期 180 天以上未还本金
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										&#160;<xsl:value-of select="PD01C/PD01CS02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ06"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ07"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ08"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ09"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01C/PD01CJ10"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="24">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最新还款记录
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										当前还款状态
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BD03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BJ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD01B/PD01BD04"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:when>
						</xsl:choose>
						</fo:table-body>
					</fo:table>
					<xsl:if test="PD01D != ''">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-body>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell number-columns-spanned="13">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01D/PD01DR01"/> - <xsl:value-of select="PD01D/PD01DR02"/> 还款状态
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell>
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											&#160;
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											1
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											2
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											3
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											4
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											5
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											6
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											7
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											8
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											9
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											10
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											11
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											12
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01D/PD01DR02,1,4)"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01D/PD01DH">
										<xsl:sort select="substring(PD01DR03,6,2)"/>
										<xsl:if test="substring(../PD01DR02,1,4) = substring(PD01DR03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01DR03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01DD01"/>												
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01D/PD01DH">
										<xsl:sort select="substring(PD01DR03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01DR02,1,4) = substring(PD01DR03,1,4) and user:islast(substring(PD01DR03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01DR03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<xsl:if test="substring(PD01D/PD01DR02,1,4) - substring(PD01D/PD01DR01,1,4) &gt;= 1">
									<fo:table-row xsl:use-attribute-sets="myBorder">
										<fo:table-cell background-color="#A7E3F1">
											<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
												<xsl:value-of select="substring(PD01D/PD01DR02,1,4)-1"/>
											</fo:block>
										</fo:table-cell>
										<xsl:value-of select="user:init()"/>
										<xsl:for-each select="PD01D/PD01DH">
											<xsl:sort select="substring(PD01DR03,6,2)"/>
											<xsl:if test="substring(../PD01DR02,1,4)-1 = substring(PD01DR03,1,4)">
												<xsl:call-template name="emptd">
													<xsl:with-param name="cnt" select="user:addm(substring(PD01DR03,6,2))"/>
												</xsl:call-template>
												<fo:table-cell >
													<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
														<xsl:value-of select="PD01DD01"/>
													</fo:block>
												</fo:table-cell>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="PD01D/PD01DH">
											<xsl:sort select="substring(PD01DR03,6,2)" order="descending"/>
											<xsl:if test="substring(../PD01DR02,1,4)-1 = substring(PD01DR03,1,4) and user:islast(substring(PD01DR03,6,2))">
												<xsl:call-template name="emptd">
													<xsl:with-param name="cnt" select="13 - substring(PD01DR03,6,2)"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="user:isnull()">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13"/>
											</xsl:call-template>
										</xsl:if>
									</fo:table-row>
								</xsl:if>
								<xsl:if test="substring(PD01D/PD01DR02,1,4) - substring(PD01D/PD01DR01,1,4) &gt;= 2">
									<fo:table-row xsl:use-attribute-sets="myBorder">
										<fo:table-cell background-color="#A7E3F1">
											<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
												<xsl:value-of select="substring(PD01D/PD01DR02,1,4)-2"/>
											</fo:block>
										</fo:table-cell>
										<xsl:value-of select="user:init()"/>
										<xsl:for-each select="PD01D/PD01DH">
											<xsl:sort select="substring(PD01DR03,6,2)"/>
											<xsl:if test="substring(../PD01DR02,1,4)-2 = substring(PD01DR03,1,4)">
												<xsl:call-template name="emptd">
													<xsl:with-param name="cnt" select="user:addm(substring(PD01DR03,6,2))"/>
												</xsl:call-template>
												<fo:table-cell >
													<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
														<xsl:value-of select="PD01DD01"/>
													</fo:block>
												</fo:table-cell>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="PD01D/PD01DH">
											<xsl:sort select="substring(PD01DR03,6,2)" order="descending"/>
											<xsl:if test="substring(../PD01DR02,1,4)-2 = substring(PD01DR03,1,4) and user:islast(substring(PD01DR03,6,2))">
												<xsl:call-template name="emptd">
													<xsl:with-param name="cnt" select="13 - substring(PD01DR03,6,2)"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:for-each>
										<xsl:if test="user:isnull()">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13"/>
											</xsl:call-template>
										</xsl:if>
									</fo:table-row>
								</xsl:if>
							</fo:table-body>
						</fo:table>
					</xsl:if>
					<xsl:if test="PD01E != ''">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-body>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell number-columns-spanned="13">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01E/PD01ER01"/> - <xsl:value-of select="PD01E/PD01ER02"/> 还款记录
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell>
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											&#160;
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											1
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											2
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											3
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											4
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											5
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											6
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											7
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											8
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											9
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											10
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											11
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											12
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4) = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>												
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4) = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4) = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>												
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4) = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<xsl:if test="substring(PD01E/PD01ER02,1,4) - substring(PD01E/PD01ER01,1,4) &gt;= 1">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)-1"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-1 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-1 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-1 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-1 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								</xsl:if>
								<xsl:if test="substring(PD01E/PD01ER02,1,4) - substring(PD01E/PD01ER01,1,4) &gt;= 2">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)-2"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-2 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-2 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-2 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-2 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								</xsl:if>
								<xsl:if test="substring(PD01E/PD01ER02,1,4) - substring(PD01E/PD01ER01,1,4) &gt;= 3">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)-3"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-3 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-3 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-3 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-3 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								</xsl:if>
								<xsl:if test="substring(PD01E/PD01ER02,1,4) - substring(PD01E/PD01ER01,1,4) &gt;= 4">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)-4"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-4 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-4 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-4 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-4 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								</xsl:if>
								<xsl:if test="substring(PD01E/PD01ER02,1,4) - substring(PD01E/PD01ER01,1,4) &gt;= 5">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-rows-spanned="2" display-align="center">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="substring(PD01E/PD01ER02,1,4)-5"/>
										</fo:block>
									</fo:table-cell>
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-5 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01ED01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-5 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<xsl:value-of select="user:init()"/>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)"/>
										<xsl:if test="substring(../PD01ER02,1,4)-5 = substring(PD01ER03,1,4)">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="user:addm(substring(PD01ER03,6,2))"/>
											</xsl:call-template>
											<fo:table-cell >
												<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
													<xsl:value-of select="PD01EJ01"/>
												</fo:block>
											</fo:table-cell>
										</xsl:if>
									</xsl:for-each>
									<xsl:for-each select="PD01E/PD01EH">
										<xsl:sort select="substring(PD01ER03,6,2)" order="descending"/>
										<xsl:if test="substring(../PD01ER02,1,4)-5 = substring(PD01ER03,1,4) and user:islast(substring(PD01ER03,6,2))">
											<xsl:call-template name="emptd">
												<xsl:with-param name="cnt" select="13 - substring(PD01ER03,6,2)"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
									<xsl:if test="user:isnull()">
										<xsl:call-template name="emptd">
											<xsl:with-param name="cnt" select="13"/>
										</xsl:call-template>
									</xsl:if>
								</fo:table-row>
								</xsl:if>
							</fo:table-body>
						</fo:table>
					</xsl:if>
					<xsl:if test="PD01G != ''">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-body>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											特殊事件发生月份
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											特殊事件类型
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<xsl:for-each select="PD01G/PD01GH">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01GR01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PD01GD01"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								</xsl:for-each>
							</fo:table-body>
						</fo:table>		
					</xsl:if>
					<xsl:if test="PD01Z != ''">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="80%" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="20%" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<xsl:for-each select="PD01Z/PD01ZH">
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									&#160;<xsl:value-of select="PD01ZD01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									添加日期
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
									<xsl:value-of select="PD01ZQ01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PD01ZR01"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
					</fo:table>
					</xsl:if>
				</xsl:for-each>
				<!-- （七）相关还款责任信息 -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					（七）相关还款责任信息
				</fo:block>
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					有相关还款责任的个人借款
				</fo:block>
				<xsl:for-each select="PCR/PD03[PD03A/PD03AD08 = '1']">
					<fo:block text-align="left" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						账户<xsl:value-of select="position()"/>
					</fo:block>
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										管理机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										业务种类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										开立日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										责任人类型
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款责任金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										币种
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										保证合同编号
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD03A/PD03AQ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD03A/PD03AD02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD03A/PD03AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD03A/PD03AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD03A/PD03AD03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD03A/PD03AJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD03A/PD03AD04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD03A/PD03AQ02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										截至&#160;<xsl:value-of select="PD03A/PD03AR03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款状态
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期月数
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD03A/PD03AJ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD03A/PD03AD05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD03A/PD03AD07"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD03A/PD03AS01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
					<xsl:if test="PD03Z != ''">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="80%" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="20%" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<xsl:for-each select="PD03Z/PD03ZH">
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									&#160;<xsl:value-of select="PD03ZD01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									添加日期
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
									<xsl:value-of select="PD03ZQ01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PD03ZR01"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
					</fo:table>
					</xsl:if>
				</xsl:for-each>
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					有相关还款责任的企业借款
				</fo:block>
				<xsl:for-each select="PCR/PD03[PD03A/PD03AD08 = '2']">
					<fo:block text-align="left" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						账户<xsl:number value="position()"/>
					</fo:block>
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										管理机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										业务种类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										开立日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										责任人类型
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款责任金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										币种
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										保证合同编号
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD03A/PD03AQ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD03A/PD03AD02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD03A/PD03AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD03A/PD03AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD03A/PD03AD03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD03A/PD03AJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD03A/PD03AD04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD03A/PD03AQ02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										截至&#160;<xsl:value-of select="PD03A/PD03AR03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款状态
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期月数
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD03A/PD03AJ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD03A/PD03AD05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD03A/PD03AD07"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD03A/PD03AS01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
					<xsl:if test="PD03Z != ''">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="80%" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="20%" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<xsl:for-each select="PD03Z/PD03ZH">
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									&#160;<xsl:value-of select="PD03ZD01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									添加日期
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
									<xsl:value-of select="PD03ZQ01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PD03ZR01"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
					</fo:table>
					</xsl:if>
				</xsl:for-each>
				<!-- （八）授信协议信息 -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					（八）授信协议信息
				</fo:block>
				<xsl:for-each select="PCA/PD02">
					<fo:block text-align="left" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						授信协议&#160;<xsl:number value="position()"/>
					</fo:block>
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										管理机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信协议标识
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										生效日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信额度用途
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD02A/PD02AI02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD02A/PD02AI03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD02A/PD02AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD02A/PD02AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD02A/PD02AD02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信额度
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信限额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信限额编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										已用额度
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										币种
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD02A/PD02AJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD02A/PD02AJ03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD02A/PD02AI04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD02A/PD02AJ04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PD02A/PD02AD03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>					
					<xsl:if test="PD02Z != ''">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="80%" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="20%" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<xsl:for-each select="PD02Z/PD02ZH">
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									&#160;<xsl:value-of select="PD02ZD01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									添加日期
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
									<xsl:value-of select="PD02ZQ01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="PD02ZR01"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
					</fo:table>
					</xsl:if>
				</xsl:for-each>
<!-- 四 非信贷交易信息明细 -->
				<fo:block space-before.optimum="20pt" space-after.optimum="15pt" text-align="center" font-size="14pt" font-family="KaiTi">
					四 非信贷交易信息明细
				</fo:block>
				<!-- 后付费记录 -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					后付费记录
				</fo:block>
				<xsl:for-each select="PND/PE01">
					<fo:block text-align="left" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						账户<xsl:number value="position()"/>
					</fo:block>
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										机构名称
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										业务类型
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										业务开通日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										当前缴费状态
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										当前欠费金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										记账年月
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PE01A/PE01AQ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PE01A/PE01AD02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PE01A/PE01AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PE01A/PE01AD03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PE01A/PE01AJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PE01A/PE01AR02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
					<xsl:if test="PE01A/PE01AQ02 != ''">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="13">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近 24 个月缴费记录
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										&#160;
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										1
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										2
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										3
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										4
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										5
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										6
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										7
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										8
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										9
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										10
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										11
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										12
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="substring(PE01A/PE01AR02,1,4)"/>
									</fo:block>
								</fo:table-cell>
								<xsl:call-template name="splittd">
									<xsl:with-param name="datas" select="PE01A/PE01AQ02"/>
									<xsl:with-param name="mths" select="substring(PE01A/PE01AR02,6,2)"/>
								</xsl:call-template>
								<xsl:call-template name="emptd">
									<xsl:with-param name="cnt" select="13 - substring(PE01A/PE01AR02,6,2)"/>
								</xsl:call-template>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="substring(PE01A/PE01AR02,1,4)-1"/>
									</fo:block>
								</fo:table-cell>
								<xsl:call-template name="splittd">
									<xsl:with-param name="datas" select="substring(PE01A/PE01AQ02,1,24-substring(PE01A/PE01AR02,6,2))"/>
									<xsl:with-param name="mths" select="12 + substring(PE01A/PE01AR02,6,2)"/>
								</xsl:call-template>
							</fo:table-row>
						<xsl:if test="substring(PE01A/PE01AR02,6,2) != 12">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="substring(PE01A/PE01AR02,1,4)-2"/>
									</fo:block>
								</fo:table-cell>
								<xsl:call-template name="emptd">
									<xsl:with-param name="cnt" select="substring(PE01A/PE01AR02,6,2) + 1"/>
								</xsl:call-template>
								<xsl:call-template name="splittd">
									<xsl:with-param name="datas" select="substring(PE01A/PE01AQ02,1,12-substring(PE01A/PE01AR02,6,2))"/>
									<xsl:with-param name="mths" select="24"/>
								</xsl:call-template>
							</fo:table-row>
						</xsl:if>
						</fo:table-body>
						</fo:table>
					</xsl:if>
				</xsl:for-each>
				
<!-- 五 公共信息明细 -->
				<fo:block space-before.optimum="20pt" space-after.optimum="15pt" text-align="center" font-size="14pt" font-family="KaiTi">
					五 公共信息明细
				</fo:block>
				<!-- （一）欠税记录 -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					（一）欠税记录
				</fo:block>
				<xsl:if test="POT/PF01 != ''">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										主管税务机关
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										欠税总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										欠税统计日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="POT/PF01">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="position()"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF01A/PF01AQ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF01A/PF01AJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF01A/PF01AR01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:if test="PF01Z != '' and PF01Z/PF01ZS01 != 0">
							<xsl:for-each select="PF01Z/PF01ZH">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PF01ZD01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											添加日期
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell number-columns-spanned="3">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="PF01ZQ01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="PF01ZR01"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
							</xsl:if>
							</xsl:for-each>
						</fo:table-body>
					</fo:table>
				</xsl:if>
				<xsl:if test="count(POT/child::*) = 0">
					<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						无
					</fo:block>
				</xsl:if>
				<!-- （二）民事判决记录 -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					（二）民事判决记录
				</fo:block>
				<xsl:if test="PCJ/PF02 != ''">
				<xsl:for-each select="PCJ/PF02">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										立案法院
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										案由
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										立案日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										结案方式
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF02A/PF02AQ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF02A/PF02AQ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF02A/PF02AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF02A/PF02AD01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										判决/调解结果
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										判决/调解生效日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										诉讼标的
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										诉讼标的金额
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF02A/PF02AQ03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF02A/PF02AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF02A/PF02AQ04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF02A/PF02AJ01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:if test="PF02Z != '' and PF02Z/PF02ZS01 != 0">
							<xsl:for-each select="PF02Z/PF02ZH">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PF02ZD01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											添加日期
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell number-columns-spanned="3">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="PF02ZQ01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="PF02ZR01"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
							</xsl:if>
						</fo:table-body>
					</fo:table>
				</xsl:for-each>
				</xsl:if>
				<xsl:if test="count(PCJ/child::*) = 0">
					<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						无
					</fo:block>
				</xsl:if>
				<!-- （三）强制执行记录 -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					（三）强制执行记录
				</fo:block>
				<xsl:if test="PCE/PF03 != ''">
				<xsl:for-each select="PCE/PF03">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										执行法院
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										执行案由
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										立案日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										结案方式
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF03A/PF03AQ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF03A/PF03AQ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF03A/PF03AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF03A/PF03AD01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										案件状态
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										结案日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										申请执行标的
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										申请执行标的价值
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										已执行标的
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										已执行标的金额
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF03A/PF03AQ03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF03A/PF03AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF03A/PF03AQ04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF03A/PF03AJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF03A/PF03AQ05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF03A/PF03AJ02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:if test="PF03Z != '' and PF03Z/PF03ZS01 != 0">
							<xsl:for-each select="PF03Z/PF03ZH">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PF03ZD01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											添加日期
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell number-columns-spanned="4">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="PF03ZQ01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="2">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="PF03ZR01"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
							</xsl:if>
						</fo:table-body>
					</fo:table>
				</xsl:for-each>
				</xsl:if>
				<xsl:if test="count(PCE/child::*) = 0">
					<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						无
					</fo:block>
				</xsl:if>
				<!-- （四）行政处罚记录 -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					（四）行政处罚记录
				</fo:block>
				<xsl:if test="PAP/PF04 != ''">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										处罚机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										处罚内容
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										处罚金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										生效日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										截止日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										行政复议结果
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="PAP/PF04">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="position()"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF04A/PF04AQ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF04A/PF04AQ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF04A/PF04AJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF04A/PF04AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF04A/PF04AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF04A/PF04AQ03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:if test="PF04Z != '' and PF04Z/PF04ZS01 != 0">
							<xsl:for-each select="PF04Z/PF04ZH">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PF04ZD01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											添加日期
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell number-columns-spanned="4">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="PF04ZQ01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="2">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="PF04ZR01"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
							</xsl:if>
						</xsl:for-each>
						</fo:table-body>
					</fo:table>
				</xsl:if>
				<xsl:if test="count(PAP/child::*) = 0">
					<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						无
					</fo:block>
				</xsl:if>
				<!-- （五）住房公积金参缴记录 -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					（五）住房公积金参缴记录
				</fo:block>
				<xsl:if test="PHF/PF05 != ''">
					<xsl:for-each select="PHF/PF05">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										参缴地
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										参缴日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										初缴月份
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										缴至月份
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										缴费状态
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										月缴存额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										个人缴存比例
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										单位缴存比例
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF05A/PF05AQ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF05A/PF05AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF05A/PF05AD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF05A/PF05AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF05A/PF05AR03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF05A/PF05AJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF05A/PF05AQ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF05A/PF05AQ03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="7">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										缴费单位
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										信息更新日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="7">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF05A/PF05AQ04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF05A/PF05AR04"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:if test="PF05Z != '' and PF05Z/PF05ZS01 != 0">
							<xsl:for-each select="PF05Z/PF05ZH">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PF05ZD01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											添加日期
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell number-columns-spanned="5">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="PF05ZQ01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="3">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="PF05ZR01"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
							</xsl:if>
						</fo:table-body>
					</fo:table>
				</xsl:for-each>
				</xsl:if>
				<xsl:if test="count(PHF/child::*) = 0">
					<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						无
					</fo:block>
				</xsl:if>
				<!-- （六）低保救助记录 -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					（六）低保救助记录
				</fo:block>
				<xsl:if test="PBS/PF06 != ''">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										人员类别
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										所在地
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										工作单位
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										家庭月收入
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										申请日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										批准日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										信息更新日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="PBS/PF06">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="position()"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF06A/PF06AD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF06A/PF06AQ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF06A/PF06AQ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF06A/PF06AQ03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF06A/PF06AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF06A/PF06AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF06A/PF06AR03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:if test="PF06Z != '' and PF06Z/PF06ZS01 != 0">
							<xsl:for-each select="PF06Z/PF06ZH">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PF06ZD01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											添加日期
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell number-columns-spanned="5">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="PF06ZQ01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="3">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="PF06ZR01"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
							</xsl:if>
						</xsl:for-each>
						</fo:table-body>
					</fo:table>
				</xsl:if>
				<xsl:if test="count(PBS/child::*) = 0">
					<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						无
					</fo:block>
				</xsl:if>
				<!-- （七）执业资格记录 -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					（七）执业资格记录
				</fo:block>
				<xsl:if test="PPQ/PF07 != ''">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										执业资格名称
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										等级
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										获得日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										吊销日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										颁发机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										机构所在地
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="PPQ/PF07">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="position()"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF07A/PF07AQ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF07A/PF07AD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF07A/PF07AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF07A/PF07AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF07A/PF07AR03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF07A/PF07AQ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF07A/PF07AD02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:if test="PF07Z != '' and PF07Z/PF07ZS01 != 0">
							<xsl:for-each select="PF07Z/PF07ZH">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PF07ZD01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											添加日期
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell number-columns-spanned="5">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="PF07ZQ01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="3">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="PF07ZR01"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
							</xsl:if>
						</xsl:for-each>
						</fo:table-body>
					</fo:table>
				</xsl:if>
				<xsl:if test="count(PPQ/child::*) = 0">
					<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						无
					</fo:block>
				</xsl:if>
				<!-- （八）行政奖励记录 -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					（八）行政奖励记录
				</fo:block>
				<xsl:if test="PAH/PF08 != ''">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										奖励机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										奖励内容
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										生效日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										截止日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="PAH/PF08">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="position()"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF08A/PF08AQ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF08A/PF08AQ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF08A/PF08AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
										<xsl:value-of select="PF08A/PF08AR02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:if test="PF08Z != '' and PF08Z/PF08ZS01 != 0">
							<xsl:for-each select="PF08Z/PF08ZH">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="PF08ZD01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											添加日期
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell number-columns-spanned="3">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="PF08ZQ01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="2">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="PF08ZR01"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
							</xsl:if>
						</xsl:for-each>
						</fo:table-body>
					</fo:table>
				</xsl:if>
				<xsl:if test="count(PAH/child::*) = 0">
					<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						无
					</fo:block>
				</xsl:if>
<!-- 六 本人声明 -->
				<fo:block space-before.optimum="20pt" space-after.optimum="15pt" text-align="center" font-size="14pt" font-family="KaiTi">
					六 本人声明
				</fo:block>
				<xsl:if test="POS/PG01/PG010H[PG010D03 = '3']">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="10%" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="70%" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="20%" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										声明内容
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										添加日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="POS/PG01/PG010H[PG010D03 = '3']">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell>
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="position()"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="PG010Q01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="PG010R01"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
					</fo:table>
				</xsl:if>
				<xsl:if test="count(POS/PG01/PG010H[PG010D03 = '3']) = 0">
					<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						无
					</fo:block>
				</xsl:if>
				
<!-- 七 异议标注 -->
				<fo:block space-before.optimum="20pt" space-after.optimum="15pt" text-align="center" font-size="14pt" font-family="KaiTi">
					七 异议标注
				</fo:block>
				<xsl:if test="POS/PG01/PG010H[PG010D03 = '1']">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="10%" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="70%" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="20%" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										标注内容
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										添加日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="POS/PG01/PG010H[PG010D03 = '1']">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell>
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="position()"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="PG010Q01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="PG010R01"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
					</fo:table>
				</xsl:if>
				<xsl:if test="count(POS/PG01/PG010H[PG010D03 = '1']) = 0">
					<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						无
					</fo:block>
				</xsl:if>
				
<!-- 八 查询记录 -->
				<fo:block space-before.optimum="20pt" space-after.optimum="15pt" text-align="center" font-size="14pt" font-family="KaiTi">
					八 查询记录
				</fo:block>
				<xsl:if test="count(POQ/child::*) != 0">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-column column-width="10%" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="20%" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="40%" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="30%" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										查询日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										查询机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										查询原因
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="POQ/PH01">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell>
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="position()"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="PH010R01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="PH010Q02"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >
											<xsl:value-of select="PH010Q03"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
					</fo:table>
				</xsl:if>
				<xsl:if test="count(POQ/child::*) = 0">
					<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						无
					</fo:block>
				</xsl:if>

			</fo:flow>
		</fo:page-sequence>

<!--报告说明-->
		<fo:page-sequence master-reference="note" format="1">
			<!--页码展示-->
			<fo:static-content flow-name="xsl-region-after">
				<fo:block text-align="center" font-size="10pt" font-family="serif" line-height="10pt">
					<fo:page-number/>
				</fo:block>
			</fo:static-content>
			<fo:flow flow-name="xsl-region-body" >
				<xsl:if test="PRH/PA01 != '' ">
					<fo:block space-after="20pt" font-weight="bold" font-size="15pt" text-align="center" font-family="Simsunbold">
						报告说明
					</fo:block>
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">1.</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									本报告由中国人民银行征信中心出具，依据截至报告时点的个人征信系统记录的信息生成。除查询记录外，其他信息均由相关机构提供，征信中心不保证其真实性和准确性，但承诺在信息汇总、加工、整合的全过程中保持客观、中立的地位。
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">2.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									本报告中的“数字解读”仅供使用本信用报告的银行等授信机构参考，授信机构应自行承担使用“数字解读”的相关法律责任。
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">3.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									“数字解读”将信用报告内容解读为一个数值，是对信用主体未来信贷违约可能性的预测，其取值范围为0到1000，分值越高，违约可能性越低；“相对位置”是信用主体的数字解读值在全部人群中的百分比排序位置，比如“>50%”代表该数字解读值高于50%的信用主体；“说明”中的“影响因素”是影响信用主体获得更高数字解读值的原因，根据当前信用报告的实际情况给出，最多有两条。“数字解读”显示为“--”的，仅代表无法根据当前信用报告内容给出数字解读值，并无其他含义。无法给出数字解读值的具体原因见“说明”。
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">4.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									本报告的信贷交易信息提示中，“业务类型”为“其他”的汇总信息不包含“资产处置”和“垫款”业务。
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">5.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									本报告中如果没有“信贷交易违约信息概要”信息，说明信用主体最近5年内没有连续逾期。
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">6.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									对于存在授信限额的协议信息，信息主体的可用额度需结合“授信协议信息”中的授信额度、授信限额信息和余额进行估算。
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">7.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									本报告中的信贷交易授信及负债信息概要展示的信息是指未结清/未销户的授信及负债信息。
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">8.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									本报告的借贷交易明细信息中，循环贷账户的到期日期是指账户授信额度的到期日期。
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">9.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									本报告的借贷交易明细信息中，借贷账户展示最近5年的还款情况，包括当前还款状态和当前逾期总额。
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">10.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									对于通过自助渠道办理的“小额、高频”业务，金融机构将合并报送相关账户，展示在本报告的借贷交易明细信息中；此时账户的还款方式为“不区分还款方式”，该账户的还款频率统一约定为“月”，“还款期数”按月计算，其还款信息按月进行观测和更新。
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">11.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									本报告中的逾期准贷记卡账户是指该账户60天以上的透支行为。
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">12.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									本报告中的还款期数为“--”是指该账户是非分期还款。
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">13.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									本报告不展示5年前已经结束的违约行为，以及5年前的欠税记录、强制执行记录、民事判决记录、行政处罚记录、电信欠费记录。
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">14.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									机构说明是数据提供机构对具体业务添加的特别说明信息。
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">15.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									本人声明是信息主体对信用报告中的信息所附注的简要说明，信用主体对本人声明的真实性负责。
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">16.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									异议标注是征信中心添加的，用于说明信用主体对信用报告中的哪些信息有异议。
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">17.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									本报告内容涉及个人隐私，查询者应依法使用、妥善保管。因使用不当造成个人信息泄露的，征信中心将不承担相关责任。
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">18.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									本报告中所有金额（除“有相关还款责任的企业借款”中的金额外）均为人民币金额，参照查询日前一天的汇率。
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">19.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									本报告整合了数据提供机构以信息主体不同证件报送的信息。
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
				</xsl:if>
			</fo:flow>
		</fo:page-sequence>
	</fo:root>
	</xsl:template>
		
	<xsl:template name="emptd">	
		<xsl:param name="cnt" select="1"/>
		<xsl:if test="$cnt != 1">
			<fo:table-cell xmlns:fo="http://www.w3.org/1999/XSL/Format">
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" >&#160;</fo:block>
			</fo:table-cell>
			<xsl:call-template name="emptd">
				<xsl:with-param name="cnt" select="$cnt - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="splittd">
		<xsl:param name="mths" select="1"/>
		<xsl:param name="datas"/>
		<xsl:if test="$mths != 0 and substring($datas,25-$mths,1) != ''">
			<fo:table-cell xmlns:fo="http://www.w3.org/1999/XSL/Format">
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" ><xsl:value-of select="substring($datas,25-$mths,1)"/></fo:block>
			</fo:table-cell>
			<xsl:call-template name="splittd">
				<xsl:with-param name="mths" select="$mths - 1"/>
				<xsl:with-param name="datas" select="$datas"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>