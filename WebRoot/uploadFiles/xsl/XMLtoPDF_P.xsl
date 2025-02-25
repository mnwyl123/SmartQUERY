<?xml version="1.0" encoding="gb2312"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:user="com.dcits.cq.util.XslUtil" extension-element-prefixes="user">
<!--<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:user="http://mycompany.com/mynamespace">
	�Զ���JS���� 
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
	<!--���߿���ʽ-->
	<xsl:attribute-set name="myBorder">
		<xsl:attribute name="border" >
			solid 0.5pt #6f6f6f
		</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:template match="/Document">
	<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
		<fo:layout-master-set>
			<!--����ҳ����-->
			<fo:simple-page-master master-name="all" page-height="11.5in" page-width="8.5in" margin-top="0.5in" margin-bottom="1in" margin-left="0.75in" margin-right="0.75in">
				<fo:region-body margin-top="1in" margin-bottom="0.75in"/>
				<fo:region-before extent="0.75in"/>
				<fo:region-after extent="0.5in"/>
			</fo:simple-page-master>
			<!--����˵��ҳ����-->
			<fo:simple-page-master master-name="note" page-height="11.5in" page-width="8.5in" margin-top="0.5in" margin-bottom="1in" margin-left="0.75in" margin-right="0.75in">
				<fo:region-body margin-top="1in" margin-bottom="0.75in"/>
				<fo:region-before extent="0.75in"/>
				<fo:region-after extent="0.5in"/>
			</fo:simple-page-master>
		</fo:layout-master-set>
		
		<fo:page-sequence master-reference="all" format="1">
			<!--ҳ��չʾ-->
			<fo:static-content flow-name="xsl-region-after">
				<fo:block text-align="center" font-size="10pt" font-family="serif" line-height="10pt">
					<fo:page-number/>
				</fo:block>
			</fo:static-content>
			
			<fo:flow flow-name="xsl-region-body">
				<fo:block font-size="25pt" font-family="KaiTi" color="black" text-align="center">
					�������ñ���
				</fo:block>
				<fo:block font-size="15pt" font-family="KaiTi" space-after="15pt" color="black" text-align="center">
					(���Ż�����)
				</fo:block>

<!-- ����ͷ��Ϣ -->
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
								&#160;�����ţ� <xsl:value-of select="PRH/PA01/PA01A/PA01AI01" />
							</fo:block>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="2">
							<fo:block text-align="right" font-size="8.5pt" font-family="Simsun">
								����ʱ�䣺 <xsl:value-of select="PRH/PA01/PA01A/PA01AR01" />&#160;
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row >
						<fo:table-cell background-color="#A7E3F1" xsl:use-attribute-sets="myBorder">
							<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
								����ѯ������
							</fo:block>
						</fo:table-cell>
						<fo:table-cell background-color="#A7E3F1" xsl:use-attribute-sets="myBorder">
							<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
								����ѯ��֤������
							</fo:block>
						</fo:table-cell>	
						<fo:table-cell background-color="#A7E3F1" xsl:use-attribute-sets="myBorder">
							<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
								����ѯ��֤������
							</fo:block>
						</fo:table-cell>
						<fo:table-cell background-color="#A7E3F1" xsl:use-attribute-sets="myBorder">
							<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
								��ѯ����
							</fo:block>
						</fo:table-cell>
						<fo:table-cell background-color="#A7E3F1" xsl:use-attribute-sets="myBorder">
							<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
								��ѯԭ��
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
				<!-- ����֤����Ϣ -->
				<xsl:if test="PRH/PA01/PA01C != ''">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">	
							<fo:table-cell number-columns-spanned="2">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									����֤����Ϣ
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									֤������
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									֤������
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
				<!-- ����թ��ʾ -->
				<xsl:if test="PRH/PA01/PA01D = '1'">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">	
							<fo:table-cell number-columns-spanned="2" background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									����թ��ʾ
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">	
							<fo:table-cell number-columns-spanned="2">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��Ϣ�����������÷���թ��ʾ����ϵ�绰�� <xsl:value-of select="PRH/PA01/PA01D/PA01DQ02"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��Ч����
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��ֹ����
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
				<!-- ������Ϣ��ʾ -->
				<xsl:if test="PRH/PA01/PA01E != '0'">
					<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
						<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">	
							<fo:table-cell number-columns-spanned="2" background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									������Ϣ��ʾ
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">	
							<fo:table-cell number-columns-spanned="2">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��Ϣ��������ñ������������ <xsl:value-of select="PRH/PA01/PA01E/PA01ES01"/> �����������ڴ����У������ʱע���Ķ�������ݡ�
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						</fo:table-body>
					</fo:table>
				</xsl:if>
				
<!-- һ ���˻�����Ϣ -->				
				<fo:block space-before="15pt" space-after="5pt" text-align="center" font-size="14pt" font-family="KaiTi">
					һ ���˻�����Ϣ
				</fo:block>
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
					��һ�������Ϣ
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
									�Ա�
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��������
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									����״��
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									ѧ��
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									ѧλ
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��ҵ״��
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									����
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��������
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
									ͨѶ��ַ
								</fo:block>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="3" background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									������ַ
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
									���
								</fo:block>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="4" background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�ֻ�����
								</fo:block>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="3" background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��Ϣ��������
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
					��������ż��Ϣ
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
									����
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									֤������
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									֤������
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									������λ
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��ϵ�绰
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
					��������ס��Ϣ
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
									���
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��ס��ַ
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									סլ�绰
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��ס״��
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��Ϣ��������
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
					���ģ�ְҵ��Ϣ
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
									���
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									������λ
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��λ����
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��λ��ַ
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��λ�绰
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
									���
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									ְҵ
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��ҵ
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									ְ��
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									ְ��
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									���뱾��λ���
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��Ϣ��������
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
<!-- �� ��Ϣ��Ҫ -->
				<fo:block space-before="15pt" space-after="5pt" text-align="center" font-size="14pt" font-family="KaiTi">
					�� ��Ϣ��Ҫ
				</fo:block>
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
					��һ���������ñ��桰���ֽ����
				</fo:block>
				<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									���ֽ��
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									���λ��
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									˵��
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
					�������Ŵ�������Ϣ��ʾ
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
									ҵ������
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�˻���
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�ױ�ҵ�񷢷��·�
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
									�ϼ�
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
					�������Ŵ�����ΥԼ��Ϣ��Ҫ
				</fo:block>
				<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell number-columns-spanned="3">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��׷����Ϣ����
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									ҵ������
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�˻���
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									���
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
									�ϼ�
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
									������Ϣ����
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�˻���
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									���
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
									���ڣ�͸֧����Ϣ����
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�˻�����
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�˻���
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�·���
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�����������/͸֧�ܶ�
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�����/͸֧����
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
					���ģ��Ŵ��������ż���ծ��Ϣ��Ҫ
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
									��ѭ�����˻���Ϣ����
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									���������
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�˻���
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�����ܶ�
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									���
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��� 6 ����ƽ��Ӧ����
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
									ѭ������·��˻���Ϣ����
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									���������
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�˻���
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�����ܶ�
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									���
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��� 6 ����ƽ��Ӧ����
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
									ѭ�����˻���Ϣ����
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									���������
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�˻���
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�����ܶ�
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									���
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��� 6 ����ƽ��Ӧ����
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
									���ǿ��˻���Ϣ����
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									����������
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�˻���
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�����ܶ�
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									���һ���������Ŷ�
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									���һ���������Ŷ�
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									���ö��
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��� 6 ����ƽ��ʹ�ö��
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
									׼���ǿ��˻���Ϣ����
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									����������
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�˻���
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�����ܶ�
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									���һ���������Ŷ�
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									���һ���������Ŷ�
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									͸֧���
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��� 6 ����ƽ��͸֧���
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
									��ػ���������Ϣ����
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1" number-rows-spanned="3" display-align="center" >
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									Ϊ����
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��������
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									������ػ�������
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�˻���
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�������
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									���
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�˻���
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�������ν��
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									���
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
									Ϊ��ҵ
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��������
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									������ػ�������
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�˻���
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�������
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									���
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�˻���
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�������ν��
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									���
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
					���壩���Ŵ�������Ϣ��Ҫ
				</fo:block>
				<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell number-columns-spanned="3">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�󸶷�ҵ��Ƿ����Ϣ����
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									ҵ������
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�˻���
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									Ƿ�ѽ��
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
					������������Ϣ��Ҫ
				</fo:block>
				<fo:table border-collapse="collapse" table-layout="fixed" width="100%" space-before="5pt">
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-column column-width="proportional-column-width(1)" xsl:use-attribute-sets="myBorder"/>
					<fo:table-body>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell number-columns-spanned="3">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									������Ϣ����
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��Ϣ����
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��¼��
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�漰���
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
					���ߣ���ѯ��¼��Ҫ
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
									��һ�β�ѯ��¼
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
									��� 1 �����ڵĲ�ѯ������
								</fo:block>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="3">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��� 1 �����ڵĲ�ѯ����
								</fo:block>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="3">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��� 2 ���ڵĲ�ѯ����
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row xsl:use-attribute-sets="myBorder">
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��������
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									���ÿ�����
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��������
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									���ÿ�����
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									���˲�ѯ
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�������
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1" display-align="center">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									�����ʸ����
								</fo:block>
							</fo:table-cell>
							<fo:table-cell background-color="#A7E3F1">
								<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
									��Լ�̻�&#10;ʵ�����
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
<!-- �� �Ŵ�������Ϣ��ϸ -->
				<fo:block space-before="15pt" space-after="5pt" text-align="center" font-size="14pt" font-family="KaiTi">
					�� �Ŵ�������Ϣ��ϸ
				</fo:block>
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
					��һ����׷����Ϣ
				</fo:block>
				<xsl:for-each select="PDA/PD01[PD01A/PD01AD01 = 'C1']">
					<fo:block text-align="left" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						�˻�<xsl:value-of select="position()"/>
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
										�������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ҵ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ծȨ��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ծȨ���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ծȨת��ʱ�Ļ���״̬
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
										����&#160;<xsl:value-of select="PD01B/PD01BR03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:if test="PD01B/PD01BD01 = 1">
							<!-- ���� -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻�״̬
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ�λ�������
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
							<!-- �ر� -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻�״̬
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻��ر�����
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
							<!-- ���⽻����Ϣ -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���⽻������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ϸ��¼
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
									�������
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
				<!-- ��������ѭ�����˻� -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					��������ѭ�����˻�
				</fo:block>
				<xsl:for-each select="PDA/PD01[PD01A/PD01AD01 = 'D1']">
					<fo:block text-align="left" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						�˻�<xsl:value-of select="position()"/><xsl:if test="PD01A/PD01AI04 != ''">������Э���ʶ��<xsl:value-of select="PD01A/PD01AI04"/>��</xsl:if>
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
										�������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���ʶ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻�����
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
										ҵ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������ʽ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����Ƶ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ʽ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ͬ����־
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
										����&#160;<xsl:value-of select="PD01B/PD01BR03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						<xsl:choose>
							<xsl:when test="PD01B/PD01BD01 = 4">
							<!-- ���� -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻�״̬
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ�λ�������
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
							<!-- ���塢ת�� -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="12">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻�״̬
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="12">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻��ر�����
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
							<!-- �������� -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻�״̬
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ʣ�໹������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����Ӧ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										Ӧ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����ʵ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ�λ�������
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
										��ǰ��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ǰ�����ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���� 31-60 ��δ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���� 61-90 ��δ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���� 91-180 ��δ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���� 180 ������δ������
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
										���»����¼
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ǰ����״̬
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
											<xsl:value-of select="PD01D/PD01DR01"/> - <xsl:value-of select="PD01D/PD01DR02"/> ����״̬
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
											<xsl:value-of select="PD01E/PD01ER01"/> - <xsl:value-of select="PD01E/PD01ER02"/> �����¼
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
											���⽻������
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											��������
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											�������
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											�������
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											��ϸ��¼
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
									�������
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
				<!-- ������ѭ������·��˻� -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					������ѭ������·��˻�
				</fo:block>
				<xsl:for-each select="PDA/PD01[PD01A/PD01AD01 = 'R4']">
					<fo:block text-align="left" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						�˻�<xsl:value-of select="position()"/><xsl:if test="PD01A/PD01AI04 != ''">������Э���ʶ��<xsl:value-of select="PD01A/PD01AI04"/>��</xsl:if>
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
										�������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���ʶ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻�����
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
										ҵ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������ʽ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����Ƶ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ʽ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ͬ����־
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
										����&#160;<xsl:value-of select="PD01B/PD01BR03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						<xsl:choose>
							<xsl:when test="PD01B/PD01BD01 = 4">
							<!-- ���� -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻�״̬
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ�λ�������
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
							<!-- ���� -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="12">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻�״̬
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="12">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻��ر�����
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
							<!-- �������� -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻�״̬
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ʣ�໹������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����Ӧ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										Ӧ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����ʵ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ�λ�������
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
										��ǰ��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ǰ�����ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���� 31-60 ��δ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���� 61-90 ��δ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���� 91-180 ��δ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���� 180 ������δ������
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
										���»����¼
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ǰ����״̬
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
											<xsl:value-of select="PD01D/PD01DR01"/> - <xsl:value-of select="PD01D/PD01DR02"/> ����״̬
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
											<xsl:value-of select="PD01E/PD01ER01"/> - <xsl:value-of select="PD01E/PD01ER02"/> �����¼
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
											���⽻������
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											��������
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											�������
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											�������
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											��ϸ��¼
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
									�������
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
				<!-- ���ģ�ѭ�����˻� -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					���ģ�ѭ�����˻�
				</fo:block>
				<xsl:for-each select="PDA/PD01[PD01A/PD01AD01 = 'R1']">
					<fo:block text-align="left" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						�˻�<xsl:value-of select="position()"/><xsl:if test="PD01A/PD01AI04 != ''">������Э���ʶ��<xsl:value-of select="PD01A/PD01AI04"/>��</xsl:if>
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
										�������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���ʶ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻�����
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
										ҵ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������ʽ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����Ƶ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ʽ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ͬ����־
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
										����&#160;<xsl:value-of select="PD01B/PD01BR03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						<xsl:choose>
							<xsl:when test="PD01B/PD01BD01 = 4">
							<!-- ���� -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻�״̬
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ�λ�������
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
							<!-- ���� -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="12">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻�״̬
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="12">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻��ر�����
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
							<!-- �������� -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻�״̬
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ʣ�໹������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����Ӧ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										Ӧ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����ʵ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ�λ�������
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
										��ǰ��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ǰ�����ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���� 31-60 ��δ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���� 61-90 ��δ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���� 91-180 ��δ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���� 180 ������δ������
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
										���»����¼
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ǰ����״̬
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
											<xsl:value-of select="PD01D/PD01DR01"/> - <xsl:value-of select="PD01D/PD01DR02"/> ����״̬
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
											<xsl:value-of select="PD01E/PD01ER01"/> - <xsl:value-of select="PD01E/PD01ER02"/> �����¼
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
											���⽻������
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											��������
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											�������
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											�������
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											��ϸ��¼
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
									�������
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
				<!-- ���壩���ǿ��˻� -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					���壩���ǿ��˻�
				</fo:block>
				<xsl:for-each select="PDA/PD01[PD01A/PD01AD01 = 'R2']">
					<fo:block text-align="left" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						�˻�<xsl:value-of select="position()"/><xsl:if test="PD01A/PD01AI04 != ''">������Э���ʶ��<xsl:value-of select="PD01A/PD01AI04"/>��</xsl:if>
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
										�������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���ʶ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻�����
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
										ҵ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������ʽ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����Ƶ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ʽ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ͬ����־
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
										����&#160;<xsl:value-of select="PD01B/PD01BR03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						<xsl:choose>
							<xsl:when test="PD01B/PD01BD01 = 5">
							<!-- ���� -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻�״̬
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ�λ�������
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
							<!-- ���� -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="12">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻�״̬
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="12">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻��ر�����
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
							<!-- �������� -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻�״̬
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ʣ�໹������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����Ӧ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										Ӧ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����ʵ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ�λ�������
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
										��ǰ��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ǰ�����ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���� 31-60 ��δ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���� 61-90 ��δ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���� 91-180 ��δ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���� 180 ������δ������
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
										���»����¼
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ǰ����״̬
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
										���ר�������Ϣ
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="6">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ר����ڶ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="6">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ڶ����Ч����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="6">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ڶ�ȵ�������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="6">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���÷��ڽ��
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
											<xsl:value-of select="PD01D/PD01DR01"/> - <xsl:value-of select="PD01D/PD01DR02"/> ����״̬
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
											<xsl:value-of select="PD01E/PD01ER01"/> - <xsl:value-of select="PD01E/PD01ER02"/> �����¼
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
											���⽻������
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											��������
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											�������
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											�������
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											��ϸ��¼
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
									�����¼�˵��
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
									�������
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
				<!-- ������׼���ǿ��˻� -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					������׼���ǿ��˻�
				</fo:block>
				<xsl:for-each select="PDA/PD01[PD01A/PD01AD01 = 'R3']">
					<fo:block text-align="left" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						�˻�<xsl:value-of select="position()"/><xsl:if test="PD01A/PD01AI04 != ''">������Э���ʶ��<xsl:value-of select="PD01A/PD01AI04"/>��</xsl:if>
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
										�������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻���ʶ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻�����
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
										ҵ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������ʽ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����Ƶ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ʽ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ͬ����־
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
										����&#160;<xsl:value-of select="PD01B/PD01BR03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						<xsl:choose>
							<xsl:when test="PD01B/PD01BD01 = 5">
							<!-- ���� -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻�״̬
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="8">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ�λ�������
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
							<!-- ���� -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="12">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻�״̬
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="12">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻��ر�����
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
							<!-- �������� -->
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�˻�״̬
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ʣ�໹������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����Ӧ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										Ӧ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����ʵ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="3">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���һ�λ�������
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
										��ǰ��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4" display-align="center">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ǰ�����ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���� 31-60 ��δ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���� 61-90 ��δ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���� 91-180 ��δ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���� 180 ������δ������
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
										���»����¼
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="4">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="5">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ǰ����״̬
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
											<xsl:value-of select="PD01D/PD01DR01"/> - <xsl:value-of select="PD01D/PD01DR02"/> ����״̬
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
											<xsl:value-of select="PD01E/PD01ER01"/> - <xsl:value-of select="PD01E/PD01ER02"/> �����¼
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
											�����¼������·�
										</fo:block>
									</fo:table-cell>
									<fo:table-cell background-color="#A7E3F1">
										<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
											�����¼�����
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
									�������
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
				<!-- ���ߣ���ػ���������Ϣ -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					���ߣ���ػ���������Ϣ
				</fo:block>
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					����ػ������εĸ��˽��
				</fo:block>
				<xsl:for-each select="PCR/PD03[PD03A/PD03AD08 = '1']">
					<fo:block text-align="left" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						�˻�<xsl:value-of select="position()"/>
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
										�������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ҵ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�������ν��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��֤��ͬ���
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
										����&#160;<xsl:value-of select="PD03A/PD03AR03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����״̬
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
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
									�������
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
					����ػ������ε���ҵ���
				</fo:block>
				<xsl:for-each select="PCR/PD03[PD03A/PD03AD08 = '2']">
					<fo:block text-align="left" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						�˻�<xsl:number value="position()"/>
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
										�������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ҵ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�������ν��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��֤��ͬ���
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
										����&#160;<xsl:value-of select="PD03A/PD03AR03"/>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row xsl:use-attribute-sets="myBorder">
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�弶����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����״̬
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
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
									�������
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
				<!-- ���ˣ�����Э����Ϣ -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					���ˣ�����Э����Ϣ
				</fo:block>
				<xsl:for-each select="PCA/PD02">
					<fo:block text-align="left" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						����Э��&#160;<xsl:number value="position()"/>
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
										�������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����Э���ʶ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��Ч����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���Ŷ����;
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
										���Ŷ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����޶�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����޶���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ö��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����
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
									�������
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
<!-- �� ���Ŵ�������Ϣ��ϸ -->
				<fo:block space-before.optimum="20pt" space-after.optimum="15pt" text-align="center" font-size="14pt" font-family="KaiTi">
					�� ���Ŵ�������Ϣ��ϸ
				</fo:block>
				<!-- �󸶷Ѽ�¼ -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					�󸶷Ѽ�¼
				</fo:block>
				<xsl:for-each select="PND/PE01">
					<fo:block text-align="left" font-size="8.5pt" font-family="Simsun" space-before="5pt">
						�˻�<xsl:number value="position()"/>
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
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ҵ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ҵ��ͨ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ǰ�ɷ�״̬
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ǰǷ�ѽ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
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
										��� 24 ���½ɷѼ�¼
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
				
<!-- �� ������Ϣ��ϸ -->
				<fo:block space-before.optimum="20pt" space-after.optimum="15pt" text-align="center" font-size="14pt" font-family="KaiTi">
					�� ������Ϣ��ϸ
				</fo:block>
				<!-- ��һ��Ƿ˰��¼ -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					��һ��Ƿ˰��¼
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
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����˰�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										Ƿ˰�ܶ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										Ƿ˰ͳ������
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
											�������
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
						��
					</fo:block>
				</xsl:if>
				<!-- �����������о���¼ -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					�����������о���¼
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
										������Ժ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�᰸��ʽ
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
										�о�/������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�о�/������Ч����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ϱ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ϱ�Ľ��
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
											�������
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
						��
					</fo:block>
				</xsl:if>
				<!-- ������ǿ��ִ�м�¼ -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					������ǿ��ִ�м�¼
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
										ִ�з�Ժ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1" number-columns-spanned="2">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ִ�а���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�᰸��ʽ
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
										����״̬
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�᰸����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����ִ�б��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����ִ�б�ļ�ֵ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ִ�б��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ִ�б�Ľ��
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
											�������
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
						��
					</fo:block>
				</xsl:if>
				<!-- ���ģ�����������¼ -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					���ģ�����������¼
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
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��Ч����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ֹ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										����������
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
											�������
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
						��
					</fo:block>
				</xsl:if>
				<!-- ���壩ס��������νɼ�¼ -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					���壩ס��������νɼ�¼
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
										�νɵ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�ν�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����·�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�����·�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�ɷ�״̬
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�½ɴ��
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���˽ɴ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��λ�ɴ����
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
										�ɷѵ�λ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��Ϣ��������
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
											�������
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
						��
					</fo:block>
				</xsl:if>
				<!-- �������ͱ�������¼ -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					�������ͱ�������¼
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
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��Ա���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										���ڵ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										������λ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ͥ������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��׼����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��Ϣ��������
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
											�������
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
						��
					</fo:block>
				</xsl:if>
				<!-- ���ߣ�ִҵ�ʸ��¼ -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					���ߣ�ִҵ�ʸ��¼
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
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										ִҵ�ʸ�����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�ȼ�
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�䷢����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�������ڵ�
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
											�������
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
						��
					</fo:block>
				</xsl:if>
				<!-- ���ˣ�����������¼ -->
				<fo:block text-align="center" font-size="8.5pt" font-family="Simsun" space-before="10pt">
					���ˣ�����������¼
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
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��Ч����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ֹ����
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
											�������
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
						��
					</fo:block>
				</xsl:if>
<!-- �� �������� -->
				<fo:block space-before.optimum="20pt" space-after.optimum="15pt" text-align="center" font-size="14pt" font-family="KaiTi">
					�� ��������
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
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��������
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�������
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
						��
					</fo:block>
				</xsl:if>
				
<!-- �� �����ע -->
				<fo:block space-before.optimum="20pt" space-after.optimum="15pt" text-align="center" font-size="14pt" font-family="KaiTi">
					�� �����ע
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
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ע����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										�������
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
						��
					</fo:block>
				</xsl:if>
				
<!-- �� ��ѯ��¼ -->
				<fo:block space-before.optimum="20pt" space-after.optimum="15pt" text-align="center" font-size="14pt" font-family="KaiTi">
					�� ��ѯ��¼
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
										���
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ѯ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ѯ����
									</fo:block>
								</fo:table-cell>
								<fo:table-cell background-color="#A7E3F1">
									<fo:block text-align="center" font-size="8.5pt" font-family="Simsun">
										��ѯԭ��
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
						��
					</fo:block>
				</xsl:if>

			</fo:flow>
		</fo:page-sequence>

<!--����˵��-->
		<fo:page-sequence master-reference="note" format="1">
			<!--ҳ��չʾ-->
			<fo:static-content flow-name="xsl-region-after">
				<fo:block text-align="center" font-size="10pt" font-family="serif" line-height="10pt">
					<fo:page-number/>
				</fo:block>
			</fo:static-content>
			<fo:flow flow-name="xsl-region-body" >
				<xsl:if test="PRH/PA01 != '' ">
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
									���������й����������������ĳ��ߣ����ݽ�������ʱ��ĸ�������ϵͳ��¼����Ϣ���ɡ�����ѯ��¼�⣬������Ϣ������ػ����ṩ���������Ĳ���֤����ʵ�Ժ�׼ȷ�ԣ�����ŵ����Ϣ���ܡ��ӹ������ϵ�ȫ�����б��ֿ͹ۡ������ĵ�λ��
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">2.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									�������еġ����ֽ��������ʹ�ñ����ñ�������е����Ż����ο������Ż���Ӧ���ге�ʹ�á����ֽ��������ط������Ρ�
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">3.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									�����ֽ���������ñ������ݽ��Ϊһ����ֵ���Ƕ���������δ���Ŵ�ΥԼ�����Ե�Ԥ�⣬��ȡֵ��ΧΪ0��1000����ֵԽ�ߣ�ΥԼ������Խ�ͣ������λ�á���������������ֽ��ֵ��ȫ����Ⱥ�еİٷֱ�����λ�ã����硰>50%����������ֽ��ֵ����50%���������壻��˵�����еġ�Ӱ�����ء���Ӱ�����������ø������ֽ��ֵ��ԭ�򣬸��ݵ�ǰ���ñ����ʵ���������������������������ֽ������ʾΪ��--���ģ��������޷����ݵ�ǰ���ñ������ݸ������ֽ��ֵ�������������塣�޷��������ֽ��ֵ�ľ���ԭ�����˵������
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">4.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									��������Ŵ�������Ϣ��ʾ�У���ҵ�����͡�Ϊ���������Ļ�����Ϣ���������ʲ����á��͡���ҵ��
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">5.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									�����������û�С��Ŵ�����ΥԼ��Ϣ��Ҫ����Ϣ��˵�������������5����û���������ڡ�
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">6.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									���ڴ��������޶��Э����Ϣ����Ϣ����Ŀ��ö�����ϡ�����Э����Ϣ���е����Ŷ�ȡ������޶���Ϣ�������й��㡣
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">7.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									�������е��Ŵ��������ż���ծ��Ϣ��Ҫչʾ����Ϣ��ָδ����/δ���������ż���ծ��Ϣ��
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">8.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									������Ľ��������ϸ��Ϣ�У�ѭ�����˻��ĵ���������ָ�˻����Ŷ�ȵĵ������ڡ�
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">9.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									������Ľ��������ϸ��Ϣ�У�����˻�չʾ���5��Ļ��������������ǰ����״̬�͵�ǰ�����ܶ
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">10.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									����ͨ��������������ġ�С���Ƶ��ҵ�񣬽��ڻ������ϲ���������˻���չʾ�ڱ�����Ľ��������ϸ��Ϣ�У���ʱ�˻��Ļ��ʽΪ�������ֻ��ʽ�������˻��Ļ���Ƶ��ͳһԼ��Ϊ���¡������������������¼��㣬�仹����Ϣ���½��й۲�͸��¡�
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">11.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									�������е�����׼���ǿ��˻���ָ���˻�60�����ϵ�͸֧��Ϊ��
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">12.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									�������еĻ�������Ϊ��--����ָ���˻��ǷǷ��ڻ��
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">13.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									�����治չʾ5��ǰ�Ѿ�������ΥԼ��Ϊ���Լ�5��ǰ��Ƿ˰��¼��ǿ��ִ�м�¼�������о���¼������������¼������Ƿ�Ѽ�¼��
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">14.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									����˵���������ṩ�����Ծ���ҵ����ӵ��ر�˵����Ϣ��
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">15.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									������������Ϣ��������ñ����е���Ϣ����ע�ļ�Ҫ˵������������Ա�����������ʵ�Ը���
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">16.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									�����ע������������ӵģ�����˵��������������ñ����е���Щ��Ϣ�����顣
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">17.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									�����������漰������˽����ѯ��Ӧ����ʹ�á����Ʊ��ܡ���ʹ�ò�����ɸ�����Ϣй¶�ģ��������Ľ����е�������Ρ�
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">18.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									�����������н���������ػ������ε���ҵ���еĽ���⣩��Ϊ����ҽ����ղ�ѯ��ǰһ��Ļ��ʡ�
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell width="20pt">
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt">19.</fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block font-size="9pt" font-family="Simsun" space-after="7pt" line-height="17pt" >
									�����������������ṩ��������Ϣ���岻֤ͬ�����͵���Ϣ��
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