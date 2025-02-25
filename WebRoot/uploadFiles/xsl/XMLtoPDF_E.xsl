<?xml version="1.0" encoding="gb2312"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
	<!--���Title��ʽ-->
	<xsl:attribute-set name="myBorder">
		<xsl:attribute name="border">
			solid 1pt #6f6f6f
		</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:template match="/Document">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<!--��ҳҳ����-->
				<fo:simple-page-master master-name="home" page-height="11.5in" page-width="8.5in" margin-top="0.5in" margin-bottom="0.5in" >
					<fo:region-body margin-top="0.5in" margin-bottom="0.5in"/>
					<fo:region-before extent="0.5in"/>
					<fo:region-after extent="0.5in"/>
				</fo:simple-page-master>
				<!--����ҳ����-->
				<fo:simple-page-master master-name="all" page-height="11.5in" page-width="8.5in" margin-top="0.5in" margin-bottom="0.5in" margin-left="0.75in" margin-right="0.75in">
					<fo:region-body margin-top="0.5in" margin-bottom="0.5in"/>
					<fo:region-before extent="0.5in"/>
					<fo:region-after extent="0.5in"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			
			<!--��ҳģ��-->
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
							��ҵ���ñ���
							</fo:block>
							<fo:block font-size="15pt" font-family="KaiTi" line-height="24pt" space-after.optimum="15pt" color="black" text-align="center">
							(���Ż�����)
							</fo:block>
							<!--����ͷ-->
							<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="180pt">
								<fo:table-body>
									<fo:table-row >
										<fo:table-cell width="310pt" margin-left="160pt">
											<fo:block font-size="15pt" font-family="Simsun" line-height="25pt">
											��ҵ���ƣ�
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
											�����룺
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
											ͳһ��������룺
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
											��ѯԭ��
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
											��ѯ������
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
											����ʱ�䣺
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
			
			<!-- ����˵�� -->
			<fo:page-sequence master-reference="all" format="1">
				<!--ҳ��չʾ-->
				<fo:static-content flow-name="xsl-region-after">
					<fo:block text-align="center" font-size="10pt" font-family="serif" line-height="10pt">
					<fo:page-number/>
				</fo:block>
				</fo:static-content>				
				<fo:flow flow-name="xsl-region-body">				

					<xsl:if test="EAA/EA01 !=''">
						<fo:block space-after="20pt" font-weight="bold" font-size="15pt" text-align="center" font-family="Simsunbold">
							����˵��
						</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%">
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">1.</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										���������й����������������ĳ��ߣ����ݽ�ֹ����ʱ������ϵͳ��¼����Ϣ���ɡ����������ı�ע�⣬��Ϣ������������ṩ��������Ϣ�����ṩ���������Ĳ���֤����ʵ�Ժ�׼ȷ�ԣ�����ŵ����Ϣ���ܡ��ӹ������ϵ�ȫ�����б��ֿ͹ۡ������ĵ�λ��
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">2.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										��������չʾ�Ļ�����Ϣ��������ϵͳ�Բ�ͬ������Դ�ṩ��ͬһ����Ϣ���������Ϣ�������Ϻ�Ľ����
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">3.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										���������Ŵ����װ���������׺͵������ס�
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">4.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										�������н�����װ���������ʽ�Ĵ��Ҳ�����Ը��������������ʵ�ʵ�����ǽ������Ϊ�������ʷ�������ȷ�������εĽ��ס������Ĳ�Ʒ������������ó�����ʡ�Ʊ�����֡�����͸֧���������ޡ��ع������ƽ�֤ȯ�������˾����ծ�ȡ�
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">5.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										�������е�������ָ�����˺�ծȨ��Լ������ծ���˲�����ծ��ʱ�������˰�Լ������ծ�����Ϊ������������û�е�����ͬԼ������ծ����ΥԼʱ��������ʵ����Ҫ��������Ϊ�������Ĳ�Ʒ������������гжһ�Ʊ������֤�����б��������ʵ�����˾�ṩ�ĵ������񣬱��չ�˾�ṩ�����ñ�֤���շ��� 
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">6.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										�������б�׷��ҵ����ָʣ�౾Ϣ���ڴ���״̬����ծȨ��Ҫ��ծ���˾���黹ȫ�����Ľ�����ס������Ĳ�Ʒ������������ʲ�����˾���õ�ծ�񡢵���������������
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">7.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										�������еĶ��ڽ��г��ڽ����ָ��������г���׷��ҵ��ѭ��͸֧������֮���ҵ�񣬰��ա�������޷��ࡱ���֣��ֱ��Ӧ���еĶ��ڡ����ںͳ��ڡ�
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">8.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										�������н�����׵���������ָ����׷��ҵ��֮�⣬�弶����Ϊ�������������弶����Ϊ��δ���ࡱ����������Ϊ0��ҵ�񣻹�ע����ָ����׷��ҵ��֮�⣬�弶����Ϊ����ע�������弶����Ϊ��δ���ࡱ������0��90���ҵ�񣻲�������ָ����׷��ҵ��֮�⣬�弶����Ϊ���μ����������ɡ�������ʧ������ΥԼ�������弶����Ϊ��δ���ࡱ������90�����ϵ�ҵ��
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">9.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										�������е������׵������ࡢ��ע�ࡢ������ֱ��Ӧ�弶����Ϊ��������ע�ͺ������ҵ��
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">10.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										����������Ϣ��Ҫ�����еĸ�ծ��ʷ��Ϣ�����и�ծ��ָ���Ŵ�������������ծ�������ܶ���ڱ�����ָ����׷��ҵ��֮��Ľ�����׵������ܶ��ǷϢ���ϼƼ����ڱ���ϼơ�
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">11.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										�������չʾһ�����޷�Χ�ڵ��ѽ����Ŵ���Ϣ�����Ŵ���Ϣ��������Ϣ��
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">12.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										�����ر�˵�����������еĽ���������λ��Ϊ��Ԫ��
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">13.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										�����ر�˵�����������еĽ��������������Ϊ����ҼƼۡ����������ҵļ������ݹ���������ֵ��¹����ĸ��ֻ��Ҷ���Ԫ�����ʱ�
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">14.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										����Ϣ��¼б��չʾ����˵����Ϣ����Դ�����¼�������顣
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">15.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										�����ṩ����˵���Ǳ��������Ա����е���Ϣ��¼�����Ϣ���������Ĳ���˵����
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">16.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										��������˵�����������ĶԱ����е���Ϣ��¼�����Ϣ����������˵����
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">17.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										��Ϣ������������Ϣ����Ա��������ṩ����Ϣ��¼�����ļ�Ҫ˵����
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell width="20pt">
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">18.</fo:block>
									</fo:table-cell>
									<fo:table-cell >
										<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
										������������ڻ�����������Ϣ�����Լ��ʹ�ã������Ʊ��ܡ���ʹ�ò�����������׵ģ��������Ĳ��е�������Ρ�
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
						<!--������ʾ-->
						<xsl:if test="EAA/EA01/EA01E != ''">
							<fo:block font-size="10pt" font-family="Simsun" space-before="13pt" >
							���ʣ���Ԫ������ң���<xsl:value-of select="EAA/EA01/EA01E/EA01EQ01"/>&#160;&#160;��Ч�ڣ�<xsl:value-of select="EAA/EA01/EA01E/EA01ER01"/>
							</fo:block>
						</xsl:if>
					</xsl:if>
				</fo:flow>
			</fo:page-sequence>
			<!--����ģ��-->
			<fo:page-sequence master-reference="all" format="1">
				<!--ҳ��չʾ-->
				<fo:static-content flow-name="xsl-region-after">
					<fo:block text-align="center" font-size="10pt" font-family="serif" line-height="10pt">
					<fo:page-number/>
				</fo:block>
				</fo:static-content>				
				<fo:flow flow-name="xsl-region-body">
<!-- ��ݱ�ʶ -->
					<xsl:if test="EAA/EA01/EA01C !=''">
						<fo:block space-before="20pt" font-weight="bold" font-size="15pt" text-align="center" font-family="Simsunbold">
							��ݱ�ʶ
						</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ҵ����
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
<!-- ������ʾ -->
					<xsl:if test="EAA/EA01/EA01D !=''">
						<fo:block space-before="20pt" font-weight="bold" font-size="15pt" text-align="center" font-family="Simsunbold">
							������ʾ
						</fo:block>
						<fo:block font-size="10pt" font-family="Simsun" space-before="13pt">
							��Ϣ��������ñ������������ <xsl:value-of select="EAA/EA01/EA01D/EA01DS01"/> �����������ڴ����У������ʱע���Ķ�������ݡ�
						</fo:block>					
					</xsl:if>
<!-- ��Ϣ��Ҫ -->
					<fo:block space-before="20pt" font-weight="bold" font-size="15pt" text-align="center" font-family="Simsunbold">
						��Ϣ��Ҫ
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
										�״����Ŵ����׵����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����Ŵ����׵Ļ�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ǰ��δ�����Ŵ����׵Ļ�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�״�����ػ������ε����
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
										�������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell>
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										&#160;���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBA/EB01/EB01A/EB01AJ01"/>&#160;
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										&#160;���
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
										&#160;���У���׷�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBA/EB01/EB01A/EB01AJ02"/>&#160;
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										&#160;���У���ע�����
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
										&#160;&#160;&#160;&#160;��ע�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="EBA/EB01/EB01A/EB01AJ03"/>&#160;
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										&#160;&#160;&#160;&#160;���������
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
										&#160;&#160;&#160;&#160;���������
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
										���Ŵ������˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										Ƿ˰��¼����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����о���¼����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ǿ��ִ�м�¼����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����������¼����
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
					<!-- δ�����Ŵ���������Ϣ��Ҫ -->
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
							δ�����Ŵ���������Ϣ��Ҫ
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
										���ʲ�����˾���õ�ծ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��Ϣ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�ܶ�
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
										������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ע��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�ϼ�
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�г��ڽ��
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBB/EB02/EB02A/EB02AH">
								<xsl:sort select="EB02AD02"/>
								<xsl:if test="EB02AD01 = '1' and EB02AD02 != 0"><!-- ��ȡ�ϼ� -->
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
								<xsl:if test="EB02AD01 = '1' and EB02AD02 = 0"><!-- ȡ�ϼ� -->
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
										���ڽ��
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBB/EB02/EB02A/EB02AH">
								<xsl:sort select="EB02AD02"/>
								<xsl:if test="EB02AD01 = '2' and EB02AD02 != 0"><!-- ��ȡ�ϼ� -->
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
								<xsl:if test="EB02AD01 = '2' and EB02AD02 = 0"><!-- ȡ�ϼ� -->
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
										ѭ��͸֧
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBB/EB02/EB02A/EB02AH">
								<xsl:sort select="EB02AD02"/>
								<xsl:if test="EB02AD01 = '3' and EB02AD02 != 0"><!-- ��ȡ�ϼ� -->
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
								<xsl:if test="EB02AD01 = '3' and EB02AD02 = 0"><!-- ȡ�ϼ� -->
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
										����
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBB/EB02/EB02A/EB02AH">
								<xsl:sort select="EB02AD02"/>
								<xsl:if test="EB02AD01 = '4' and EB02AD02 != 0"><!-- ��ȡ�ϼ� -->
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
								<xsl:if test="EB02AD01 = '4' and EB02AD02 = 0"><!-- ȡ�ϼ� -->
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
										�ϼ�
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBB/EB02/EB02A/EB02AH">
								<xsl:sort select="EB02AD02"/>
								<xsl:if test="EB02AD01 = '0' and EB02AD02 != 0"><!-- ��ȡ�ϼ� -->
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
								<xsl:if test="EB02AD01 = '0' and EB02AD02 = 0"><!-- ȡ�ϼ� -->
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
										������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ע��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�ϼ�
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���гжһ�Ʊ
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBC/EB03/EB03A/EB03AH">
								<xsl:sort select="EB03AD02"/>
								<xsl:if test="EB03AD01 = '1' and EB03AD02 != 0"><!-- ��ȡ�ϼ� -->
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
								<xsl:if test="EB03AD01 = '1' and EB03AD02 = 0"><!-- ȡ�ϼ� -->
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
										����֤
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBC/EB03/EB03A/EB03AH">
								<xsl:sort select="EB03AD02"/>
								<xsl:if test="EB03AD01 = '2' and EB03AD02 != 0"><!-- ��ȡ�ϼ� -->
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
								<xsl:if test="EB03AD01 = '2' and EB03AD02 = 0"><!-- ȡ�ϼ� -->
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
										���б���
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBC/EB03/EB03A/EB03AH">
								<xsl:sort select="EB03AD02"/>
								<xsl:if test="EB03AD01 = '3' and EB03AD02 != 0"><!-- ��ȡ�ϼ� -->
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
								<xsl:if test="EB03AD01 = '3' and EB03AD02 = 0"><!-- ȡ�ϼ� -->
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
										����
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBC/EB03/EB03A/EB03AH">
								<xsl:sort select="EB03AD02"/>
								<xsl:if test="EB03AD01 = '9' and EB03AD02 != 0"><!-- ��ȡ�ϼ� -->
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
								<xsl:if test="EB03AD01 = '9' and EB03AD02 = 0"><!-- ȡ�ϼ� -->
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
										�ϼ�
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
										��ѭ�����ö��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ѭ�����ö��
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ö��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ʣ����ö��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ö��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ʣ����ö��
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
										&#160;˵���� ���ڴ��������޶�Ŀ��ƣ� ʣ����ö���޷�׼ȷ���㣬��Ҫ���������ϸ��Ϣ���й��㡣
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:if>
						</fo:table-body>
						</fo:table>
					<!-- ��ػ���������Ϣ��Ҫ -->					
					<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
						��ػ���������Ϣ��Ҫ
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
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��׷��ҵ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����������
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�������ν��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�������ν��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ע�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���������
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
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�������ν��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ע�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���������
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
					<!-- �ѽ����Ŵ���Ϣ��Ҫ -->					
					<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
						�ѽ����Ŵ���Ϣ��Ҫ
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
										���ʲ�����˾���õ�ծ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
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
										�������˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ע���˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�������˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�ϼ�
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�г��ڽ��
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBB/EB02/EB02B/EB02BH">
									<xsl:sort select="EB02BD01"/>
									<xsl:if test="EB02BD01 = '1' and EB02BD02 != 0"><!-- ��ȡ�ϼ� -->
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB02BS04"/>
										</fo:block>
									</fo:table-cell>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="EBB/EB02/EB02B/EB02BH">
									<xsl:if test="EB02BD01 = '1' and EB02BD02 = 0"><!-- ȡ�ϼ� -->
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
										���ڽ��
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBB/EB02/EB02B/EB02BH">
									<xsl:sort select="EB02BD01"/>
									<xsl:if test="EB02BD01 = '2' and EB02BD02 != 0"><!-- ��ȡ�ϼ� -->
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB02BS04"/>
										</fo:block>
									</fo:table-cell>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="EBB/EB02/EB02B/EB02BH">
									<xsl:if test="EB02BD01 = '2' and EB02BD02 = 0"><!-- ȡ�ϼ� -->
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
										ѭ��͸֧
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBB/EB02/EB02B/EB02BH">
									<xsl:sort select="EB02BD01"/>
									<xsl:if test="EB02BD01 = '3' and EB02BD02 != 0"><!-- ��ȡ�ϼ� -->
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB02BS04"/>
										</fo:block>
									</fo:table-cell>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="EBB/EB02/EB02B/EB02BH">
									<xsl:if test="EB02BD01 = '3' and EB02BD02 = 0"><!-- ȡ�ϼ� -->
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
										����
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBB/EB02/EB02B/EB02BH">
									<xsl:sort select="EB02BD01"/>
									<xsl:if test="EB02BD01 = '4' and EB02BD02 != 0"><!-- ��ȡ�ϼ� -->
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB02BS04"/>
										</fo:block>
									</fo:table-cell>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="EBB/EB02/EB02B/EB02BH">
									<xsl:if test="EB02BD01 = '4' and EB02BD02 = 0"><!-- ȡ�ϼ� -->
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
										�ϼ�
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBB/EB02/EB02B/EB02BH">
									<xsl:sort select="EB02BD01"/>
									<xsl:if test="EB02BD01 = '0' and EB02BD02 != 0"><!-- ��ȡ�ϼ� -->
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB02BS04"/>
										</fo:block>
									</fo:table-cell>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="EBB/EB02/EB02B/EB02BH">
									<xsl:if test="EB02BD01 = '0' and EB02BD02 = 0"><!-- ȡ�ϼ� -->
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
										�������˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ע���˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�������˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�ϼ�
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���гжһ�Ʊ
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBC/EB03/EB03B/EB03BH">
									<xsl:if test="EB03BD01 = '1' and EB03BD02 != 0"><!-- ��ȡ�ϼ� -->
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB03BS02"/>
										</fo:block>
									</fo:table-cell>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="EBC/EB03/EB03B/EB03BH">
									<xsl:if test="EB03BD01 = '1' and EB03BD02 = 0"><!-- ȡ�ϼ� -->
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
										����֤
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBC/EB03/EB03B/EB03BH">
									<xsl:if test="EB03BD01 = '2' and EB03BD02 != 0"><!-- ��ȡ�ϼ� -->
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB03BS02"/>
										</fo:block>
									</fo:table-cell>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="EBC/EB03/EB03B/EB03BH">
									<xsl:if test="EB03BD01 = '2' and EB03BD02 = 0"><!-- ȡ�ϼ� -->
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
										���б���
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBC/EB03/EB03B/EB03BH">
									<xsl:if test="EB03BD01 = '3' and EB03BD02 != 0"><!-- ��ȡ�ϼ� -->
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB03BS02"/>
										</fo:block>
									</fo:table-cell>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="EBC/EB03/EB03B/EB03BH">
									<xsl:if test="EB03BD01 = '3' and EB03BD02 = 0"><!-- ȡ�ϼ� -->
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
										����
									</fo:block>
								</fo:table-cell>
								<xsl:for-each select="EBC/EB03/EB03B/EB03BH">
									<xsl:if test="EB03BD01 = '9' and EB03BD02 != 0"><!-- ��ȡ�ϼ� -->
									<fo:table-cell >
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											<xsl:value-of select="EB03BS02"/>
										</fo:block>
									</fo:table-cell>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="EBC/EB03/EB03B/EB03BH">
									<xsl:if test="EB03BD01 = '9' and EB03BD02 = 0"><!-- ȡ�ϼ� -->
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
										�ϼ�
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
					<!-- ��ծ��ʷ -->					
					<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
						��ծ��ʷ
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
										ȫ����ծ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ע�ฺծ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����ฺծ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����ฺծ
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ڱ���
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
						��
					</fo:block>
					</xsl:if>
<!-- ������Ϣ -->
					<fo:block space-before="20pt" font-weight="bold" font-size="15pt" text-align="center" font-family="Simsunbold">
						������Ϣ
					</fo:block>
					<xsl:if test="ECA !=''">
					<!-- �����ſ���Ϣ -->
					<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
						�����ſ���Ϣ
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
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ECA/EC01/EC010D01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��֯��������
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
										��ҵ��ģ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ECA/EC01/EC010D03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������ҵ
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
										�������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										<xsl:value-of select="ECA/EC01/EC010R01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�Ǽ�֤����Ч��ֹ����
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
										�Ǽǵ�ַ
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
										�칫/��Ӫ��ַ
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
										����״̬
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
					<!-- ע���ʱ�����Ҫ��������Ϣ -->
					<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
						ע���ʱ�����Ҫ��������Ϣ
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
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell xsl:use-attribute-sets="myBorder">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ʷ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell xsl:use-attribute-sets="myBorder">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ݱ�ʶ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell xsl:use-attribute-sets="myBorder">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ݱ�ʶ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell xsl:use-attribute-sets="myBorder">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ʱ���
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
										ע���ʱ�������Һϼ� <xsl:value-of select="ECA/EC02/EC020J01"/> ��Ԫ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										�������ڣ�<xsl:value-of select="ECA/EC02/EC020R01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:if>
							<xsl:if test="ECA/EC02/EC020J01 =''">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										�������ڣ�<xsl:value-of select="ECA/EC02/EC020R01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:if>
						</fo:table-body>
						</fo:table>
					<!-- ��Ҫ�����Ա��Ϣ -->					
					<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
						��Ҫ�����Ա��Ϣ
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
										ְλ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										֤������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										֤������
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
										�������ڣ�<xsl:value-of select="ECA/EC03/EC030R01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
						</fo:table>
					<!-- �ϼ����� -->					
					<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
						�ϼ�����
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
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ݱ�ʶ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ݱ�ʶ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
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
					<!-- ʵ�ʿ����� -->
					<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
						ʵ�ʿ�����
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
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ݱ�ʶ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ݱ�ʶ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
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
						��
					</fo:block>
					</xsl:if>
<!-- �Ŵ���¼��ϸ -->
					<fo:block space-before="20pt" font-weight="bold" font-size="15pt" text-align="center" font-family="Simsunbold">
						�Ŵ���¼��ϸ
					</fo:block>
					<xsl:if test="EDA !=''">
					<!-- ��׷��ҵ�� -->
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="10pt" font-family="Simsun">
										��׷��ҵ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										�� <xsl:value-of select="count(EDA/ED01/ED01A[ED01AD02 = 'C1'])"/> ��
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
										�˻����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ծȨ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ҵ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��Ϣ��������
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�ر�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������ʽ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ʷ����
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
										������
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					<!-- δ�����Ŵ� -->
					<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
						δ�����Ŵ�
					</fo:block>
					<xsl:if test="EDA/ED03 != ''">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										ǷϢ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										�� <xsl:value-of select="count(ED03)"/> ��
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
										���Ż���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ǷϢ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ǷϢ���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���仯����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��Ϣ��������
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
					<!-- �г��ڽ�� -->
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										�г��ڽ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										�� <xsl:value-of select="count(EDA/ED01/ED01A[ED01AD01 ='1' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and (ED01AD03 = '20' or ED01AD03 ='30')])"/> ��
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
										�˻����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���Ż���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ҵ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������ʽ
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������ʽ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ڱ���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������ʽ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�ض�������ʾ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����Э����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ʷ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��Ϣ��������
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
										������
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
					<!-- ���ڽ�� -->
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										���ڽ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										�� <xsl:value-of select="count(EDA/ED01/ED01A[ED01AD01 ='1' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and ED01AD03 = '10'])"/> ��
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
										�˻����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���Ż���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ҵ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������ʽ
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������ʽ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ڱ���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������ʽ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�ض�������ʾ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����Э����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ʷ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��Ϣ��������
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
										������
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
					<!-- ѭ��͸֧ -->
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										ѭ��͸֧
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										�� <xsl:value-of select="count(EDA/ED01/ED01A[ED01AD01 ='1' and ED01AD02 = 'R1'])"/> ��
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
										�˻����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���Ż���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ҵ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ö��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������ʽ
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������ʽ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ڱ���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������ʽ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ʣ�໹������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�ض�������ʾ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����Э����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ʷ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��Ϣ��������
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
										������
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
					<!-- ���� -->
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										�� <xsl:value-of select="sum(EDA/ED02/ED020S01[text() != ''])"/> ��
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
										���Ż���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ҵ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ڱ���
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
					<!-- ���гжһ�Ʊ������֤ -->
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										���гжһ�Ʊ������֤
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										�� <xsl:value-of select="sum(EDB/ED05/ED050S01[(../ED050D02 ='51' or ../ED050D02 ='61') and text() != ''])"/> ��
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
										���Ż���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ҵ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����ա�30��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����ա�60��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����ա�90��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������>90��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�ϼ�
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
					<!-- ���б���������ҵ�� -->
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										���б���������ҵ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										�� <xsl:value-of select="sum(EDB/ED05/ED050S01[../ED050D02 !='51' and ../ED050D02 !='61' and text() != ''])"/> ��
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
										���Ż���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ҵ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
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
					<!-- ������Ϣ -->
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										������Ϣ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										�� <xsl:value-of select="count(EDC/ED06/ED060I01)"/> ��
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
										����Э����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���Ż���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���Ŷ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ѭ����־
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��Ч����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��Ϣ��������
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���Ŷ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ö��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����޶�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����޶���
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
					<!-- �ѽ����Ŵ� -->
					<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
						�ѽ����Ŵ�
					</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										�г��ڽ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										�� <xsl:value-of select="count(EDA/ED01/ED01A[ED01AD01 ='2' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and (ED01AD03 = '20' or ED01AD03 ='30')])"/> ��
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
										�˻����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���Ż���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ҵ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�ر�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ�λ�����ʽ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ʷ����
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
										������
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
										���ڽ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										�� <xsl:value-of select="count(EDA/ED01/ED01A[ED01AD01='2' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and ED01AD03 = '10'])"/> ��
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
										�˻����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���Ż���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ҵ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�ر�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ�λ�����ʽ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ʷ����
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
										������
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
										ѭ��͸֧
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										�� <xsl:value-of select="count(EDA/ED01/ED01A[ED01AD01='2' and ED01AD02 = 'R1'])"/> ��
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
										�˻����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���Ż���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ҵ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ö��
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�ر�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ�λ�����ʽ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ʷ����
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
										������
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
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										�� <xsl:value-of select="sum(EDA/ED02/ED020S02[text() != ''])"/> ��
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
										���Ż���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ҵ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ֽ��
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
										���гжһ�Ʊ������֤
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										�� <xsl:value-of select="sum(EDB/ED05/ED050S02[(../ED050D02 ='51' or ../ED050D02 ='61') and text() != ''])"/> ��
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
										���Ż���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ҵ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����־
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
										���б���������ҵ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										�� <xsl:value-of select="sum(EDB/ED05/ED050S02[../ED050D02 !='51' and ../ED050D02 !='61' and text() != ''])"/> ��
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
										���Ż���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ҵ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����־
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
					<!-- ��ػ������� -->
					<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
						��ػ�������
					</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										Ϊ��������˳е�����ػ�������
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="9pt" font-family="Simsun">
										�������������ҵ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										�� <xsl:value-of select="count(EDD/ED07)"/> ��
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
										�˻����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��֤��ͬ
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���Ż���/
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ծȨ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ҵ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������/
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����/
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ö��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ڱ���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������/
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����״̬
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ʣ�໹��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��Ϣ��������
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
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										�� <xsl:value-of select="count(EDD/ED08)"/> ��
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
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��֤��ͬ
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���Ż���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ҵ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ڱ���
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
										Ϊ�������׳е�����ػ�������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										�� <xsl:value-of select="count(EDD/ED09)"/> ��
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
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��֤��ͬ���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�������ν��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���Ż���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ҵ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
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
						��
					</fo:block>
					</xsl:if>
<!-- ���Ŵ���¼��ϸ -->
					<fo:block space-before="20pt" font-weight="bold" font-size="15pt" text-align="center" font-family="Simsunbold">
						���Ŵ���¼��ϸ
					</fo:block>
					<xsl:if test="EEA !=''">
					<!-- ������ҵ�ɷ���Ϣ -->
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="10pt">
							<fo:table-column column-width="proportional-column-width(1)"/>
							<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row >
								<fo:table-cell >
									<fo:block text-align="left" font-size="10pt" font-family="Simsun">
										������ҵ�ɷ���Ϣ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
										�� <xsl:value-of select="count(EEA/EE01)"/> ��
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
										������ҵ��λ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ҵ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�ɷ�״̬
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�ۼ�Ƿ�ѽ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ͳ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�鿴��ȥ 24 ���½ɷ����
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
										������
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:if>
					<xsl:if test="count(EEA/child::*) = 0 ">
					<fo:block space-before="10pt" font-size="10pt" text-align="center" font-family="Simsun">
						��
					</fo:block>
					</xsl:if>
<!-- ������¼��ϸ -->
					<fo:block space-before="20pt" font-weight="bold" font-size="15pt" text-align="center" font-family="Simsunbold">
						������¼��ϸ
					</fo:block>
					<!-- Ƿ˰��Ϣ -->
					<xsl:if test="EFA/EF01 !=''">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun" color="red">
							Ƿ˰��Ϣ
						</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����˰�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										Ƿ˰�ܶԪ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										Ƿ˰ͳ������
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
					<!-- �����о���¼ -->
					<xsl:if test="EFB/EF02 !=''">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun" color="red">
							�����о���¼
						</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<xsl:for-each select="EFB/EF02">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										������Ժ��<xsl:value-of select="EF020Q01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										�������ڣ�<xsl:value-of select="EF020R01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										���ɣ�<xsl:value-of select="EF020Q02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										���ϵ�λ��<xsl:value-of select="EF020D01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										���ţ�<xsl:value-of select="EF020I02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										���г���<xsl:value-of select="EF020D02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										���ϱ�ģ�<xsl:value-of select="EF020Q03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										���ϱ�Ľ�Ԫ����<xsl:value-of select="EF020J01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										�᰸��ʽ��<xsl:value-of select="EF020D03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										�о�/������Ч���ڣ�<xsl:value-of select="EF020R02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-columns-spanned="2">
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										�о�/��������<xsl:value-of select="EF020Q04"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:if>
					<!-- ǿ��ִ�м�¼ -->
					<xsl:if test="EFB/EF03 !=''">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun" color="red">
							ǿ��ִ�м�¼
						</fo:block>
						<xsl:for-each select="EFB/EF03">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										������Ժ��<xsl:value-of select="EF030Q01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										�������ڣ�<xsl:value-of select="EF030R01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										���ɣ�<xsl:value-of select="EF030Q02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										���ţ�<xsl:value-of select="EF030I02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										����ִ�б�ģ�<xsl:value-of select="EF030Q03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										����ִ�б�Ľ�Ԫ����<xsl:value-of select="EF030J01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										����״̬��<xsl:value-of select="EF030Q04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										�᰸��ʽ��<xsl:value-of select="EF030D01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										��ִ�б�ģ�<xsl:value-of select="EF030Q05"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										��ִ�б�Ľ�Ԫ����<xsl:value-of select="EF030J02"/>
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
					<!-- ����������Ϣ -->
					<xsl:if test="EFC/EF04 !=''">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun" color="red">
							����������Ϣ
						</fo:block>
						<xsl:for-each select="EFC/EF04">
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										����������<xsl:value-of select="EF040Q01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										�����������ĺţ�<xsl:value-of select="EF040I02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										Υ����Ϊ��<xsl:value-of select="EF040Q02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										�������ڣ�<xsl:value-of select="EF040R01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										����������<xsl:value-of select="EF040Q03"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										������Ԫ����<xsl:value-of select="EF040J01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										����ִ�������<xsl:value-of select="EF040Q04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										������������<xsl:value-of select="EF040Q05"/>
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
					<!-- ס��������ν���Ϣ -->
					<xsl:if test="EFD/EF05 !=''">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
							ס��������ν���Ϣ
						</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<xsl:for-each select="EFD/EF05">
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										ͳ�����£�<xsl:value-of select="EF05A/EF05AR04"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										�������£�<xsl:value-of select="EF05A/EF05AR01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										ְ��������<xsl:value-of select="EF05A/EF05AS01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										�ɷѻ�����Ԫ����<xsl:value-of select="EF05A/EF05AJ01"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										���һ�νɷ����ڣ�<xsl:value-of select="EF05A/EF05AR02"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										�������£�<xsl:value-of select="EF05A/EF05AR03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										�ɷ�״̬��<xsl:value-of select="EF05A/EF05AD01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										�ۼ�Ƿ�ѽ�Ԫ����<xsl:value-of select="EF05A/EF05AJ02"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
						</fo:table>
					</xsl:if>
					<!-- �����ɼ�¼ -->
					<xsl:if test="EFE/EF06 !=''">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
							�����ɼ�¼
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
										��ɲ���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ֹ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�������
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
					<!-- �����֤��¼ -->
					<xsl:if test="EFE/EF07 !=''">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
							�����֤��¼
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
										��֤����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��֤����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��֤����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ֹ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��֤����
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
					<!-- ������ʼ�¼ -->
					<xsl:if test="EFE/EF08 !=''">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
							������ʼ�¼
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
										�϶�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��׼����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ֹ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
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
					<!-- ��ý�����¼ -->
					<xsl:if test="EFE/EF09 !=''">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
							��ý�����¼
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
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ֹ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������ʵ
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
					<!-- ӵ��ר����� -->
					<xsl:if test="EFE/EF10 !=''">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
							ӵ��ר�����
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
										ר������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ר����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ר����Ч�ڣ���λ���꣩
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
					<!-- ���뾳���������ɫͨ����Ϣ -->
					<xsl:if test="EFF/EF11 !=''">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
							���뾳���������ɫͨ����Ϣ
						</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��׼����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������Ʒ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��Ч����
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
					<!-- ��������Ʒ������Ϣ -->
					<xsl:if test="EFF/EF12 !=''">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
							��������Ʒ������Ϣ
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
										��׼����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������Ʒ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ֹ����
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
					<!-- ��������Ʒ�����������Ϣ -->
					<xsl:if test="EFF/EF13 !=''">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
							��������Ʒ�����������Ϣ
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
										��ܲ���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��Ͻֱ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ܼ���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��Ч����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ֹ����
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
					<!-- ���ʹ�ģ������Ϣ -->
					<xsl:if test="EFG/EF14 !=''">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
							���ʹ�ģ������Ϣ
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
										������¼
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ʿ�������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ģ
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
						��
					</fo:block>
					</xsl:if>
<!-- ���񱨱� -->
					<xsl:if test="EGA !=''"/>
<!-- ������Ϣ -->
					<fo:block space-before="20pt" font-weight="bold" font-size="15pt" text-align="center" font-family="Simsunbold">
						������Ϣ
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
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
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
						��
					</fo:block>
					</xsl:if>
<!-- �����������ע��Ϣ -->
					<fo:block space-before="20pt" font-weight="bold" font-size="15pt" text-align="center" font-family="Simsunbold">
						�����������ע��Ϣ
					</fo:block>
					<xsl:if test="EIA/EI01[EI010D02='1']">
						<fo:block space-before="10pt" font-size="10pt" text-align="left" font-family="Simsun">
							�����ṩ����˵��
						</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="10%" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="70%" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="20%" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����ṩ����˵��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�������
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
							��������˵��
						</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="10%" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="70%" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="20%" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������˵��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�������
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
							��Ϣ��������
						</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="10%" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="70%" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="20%" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��Ϣ��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�������
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
							�����ע
						</fo:block>
						<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="2pt">
							<fo:table-column column-width="10%" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="70%" xsl:use-attribute-sets="myBorder"/>
							<fo:table-column column-width="20%" xsl:use-attribute-sets="myBorder"/>
						<fo:table-body>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����ע
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�������
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
						��
					</fo:block>
					</xsl:if>
				</fo:flow>
			</fo:page-sequence>
			
			<!--���� 1 ģ��-->
			<fo:page-sequence master-reference="all" format="1">
				<!--ҳ��չʾ-->
				<fo:static-content flow-name="xsl-region-after">
					<fo:block text-align="center" font-size="10pt" font-family="serif" line-height="10pt">
					<fo:page-number/>
				</fo:block>
				</fo:static-content>				
				<fo:flow flow-name="xsl-region-body">
<!-- ���� 1�����ü�¼������Ϣ -->
					<fo:block font-weight="bold" font-size="15pt" text-align="left" font-family="Simsunbold">
						���� 1�����ü�¼������Ϣ
					</fo:block>
					<fo:block space-before="10pt" font-size="12pt" text-align="left" font-family="Simsun">
						һ���Ŵ���¼��ϸ
					</fo:block>
					<fo:block space-before="5pt" font-size="10pt" text-align="left" font-family="Simsun">
						(һ)��׷����¼����ʷ����
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
									<xsl:value-of select="position()"/>.�˻���ţ�<xsl:value-of select="ED01A/ED01AI01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									�˻�״̬��<xsl:value-of select="translate(translate(ED01A/ED01AD01,'1','δ'),'2','��')"/>����
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									���Ż�����<xsl:value-of select="ED01A/ED01AI02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									ҵ�����ࣺ<xsl:value-of select="ED01A/ED01AD06"/>
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
										��Ϣ��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���仯����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�϶�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ʵ�ʻ�������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ʵ���ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������ʽ
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
						(��)�г��ڽ�����ʷ����
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
									<xsl:value-of select="position()"/>.�˻���ţ�<xsl:value-of select="ED01A/ED01AI01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									�˻�״̬��<xsl:value-of select="translate(translate(ED01A/ED01AD01,'1','δ'),'2','��')"/>����
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									���Ż�����<xsl:value-of select="ED01A/ED01AI02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									ҵ�����ࣺ<xsl:value-of select="ED01A/ED01AD06"/>
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
										��Ϣ��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���仯����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶�����϶�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ڱ���
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										Լ����������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��Ӧ���ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ʵ�ʻ�������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��ʵ���ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ�λ�����ʽ
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
										�ض�������ʾ
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���׽��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�������ڱ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������ϸ��Ϣ
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
						(��)���ڽ�����ʷ����
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
									<xsl:value-of select="position()"/>.�˻���ţ�<xsl:value-of select="ED01A/ED01AI01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									�˻�״̬��<xsl:value-of select="translate(translate(ED01A/ED01AD01,'1','δ'),'2','��')"/>����
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									���Ż�����<xsl:value-of select="ED01A/ED01AI02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									ҵ�����ࣺ<xsl:value-of select="ED01A/ED01AD06"/>
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
										��Ϣ��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���仯����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶�����϶�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ڱ���
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										Լ����������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��Ӧ���ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ʵ�ʻ�������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��ʵ���ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ�λ�����ʽ
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
										�ض�������ʾ
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���׽��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�������ڱ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������ϸ��Ϣ
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
						(��)ѭ��͸֧����ʷ����
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
									<xsl:value-of select="position()"/>.�˻���ţ�<xsl:value-of select="ED01A/ED01AI01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									�˻�״̬��<xsl:value-of select="translate(translate(ED01A/ED01AD01,'1','δ'),'2','��')"/>����
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									���Ż�����<xsl:value-of select="ED01A/ED01AI02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									ҵ�����ࣺ<xsl:value-of select="ED01A/ED01AD06"/>
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
										��Ϣ��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���仯����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶�����϶�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ڱ���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										Լ����������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��Ӧ���ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ʵ�ʻ�������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��ʵ���ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ�λ�����ʽ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ʣ�໹������
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
										�ض�������ʾ
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���׽��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�������ڱ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������ϸ��Ϣ
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
						(��)���ֵ��Ŵ���ϸ����ʷ����
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
									<xsl:value-of select="position()"/>.�˻���ţ�<xsl:value-of select="ED01A/ED01AI01"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									�˻�״̬��<xsl:value-of select="translate(translate(ED01A/ED01AD01,'1','δ'),'2','��')"/>����
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									���Ż�����<xsl:value-of select="ED01A/ED01AI02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									ҵ�����ࣺ<xsl:value-of select="ED01A/ED01AD06"/>
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
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ֽ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������ʽ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����Э����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��Ϣ��������
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
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ֽ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�ر�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ�λ�������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ�λ�����ʽ
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
										��ʷ����
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell number-rows-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��Ϣ��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���仯����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶�����϶�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ڱ���
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										Լ����������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��Ӧ���ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��
									</fo:block>
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ʵ�ʻ�������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ��ʵ���ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ�λ�����ʽ
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
										�ض�������ʾ
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���׽��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�������ڱ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������ϸ��Ϣ
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
						(��)���гжһ�Ʊ������֤���Ŵ���ϸ
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
									���Ż�����<xsl:value-of select="ED04A/ED04AI02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									ҵ�����ࣺ<xsl:value-of select="ED04A/ED04AD03"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									�˻�״̬��<xsl:value-of select="translate(translate(ED04B/ED04BD01,'1','δ'),'2','��')"/>����
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									�弶���ࣺ<xsl:value-of select="ED04B/ED04BD02"/>
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
										�˻����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������ʽ
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��֤�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ճ���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����Э����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��Ϣ��������
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
										�˻����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�ر�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����־
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
						(��)���б���������ҵ����Ŵ���ϸ
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
									���Ż�����<xsl:value-of select="ED04A/ED04AI02"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									ҵ�����ࣺ<xsl:value-of select="ED04A/ED04AD03"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									�˻�״̬��<xsl:value-of select="translate(translate(ED04B/ED04BD01,'1','δ'),'2','��')"/>����
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
								<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
									�弶���ࣺ<xsl:value-of select="ED04B/ED04BD02"/>
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
										�˻����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������ʽ
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��֤�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ճ���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="2" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��Ϣ��������
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
										�˻����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�ر�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����־
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
						�������Ŵ���¼��ϸ
					</fo:block>
					<fo:block space-before="5pt" font-size="10pt" text-align="left" font-family="Simsun">
						������ҵ��ʷ�ɷѼ�¼��ϸ
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
										������ҵ��λ���ƣ�<xsl:value-of select="EE01A/EE01AQ01"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block text-align="left" font-size="8.5pt" font-family="Simsun">
										ҵ�����ͣ�<xsl:value-of select="EE01A/EE01AD01"/>
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
										ͳ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�ɷ�״̬
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����Ӧ�ɽ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����ʵ�ɽ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�ۼ�Ƿ�ѽ��
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
						����������¼��ϸ
					</fo:block>
					<fo:block space-before="5pt" font-size="10pt" text-align="left" font-family="Simsun">
						ס����������ʷ�ɷѼ�¼��ϸ
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
										ͳ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�ɷ�״̬
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����Ӧ�ɽ�Ԫ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����ʵ�ɽ�Ԫ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�ۼ�Ƿ�ѽ�Ԫ��
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
<!-- ���� 2�����񱨱���Ϣ -->
					<xsl:if test="EAA !=''"></xsl:if>
					
				</fo:flow>
			</fo:page-sequence>
			
		</fo:root>
	</xsl:template>
</xsl:stylesheet>

