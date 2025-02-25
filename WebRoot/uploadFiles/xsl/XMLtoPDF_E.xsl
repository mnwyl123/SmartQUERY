<?xml version="1.0" encoding="gb2312"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
	<!--表格Title样式-->
	<xsl:attribute-set name="myBorder">
		<xsl:attribute name="border">
			solid 1pt #6f6f6f
		</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:template match="/Document">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<!--首页页面规格-->
				<fo:simple-page-master master-name="home" page-height="11.5in" page-width="8.5in" margin-top="0.5in" margin-bottom="0.5in" >
					<fo:region-body margin-top="0.5in" margin-bottom="0.5in"/>
					<fo:region-before extent="0.5in"/>
					<fo:region-after extent="0.5in"/>
				</fo:simple-page-master>
				<!--正文页面规格-->
				<fo:simple-page-master master-name="all" page-height="11.5in" page-width="8.5in" margin-top="0.5in" margin-bottom="0.5in" margin-left="0.75in" margin-right="0.75in">
					<fo:region-body margin-top="0.5in" margin-bottom="0.5in"/>
					<fo:region-before extent="0.5in"/>
					<fo:region-after extent="0.5in"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			
			<!--首页模块-->
			<xsl:if test="EAA/EA01 !=''">
				<fo:page-sequence master-reference="home" format="1">
					<fo:static-content flow-name="xsl-region-after">
						<fo:block >
							<fo:external-graphic src="url('footer.gif')"/>
						</fo:block>
					</fo:static-content>
					<fo:flow flow-name="xsl-region-body" >
					
						<xsl:if test="EAA/EA01 != '' ">
							<fo:block space-after="100pt">
								<fo:list-block>
									<fo:list-item>
										<fo:list-item-label>
											<fo:block  margin-left="50pt"><fo:external-graphic src="plogo.gif" content-width="120px" content-height="336px"/></fo:block>
										</fo:list-item-label>
										<fo:list-item-body>
											<fo:block margin-left="410pt" font-family="Simsun"><xsl:value-of select="EAA/EA01/EA01A/EA01AI01"/></fo:block>
										</fo:list-item-body>
									</fo:list-item>
								</fo:list-block>
							</fo:block>
							<fo:block font-size="30pt" font-family="KaiTi" line-height="24pt" space-after="10pt" color="black" text-align="center">
							企业信用报告
							</fo:block>
							<fo:block font-size="15pt" font-family="KaiTi" line-height="24pt" space-after.optimum="15pt" color="black" text-align="center">
							(授信机构版)
							</fo:block>
							<!--报告头-->
							<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="180pt">
								<fo:table-body>
									<fo:table-row >
										<fo:table-cell width="310pt" margin-left="160pt">
											<fo:block font-size="15pt" font-family="Simsun" line-height="25pt">
											企业名称：
											</fo:block>
										</fo:table-cell>
										<fo:table-cell margin-right="35pt">
											<fo:block font-size="15pt" font-family="Simsun" line-height="25pt" >
											<xsl:value-of select="EAA/EA01/EA01C/EA01CQ01"/>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell width="310pt" margin-left="160pt">
											<fo:block font-size="15pt" font-family="Simsun" line-height="25pt">
											中征码：
											</fo:block>
										</fo:table-cell>
										<fo:table-cell>
											<xsl:for-each select="EAA/EA01/EA01C/EA01CH">
												<xsl:if test="EA01CD01 = '10' ">
													<fo:block font-size="15pt" font-family="Simsun" line-height="25pt" >
													<xsl:value-of select="EA01CI01"/>
													</fo:block>
												</xsl:if>
											</xsl:for-each>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell width="310pt" margin-left="160pt">
											<fo:block font-size="15pt" font-family="Simsun" line-height="25pt">
											统一社会信用码：
											</fo:block>
										</fo:table-cell>
										<fo:table-cell>
											<xsl:for-each select="EAA/EA01/EA01C/EA01CH">
												<xsl:if test="EA01CD01 = '20' ">
													<fo:block font-size="15pt" font-family="Simsun" line-height="25pt" >
													<xsl:value-of select="EA01CI01"/>
													</fo:block>
												</xsl:if>
											</xsl:for-each>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell width="310pt" margin-left="160pt">
											<fo:block font-size="15pt" font-family="Simsun" line-height="25pt">
											查询原因：
											</fo:block>
										</fo:table-cell>
										<fo:table-cell>
											<fo:block font-size="15pt" font-family="Simsun" line-height="25pt" >
											<xsl:value-of select="EAA/EA01/EA01B/EA01BD02"/>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell width="310pt" margin-left="160pt">
											<fo:block font-size="15pt" font-family="Simsun" line-height="25pt">
											查询机构：
											</fo:block>
										</fo:table-cell>
										<fo:table-cell margin-right="35pt">
											<fo:block font-size="15pt" font-family="Simsun" line-height="25pt" >
											<xsl:value-of select="EAA/EA01/EA01B/EA01BI01"/>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>
										<fo:table-cell width="310pt" margin-left="160pt">
											<fo:block font-size="15pt" font-family="Simsun" line-height="25pt">
											报告时间：
											</fo:block>
										</fo:table-cell>
										<fo:table-cell>
											<fo:block font-size="15pt" font-family="Simsun" line-height="25pt" >
											<xsl:value-of select="EAA/EA01/EA01A/EA01AR01"/>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</fo:table-body>
							</fo:table>
						</xsl:if>
					</fo:flow>
				</fo:page-sequence>
			</xsl:if>
			
			<!-- 报告说明 -->
			<fo:page-sequence master-reference="all" format="1">
				<!--页码展示-->
				<fo:static-content flow-name="xsl-region-after">
					<fo:block text-align="center" font-size="10pt" font-family="serif" line-height="10pt">
					<fo:page-number/>
				</fo:block>
				</fo:static-content>				
				<fo:flow flow-name="xsl-region-body">				

					<xsl:if test="EAA/EA01 !=''">
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
										本报告由中国人民银行征信中心出具，依据截止报告时间征信系统记录的信息生成。除征信中心标注外，信息均由相关数据提供机构和信息主体提供，征信中心不保证其真实性和准确性，但承诺在信息汇总、加工、整合的全过程中保持客观、中立的地位。
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">2.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										本报告所展示的基本信息来自征信系统对不同数据来源提供的同一个信息主体基本信息进行整合后的结果。
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">3.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										本报告中信贷交易包括借贷交易和担保交易。
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">4.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										本报告中借贷交易包括各种形式的贷款，也包括以各种其他名义融资但实质上是借贷的行为，即融资方负有明确还款责任的交易。常见的产品种类包括：贷款、贸易融资、票据贴现、保理、透支、融资租赁、回购、垫款、黄金证券借贷、公司信用债等。
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">5.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										本报告中担保交易指第三人和债权人约定，当债务人不履行债务时，第三人按约定履行债务的行为。包括名义上没有担保合同约定但当债务人违约时、第三人实质上要代偿的行为。常见的产品种类包括：银行承兑汇票、信用证、银行保函、融资担保公司提供的担保服务，保险公司提供的信用保证保险服务。 
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">6.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										本报告中被追偿业务是指剩余本息处于催收状态（即债权人要求债务人尽快归还全部借款）的借贷交易。常见的产品种类包括：由资产管理公司处置的债务、垫款（含担保代偿）。
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">7.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										本报告中的短期借款、中长期借款是指借贷交易中除被追偿业务、循环透支、贴现之外的业务，按照“借款期限分类”划分，分别对应其中的短期、中期和长期。
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">8.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										本报告中借贷交易的正常类是指除被追偿业务之外，五级分类为“正常”或者五级分类为“未分类”且逾期天数为0的业务；关注类是指除被追偿业务之外，五级分类为“关注”或者五级分类为“未分类”且逾期0至90天的业务；不良类是指除被追偿业务之外，五级分类为“次级”、“可疑”、“损失”、“违约”或者五级分类为“未分类”且逾期90天以上的业务。
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">9.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										本报告中担保交易的正常类、关注类、不良类分别对应五级分类为正常、关注和后三类的业务。
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">10.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										本报告中信息概要部分中的负债历史信息，其中负债是指由信贷交易所产生的债务；逾期总额、逾期本金是指除被追偿业务之外的借贷交易的逾期总额（含欠息）合计及逾期本金合计。
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">11.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										本报告仅展示一定期限范围内的已结清信贷信息、非信贷信息、公共信息。
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">12.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										如无特别说明，本报告中的金额类数据项单位均为万元。
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">13.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										如无特别说明，本报告中的金额类汇总数据项均为人民币计价。外币折人民币的计算依据国家外汇管理局当月公布的各种货币对美元折算率表。
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">14.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										如信息记录斜体展示，则说明信息主体对此条记录存在异议。
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">15.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										数据提供机构说明是报数机构对报告中的信息记录或对信息主体所作的补充说明。
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">16.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										征信中心说明是征信中心对报告中的信息记录或对信息主体所作的说明。
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">17.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										信息主体声明是信息主体对报数机构提供的信息记录所作的简要说明。
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">18.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										本报告仅供金融机构按照与信息主体的约定使用，请妥善保管。因使用不当而引起纠纷的，征信中心不承担相关责任。
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
						<!--汇率显示-->
						<xsl:if test="EAA/EA01/EA01E != ''">
							<fo:block font-size="10pt" font-family="Simsun" space-before="13pt" >
							汇率（美元折人民币）：<xsl:value-of select="EAA/EA01/EA01E/EA01EQ01"/>&#160;&#160;有效期：<xsl:value-of select="EAA/EA01/EA01E/EA01ER01"/>
							</fo:block>
						</xsl:if>
					</xsl:if>
				</fo:flow>
			</fo:page-sequence>
			<!--正文模块-->
			<fo:page-sequence master-reference="all" format="1">
				<!--页码展示-->
				<fo:static-content flow-name="xsl-region-after">
					<fo:block text-align="center" font-size="10pt" font-family="serif" line-height="10pt">
					<fo:page-number/>
				</fo:block>
				</fo:static-content>				
				<fo:flow flow-name="xsl-region-body">
<!-- 身份标识 -->
					<xsl:if test="EAA/EA01/EA01C !=''">
						<fo:block space-before="20pt" font-weight="bold" font-size="15pt" text-align="center" font-family="Simsunbold">
							身份标识
						</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										企业名称
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										&#160;<xsl:value-of select="EAA/EA01/EA01C/EA01CQ01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EAA/EA01/EA01C/EA01CH">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell>
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EA01CD01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="2">
										<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
											&#160;<xsl:value-of select="EA01CI01" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:if>
<!-- 异议提示 -->
					<xsl:if test="EAA/EA01/EA01D !=''">
						<fo:block space-before="20pt" font-weight="bold" font-size="15pt" text-align="center" font-family="Simsunbold">
							异议提示
						</fo:block>
						<fo:block font-size="10pt" font-family="Simsun" space-before="13pt">
							信息主体对信用报告内容提出了 <xsl:value-of select="EAA/EA01/EA01D/EA01DS01"/> 笔异议且正在处理中，请浏览时注意阅读相关内容。
						</fo:block>					
					</xsl:if>
<!-- 信息概要 -->
					<fo:block space-before="20pt" font-weight="bold" font-size="15pt" text-align="center" font-family="Simsunbold">
						信息概要
					</fo:block>
					<xsl:if test="EBA !=''">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										首次有信贷交易的年份
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										发生信贷交易的机构数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										当前有未结清信贷交易的机构数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										首次有相关还款责任的年份
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBA/EB01/EB01A/EB01AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBA/EB01/EB01A/EB01AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBA/EB01/EB01A/EB01AS01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBA/EB01/EB01A/EB01AS02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										借贷交易
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										担保交易
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell>
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										&#160;余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBA/EB01/EB01A/EB01AJ01"/>&#160;
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										&#160;余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBA/EB01/EB01A/EB01AJ05"/>&#160;
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell>
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										&#160;其中：被追偿余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBA/EB01/EB01A/EB01AJ02"/>&#160;
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										&#160;其中：关注类余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBA/EB01/EB01A/EB01AJ06"/>&#160;
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell>
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										&#160;&#160;&#160;&#160;关注类余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBA/EB01/EB01A/EB01AJ03"/>&#160;
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										&#160;&#160;&#160;&#160;不良类余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBA/EB01/EB01A/EB01AJ07"/>&#160;
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell>
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										&#160;&#160;&#160;&#160;不良类余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBA/EB01/EB01A/EB01AJ04"/>&#160;
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										&#160;
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										&#160;
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										非信贷交易账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										欠税记录条数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										民事判决记录条数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										强制执行记录条数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										行政处罚记录条数
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBA/EB01/EB01B/EB01BS01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBA/EB01/EB01B/EB01BS02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBA/EB01/EB01B/EB01BS03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBA/EB01/EB01B/EB01BS04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBA/EB01/EB01B/EB01BS05"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
					<!-- 未结清信贷及授信信息概要 -->
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
							未结清信贷及授信信息概要
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
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										由资产管理公司处置的债务
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										垫款
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										处置日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										本金
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										利息及其他
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										总额
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBB/EB02/EB02A/EB02AS01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBB/EB02/EB02A/EB02AJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBB/EB02/EB02A/EB02AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBB/EB02/EB02A/EB02AS02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBB/EB02/EB02A/EB02AJ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBB/EB02/EB02A/EB02AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBB/EB02/EB02A/EB02AJ04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBB/EB02/EB02A/EB02AJ05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBB/EB02/EB02A/EB02AJ03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
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
								<fo:table-cell number-rows-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										&#160;
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										正常类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										关注类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										不良类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										合计
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										中长期借款
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBB/EB02/EB02A/EB02AH">
								<xsl:sort select="EB02AD02"/>
								<xsl:if test="EB02AD01 = '1' and EB02AD02 != 0"><!-- 不取合计 -->
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02AS04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02AJ06"/>
									</fo:block>
								</fo:table-cell>
								</xsl:if>
								<xsl:if test="EB02AD01 = '1' and EB02AD02 = 0"><!-- 取合计 -->
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02AS04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02AJ06"/>
									</fo:block>
								</fo:table-cell>
								</xsl:if>
								</xsl:for-each>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										短期借款
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBB/EB02/EB02A/EB02AH">
								<xsl:sort select="EB02AD02"/>
								<xsl:if test="EB02AD01 = '2' and EB02AD02 != 0"><!-- 不取合计 -->
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02AS04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02AJ06"/>
									</fo:block>
								</fo:table-cell>
								</xsl:if>
								<xsl:if test="EB02AD01 = '2' and EB02AD02 = 0"><!-- 取合计 -->
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02AS04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02AJ06"/>
									</fo:block>
								</fo:table-cell>
								</xsl:if>
								</xsl:for-each>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										循环透支
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBB/EB02/EB02A/EB02AH">
								<xsl:sort select="EB02AD02"/>
								<xsl:if test="EB02AD01 = '3' and EB02AD02 != 0"><!-- 不取合计 -->
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02AS04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02AJ06"/>
									</fo:block>
								</fo:table-cell>
								</xsl:if>
								<xsl:if test="EB02AD01 = '3' and EB02AD02 = 0"><!-- 取合计 -->
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02AS04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02AJ06"/>
									</fo:block>
								</fo:table-cell>
								</xsl:if>
								</xsl:for-each>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										贴现
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBB/EB02/EB02A/EB02AH">
								<xsl:sort select="EB02AD02"/>
								<xsl:if test="EB02AD01 = '4' and EB02AD02 != 0"><!-- 不取合计 -->
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02AS04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02AJ06"/>
									</fo:block>
								</fo:table-cell>
								</xsl:if>
								<xsl:if test="EB02AD01 = '4' and EB02AD02 = 0"><!-- 取合计 -->
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02AS04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02AJ06"/>
									</fo:block>
								</fo:table-cell>
								</xsl:if>
								</xsl:for-each>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										合计
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBB/EB02/EB02A/EB02AH">
								<xsl:sort select="EB02AD02"/>
								<xsl:if test="EB02AD01 = '0' and EB02AD02 != 0"><!-- 不取合计 -->
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02AS04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02AJ06"/>
									</fo:block>
								</fo:table-cell>
								</xsl:if>
								<xsl:if test="EB02AD01 = '0' and EB02AD02 = 0"><!-- 取合计 -->
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02AS04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02AJ06"/>
									</fo:block>
								</fo:table-cell>
								</xsl:if>
								</xsl:for-each>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
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
								<fo:table-cell number-rows-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										&#160;
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										正常类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										关注类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										不良类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										合计
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										银行承兑汇票
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBC/EB03/EB03A/EB03AH">
								<xsl:sort select="EB03AD02"/>
								<xsl:if test="EB03AD01 = '1' and EB03AD02 != 0"><!-- 不取合计 -->
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB03AS02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB03AJ01"/>
									</fo:block>
								</fo:table-cell>
								</xsl:if>
								<xsl:if test="EB03AD01 = '1' and EB03AD02 = 0"><!-- 取合计 -->
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB03AS02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB03AJ01"/>
									</fo:block>
								</fo:table-cell>
								</xsl:if>
								</xsl:for-each>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										信用证
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBC/EB03/EB03A/EB03AH">
								<xsl:sort select="EB03AD02"/>
								<xsl:if test="EB03AD01 = '2' and EB03AD02 != 0"><!-- 不取合计 -->
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB03AS02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB03AJ01"/>
									</fo:block>
								</fo:table-cell>
								</xsl:if>
								<xsl:if test="EB03AD01 = '2' and EB03AD02 = 0"><!-- 取合计 -->
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB03AS02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB03AJ01"/>
									</fo:block>
								</fo:table-cell>
								</xsl:if>
								</xsl:for-each>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										银行保函
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBC/EB03/EB03A/EB03AH">
								<xsl:sort select="EB03AD02"/>
								<xsl:if test="EB03AD01 = '3' and EB03AD02 != 0"><!-- 不取合计 -->
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB03AS02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB03AJ01"/>
									</fo:block>
								</fo:table-cell>
								</xsl:if>
								<xsl:if test="EB03AD01 = '3' and EB03AD02 = 0"><!-- 取合计 -->
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB03AS02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB03AJ01"/>
									</fo:block>
								</fo:table-cell>
								</xsl:if>
								</xsl:for-each>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										其他
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBC/EB03/EB03A/EB03AH">
								<xsl:sort select="EB03AD02"/>
								<xsl:if test="EB03AD01 = '9' and EB03AD02 != 0"><!-- 不取合计 -->
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB03AS02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB03AJ01"/>
									</fo:block>
								</fo:table-cell>
								</xsl:if>
								<xsl:if test="EB03AD01 = '9' and EB03AD02 = 0"><!-- 取合计 -->
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB03AS02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB03AJ01"/>
									</fo:block>
								</fo:table-cell>
								</xsl:if>
								</xsl:for-each>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										合计
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="sum(EBC/EB03/EB03A/EB03AH/EB03AS02[../EB03AD02='1' and ../EB03AD01!=0])"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="sum(EBC/EB03/EB03A/EB03AH/EB03AJ01[../EB03AD02='1' and ../EB03AD01!=0])"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="sum(EBC/EB03/EB03A/EB03AH/EB03AS02[../EB03AD02='2' and ../EB03AD01!=0])"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="sum(EBC/EB03/EB03A/EB03AH/EB03AJ01[../EB03AD02='2' and ../EB03AD01!=0])"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="sum(EBC/EB03/EB03A/EB03AH/EB03AS02[../EB03AD02='3' and ../EB03AD01!=0])"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="sum(EBC/EB03/EB03A/EB03AH/EB03AJ01[../EB03AD02='3' and ../EB03AD01!=0])"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="sum(EBC/EB03/EB03A/EB03AH/EB03AS02[../EB03AD02='0' and ../EB03AD01!=0])"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="sum(EBC/EB03/EB03A/EB03AH/EB03AJ01[../EB03AD02='0' and ../EB03AD01!=0])"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										非循环信用额度
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										循环信用额度
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										已用额度
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										剩余可用额度
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										已用额度
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										剩余可用额度
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBD/EB04/EB040J01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBD/EB04/EB040J02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBD/EB04/EB040J03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBD/EB04/EB040J04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBD/EB04/EB040J05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBD/EB04/EB040J06"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:if test="EBD/EB04/EB040D01='1'">							
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="6">
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										&#160;说明： 由于存在授信限额的控制， 剩余可用额度无法准确计算，需要结合授信明细信息进行估算。
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:if>
						</fo:table-body>
						</fo:table>
					<!-- 相关还款责任信息概要 -->					
					<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
						相关还款责任信息概要
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
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										责任类型
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										被追偿业务
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										其他借贷交易
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款责任金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款责任金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										关注类余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										不良类余额
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EBE/EB05/EB05A/EB05AH">
							<xsl:sort select="EB05AD01"/>
								<xsl:if test="EB05AD01 != 0">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05AD01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05AJ01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05AS02"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05AJ02"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05AJ03"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05AS03"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05AJ04"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05AJ05"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05AJ06"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="../EBE/EB05/EB05A/EB05AH">
								<xsl:if test="EB05AD01 = 0">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05AD01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05AJ01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05AS02"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05AJ02"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05AJ03"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05AS03"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05AJ04"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05AJ05"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05AJ06"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								</xsl:if>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										责任类型
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										担保交易
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款责任金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										关注类余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										不良类余额
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EBE/EB05/EB05B/EB05BH">
							<xsl:sort select="EB05BD01"/>
								<xsl:if test="EB05BD01 != 0">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05BD01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05BJ01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05BS02"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05BJ02"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05BJ03"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05BJ04"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="EBE/EB05/EB05B/EB05BH">
								<xsl:if test="EB05BD01 = 0">
								<fo:table-row xsl:use-attribute-sets="myBorder">
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05BD01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05BJ01"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05BS02"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05BJ02"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05BJ03"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB05BJ04"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								</xsl:if>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					<!-- 已结清信贷信息概要 -->					
					<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
						已结清信贷信息概要
					</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										由资产管理公司处置的债务
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										垫款
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										处置完成日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										结清日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBB/EB02/EB02B/EB02BS01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBB/EB02/EB02B/EB02BJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBB/EB02/EB02B/EB02BR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBB/EB02/EB02B/EB02BS02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBB/EB02/EB02B/EB02BJ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBB/EB02/EB02B/EB02BR02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										&#160;
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										正常类账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										关注类账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										不良类账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										合计
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										中长期借款
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBB/EB02/EB02B/EB02BH">
									<xsl:sort select="EB02BD01"/>
									<xsl:if test="EB02BD01 = '1' and EB02BD02 != 0"><!-- 不取合计 -->
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB02BS04"/>
										</fo:block>
									</fo:table-cell>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="EBB/EB02/EB02B/EB02BH">
									<xsl:if test="EB02BD01 = '1' and EB02BD02 = 0"><!-- 取合计 -->
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB02BS04"/>
										</fo:block>
									</fo:table-cell>
									</xsl:if>
								</xsl:for-each>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										短期借款
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBB/EB02/EB02B/EB02BH">
									<xsl:sort select="EB02BD01"/>
									<xsl:if test="EB02BD01 = '2' and EB02BD02 != 0"><!-- 不取合计 -->
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB02BS04"/>
										</fo:block>
									</fo:table-cell>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="EBB/EB02/EB02B/EB02BH">
									<xsl:if test="EB02BD01 = '2' and EB02BD02 = 0"><!-- 取合计 -->
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB02BS04"/>
										</fo:block>
									</fo:table-cell>
									</xsl:if>
								</xsl:for-each>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										循环透支
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBB/EB02/EB02B/EB02BH">
									<xsl:sort select="EB02BD01"/>
									<xsl:if test="EB02BD01 = '3' and EB02BD02 != 0"><!-- 不取合计 -->
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB02BS04"/>
										</fo:block>
									</fo:table-cell>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="EBB/EB02/EB02B/EB02BH">
									<xsl:if test="EB02BD01 = '3' and EB02BD02 = 0"><!-- 取合计 -->
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB02BS04"/>
										</fo:block>
									</fo:table-cell>
									</xsl:if>
								</xsl:for-each>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										贴现
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBB/EB02/EB02B/EB02BH">
									<xsl:sort select="EB02BD01"/>
									<xsl:if test="EB02BD01 = '4' and EB02BD02 != 0"><!-- 不取合计 -->
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB02BS04"/>
										</fo:block>
									</fo:table-cell>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="EBB/EB02/EB02B/EB02BH">
									<xsl:if test="EB02BD01 = '4' and EB02BD02 = 0"><!-- 取合计 -->
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB02BS04"/>
										</fo:block>
									</fo:table-cell>
									</xsl:if>
								</xsl:for-each>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										合计
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBB/EB02/EB02B/EB02BH">
									<xsl:sort select="EB02BD01"/>
									<xsl:if test="EB02BD01 = '0' and EB02BD02 != 0"><!-- 不取合计 -->
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB02BS04"/>
										</fo:block>
									</fo:table-cell>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="EBB/EB02/EB02B/EB02BH">
									<xsl:if test="EB02BD01 = '0' and EB02BD02 = 0"><!-- 取合计 -->
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB02BS04"/>
										</fo:block>
									</fo:table-cell>
									</xsl:if>
								</xsl:for-each>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										&#160;
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										正常类账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										关注类账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										不良类账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										合计
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										银行承兑汇票
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBC/EB03/EB03B/EB03BH">
									<xsl:if test="EB03BD01 = '1' and EB03BD02 != 0"><!-- 不取合计 -->
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB03BS02"/>
										</fo:block>
									</fo:table-cell>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="EBC/EB03/EB03B/EB03BH">
									<xsl:if test="EB03BD01 = '1' and EB03BD02 = 0"><!-- 取合计 -->
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB03BS02"/>
										</fo:block>
									</fo:table-cell>
									</xsl:if>
								</xsl:for-each>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										信用证
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBC/EB03/EB03B/EB03BH">
									<xsl:if test="EB03BD01 = '2' and EB03BD02 != 0"><!-- 不取合计 -->
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB03BS02"/>
										</fo:block>
									</fo:table-cell>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="EBC/EB03/EB03B/EB03BH">
									<xsl:if test="EB03BD01 = '2' and EB03BD02 = 0"><!-- 取合计 -->
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB03BS02"/>
										</fo:block>
									</fo:table-cell>
									</xsl:if>
								</xsl:for-each>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										银行保函
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBC/EB03/EB03B/EB03BH">
									<xsl:if test="EB03BD01 = '3' and EB03BD02 != 0"><!-- 不取合计 -->
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB03BS02"/>
										</fo:block>
									</fo:table-cell>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="EBC/EB03/EB03B/EB03BH">
									<xsl:if test="EB03BD01 = '3' and EB03BD02 = 0"><!-- 取合计 -->
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB03BS02"/>
										</fo:block>
									</fo:table-cell>
									</xsl:if>
								</xsl:for-each>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										其他
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBC/EB03/EB03B/EB03BH">
									<xsl:if test="EB03BD01 = '9' and EB03BD02 != 0"><!-- 不取合计 -->
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB03BS02"/>
										</fo:block>
									</fo:table-cell>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="EBC/EB03/EB03B/EB03BH">
									<xsl:if test="EB03BD01 = '9' and EB03BD02 = 0"><!-- 取合计 -->
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB03BS02"/>
										</fo:block>
									</fo:table-cell>
									</xsl:if>
								</xsl:for-each>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										合计
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="sum(EBC/EB03/EB03B/EB03BH/EB03BS02[../EB03BD02='1' and ../EB03BD01!=0])"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="sum(EBC/EB03/EB03B/EB03BH/EB03BS02[../EB03BD02='2' and ../EB03BD01!=0])"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="sum(EBC/EB03/EB03B/EB03BH/EB03BS02[../EB03BD02='3' and ../EB03BD01!=0])"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="sum(EBC/EB03/EB03B/EB03BH/EB03BS02[../EB03BD02='0' and ../EB03BD01!=0])"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
					<!-- 负债历史 -->					
					<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
						负债历史
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
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-rows-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										&#160;
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										全部负债
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										关注类负债
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										不良类负债
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期类负债
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										本金逾期
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期本金
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EBB/EB02/EB02C/EB02CH">
							<xsl:sort select="EB02CR01" order="descending"/>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02CR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02CS02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02CJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02CS03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02CJ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02CS04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02CJ03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02CS05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02CJ04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02CS06"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EB02CJ05"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:if>
					<xsl:if test="count(EBA/child::*) = 0 ">
					<fo:block space-before="10pt" font-size="10pt" text-align="center" font-family="Simsun">
						无
					</fo:block>
					</xsl:if>
<!-- 基本信息 -->
					<fo:block space-before="20pt" font-weight="bold" font-size="15pt" text-align="center" font-family="Simsunbold">
						基本信息
					</fo:block>
					<xsl:if test="ECA !=''">
					<!-- 基本概况信息 -->
					<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
						基本概况信息
					</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										经济类型
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ECA/EC01/EC010D01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										组织机构类型
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ECA/EC01/EC010D02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										企业规模
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ECA/EC01/EC010D03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										所属行业
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ECA/EC01/EC010D04"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										成立年份
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ECA/EC01/EC010R01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										登记证书有效截止日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ECA/EC01/EC010R02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										登记地址
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ECA/EC01/EC010Q01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										办公/经营地址
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ECA/EC01/EC010Q02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										存续状态
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ECA/EC01/EC010D05"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
					<!-- 注册资本及主要出资人信息 -->
					<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
						注册资本及主要出资人信息
					</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
							<fo:table-column column-width="proportional-column-width(1)" />
							<fo:table-column column-width="proportional-column-width(1)" />
							<fo:table-column column-width="proportional-column-width(1)" />
							<fo:table-column column-width="proportional-column-width(1)" />
							<fo:table-column column-width="proportional-column-width(1)" />
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell xsl:use-attribute-sets="myBorder">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										类型
									</fo:block>
								</fo:table-cell>
								<fo:table-cell xsl:use-attribute-sets="myBorder">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										出资方
									</fo:block>
								</fo:table-cell>
								<fo:table-cell xsl:use-attribute-sets="myBorder">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										身份标识类型
									</fo:block>
								</fo:table-cell>
								<fo:table-cell xsl:use-attribute-sets="myBorder">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										身份标识号码
									</fo:block>
								</fo:table-cell>
								<fo:table-cell xsl:use-attribute-sets="myBorder">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										出资比例
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="ECA/EC02/EC020H">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell xsl:use-attribute-sets="myBorder">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EC020D01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell xsl:use-attribute-sets="myBorder">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EC020Q01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell xsl:use-attribute-sets="myBorder">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EC020D03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell xsl:use-attribute-sets="myBorder">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EC020I01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell xsl:use-attribute-sets="myBorder">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EC020Q02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
							<xsl:if test="ECA/EC02/EC020J01 !=''">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										注册资本折人民币合计 <xsl:value-of select="ECA/EC02/EC020J01"/> 万元
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										更新日期：<xsl:value-of select="ECA/EC02/EC020R01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:if>
							<xsl:if test="ECA/EC02/EC020J01 =''">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										更新日期：<xsl:value-of select="ECA/EC02/EC020R01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:if>
						</fo:table-body>
						</fo:table>
					<!-- 主要组成人员信息 -->					
					<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
						主要组成人员信息
					</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										职位
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										姓名
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										证件类型
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										证件号码
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="ECA/EC03/EC030H">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EC030D02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EC030Q01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EC030D01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EC030I01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="4" >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										更新日期：<xsl:value-of select="ECA/EC03/EC030R01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
					<!-- 上级机构 -->					
					<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
						上级机构
					</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										类型
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										名称
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										身份标识类型
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										身份标识号码
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										更新日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ECA/EC04/EC040D01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ECA/EC04/EC040Q01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ECA/EC04/EC040D02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ECA/EC04/EC040I01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ECA/EC04/EC040R01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
					<!-- 实际控制人 -->
					<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
						实际控制人
					</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										名称
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										身份标识类型
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										身份标识号码
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										更新日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="ECA/EC05/EC050H">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EC050Q01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EC050D02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EC050I01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../EC050R01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:if>
					<xsl:if test="count(ECA/child::*) = 0 ">
					<fo:block space-before="10pt" font-size="10pt" text-align="center" font-family="Simsun">
						无
					</fo:block>
					</xsl:if>
<!-- 信贷记录明细 -->
					<fo:block space-before="20pt" font-weight="bold" font-size="15pt" text-align="center" font-family="Simsunbold">
						信贷记录明细
					</fo:block>
					<xsl:if test="EDA !=''">
					<!-- 被追偿业务 -->
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="10pt" font-family="Simsun">
										被追偿业务
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										共 <xsl:value-of select="count(EDA/ED01/ED01A[ED01AD02 = 'C1'])"/> 笔
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
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
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										债权机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										业务种类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										接收日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										币种
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										借款金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										信息报告日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										关闭日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款形式
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										历史表现
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EDA/ED01/ED01A[ED01AD02 = 'C1']">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AI01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AI02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AD05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AD07"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AR04"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AR03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BR04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BJ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BD02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										见附件
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					<!-- 未结清信贷 -->
					<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
						未结清信贷
					</fo:block>
					<xsl:if test="EDA/ED03 != ''">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										欠息
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										共 <xsl:value-of select="count(ED03)"/> 笔
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										欠息类型
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										币种
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										欠息余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额变化日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										信息报告日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EDA/ED03">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED030I02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED030D03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED030D02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED030J01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED030R01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED030R02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:if>
					<!-- 中长期借款 -->
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										中长期借款
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										共 <xsl:value-of select="count(EDA/ED01/ED01A[ED01AD01 ='1' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and (ED01AD03 = '20' or ED01AD03 ='30')])"/> 笔
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
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
								<fo:table-cell number-rows-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										业务种类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										开立日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										币种
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										借款金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										发放形式
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										担保方式
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期本金
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期月数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款形式
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										特定交易提示
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信协议编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										历史表现
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										信息报告日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EDA/ED01/ED01A[ED01AD01 ='1' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and (ED01AD03 = '20' or ED01AD03 ='30')]">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-rows-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AI01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AI02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AD05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AD07"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AD10"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AD08"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BJ04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BJ05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BS02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BR04"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BJ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BD02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01C/ED01CH/ED01CD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AI03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										见附件
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AR04"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					<!-- 短期借款 -->
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										短期借款
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										共 <xsl:value-of select="count(EDA/ED01/ED01A[ED01AD01 ='1' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and ED01AD03 = '10'])"/> 笔
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
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
								<fo:table-cell number-rows-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										业务种类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										开立日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										币种
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										借款金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										发放形式
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										担保方式
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期本金
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期月数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款形式
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										特定交易提示
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信协议编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										历史表现
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										信息报告日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EDA/ED01/ED01A[ED01AD01 ='1' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and ED01AD03 = '10']">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-rows-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AI01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AI02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AD05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AD07"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AD10"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AD08"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BJ04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BJ05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BS02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BR04"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BJ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BD02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01C/ED01CH/ED01CD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AI03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										见附件
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AR04"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					<!-- 循环透支 -->
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										循环透支
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										共 <xsl:value-of select="count(EDA/ED01/ED01A[ED01AD01 ='1' and ED01AD02 = 'R1'])"/> 笔
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
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
								<fo:table-cell number-rows-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										业务种类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										开立日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										币种
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										信用额度
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										发放形式
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										担保方式
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期本金
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期月数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款形式
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										剩余还款月数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										特定交易提示
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信协议编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										历史表现
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										信息报告日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EDA/ED01/ED01A[ED01AD01 ='1' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and ED01AD03 = '10']">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-rows-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AI01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AI02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AD05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AD07"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AJ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AD10"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AD08"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BJ04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BJ05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BS02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BR04"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BJ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BD02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BS03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01C/ED01CH/ED01CD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AI03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										见附件
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AR04"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					<!-- 贴现 -->
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										贴现
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										共 <xsl:value-of select="sum(EDA/ED02/ED020S01[text() != ''])"/> 笔
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										业务种类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期本金
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EDA/ED02[ED020S01 != '']">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED020I02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED020D02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED020D03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED020S01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED020J01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED020J02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED020J03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					<!-- 银行承兑汇票和信用证 -->
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										银行承兑汇票和信用证
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										共 <xsl:value-of select="sum(EDB/ED05/ED050S01[(../ED050D02 ='51' or ../ED050D02 ='61') and text() != ''])"/> 笔
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
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
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										业务种类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日≤30天
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日≤60天
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日≤90天
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日>90天
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										合计
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EDB/ED05[ED050S01 != '' and (ED050D02 ='51' or ED050D02 ='61')]">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED050I02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED050D02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED050D03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED050S01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED050J02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED050J03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED050J04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED050J05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED050J01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					<!-- 银行保函及其他业务 -->
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										银行保函及其他业务
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										共 <xsl:value-of select="sum(EDB/ED05/ED050S01[../ED050D02 !='51' and ../ED050D02 !='61' and text() != ''])"/> 笔
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										业务种类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EDB/ED05[ED050S01 != '' and (ED050D02 ='51' or ED050D02 ='61')]">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED050I02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED050D02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED050D03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED050S01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED050J01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					<!-- 授信信息 -->
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										授信信息
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										共 <xsl:value-of select="count(EDC/ED06/ED060I01)"/> 笔
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信协议编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信额度类型
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										额度循环标志
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										生效日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										信息报告日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										币种
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信额度
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										已用额度
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信限额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信限额编号
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EDC/ED06">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED060I01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED060I02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED060D02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED060D03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED060R01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED060R02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED060R03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED060D04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED060J01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED060J04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED060J03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED060I03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					<!-- 已结清信贷 -->
					<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
						已结清信贷
					</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										中长期借款
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										共 <xsl:value-of select="count(EDA/ED01/ED01A[ED01AD01 ='2' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and (ED01AD03 = '20' or ED01AD03 ='30')])"/> 笔
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										业务种类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										开立日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										币种
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										借款金额
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										关闭日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次还款形式
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										历史表现
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EDA/ED01/ED01A[ED01AD01='2' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and (ED01AD03 = '20' or ED01AD03 ='30')]">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AI01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AI02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AD05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AD07"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AJ01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AR03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BR04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BD02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										见附件
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										短期借款
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										共 <xsl:value-of select="count(EDA/ED01/ED01A[ED01AD01='2' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and ED01AD03 = '10'])"/> 笔
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										业务种类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										开立日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										币种
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										借款金额
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										关闭日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次还款形式
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										历史表现
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EDA/ED01/ED01A[ED01AD01='2' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and ED01AD03 = '10']">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AI01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AI02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AD05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AD07"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AJ01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AR03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BR04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BD02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										见附件
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										循环透支
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										共 <xsl:value-of select="count(EDA/ED01/ED01A[ED01AD01='2' and ED01AD02 = 'R1'])"/> 笔
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										业务种类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										开立日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										币种
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										信用额度
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										关闭日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次还款形式
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										历史表现
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EDA/ED01/ED01A[ED01AD01='2' and ED01AD02 = 'R1']">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AI01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AI02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AD05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AD07"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AJ02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01AR03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BR04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="../ED01B/ED01BH/ED01BD02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										见附件
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										贴现
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										共 <xsl:value-of select="sum(EDA/ED02/ED020S02[text() != ''])"/> 笔
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										业务种类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										贴现金额
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EDA/ED02[ED020S02 != '']">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED020I02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED020D02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED020D03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED020S02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED020J04"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										银行承兑汇票和信用证
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										共 <xsl:value-of select="sum(EDB/ED05/ED050S02[(../ED050D02 ='51' or ../ED050D02 ='61') and text() != ''])"/> 笔
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										业务种类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										垫款标志
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EDB/ED05[ED050S02 != '' and (ED050D02 ='51' or ED050D02 ='61')]">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED050I02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED050D02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED050D03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED050S02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED050D04"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										银行保函及其他业务
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										共 <xsl:value-of select="sum(EDB/ED05/ED050S02[../ED050D02 !='51' and ../ED050D02 !='61' and text() != ''])"/> 笔
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										业务种类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										垫款标志
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EDB/ED05[ED050S02 != '' and ED050D02 !='51' and ED050D02 !='61']">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED050I02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED050D02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED050D03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED050S02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED050D04"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					<!-- 相关还款责任 -->
					<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
						相关还款责任
					</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										为其他借款人承担的相关还款责任
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										除贴现外的其他业务
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										共 <xsl:value-of select="count(EDD/ED07)"/> 笔
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
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
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										责任类型
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										保证合同
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款责任
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										币种
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款责任
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信机构/
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										债权机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										业务种类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										开立日期/
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										接收日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										币种
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										借款金额/
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										信用额度
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期本金
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期月数/
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款状态
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										剩余还款
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										月数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										信息报告日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EDD/ED07">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED070I01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED070D03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED070I03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED070D10"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED070J01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED070I02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED070D06"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED070R01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED070R02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED070D07"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED070J05"/><xsl:value-of select="ED070J06"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED070J02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED070D08"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED070J03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED070J04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED070S01"/><xsl:value-of select="ED070D09"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED070S02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED070R03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										贴现
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										共 <xsl:value-of select="count(EDD/ED08)"/> 笔
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
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
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										责任类型
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										保证合同
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款责任
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										业务种类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										借款金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期本金
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EDD/ED08">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED080D01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED080I03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED080J01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED080I02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED080D03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED080D04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED080S01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED080J05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED080J02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED080J03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED080J04"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										为担保交易承担的相关还款责任
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										共 <xsl:value-of select="count(EDD/ED09)"/> 笔
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
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
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										责任类型
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										保证合同编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款责任金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信机构
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										业务种类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										担保金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EDD/ED09">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED090D01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED090I03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED090J01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED090I02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED090D03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED090D04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED090S01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED090J03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED090J02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:if>
					<xsl:if test="count(EDA/child::*) = 0 ">
					<fo:block space-before="10pt" font-size="10pt" text-align="center" font-family="Simsun">
						无
					</fo:block>
					</xsl:if>
<!-- 非信贷记录明细 -->
					<fo:block space-before="20pt" font-weight="bold" font-size="15pt" text-align="center" font-family="Simsunbold">
						非信贷记录明细
					</fo:block>
					<xsl:if test="EEA !=''">
					<!-- 公用事业缴费信息 -->
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="10pt" font-family="Simsun">
										公用事业缴费信息
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										共 <xsl:value-of select="count(EEA/EE01)"/> 笔
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(2)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										公用事业单位名称
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										业务类型
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										缴费状态
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										累计欠费金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										统计年月
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										查看过去 24 个月缴费情况
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EEA/EE01">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EE01A/EE01AQ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EE01A/EE01AD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EE01A/EE01AD02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EE01A/EE01AJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EE01A/EE01AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										见附件
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:if>
					<xsl:if test="count(EEA/child::*) = 0 ">
					<fo:block space-before="10pt" font-size="10pt" text-align="center" font-family="Simsun">
						无
					</fo:block>
					</xsl:if>
<!-- 公共记录明细 -->
					<fo:block space-before="20pt" font-weight="bold" font-size="15pt" text-align="center" font-family="Simsunbold">
						公共记录明细
					</fo:block>
					<!-- 欠税信息 -->
					<xsl:if test="EFA/EF01 !=''">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun" color="red">
							欠税信息
						</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										主管税务机关
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										欠税总额（元）
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										欠税统计日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EFA/EF01">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF010Q01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF010J01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF010R01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:if>
					<!-- 民事判决记录 -->
					<xsl:if test="EFB/EF02 !=''">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun" color="red">
							民事判决记录
						</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<xsl:for-each select="EFB/EF02">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										立案法院：<xsl:value-of select="EF020Q01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										立案日期：<xsl:value-of select="EF020R01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										案由：<xsl:value-of select="EF020Q02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										诉讼地位：<xsl:value-of select="EF020D01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										案号：<xsl:value-of select="EF020I02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										审判程序：<xsl:value-of select="EF020D02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										诉讼标的：<xsl:value-of select="EF020Q03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										诉讼标的金额（元）：<xsl:value-of select="EF020J01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										结案方式：<xsl:value-of select="EF020D03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										判决/调解生效日期：<xsl:value-of select="EF020R02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										判决/调解结果：<xsl:value-of select="EF020Q04"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:if>
					<!-- 强制执行记录 -->
					<xsl:if test="EFB/EF03 !=''">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun" color="red">
							强制执行记录
						</fo:block>
						<xsl:for-each select="EFB/EF03">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										立案法院：<xsl:value-of select="EF030Q01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										立案日期：<xsl:value-of select="EF030R01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										案由：<xsl:value-of select="EF030Q02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										案号：<xsl:value-of select="EF030I02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										申请执行标的：<xsl:value-of select="EF030Q03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										申请执行标的金额（元）：<xsl:value-of select="EF030J01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										案件状态：<xsl:value-of select="EF030Q04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										结案方式：<xsl:value-of select="EF030D01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										已执行标的：<xsl:value-of select="EF030Q05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										已执行标的金额（元）：<xsl:value-of select="EF030J02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:block text-align="left" font-size="3pt" font-family="Simsun">
							&#160;
						</fo:block>
						</xsl:for-each>
					</xsl:if>
					<!-- 行政处罚信息 -->
					<xsl:if test="EFC/EF04 !=''">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun" color="red">
							行政处罚信息
						</fo:block>
						<xsl:for-each select="EFC/EF04">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										处罚机构：<xsl:value-of select="EF040Q01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										处罚决定书文号：<xsl:value-of select="EF040I02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										违法行为：<xsl:value-of select="EF040Q02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										处罚日期：<xsl:value-of select="EF040R01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										处罚决定：<xsl:value-of select="EF040Q03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										处罚金额（元）：<xsl:value-of select="EF040J01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										处罚执行情况：<xsl:value-of select="EF040Q04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										行政复议结果：<xsl:value-of select="EF040Q05"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:block text-align="left" font-size="3pt" font-family="Simsun">
							&#160;
						</fo:block>
						</xsl:for-each>
					</xsl:if>
					<!-- 住房公积金参缴信息 -->
					<xsl:if test="EFD/EF05 !=''">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
							住房公积金参缴信息
						</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<xsl:for-each select="EFD/EF05">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										统计年月：<xsl:value-of select="EF05A/EF05AR04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										初缴年月：<xsl:value-of select="EF05A/EF05AR01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										职工人数：<xsl:value-of select="EF05A/EF05AS01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										缴费基数（元）：<xsl:value-of select="EF05A/EF05AJ01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										最近一次缴费日期：<xsl:value-of select="EF05A/EF05AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										缴至年月：<xsl:value-of select="EF05A/EF05AR03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										缴费状态：<xsl:value-of select="EF05A/EF05AD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										累计欠费金额（元）：<xsl:value-of select="EF05A/EF05AJ02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:if>
					<!-- 获得许可记录 -->
					<xsl:if test="EFE/EF06 !=''">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
							获得许可记录
						</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										许可部门
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										许可类型
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										许可日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										截止日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										许可内容
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EFE/EF06">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF060Q01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF060Q02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF060R01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF060R02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF060Q03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:if>
					<!-- 获得认证记录 -->
					<xsl:if test="EFE/EF07 !=''">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
							获得认证记录
						</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										认证部门
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										认证类型
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										认证日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										截止日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										认证内容
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EFE/EF07">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF070Q01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF070Q02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF070R01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF070R02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF070Q03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:if>
					<!-- 获得资质记录 -->
					<xsl:if test="EFE/EF08 !=''">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
							获得资质记录
						</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										认定部门
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										资质类型
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										批准日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										截止日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										资质内容
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EFE/EF08">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF080Q01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF080Q02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF080R01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF080R02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF080Q03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:if>
					<!-- 获得奖励记录 -->
					<xsl:if test="EFE/EF09 !=''">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
							获得奖励记录
						</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										奖励部门
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										奖励名称
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授予日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										截止日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										奖励事实
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EFE/EF09">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF090Q01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF090Q02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF090R01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF090R02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF090Q03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:if>
					<!-- 拥有专利情况 -->
					<xsl:if test="EFE/EF10 !=''">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
							拥有专利情况
						</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										专利名称
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										专利号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										申请日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授予日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										专利有效期（单位：年）
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EFE/EF10">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF100Q01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF100I02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF100R01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF100R02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF100S01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:if>
					<!-- 出入境检验检疫绿色通道信息 -->
					<xsl:if test="EFF/EF11 !=''">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
							出入境检验检疫绿色通道信息
						</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										批准部门
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										出口商品名称
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										生效日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EFF/EF11">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF110Q01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF110Q02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF110R01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:if>
					<!-- 进出口商品免验信息 -->
					<xsl:if test="EFF/EF12 !=''">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
							进出口商品免验信息
						</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										批准部门
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										免验商品名称
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										免验号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										截止日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EFF/EF12">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF120Q01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF120Q02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF120I02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF120R02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:if>
					<!-- 进出口商品检验分类监管信息 -->
					<xsl:if test="EFF/EF13 !=''">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
							进出口商品检验分类监管信息
						</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										监管部门
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										管辖直属局
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										监管级别
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										生效日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										截止日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EFF/EF13">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF130Q01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF130Q02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF130D01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF130R01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF130R02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:if>
					<!-- 融资规模控制信息 -->
					<xsl:if test="EFG/EF14 !=''">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
							融资规模控制信息
						</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										所属名录
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										融资控制类型
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										年度
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										规模
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EFG/EF14">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF140D01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF140D02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF140R01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF140J01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:if>
					<xsl:if test="count(EFA/child::*) = 0 and count(EFB/child::*) = 0 and count(EFC/child::*) = 0 and count(EFD/child::*) = 0 and count(EFE/child::*) = 0 and count(EFF/child::*) = 0 and count(EFG/child::*) = 0">
					<fo:block space-before="10pt" font-size="10pt" text-align="center" font-family="Simsun">
						无
					</fo:block>
					</xsl:if>
<!-- 财务报表 -->
					<xsl:if test="EGA !=''"/>
<!-- 评级信息 -->
					<fo:block space-before="20pt" font-weight="bold" font-size="15pt" text-align="center" font-family="Simsunbold">
						评级信息
					</fo:block>
					<xsl:if test="EHA !=''">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										评级日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										评级结果
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										评级机构
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EHA/EH01">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EH010R01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EH010D01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EH010Q01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:if>
					<xsl:if test="count(EHA/child::*) = 0">
					<fo:block space-before="10pt" font-size="10pt" text-align="center" font-family="Simsun">
						无
					</fo:block>
					</xsl:if>
<!-- 声明及异议标注信息 -->
					<fo:block space-before="20pt" font-weight="bold" font-size="15pt" text-align="center" font-family="Simsunbold">
						声明及异议标注信息
					</fo:block>
					<xsl:if test="EIA/EI01[EI010D02='1']">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
							数据提供机构说明
						</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="10%" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="70%" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="20%" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										数据提供机构说明
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										添加日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EIA/EI01[EI010D02='1']">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="position()"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EI010Q01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EI010R01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:if>
					<xsl:if test="EIA/EI01[EI010D02='2']">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
							征信中心说明
						</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="10%" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="70%" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="20%" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										征信中心说明
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										添加日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EIA/EI01[EI010D02='2']">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="position()"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EI010Q01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EI010R01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:if>
					<xsl:if test="EIA/EI01[EI010D02='3']">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
							信息主体声明
						</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="10%" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="70%" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="20%" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										信息主体声明
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										添加日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EIA/EI01[EI010D02='3']">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="position()"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EI010Q01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EI010R01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:if>
					<xsl:if test="EIA/EI01[EI010D02='4']">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
							异议标注
						</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="10%" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="70%" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="20%" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										异议标注
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										添加日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EIA/EI01[EI010D02='4']">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="position()"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EI010Q01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EI010R01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:if>
					<xsl:if test="count(EIA/child::*) = 0">
					<fo:block space-before="10pt" font-size="10pt" text-align="center" font-family="Simsun">
						无
					</fo:block>
					</xsl:if>
				</fo:flow>
			</fo:page-sequence>
			
			<!--附件 1 模块-->
			<fo:page-sequence master-reference="all" format="1">
				<!--页码展示-->
				<fo:static-content flow-name="xsl-region-after">
					<fo:block text-align="center" font-size="10pt" font-family="serif" line-height="10pt">
					<fo:page-number/>
				</fo:block>
				</fo:static-content>				
				<fo:flow flow-name="xsl-region-body">
<!-- 附件 1：信用记录补充信息 -->
					<fo:block font-weight="bold" font-size="15pt" text-align="left" font-family="Simsunbold">
						附件 1：信用记录补充信息
					</fo:block>
					<fo:block space-before="10pt" font-size="12pt" text-align="left" font-family="Simsun">
						一、信贷记录明细
					</fo:block>
					<fo:block space-before="5pt" font-size="10pt" text-align="left" font-family="Simsun">
						(一)被追偿记录的历史表现
					</fo:block>
					<xsl:if test="EDA/ED01[ED01A/ED01AD02='C1']">
					<xsl:for-each select="EDA/ED01[ED01A/ED01AD02='C1']">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
						<fo:table-column column-width="proportional-column-width(1)" />
						<fo:table-column column-width="proportional-column-width(1)" />
						<fo:table-column column-width="proportional-column-width(1)" />
						<fo:table-column column-width="proportional-column-width(1)" />
					<fo:table-body>
						<fo:table-row >
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="position()"/>.账户编号：<xsl:value-of select="ED01A/ED01AI01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									账户状态：<xsl:value-of select="translate(translate(ED01A/ED01AD01,'1','未'),'2','已')"/>结清
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									授信机构：<xsl:value-of select="ED01A/ED01AI02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									业务种类：<xsl:value-of select="ED01A/ED01AD06"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
					</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="1pt" space-after="5pt">
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
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										信息报告日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额变化日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										认定日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										实际还款日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										实还总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										还款形式
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="ED01B/ED01BH">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BR03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BR04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BJ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BD02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:for-each>
					</xsl:if>
					<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
						(二)中长期借款的历史表现
					</fo:block>
					<xsl:if test="EDA/ED01[(ED01A/ED01AD02 = 'D1' or ED01A/ED01AD02 = 'R4') and (ED01A/ED01AD03 = '20' or ED01A/ED01AD03 ='30')]">
					<xsl:for-each select="EDA/ED01[(ED01A/ED01AD02 = 'D1' or ED01A/ED01AD02 = 'R4') and (ED01A/ED01AD03 = '20' or ED01A/ED01AD03 ='30')]">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
						<fo:table-column column-width="proportional-column-width(1)" />
						<fo:table-column column-width="proportional-column-width(1)" />
						<fo:table-column column-width="proportional-column-width(1)" />
						<fo:table-column column-width="proportional-column-width(1)" />
					<fo:table-body>
						<fo:table-row >
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="position()"/>.账户编号：<xsl:value-of select="ED01A/ED01AI01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									账户状态：<xsl:value-of select="translate(translate(ED01A/ED01AD01,'1','未'),'2','已')"/>结清
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									授信机构：<xsl:value-of select="ED01A/ED01AI02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									业务种类：<xsl:value-of select="ED01A/ED01AD06"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
					</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="1pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										信息报告日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额变化日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类认定日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期本金
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期月数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										约定还款日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次应还总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										实际还款日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次实还总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次还款形式
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="ED01B/ED01BH">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-rows-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BR03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BJ04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BJ05"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BS02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BR05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BJ03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BR04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BJ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BD02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
						<xsl:if test="ED01C !='' and ED01C/ED01CS01 !=0">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" >
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										特定交易提示
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										交易类型
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										交易日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										交易金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日期变更月数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										交易明细信息
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="ED01C/ED01CH">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01CD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01CR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01CJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01CS02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01CQ01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
						</xsl:if>						
						<fo:block space-before="4pt" font-size="10pt" text-align="left" font-family="Simsun"></fo:block>
					</xsl:for-each>
					</xsl:if>
					<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
						(三)短期借款的历史表现
					</fo:block>
					<xsl:if test="EDA/ED01[(ED01A/ED01AD02 = 'D1' or ED01A/ED01AD02 = 'R4') and ED01A/ED01AD03 = '10']">
					<xsl:for-each select="EDA/ED01[(ED01A/ED01AD02 = 'D1' or ED01A/ED01AD02 = 'R4') and ED01A/ED01AD03 = '10']">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
						<fo:table-column column-width="proportional-column-width(1)" />
						<fo:table-column column-width="proportional-column-width(1)" />
						<fo:table-column column-width="proportional-column-width(1)" />
						<fo:table-column column-width="proportional-column-width(1)" />
					<fo:table-body>
						<fo:table-row >
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="position()"/>.账户编号：<xsl:value-of select="ED01A/ED01AI01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									账户状态：<xsl:value-of select="translate(translate(ED01A/ED01AD01,'1','未'),'2','已')"/>结清
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									授信机构：<xsl:value-of select="ED01A/ED01AI02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									业务种类：<xsl:value-of select="ED01A/ED01AD06"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
					</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="1pt" >
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										信息报告日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额变化日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类认定日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期本金
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期月数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										约定还款日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次应还总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										实际还款日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次实还总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次还款形式
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="ED01B/ED01BH">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-rows-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BR03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BJ04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BJ05"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BS02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BR05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BJ03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BR04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BJ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BD02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
						<xsl:if test="ED01C !='' and ED01C/ED01CS01 !=0">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" >
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										特定交易提示
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										交易类型
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										交易日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										交易金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日期变更月数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										交易明细信息
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="ED01C/ED01CH">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01CD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01CR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01CJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01CS02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01CQ01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
						</xsl:if>
						<fo:block space-before="4pt" font-size="10pt" text-align="left" font-family="Simsun"></fo:block>
					</xsl:for-each>
					</xsl:if>
					<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
						(四)循环透支的历史表现
					</fo:block>
					<xsl:if test="EDA/ED01[ED01A/ED01AD02 = 'R1']">
					<xsl:for-each select="EDA/ED01[ED01A/ED01AD02 = 'R1']">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
						<fo:table-column column-width="proportional-column-width(1)" />
						<fo:table-column column-width="proportional-column-width(1)" />
						<fo:table-column column-width="proportional-column-width(1)" />
						<fo:table-column column-width="proportional-column-width(1)" />
					<fo:table-body>
						<fo:table-row >
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="position()"/>.账户编号：<xsl:value-of select="ED01A/ED01AI01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									账户状态：<xsl:value-of select="translate(translate(ED01A/ED01AD01,'1','未'),'2','已')"/>结清
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									授信机构：<xsl:value-of select="ED01A/ED01AI02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									业务种类：<xsl:value-of select="ED01A/ED01AD06"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
					</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="1pt" >
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
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										信息报告日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额变化日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类认定日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期本金
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期月数
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										约定还款日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次应还总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										实际还款日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次实还总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次还款形式
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										剩余还款月数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										&#160;
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="ED01B/ED01BH">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-rows-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BR03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BJ04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BJ05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BS02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BR05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BJ03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BR04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BJ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BD02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BS03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										&#160;
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
						<xsl:if test="ED01C !='' and ED01C/ED01CS01 !=0">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" >
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										特定交易提示
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										交易类型
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										交易日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										交易金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日期变更月数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										交易明细信息
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="ED01C/ED01CH">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01CD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01CR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01CJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01CS02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01CQ01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
						</xsl:if>
						<fo:block space-before="4pt" font-size="10pt" text-align="left" font-family="Simsun"></fo:block>
					</xsl:for-each>
					</xsl:if>
					<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
						(五)贴现的信贷明细、历史表现
					</fo:block>
					<xsl:if test="EDA/ED01[ED01A/ED01AD02 = 'D2']">
					<xsl:for-each select="EDA/ED01[ED01A/ED01AD02 = 'D2']">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
						<fo:table-column column-width="proportional-column-width(1)" />
						<fo:table-column column-width="proportional-column-width(1)" />
						<fo:table-column column-width="proportional-column-width(1)" />
						<fo:table-column column-width="proportional-column-width(1)" />
					<fo:table-body>
						<fo:table-row >
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									<xsl:value-of select="position()"/>.账户编号：<xsl:value-of select="ED01A/ED01AI01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									账户状态：<xsl:value-of select="translate(translate(ED01A/ED01AD01,'1','未'),'2','已')"/>结清
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									授信机构：<xsl:value-of select="ED01A/ED01AI02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									业务种类：<xsl:value-of select="ED01A/ED01AD06"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
					</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="1pt" >
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
						<xsl:if test="ED01A/ED01AD01 = '1'">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										开户日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										币种
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										贴现金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										担保方式
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信协议编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										信息报告日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01A/ED01AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01A/ED01AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01A/ED01AD07"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01A/ED01AJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01A/ED01AD08"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01B/ED01BH/ED01BD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01A/ED01AI03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01A/ED01AR04"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:if>
							<xsl:if test="ED01A/ED01AD01 = '2'">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										开户日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										币种
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										贴现金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										关闭日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最后一次还款日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最后一次还款形式
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01A/ED01AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01A/ED01AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01A/ED01AD07"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01A/ED01AJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01A/ED01AR03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01B/ED01BH/ED01BD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01B/ED01BH/ED01BR04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01B/ED01BH/ED01BD02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:if>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" >
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
										历史表现
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										信息报告日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额变化日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										五级分类认定日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期本金
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										逾期月数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										约定还款日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次应还总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										实际还款日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次实还总额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										最近一次还款形式
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="ED01B/ED01BH">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-rows-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BR03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BJ04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BJ05"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BS02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BR05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BJ03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BR04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BJ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01BD02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
						<xsl:if test="ED01C !='' and ED01C/ED01CS01 !=0">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" >
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										特定交易提示
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										交易类型
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										交易日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										交易金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日期变更月数
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										交易明细信息
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="ED01C/ED01CH">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01CD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01CR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01CJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01CS02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED01CQ01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
						</xsl:if>
						<fo:block space-before="4pt" font-size="10pt" text-align="left" font-family="Simsun"></fo:block>
					</xsl:for-each>
					</xsl:if>
					<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
						(六)银行承兑汇票和信用证的信贷明细
					</fo:block>
					<xsl:if test="EDB/ED04[ED04A/ED04AD03 = '51' or ED04A/ED04AD03 = '61']">
					<xsl:for-each select="EDB/ED04[ED04A/ED04AD03 = '51' or ED04A/ED04AD03 = '61']">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
						<fo:table-column column-width="proportional-column-width(1)" />
						<fo:table-column column-width="proportional-column-width(1)" />
						<fo:table-column column-width="proportional-column-width(1)" />
						<fo:table-column column-width="proportional-column-width(1)" />
					<fo:table-body>
						<fo:table-row >
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									授信机构：<xsl:value-of select="ED04A/ED04AI02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									业务种类：<xsl:value-of select="ED04A/ED04AD03"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									账户状态：<xsl:value-of select="translate(translate(ED04B/ED04BD01,'1','未'),'2','已')"/>结清
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									五级分类：<xsl:value-of select="ED04B/ED04BD02"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
					</fo:table>
						<xsl:if test="ED04B/ED04BD01 = '1'">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="1pt" space-after="4pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										开立日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										币种
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										反担保方式
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										保证金比例
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										风险敞口
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										授信协议编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										信息报告日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04A/ED04AI01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04A/ED04AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04A/ED04AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04A/ED04AD04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04A/ED04AJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04A/ED04AD05"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04A/ED04AQ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04B/ED04BJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04B/ED04BJ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04A/ED04AI03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04B/ED04BR01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						</xsl:if>
						<xsl:if test="ED04B/ED04BD01 = '2'">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="1pt" space-after="4pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										开立日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										币种
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										关闭日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										垫款标志
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04A/ED04AI01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04A/ED04AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04A/ED04AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04A/ED04AD04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04A/ED04AJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04B/ED04BR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04B/ED04BD03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						</xsl:if>
					</xsl:for-each>
					</xsl:if>
					<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
						(七)银行保函及其他业务的信贷明细
					</fo:block>
					<xsl:if test="EDB/ED04[ED04A/ED04AD03 != '51' and ED04A/ED04AD03 != '61']">
					<xsl:for-each select="EDB/ED04[ED04A/ED04AD03 != '51' and ED04A/ED04AD03 != '61']">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
						<fo:table-column column-width="proportional-column-width(1)" />
						<fo:table-column column-width="proportional-column-width(1)" />
						<fo:table-column column-width="proportional-column-width(1)" />
						<fo:table-column column-width="proportional-column-width(1)" />
					<fo:table-body>
						<fo:table-row >
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									授信机构：<xsl:value-of select="ED04A/ED04AI02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									业务种类：<xsl:value-of select="ED04A/ED04AD03"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									账户状态：<xsl:value-of select="translate(translate(ED04B/ED04BD01,'1','未'),'2','已')"/>结清
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									五级分类：<xsl:value-of select="ED04B/ED04BD02"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
					</fo:table>
						<xsl:if test="ED04B/ED04BD01 = '1'">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="1pt" space-after="4pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										开立日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										币种
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										反担保方式
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										保证金比例
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										余额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										风险敞口
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										信息报告日期
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04A/ED04AI01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04A/ED04AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04A/ED04AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04A/ED04AD04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04A/ED04AJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04A/ED04AD05"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04A/ED04AQ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04B/ED04BJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04B/ED04BJ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04B/ED04BR01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						</xsl:if>
						<xsl:if test="ED04B/ED04BD01 = '2'">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="1pt" space-after="4pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										账户编号
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										开立日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										到期日
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										币种
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										关闭日期
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										垫款标志
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04A/ED04AI01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04A/ED04AR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04A/ED04AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04A/ED04AD04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04A/ED04AJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04B/ED04BR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ED04B/ED04BD03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						</xsl:if>
					</xsl:for-each>
					</xsl:if>
					<fo:block space-before="10pt" font-size="12pt" text-align="left" font-family="Simsun">
						二、非信贷记录明细
					</fo:block>
					<fo:block space-before="5pt" font-size="10pt" text-align="left" font-family="Simsun">
						公用事业历史缴费记录明细
					</fo:block>
					<xsl:if test="EEA/EE01 != ''">
					<xsl:for-each select="EEA/EE01">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" />
							<fo:table-column column-width="proportional-column-width(1)" />
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										公用事业单位名称：<xsl:value-of select="EE01A/EE01AQ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										业务类型：<xsl:value-of select="EE01A/EE01AD01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="1pt" space-after="4pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										统计年月
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										缴费状态
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										本月应缴金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										本月实缴金额
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										累计欠费金额
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EE01B/EE01BH">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EE01BR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EE01BD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EE01BJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EE01BJ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EE01BJ03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:for-each>
					</xsl:if>
					<fo:block space-before="10pt" font-size="12pt" text-align="left" font-family="Simsun">
						三、公共记录明细
					</fo:block>
					<fo:block space-before="5pt" font-size="10pt" text-align="left" font-family="Simsun">
						住房公积金历史缴费记录明细
					</fo:block>
					<xsl:if test="EFD/EF05 != ''">
					<xsl:for-each select="EFD/EF05">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="1pt" space-after="4pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										统计年月
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										缴费状态
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										本月应缴金额（元）
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										本月实缴金额（元）
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										累计欠费金额（元）
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="EF05B/EF05BH">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF05BR01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF05BD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF05BJ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF05BJ02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EF05BJ03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:for-each>
					</xsl:if>
<!-- 附件 2：财务报表信息 -->
					<xsl:if test="EAA !=''"></xsl:if>
					
				</fo:flow>
			</fo:page-sequence>
			
		</fo:root>
	</xsl:template>
</xsl:stylesheet>

