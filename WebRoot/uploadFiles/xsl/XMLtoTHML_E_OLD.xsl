<?xml version="1.0" encoding="GB2312"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
	<xsl:output method="html" version="1.0" encoding="GB2312"/>  
	<xsl:template match="/Document">
		<html oncontextmenu="return false" onselectstart="return false">
			<head>
				<title>企业信用报告</title>				
			</head>
			<style type="text/css">
				@media print{
					body{display:none}
				}
				.tdStyle{
						  height:25px;
						  font-size:12px;
						  text-align:center;
						  text-indent:4px;
						  background-color:#99ccFF;
					}
					.tdStyle1{
						  height:25px;
						  font-size:12px;
						  text-align:left;
						  text-indent:4px;
					}
					.tdStyle2{
						  height:25px;
						  font-size:12px;
						  text-align:center;
					}
					.tdStyle3{
						  height:25px;
						  font-size:12px;
						  text-align:center;
						  background-color:#99ccFF;
					}
			</style>
			<script language="javascript">
				document.onkeydown=document.onkeyup=document.onkeypress=function(){
					if(window.event.keyCode==123){
						window.event.returnValue=false;
						return(false);
					}
				};
				window.opener = "";
			</script>
			<body>
				<!-- 报文头信息 - 身份标识 - 异议提示 -->
				<xsl:apply-templates select="EAA/EA01"/>
				<!-- 基本信息 -->
				<xsl:apply-templates select="ECA"/>
				<!-- 信息概要 -->
					<!-- 信用提示信息 -->
					<xsl:apply-templates select="EBA"/>
					<!-- 未结清信贷及授信信息概要 相关还款责任信息概要 已结清信贷信息概要 负债历史 -->
					<xsl:apply-templates select="EBB"/>
				<!-- 信贷记录明细 -->
					<!-- 被追偿业务 未结清信贷 已结清信贷 相关还款责任 -->
					<xsl:apply-templates select="EDA"/>
				<!-- 非信贷记录明细 -->
				<xsl:apply-templates select="EEA"/>
				<!-- 公共记录明细 -->
					<!-- 欠税信息 -->
					<xsl:apply-templates select="EFA"/>
					<!-- 法院信息 -->
					<xsl:apply-templates select="EFB"/>
					<!-- 行政处罚信息 -->
					<xsl:apply-templates select="EFC"/>
					<!-- 住房公积金参缴信息 -->
					<xsl:apply-templates select="EFD"/>
					<!-- 获得认证/奖励相关信息 -->
					<xsl:apply-templates select="EFE"/>
					<!-- 进出口检验相关信息 -->
					<xsl:apply-templates select="EFF"/>
					<!-- 融资规模控制信息 -->
					<xsl:apply-templates select="EFG"/>
				<!-- 财务报表 -->
				<xsl:apply-templates select="EGA"/>
				<!-- 评级信息 -->
				<xsl:apply-templates select="EHA"/>
				<!-- 声明及异议标注信息 -->
				<xsl:apply-templates select="EIA"/>
				<!-- 附件 1：信用记录补充信息 -->
				<xsl:call-template name="annex1"/>
				<!-- 附件 2：财务报表信息 -->
				<xsl:call-template name="annex2"/>
				<!-- 报告说明 -->
				<xsl:apply-templates select="EAA"/>
				<noscript><iframe src="*.htm"></iframe></noscript>
			</body>
		</html>
	</xsl:template>
<!-- 报告说明 -->
	<xsl:template match="EAA">
		<table bgcolor="" width="80%" align='center' border="0" cellspacing="0" cellpadding="2">
			<tr>
				<td height='4' colspan="4">
					<div align="center" class="style2">
						<font style="font-size: 18.0pt;font-weight:bold">报告说明</font>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="4" height='30'>&#160;</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					1.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">本报告由中国人民银行征信中心出具，依据截止报告时间征信系统记录的信息生成。除征信中心标注外，信息均由相关数据提供机构和信息主体提供，征信中心不保证其真实性和准确性，但承诺在信息汇总、加工、整合的全过程中保持客观、中立的地位。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					2.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">本报告所展示的基本信息来自征信系统对不同数据来源提供的同一个信息主体基本信息进行整合后的结果。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					3.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">本报告中信贷交易包括借贷交易和担保交易。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					4.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">本报告中借贷交易包括各种形式的贷款，也包括以各种其他名义融资但实质上是借贷的行为，即融资方负有明确还款责任的交易。常见的产品种类包括：贷款、贸易融资、票据贴现、保理、透支、融资租赁、回购、垫款、黄金证券借贷、公司信用债等。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					5.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">本报告中担保交易指第三人和债权人约定，当债务人不履行债务时，第三人按约定履行债务的行为。包括名义上没有担保合同约定但当债务人违约时、第三人实质上要代偿的行为。常见的产品种类包括：银行承兑汇票、信用证、银行保函、融资担保公司提供的担保服务，保险公司提供的信用保证保险服务。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					6.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">本报告中被追偿业务是指剩余本息处于催收状态（即债权人要求债务人尽快归还全部借款）的借贷交易。常见的产品种类包括：由资产管理公司处置的债务、垫款（含担保代偿）。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					7.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">本报告中的短期借款、中长期借款是指借贷交易中除被追偿业务、循环透支、贴现之外的业务，按照“借款期限分类”划分，分别对应其中的短期、中期和长期。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					8.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">本报告中借贷交易的正常类是指除被追偿业务之外，五级分类为“正常”或者五级分类为“未分类”且逾期天数为0的业务；关注类是指除被追偿业务之外，五级分类为“关注”或者五级分类为“未分类”且逾期0至90天的业务；不良类是指除被追偿业务之外，五级分类为“次级”、“可疑”、“损失”、“违约”或者五级分类为“未分类”且逾期90天以上的业务。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					9.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">本报告中担保交易的正常类、关注类、不良类分别对应五级分类为正常、关注和后三类的业务。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					10.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">本报告中信息概要部分中的负债历史信息，其中负债是指由信贷交易所产生的债务；逾期总额、逾期本金是指除被追偿业务之外的借贷交易的逾期总额（含欠息）合计及逾期本金合计。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					11.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">本报告仅展示一定期限范围内的已结清信贷信息、非信贷信息、公共信息。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					12.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">如无特别说明，本报告中的金额类数据项单位均为万元。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					13.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">如无特别说明，本报告中的金额类汇总数据项均为人民币计价。外币折人民币的计算依据国家外汇管理局当月公布的各种货币对美元折算率表。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					14.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">如信息记录斜体展示，则说明信息主体对此条记录存在异议。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					15.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">数据提供机构说明是报数机构对报告中的信息记录或对信息主体所作的补充说明。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					16.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">征信中心说明是征信中心对报告中的信息记录或对信息主体所作的说明。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					17.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">信息主体声明是信息主体对报数机构提供的信息记录所作的简要说明。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					18.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">本报告仅供金融机构按照与信息主体的约定使用，请妥善保管。因使用不当而引起纠纷的，征信中心不承担相关责任。</font>
				</td>
			</tr>
			<tr>
				<td colspan="4" height='10'>&#160;</td>
			</tr>
			<tr style="line-height:30px">
				<td colspan="4" valign="top" height='30px'>
					<font style="font-size: 12.0pt">汇率（美元折人民币）：<xsl:value-of select="EA01/EA01E/EA01EQ01"/>&#160;&#160;有效期：<xsl:value-of select="EA01/EA01E/EA01ER01"/></font>
				</td>
			</tr>
		</table>
	</xsl:template>
<!-- 报文头信息模块 -->
	<xsl:template match="EAA/EA01">
		<table bgcolor="" width="80%" align='center' border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td colspan="2" align="center">
					<font style="font-size: 32.0pt;font-weight:bold;">企业信用报告</font>
					<br/><br/>
					<font style="font-size: 16.0pt;font-weight:bold;">(授信机构版)</font>
					<br/><br/><br/>
				</td>
			</tr>
			
		</table>
		<br/><br/>
		
		<!-- 报告头 -->
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td width="30%" height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">报告编号</font>
				</td>
				<td width="70%">
					<font style="font-size: 12.0pt"><xsl:value-of select="EA01A/EA01AI01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td width="30%" height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">报告日期</font>
				</td>
				<td width="70%">
					<font style="font-size: 12.0pt"><xsl:value-of select="EA01A/EA01AR01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td width="30%" height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">查询机构</font>
				</td>
				<td width="70%">
					<font style="font-size: 12.0pt"><xsl:value-of select="EA01B/EA01BI01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td width="30%" height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">查询原因</font>
				</td>
				<td width="70%">
					<font style="font-size: 12.0pt"><span name="2004"><xsl:value-of select="EA01B/EA01BD02"/></span></font>
				</td>
			</tr>
		</table>
		
		<!--  -->
		<div align="center">
			<font style="font-size: 22.0pt;font-weight:bold;">身份标识</font>
		</div>
		<br/><br/>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td width="30%" height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">企业名称</font>
				</td>
				<td width="70%">
					<font style="font-size: 12.0pt"><xsl:value-of select="EA01C/EA01CQ01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td width="30%" height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">企业身份标识个数</font>
				</td>
				<td width="70%">
					<font style="font-size: 12.0pt"><xsl:value-of select="EA01C/EA01CS01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td width="30%" height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">企业身份标识类型</font>
				</td>
				<td width="70%">
					<font style="font-size: 12.0pt"><span name="2002"><xsl:value-of select="EA01C/EA01CH/EA01CD01"/></span></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td width="30%" height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">企业身份标识号码</font>
				</td>
				<td width="70%">
					<font style="font-size: 12.0pt"><xsl:value-of select="EA01C/EA01CH/EA01CI01"/></font>
				</td>
			</tr>
		</table>
		<br/><br/>
		<xsl:if test="EA01D/EA01DS01 != 0">
			<div align="center">
				<font style="font-size: 22.0pt;font-weight:bold;">异议提示</font>
			</div>
			<br/>
			<br/>
			<table width="80%" align='center'>
				<tr>
					<td align="left">
						<font style="font-size: 13.0pt;">信息主体对信用报告内容提出了 <xsl:value-of select="EA01D/EA01DS01"/> 笔异议且正在处理中，请浏览时注意阅读相关内容。</font>						
					</td>
				</tr>
			</table>
			<br/>
		</xsl:if>
	</xsl:template>	
<!-- 企业基本信息 -->
	<xsl:template match="ECA">
		<br/>
		<div align="center">
			<font style="font-size: 22.0pt;font-weight:bold;">基本信息</font>
		</div>
		<br/><br/>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left" >
					<font style="font-size: 14.0pt;font-weight:bold;">基本概况信息</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">经济类型</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name=""><xsl:value-of select="EC01/EC010D01"/></span></font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">组织机构类型</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name=""><xsl:value-of select="EC01/EC010D02"/></span></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">企业规模</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name="2005"><xsl:value-of select="EC01/EC010D03"/></span></font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">所属行业</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name=""><xsl:value-of select="EC01/EC010D04"/></span></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">成立年份</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC01/EC010R01"/></font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">登记证书有效截止日期</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC01/EC010R02"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">登记地址</font>
				</td>
				<td height="25px" align="center" colspan="3">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC01/EC010Q01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">办公/经营地址</font>
				</td>
				<td height="25px" align="center" colspan="3">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC01/EC010Q02"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">存续状态</font>
				</td>
				<td height="25px" align="center" colspan="3">
					<font style="font-size: 12.0pt;">&#160;<span name="2006"/><xsl:value-of select="EC01/EC010D05"/></font>
				</td>
			</tr>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left" >
					<font style="font-size: 14.0pt;font-weight:bold;">注册资本及主要出资人信息</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
		<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">注册资本折人民币合计</font>
				</td>
				<td height="25px" align="center" colspan="3">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC02/EC020J01"/> 万元</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">主要出资人个数</font>
				</td>
				<td height="25px" align="center" colspan="3">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC02/EC020S01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">更新日期</font>
				</td>
				<td height="25px" align="center" colspan="3">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC02/EC020R01"/></font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left" >
					<font style="font-size: 14.0pt;font-weight:bold;">出资人信息</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">出资人类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">出资人身份类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">出资人名称</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">出资人身份标识类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">出资人身份标识号码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">出资比例</font>
				</td>
			</tr>
			<xsl:for-each select="EC02/EC020H">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name="2007"><xsl:value-of select="EC020D01"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name="3004"><xsl:value-of select="EC020D02"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC020Q01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;
					<xsl:if test="EC020D02 = '1'"><span name="3005"><xsl:value-of select="EC020D03"/></span></xsl:if>
					<xsl:if test="EC020D02 = '2'"><span name="2002"><xsl:value-of select="EC020D03"/></span></xsl:if>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC020I01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC020Q02"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">主要组成人员信息</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
		<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">主要成员个数</font>
				</td>
				<td height="25px" align="center" colspan="3">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC03/EC030S01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">更新日期</font>
				</td>
				<td height="25px" align="center" colspan="3">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC03/EC030R01"/></font>
				</td>
			</tr>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">姓名</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">证件类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">证件号码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">职位</font>
				</td>
			</tr>
			<xsl:for-each select="EC03/EC030H">
			<tr style="line-height:20px">
				
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC030Q01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name="3005"><xsl:value-of select="EC030D01"/></span></font>
				</td> 
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC030I01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name="2008"><xsl:value-of select="EC030D02"/></span></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">上级机构信息</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">上级机构类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">上级机构名称</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">上级机构身份标识类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">上级机构身份标识号码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">更新日期</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name="2009"><xsl:value-of select="EC04/EC040D01"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC04/EC040Q01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name="2002"><xsl:value-of select="EC04/EC040D02"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC04/EC040I01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC04/EC040R01"/></font>
				</td>
			</tr>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">实际控制人信息</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">实际控制人个数</font>
				</td>
				<td height="25px" align="center" colspan="3">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC05/EC050S01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">更新日期</font>
				</td>
				<td height="25px" align="center" colspan="3">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC05/EC050R01"/></font>
				</td>
			</tr>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">实际控制人身份类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">实际控制人名称</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">实际控制人身份标识类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">实际控制人身份标识号码</font>
				</td>
			</tr>
			<xsl:for-each select="EC05/EC050H">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name="2001"><xsl:value-of select="EC050D01"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC050Q01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;
					<xsl:if test="EC020D02 = '1'"><span name="3005"><xsl:value-of select="EC050D02"/></span></xsl:if>
					<xsl:if test="EC020D02 = '2'"><span name="2002"><xsl:value-of select="EC020D03"/></span></xsl:if>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC050I01"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<br/>
	</xsl:template>
<!-- 信息概要 -->
	<!-- 信用提示信息 -->
	<xsl:template match="EBA/EB01">
		<br/>
		<div align="center">
			<font style="font-size: 22.0pt;font-weight:bold;">信用提示信息</font>
		</div>
		<br/><br/>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left" >
					<font style="font-size: 14.0pt;font-weight:bold;">信贷交易提示信息</font>
				</td>
			</tr>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">首次有信贷交易的年份</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">首次有相关还款责任的年份</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">发生信贷交易的机构数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">当前有未结清信贷交易的机构数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷交易余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">被追偿的借贷交易余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">关注类借贷交易余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">不良类借贷交易余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">担保交易余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">关注类担保交易余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">不良类担保交易余额</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB01A/EB01AR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB01A/EB01AR02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB01A/EB01AS01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB01A/EB01AS02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB01A/EB01AJ01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB01A/EB01AJ02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB01A/EB01AJ03"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB01A/EB01AJ04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB01A/EB01AJ05"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB01A/EB01AJ06"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB01A/EB01AJ07"/></font>
				</td>
			</tr>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left" >
					<font style="font-size: 14.0pt;font-weight:bold;">非信贷交易及公共信息提示信息</font>
				</td>
			</tr>
		</table>
		<!-- 非信贷交易 -->
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">非信贷交易账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">欠税记录条数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">民事判决记录条数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">强制执行记录条数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">行政处罚记录条数</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB01B/EB01BS01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB01B/EB01BS02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB01B/EB01BS03"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB01B/EB01BS04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB01B/EB01BS05"/></font>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template match="EBB">
		<!-- 未结清信贷及授信信息概要 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">未结清信贷及授信信息概要</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">资产处置业务账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">资产处置业务余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次处置日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">垫款业务账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">垫款业务余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">垫款最近一次还款日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期总额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期本金</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期利息及其他</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">其他借贷交易分类汇总条目数量</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02/EB02A/EB02AS01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02/EB02A/EB02AJ01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02/EB02A/EB02AR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02/EB02A/EB02AS02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02/EB02A/EB02AJ02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02/EB02A/EB02AR02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02/EB02A/EB02AJ03"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02/EB02A/EB02AJ04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02/EB02A/EB02AJ05"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02/EB02A/EB02AS03"/></font>
				</td>
			</tr>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left" >
					<font style="font-size: 14.0pt;font-weight:bold;"> 未接清其他借贷交易信息</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">&#160;</font>
				</td>
				<td height="25px" align="center" colspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">正常类</font>
				</td>
				<td height="25px" align="center" colspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">关注类</font>
				</td>
				<td height="25px" align="center" colspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">不良类</font>
				</td>
				<td height="25px" align="center" colspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">合计</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">中长期借款</font>
				</td>
			<xsl:for-each select="EB02/EB02A/EB02AH">
				<xsl:sort select="EB02AD02"/>
				<xsl:if test="EB02AD01 = '1' and EB02AD02 != 0"><!-- 不取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AS04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AJ06"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="EB02/EB02A/EB02AH">
				<xsl:if test="EB02AD01 = '1' and EB02AD02 = 0"><!-- 取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AS04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AJ06"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">短期借款</font>
				</td>
			<xsl:for-each select="EB02/EB02A/EB02AH">
				<xsl:sort select="EB02AD02"/>
				<xsl:if test="EB02AD01 = '2' and EB02AD02 != 0"><!-- 不取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AS04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AJ06"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="EB02/EB02A/EB02AH">
				<xsl:if test="EB02AD01 = '2' and EB02AD02 = 0"><!-- 取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AS04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AJ06"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">循环透支</font>
				</td>
			<xsl:for-each select="EB02/EB02A/EB02AH">
				<xsl:sort select="EB02AD02"/>
				<xsl:if test="EB02AD01 = '3' and EB02AD02 != 0"><!-- 不取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AS04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AJ06"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="EB02/EB02A/EB02AH">
				<xsl:if test="EB02AD01 = '3' and EB02AD02 = 0"><!-- 取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AS04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AJ06"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">贴现</font>
				</td>
			<xsl:for-each select="EB02/EB02A/EB02AH">
				<xsl:sort select="EB02AD02"/>
				<xsl:if test="EB02AD01 = '4' and EB02AD02 != 0"><!-- 不取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AS04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AJ06"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="EB02/EB02A/EB02AH">
				<xsl:if test="EB02AD01 = '4' and EB02AD02 = 0"><!-- 取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AS04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AJ06"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">合计</font>
				</td>
			<xsl:for-each select="EB02/EB02A/EB02AH">
				<xsl:sort select="EB02AD02"/>
				<xsl:if test="EB02AD01 = '0' and EB02AD02 != 0"><!-- 不取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AS04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AJ06"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="EB02/EB02A/EB02AH">
				<xsl:if test="EB02AD01 = '0' and EB02AD02 = 0"><!-- 取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AS04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AJ06"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			</tr>
		</table>
		<!-- 已结清信贷交易 -->
		<!-- 已结清信贷信息概要 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">已结清信贷信息概要</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">资产处置业务账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">资产处置业务金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">处置完成日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">结清日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">垫款业务账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">垫款业务金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">其他借贷交易分类汇总条目数量</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02/EB02B/EB02BS01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02/EB02B/EB02BJ01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02/EB02B/EB02BR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02/EB02B/EB02BR02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02/EB02B/EB02BS02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02/EB02B/EB02BJ02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02/EB02B/EB02BS03"/></font>
				</td>
			</tr>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left" >
					<font style="font-size: 14.0pt;font-weight:bold;">已结清其他借贷交易分类汇总信息</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">&#160;</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">正常类账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">关注类账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">不良类账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">合计</font>
				</td>
			</tr>			
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">中长期借款</font>
				</td>
			<xsl:for-each select="EB02/EB02B/EB02BH">
				<xsl:sort select="EB02BD01"/>
				<xsl:if test="EB02BD01 = '1' and EB02BD02 != 0"><!-- 不取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02BS04"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="EB02/EB02B/EB02BH">
				<xsl:if test="EB02BD01 = '1' and EB02BD02 = 0"><!-- 取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02BS04"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">短期借款</font>
				</td>
			<xsl:for-each select="EB02/EB02B/EB02BH">
				<xsl:sort select="EB02BD01"/>
				<xsl:if test="EB02BD01 = '2' and EB02BD02 != 0"><!-- 不取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02BS04"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="EB02/EB02B/EB02BH">
				<xsl:if test="EB02BD01 = '2' and EB02BD02 = 0"><!-- 取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02BS04"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">循环透支</font>
				</td>
			<xsl:for-each select="EB02/EB02B/EB02BH">
				<xsl:sort select="EB02BD01"/>
				<xsl:if test="EB02BD01 = '3' and EB02BD02 != 0"><!-- 不取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02BS04"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="EB02/EB02B/EB02BH">
				<xsl:if test="EB02BD01 = '3' and EB02BD02 = 0"><!-- 取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02BS04"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">贴现</font>
				</td>
			<xsl:for-each select="EB02/EB02B/EB02BH">
				<xsl:sort select="EB02BD01"/>
				<xsl:if test="EB02BD01 = '4' and EB02BD02 != 0"><!-- 不取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02BS04"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="EB02/EB02B/EB02BH">
				<xsl:if test="EB02BD01 = '4' and EB02BD02 = 0"><!-- 取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02BS04"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">合计</font>
				</td>
			<xsl:for-each select="EB02/EB02B/EB02BH">
				<xsl:sort select="EB02BD01"/>
				<xsl:if test="EB02BD01 = '0' and EB02BD02 != 0"><!-- 不取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02BS04"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="EB02/EB02B/EB02BH">
				<xsl:if test="EB02BD01 = '0' and EB02BD02 = 0"><!-- 取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02BS04"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			</tr>
		</table>		
		<br/>
		<!-- 负债历史汇总信息 -->
		<!-- 负债历史 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">负债历史</font>
				</td>
				<td height="25px" align="right">
					<font style="font-size: 12.0pt;font-weight:bold;">月份数：共 <xsl:value-of select="EB02/EB02C/EB02CS01"/> 笔</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">&#160;</font>
				</td>
				<td height="25px" align="center" colspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">全部负债</font>
				</td>
				<td height="25px" align="center" colspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">关注类负债</font>
				</td>
				<td height="25px" align="center" colspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">不良类负债</font>
				</td>
				<td height="25px" align="center" colspan="4" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期类负债</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期总额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">本金逾期账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期本金</font>
				</td>
			</tr>
			<xsl:for-each select="EB02/EB02C/EB02CH">
			<xsl:sort select="EB02CR01" order="descending"/>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02CR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02CS02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02CJ01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02CS03"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02CJ02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02CS04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02CJ03"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02CS05"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02CJ04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02CS06"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02CJ05"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<br/>
		<!-- 未结清担保交易 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left" >
					<font style="font-size: 14.0pt;font-weight:bold;"> 未结清担保交易</font>
				</td>
			</tr>
		</table>
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">未结清担保交易</font>
				</td>
				<td height="25px" align="right">
					<font style="font-size: 12.0pt;font-weight:bold;">总条目数量：共 <xsl:value-of select="../EBC/EB03/EB03A/EB03AS01"/> 笔</font>
				</td>
			</tr>
		</table>
		
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">&#160;</font>
				</td>
				<td height="25px" align="center" colspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">正常类</font>
				</td>
				<td height="25px" align="center" colspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">关注类</font>
				</td>
				<td height="25px" align="center" colspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">不良类</font>
				</td>
				<td height="25px" align="center" colspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">合计</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">银行承兑汇票</font>
				</td>
			<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
				<xsl:sort select="EB03AD02"/>
				<xsl:if test="EB03AD01 = '1' and EB03AD02 != 0"><!-- 不取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03AS02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03AJ01"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
				<xsl:if test="EB03AD01 = '1' and EB03AD02 = 0"><!-- 取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03AS02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03AJ01"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信用证</font>
				</td>
			<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
				<xsl:sort select="EB03AD02"/>
				<xsl:if test="EB03AD01 = '2' and EB03AD02 != 0"><!-- 不取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03AS02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03AJ01"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
				<xsl:if test="EB03AD01 = '2' and EB03AD02 = 0"><!-- 取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03AS02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03AJ01"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">银行保函</font>
				</td>
			<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
				<xsl:sort select="EB03AD02"/>
				<xsl:if test="EB03AD01 = '3' and EB03AD02 != 0"><!-- 不取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03AS02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03AJ01"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
				<xsl:if test="EB03AD01 = '3' and EB03AD02 = 0"><!-- 取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03AS02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03AJ01"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">其他</font>
				</td>
			<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
				<xsl:sort select="EB03AD02"/>
				<xsl:if test="EB03AD01 = '9' and EB03AD02 != 0"><!-- 不取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03AS02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03AJ01"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
				<xsl:if test="EB03AD01 = '9' and EB03AD02 = 0"><!-- 取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03AS02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03AJ01"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			</tr>
		</table>
		<br/>
		<!-- 已结清担保交易 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">已结清担保交易</font>
				</td>
				<td height="25px" align="right">
					<font style="font-size: 12.0pt;font-weight:bold;">总条目数量：共 <xsl:value-of select="../EBC/EB03/EB03B/EB03BS01"/> 笔</font>
				</td>
			</tr>
		</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">&#160;</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">正常类账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">关注类账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">不良类账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">合计</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">银行承兑汇票</font>
				</td>
			<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
				<xsl:sort select="EB03BD02"/>
				<xsl:if test="EB03BD01 = '1' and EB03BD02 != 0"><!-- 不取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03BS02"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
				<xsl:if test="EB03BD01 = '1' and EB03BD02 = 0"><!-- 取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03BS02"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信用证</font>
				</td>
			<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
				<xsl:sort select="EB03BD02"/>
				<xsl:if test="EB03BD01 = '2' and EB03BD02 != 0"><!-- 不取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03BS02"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
				<xsl:if test="EB03BD01 = '2' and EB03BD02 = 0"><!-- 取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03BS02"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">银行保函</font>
				</td>
			<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
				<xsl:sort select="EB03BD02"/>
				<xsl:if test="EB03BD01 = '3' and EB03BD02 != 0"><!-- 不取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03BS02"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
				<xsl:if test="EB03BD01 = '3' and EB03BD02 = 0"><!-- 取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03BS02"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">其他</font>
				</td>
			<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
				<xsl:sort select="EB03BD02"/>
				<xsl:if test="EB03BD01 = '9' and EB03BD02 != 0"><!-- 不取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03BS02"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
				<xsl:if test="EB03BD01 = '9' and EB03BD02 = 0"><!-- 取合计 -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03BS02"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			</tr>
		</table>
		<!-- 授信协议汇总信息 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left" >
					<font style="font-size: 14.0pt;font-weight:bold;">授信协议汇总信息</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">非循环信用额度合计</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">已使用的非循环信用额度合计</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">剩余可用的非循环额度合计</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">循环信用额度合计</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">已使用的循环信用额度合计</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">剩余可用的循环额度合计</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">是否包含授信限额</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="../EBD/EB04/EB040J01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="../EBD/EB04/EB040J02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="../EBD/EB04/EB040J03"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="../EBD/EB04/EB040J04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="../EBD/EB04/EB040J05"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="../EBD/EB04/EB040J06"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name="3006"><xsl:value-of select="../EBD/EB04/EB040D01"/></span></font>
				</td>
			</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<xsl:if test="../EBD/EB04/EB040D01='1'">
				<tr style="line-height:20px">
					<td height="25px" align="left" colspan="6">
						<font style="font-size: 12.0pt;">说明： 由于存在授信限额的控制， 剩余可用额度无法准确计算，需要结合授信明细信息进行估算。</font>
					</td>
				</tr>
			</xsl:if>
			</table>
		<br/>
		<!-- 相关还款责任信息概要 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">相关还款责任信息概要</font>
				</td>
				<td height="25px" align="right">
					<font style="font-size: 12.0pt;font-weight:bold;">还款责任类型数量：共 <xsl:value-of select="../EBE/EB05/EB05A/EB05AS01"/> 笔</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">责任类型</font>
				</td>
				<td height="25px" align="center" colspan="3" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">被追偿业务</font>
				</td>
				<td height="25px" align="center" colspan="5" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">其他借贷交易</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">还款责任金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">还款责任金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">关注类余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">不良类余额</font>
				</td>
			</tr>
			<xsl:for-each select="../EBE/EB05/EB05A/EB05AH">
			<xsl:sort select="EB05AD01"/>
				<xsl:if test="EB05AD01 != 0">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2019"><xsl:value-of select="EB05AD01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB05AJ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB05AS02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB05AJ02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB05AJ03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB05AS03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB05AJ04"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB05AJ05"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB05AJ06"/></font>
					</td>
				</tr>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="../EBE/EB05/EB05A/EB05AH">
				<xsl:if test="EB05AD01 = 0">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB05AD01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB05AJ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB05AS02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB05AJ02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB05AJ03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB05AS03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB05AJ04"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB05AJ05"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB05AJ06"/></font>
					</td>
				</tr>
				</xsl:if>
			</xsl:for-each>
		</table>
		<br/>
		<!-- 担保交易相关还款责任汇总信息 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">担保交易相关还款责任汇总信息</font>
				</td>
				<td height="25px" align="right">
					<font style="font-size: 12.0pt;font-weight:bold;">还款责任类型数量：共 <xsl:value-of select="../EBE/EB05/EB05B/EB05BS01"/> 笔</font>
				</td>
			</tr>
		</table>		
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">责任类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">还款责任金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">关注类余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">不良类余额</font>
				</td>
			</tr>
			<xsl:for-each select="../EBE/EB05/EB05B/EB05BH">
			<xsl:sort select="EB05BD01"/>
				<xsl:if test="EB05BD01 != 0">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2019"><xsl:value-of select="EB05BD01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB05BJ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB05BS02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB05BJ02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB05BJ03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB05BJ04"/></font>
					</td>
				</tr>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="../EBE/EB05/EB05B/EB05BH">
				<xsl:if test="EB05BD01 = 0">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB05BD01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB05BJ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB05BS02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB05BJ02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB05BJ03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB05BJ04"/></font>
					</td>
				</tr>
				</xsl:if>
			</xsl:for-each>
		</table>
		<br/>
		<!--  -->
		<!-- 已结清信贷信息概要 -->
		
		<br/>
		
		<br/>
	
		<br/>
		<!-- 负债历史 -->
		
		
		<br/>
	</xsl:template>

<!-- 信贷记录明细 -->
	<xsl:template match="EDA">
		<br/>
		<div align="center">
			<font style="font-size: 22.0pt;font-weight:bold;">信贷记录明细</font>
		</div>
		<br/>
		<!-- 被追偿业务 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">被追偿业务</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷账户编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户活动状态</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷账户类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借款期限</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构代码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">授信协议编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类大类</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类细分</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">开户日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">币种</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">特定交易个数</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">历史表现</font>
				</td>
				
			</tr><tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借款金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信用额度</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">到期日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">担保方式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">其他还款保证方式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">发放形式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">共同借款标识</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">关闭日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">还款表现记录条数</font>
				</td>
			</tr>
			<xsl:for-each select="ED01/ED01A[ED01AD02 = 'C1']">
				<tr style="line-height:20px">
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2010"><xsl:value-of select="ED01AD01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2011"><xsl:value-of select="ED01AD02"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2020"><xsl:value-of select="ED01AD03"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2021"><xsl:value-of select="ED01AD04"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2022"><xsl:value-of select="ED01AD05"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;
						<xsl:if test="ED01AD05 = '10'"><span name="2023"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '11'"><span name="2024"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '12'"><span name="2025"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '13'"><span name="2026"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '14'"><span name="2027"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '15'"><span name="2028"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '16'"><span name="2029"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '21'"><span name="2030"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '31'"><span name="2031"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '41'"><span name="2032"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '51'"><span name="2033"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="3003"><xsl:value-of select="ED01AD07"/></span></font>
					</td>
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="../ED01C/ED01CS01"/></font>
					</td>
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;见附件</font>
					</td>
				</tr><tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AJ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AJ02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2037"><xsl:value-of select="ED01AD08"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2038"><xsl:value-of select="ED01AD09"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2040"><xsl:value-of select="ED01AD10"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2097"><xsl:value-of select="ED01AD11"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR04"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="../ED01B/ED01BS01"/></font>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
		<!-- 中长期借款 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">未结清中长期借款</font>
				</td>
				<td height="25px" align="right">
					<font style="font-size: 12.0pt;font-weight:bold;">共 <xsl:value-of select="count(ED01/ED01A[ED01AD01 ='1' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and (ED01AD03 = '20' or ED01AD03 ='30')])"/> 笔</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷账户编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户活动状态</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷账户类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借款期限</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构代码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">授信协议编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类大类</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类细分</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">开户日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">币种</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">特定交易个数</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">历史表现</font>
				</td>
				
			</tr><tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借款金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信用额度</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">到期日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">担保方式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">其他还款保证方式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">发放形式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">共同借款标识</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">关闭日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">还款表现记录条数</font>
				</td>
			</tr>
			<xsl:for-each select="ED01/ED01A[ED01AD01 ='1' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and (ED01AD03 = '20' or ED01AD03 ='30')]">
				<tr style="line-height:20px">
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2010"><xsl:value-of select="ED01AD01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2011"><xsl:value-of select="ED01AD02"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2020"><xsl:value-of select="ED01AD03"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2021"><xsl:value-of select="ED01AD04"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AD05"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;
						<xsl:if test="ED01AD05 = '10'"><span name="2023"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '11'"><span name="2024"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '12'"><span name="2025"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '13'"><span name="2026"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '14'"><span name="2027"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '15'"><span name="2028"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '16'"><span name="2029"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '21'"><span name="2030"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '31'"><span name="2031"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '41'"><span name="2032"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '51'"><span name="2033"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="3003"><xsl:value-of select="ED01AD07"/></span></font>
					</td>
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="../ED01C/ED01CS01"/></font>
					</td>
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;见附件</font>
					</td>
				</tr><tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AJ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AJ02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2037"><xsl:value-of select="ED01AD08"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2038"><xsl:value-of select="ED01AD09"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2040"><xsl:value-of select="ED01AD10"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2097"><xsl:value-of select="ED01AD11"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR04"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="../ED01B/ED01BS01"/></font>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
		<!-- 短期借贷 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">短期借贷</font>
				</td>
				<td height="25px" align="right">
					<font style="font-size: 12.0pt;font-weight:bold;">共 <xsl:value-of select="count(ED01/ED01A[ED01AD01 ='1' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and (ED01AD03 = '20' or ED01AD03 ='30')])"/> 笔</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷账户编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户活动状态</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷账户类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借款期限</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构代码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">授信协议编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类大类</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类细分</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">开户日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">币种</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">特定交易个数</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">历史表现</font>
				</td>
				
			</tr><tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借款金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信用额度</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">到期日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">担保方式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">其他还款保证方式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">发放形式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">共同借款标识</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">关闭日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">还款表现记录条数</font>
				</td>
			</tr>
			<xsl:for-each select="ED01/ED01A[ED01AD01 ='1' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and ED01AD03 = '10']">
				<tr style="line-height:20px">
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2010"><xsl:value-of select="ED01AD01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2011"><xsl:value-of select="ED01AD02"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2020"><xsl:value-of select="ED01AD03"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2021"><xsl:value-of select="ED01AD04"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2022"><xsl:value-of select="ED01AD05"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;
						<xsl:if test="ED01AD05 = '10'"><span name="2023"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '11'"><span name="2024"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '12'"><span name="2025"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '13'"><span name="2026"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '14'"><span name="2027"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '15'"><span name="2028"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '16'"><span name="2029"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '21'"><span name="2030"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '31'"><span name="2031"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '41'"><span name="2032"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '51'"><span name="2033"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="3003"><xsl:value-of select="ED01AD07"/></span></font>
					</td>
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="../ED01C/ED01CS01"/></font>
					</td>
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;见附件</font>
					</td>
				</tr><tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AJ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AJ02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2037"><xsl:value-of select="ED01AD08"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2038"><xsl:value-of select="ED01AD09"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2040"><xsl:value-of select="ED01AD10"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2097"><xsl:value-of select="ED01AD11"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR04"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="../ED01B/ED01BS01"/></font>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<!-- 未结清循环透支 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">循环透支</font>
				</td>
				<td height="25px" align="right">
					<font style="font-size: 12.0pt;font-weight:bold;">共 <xsl:value-of select="count(ED01/ED01A[ED01AD01 ='1' and ED01AD02 = 'R1'])"/> 笔</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷账户编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户活动状态</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷账户类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借款期限</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构代码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">授信协议编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类大类</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类细分</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">开户日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">币种</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">特定交易个数</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">历史表现</font>
				</td>
				
			</tr><tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借款金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信用额度</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">到期日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">担保方式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">其他还款保证方式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">发放形式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">共同借款标识</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">关闭日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">还款表现记录条数</font>
				</td>
			</tr>
			<xsl:for-each select="ED01/ED01A">
			<xsl:if test="ED01AD01 ='1' and ED01AD02 = 'R1'">
				<tr style="line-height:20px">
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2010"><xsl:value-of select="ED01AD01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2011"><xsl:value-of select="ED01AD02"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2020"><xsl:value-of select="ED01AD03"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2021"><xsl:value-of select="ED01AD04"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2022"><xsl:value-of select="ED01AD05"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;
						<xsl:if test="ED01AD05 = '10'"><span name="2023"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '11'"><span name="2024"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '12'"><span name="2025"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '13'"><span name="2026"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '14'"><span name="2027"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '15'"><span name="2028"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '16'"><span name="2029"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '21'"><span name="2030"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '31'"><span name="2031"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '41'"><span name="2032"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '51'"><span name="2033"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="3003"><xsl:value-of select="ED01AD07"/></span></font>
					</td>
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="../ED01C/ED01CS01"/></font>
					</td>
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;见附件</font>
					</td>
				</tr><tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AJ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AJ02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2037"><xsl:value-of select="ED01AD08"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2038"><xsl:value-of select="ED01AD09"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2040"><xsl:value-of select="ED01AD10"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2097"><xsl:value-of select="ED01AD11"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR04"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="../ED01B/ED01BS01"/></font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>
		</table>
		<!-- 未结清贴现账户 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">未结清贴现账户</font>
				</td>
				<td height="25px" align="right">
					<font style="font-size: 12.0pt;font-weight:bold;">共 <xsl:value-of select="count(ED01/ED01A[ED01AD01 ='1' and ED01AD02 = 'D2'])"/> 笔</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷账户编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户活动状态</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷账户类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借款期限</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构代码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">授信协议编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类大类</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类细分</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">开户日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">币种</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">特定交易个数</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">历史表现</font>
				</td>
				
			</tr><tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借款金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信用额度</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">到期日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">担保方式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">其他还款保证方式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">发放形式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">共同借款标识</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">关闭日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">还款表现记录条数</font>
				</td>
			</tr>
			<xsl:for-each select="ED01/ED01A">
			<xsl:if test="ED01AD01 ='1' and ED01AD02 = 'D2'">
				<tr style="line-height:20px">
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2010"><xsl:value-of select="ED01AD01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2011"><xsl:value-of select="ED01AD02"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2020"><xsl:value-of select="ED01AD03"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2021"><xsl:value-of select="ED01AD04"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2022"><xsl:value-of select="ED01AD05"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;
						<xsl:if test="ED01AD05 = '10'"><span name="2023"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '11'"><span name="2024"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '12'"><span name="2025"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '13'"><span name="2026"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '14'"><span name="2027"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '15'"><span name="2028"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '16'"><span name="2029"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '21'"><span name="2030"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '31'"><span name="2031"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '41'"><span name="2032"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '51'"><span name="2033"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="3003"><xsl:value-of select="ED01AD07"/></span></font>
					</td>
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="../ED01C/ED01CS01"/></font>
					</td>
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;见附件</font>
					</td>
				</tr><tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AJ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AJ02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2037"><xsl:value-of select="ED01AD08"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2038"><xsl:value-of select="ED01AD09"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2040"><xsl:value-of select="ED01AD10"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2097"><xsl:value-of select="ED01AD11"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR04"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="../ED01B/ED01BS01"/></font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>
		</table>
		<!-- 已结清信贷 -->
		<!-- 被追偿业务 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">已结清被追偿业务</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷账户编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户活动状态</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷账户类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借款期限</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构代码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">授信协议编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类大类</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类细分</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">开户日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">币种</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">特定交易个数</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">历史表现</font>
				</td>
				
			</tr><tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借款金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信用额度</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">到期日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">担保方式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">其他还款保证方式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">发放形式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">共同借款标识</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">关闭日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">还款表现记录条数</font>
				</td>
			</tr>
			<xsl:for-each select="ED01/ED01A[ED01AD02 = 'C1' and ED01AD01 = '2']">
				<tr style="line-height:20px">
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2010"><xsl:value-of select="ED01AD01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2011"><xsl:value-of select="ED01AD02"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2020"><xsl:value-of select="ED01AD03"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2021"><xsl:value-of select="ED01AD04"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2022"><xsl:value-of select="ED01AD05"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;
						<xsl:if test="ED01AD05 = '10'"><span name="2023"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '11'"><span name="2024"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '12'"><span name="2025"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '13'"><span name="2026"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '14'"><span name="2027"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '15'"><span name="2028"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '16'"><span name="2029"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '21'"><span name="2030"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '31'"><span name="2031"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '41'"><span name="2032"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '51'"><span name="2033"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="3003"><xsl:value-of select="ED01AD07"/></span></font>
					</td>
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="../ED01C/ED01CS01"/></font>
					</td>
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;见附件</font>
					</td>
				</tr><tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AJ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AJ02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2037"><xsl:value-of select="ED01AD08"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2038"><xsl:value-of select="ED01AD09"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2040"><xsl:value-of select="ED01AD10"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2097"><xsl:value-of select="ED01AD11"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR04"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="../ED01B/ED01BS01"/></font>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
		<!-- 中长期借款 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">已结清中长期借款</font>
				</td>
				<td height="25px" align="right">
					<font style="font-size: 12.0pt;font-weight:bold;">共 <xsl:value-of select="count(ED01/ED01A[ED01AD01 ='2' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and (ED01AD03 = '20' or ED01AD03 ='30')])"/> 笔</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷账户编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户活动状态</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷账户类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借款期限</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构代码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">授信协议编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类大类</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类细分</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">开户日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">币种</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">特定交易个数</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">历史表现</font>
				</td>
				
			</tr><tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借款金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信用额度</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">到期日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">担保方式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">其他还款保证方式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">发放形式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">共同借款标识</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">关闭日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">还款表现记录条数</font>
				</td>
			</tr>
			<xsl:for-each select="ED01/ED01A[ED01AD01 ='2' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and (ED01AD03 = '20' or ED01AD03 ='30')]">
				<tr style="line-height:20px">
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2010"><xsl:value-of select="ED01AD01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2011"><xsl:value-of select="ED01AD02"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2020"><xsl:value-of select="ED01AD03"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2021"><xsl:value-of select="ED01AD04"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2022"><xsl:value-of select="ED01AD05"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;
						<xsl:if test="ED01AD05 = '10'"><span name="2023"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '11'"><span name="2024"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '12'"><span name="2025"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '13'"><span name="2026"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '14'"><span name="2027"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '15'"><span name="2028"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '16'"><span name="2029"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '21'"><span name="2030"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '31'"><span name="2031"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '41'"><span name="2032"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '51'"><span name="2033"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="3003"><xsl:value-of select="ED01AD07"/></span></font>
					</td>
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="../ED01C/ED01CS01"/></font>
					</td>
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;见附件</font>
					</td>
				</tr><tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AJ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AJ02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2037"><xsl:value-of select="ED01AD08"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2038"><xsl:value-of select="ED01AD09"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2040"><xsl:value-of select="ED01AD10"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2097"><xsl:value-of select="ED01AD11"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR04"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="../ED01B/ED01BS01"/></font>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
		<!-- 短期借贷 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">已结清短期借贷</font>
				</td>
				<td height="25px" align="right">
					<font style="font-size: 12.0pt;font-weight:bold;">共 <xsl:value-of select="count(ED01/ED01A[ED01AD01 ='2' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and (ED01AD03 = '20' or ED01AD03 ='30')])"/> 笔</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷账户编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户活动状态</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷账户类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借款期限</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构代码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">授信协议编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类大类</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类细分</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">开户日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">币种</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">特定交易个数</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">历史表现</font>
				</td>
				
			</tr><tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借款金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信用额度</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">到期日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">担保方式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">其他还款保证方式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">发放形式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">共同借款标识</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">关闭日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">还款表现记录条数</font>
				</td>
			</tr>
			<xsl:for-each select="ED01/ED01A[ED01AD01 ='2' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and ED01AD03 = '10']">
				<tr style="line-height:20px">
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2010"><xsl:value-of select="ED01AD01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2011"><xsl:value-of select="ED01AD02"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2020"><xsl:value-of select="ED01AD03"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2021"><xsl:value-of select="ED01AD04"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2022"><xsl:value-of select="ED01AD05"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;
						<xsl:if test="ED01AD05 = '10'"><span name="2023"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '11'"><span name="2024"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '12'"><span name="2025"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '13'"><span name="2026"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '14'"><span name="2027"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '15'"><span name="2028"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '16'"><span name="2029"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '21'"><span name="2030"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '31'"><span name="2031"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '41'"><span name="2032"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '51'"><span name="2033"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="3003"><xsl:value-of select="ED01AD07"/></span></font>
					</td>
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="../ED01C/ED01CS01"/></font>
					</td>
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;见附件</font>
					</td>
				</tr><tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AJ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AJ02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2037"><xsl:value-of select="ED01AD08"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2038"><xsl:value-of select="ED01AD09"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2040"><xsl:value-of select="ED01AD10"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2097"><xsl:value-of select="ED01AD11"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR04"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="../ED01B/ED01BS01"/></font>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<!-- 已结清循环透支 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">已结清循环透支</font>
				</td>
				<td height="25px" align="right">
					<font style="font-size: 12.0pt;font-weight:bold;">共 <xsl:value-of select="count(ED01/ED01A[ED01AD01 ='2' and ED01AD02 = 'R1'])"/> 笔</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷账户编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户活动状态</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷账户类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借款期限</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构代码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">授信协议编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类大类</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类细分</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">开户日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">币种</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">特定交易个数</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">历史表现</font>
				</td>
				
			</tr><tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借款金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信用额度</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">到期日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">担保方式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">其他还款保证方式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">发放形式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">共同借款标识</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">关闭日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">还款表现记录条数</font>
				</td>
			</tr>
			<xsl:for-each select="ED01/ED01A">
			<xsl:if test="ED01AD01 ='2' and ED01AD02 = 'R1'">
				<tr style="line-height:20px">
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2010"><xsl:value-of select="ED01AD01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2011"><xsl:value-of select="ED01AD02"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2020"><xsl:value-of select="ED01AD03"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2021"><xsl:value-of select="ED01AD04"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2022"><xsl:value-of select="ED01AD05"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;
						<xsl:if test="ED01AD05 = '10'"><span name="2023"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '11'"><span name="2024"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '12'"><span name="2025"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '13'"><span name="2026"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '14'"><span name="2027"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '15'"><span name="2028"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '16'"><span name="2029"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '21'"><span name="2030"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '31'"><span name="2031"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '41'"><span name="2032"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '51'"><span name="2033"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="3003"><xsl:value-of select="ED01AD07"/></span></font>
					</td>
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="../ED01C/ED01CS01"/></font>
					</td>
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;见附件</font>
					</td>
				</tr><tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AJ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AJ02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2037"><xsl:value-of select="ED01AD08"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2038"><xsl:value-of select="ED01AD09"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2040"><xsl:value-of select="ED01AD10"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2097"><xsl:value-of select="ED01AD11"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR04"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="../ED01B/ED01BS01"/></font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>
		</table>
		<!-- 未结清贴现账户 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">已结清结清贴现账户</font>
				</td>
				<td height="25px" align="right">
					<font style="font-size: 12.0pt;font-weight:bold;">共 <xsl:value-of select="count(ED01/ED01A[ED01AD01 ='2' and ED01AD02 = 'D2'])"/> 笔</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷账户编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户活动状态</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷账户类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借款期限</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构代码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">授信协议编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类大类</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类细分</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">开户日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">币种</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">特定交易个数</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">历史表现</font>
				</td>
				
			</tr><tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借款金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信用额度</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">到期日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">担保方式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">其他还款保证方式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">发放形式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">共同借款标识</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">关闭日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">还款表现记录条数</font>
				</td>
			</tr>
			<xsl:for-each select="ED01/ED01A">
			<xsl:if test="ED01AD01 ='2' and ED01AD02 = 'D2'">
				<tr style="line-height:20px">
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2010"><xsl:value-of select="ED01AD01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2011"><xsl:value-of select="ED01AD02"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2020"><xsl:value-of select="ED01AD03"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2021"><xsl:value-of select="ED01AD04"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AI03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2022"><xsl:value-of select="ED01AD05"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;
						<xsl:if test="ED01AD05 = '10'"><span name="2023"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '11'"><span name="2024"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '12'"><span name="2025"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '13'"><span name="2026"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '14'"><span name="2027"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '15'"><span name="2028"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '16'"><span name="2029"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '21'"><span name="2030"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '31'"><span name="2031"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '41'"><span name="2032"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '51'"><span name="2033"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="3003"><xsl:value-of select="ED01AD07"/></span></font>
					</td>
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="../ED01C/ED01CS01"/></font>
					</td>
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;见附件</font>
					</td>
				</tr><tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AJ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AJ02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2037"><xsl:value-of select="ED01AD08"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2038"><xsl:value-of select="ED01AD09"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2040"><xsl:value-of select="ED01AD10"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2097"><xsl:value-of select="ED01AD11"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01AR04"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="../ED01B/ED01BS01"/></font>
					</td>
				</tr>
			</xsl:if>
			</xsl:for-each>
		</table>
		<!-- 贴现账户分机构汇总信息 -->
		<!-- 贴现 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">贴现账户分机构汇总信息</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">贴现账户分机构汇总信息编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构代码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务种类</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">五级分类</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">未结清账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额合计</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期总额合计</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期本金合计</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">已结清账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">已结清账户贴现金额合计</font>
				</td>
			</tr>
			<xsl:for-each select="ED02[ED020S01 != '']">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED020I01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2021"><xsl:value-of select="ED020D01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED020I02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2096"><xsl:value-of select="ED020D02"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2045"><xsl:value-of select="ED020D03"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED020S01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED020J01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED020J02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED020J03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED020S02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED020J04"/></font>
					</td>
				</tr>
			</xsl:for-each>
		</table>	
		<!-- 欠息信息 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">欠息信息</font>
				</td>
			</tr>
			<xsl:if test="ED03 != ''">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">欠息</font>
				</td>
				<td height="25px" align="right">
					<font style="font-size: 12.0pt;font-weight:bold;">共 <xsl:value-of select="count(ED03)"/> 笔</font>
				</td>
			</tr>
			</xsl:if>
		</table>
		<xsl:if test="ED03 != ''">		
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">欠息信息编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构代码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">币种</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">欠息余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额变化日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">欠息类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
				</td>
			</tr>
			<xsl:for-each select="ED03">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED030I01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name="2021"><xsl:value-of select="ED030D01"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED030I02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name="3003"><xsl:value-of select="ED030D02"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED030J01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED030R01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name="2044"><xsl:value-of select="ED030D03"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED030R02"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<br/>
		</xsl:if>
		<br/>
		<br/>
		<!-- 担保账户信息单元 -->
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">银行承兑汇票和信用证的信用证明细</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="../EDB/ED04[ED04A/ED04AD03 = '51' or ED04A/ED04AD03 = '61']">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">授信机构：</font>
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04A/ED04AI02"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">业务种类：</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2034"><xsl:value-of select="ED04A/ED04AD03"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">账户状态：</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2010"><xsl:value-of select="ED04B/ED04BD01"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">五级分类：</font>
					<font style="font-size: 12.0pt;f">&#160;<span name="2045"><xsl:value-of select="ED04B/ED04BD02"/></span></font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<xsl:if test="ED04B/ED04BD01 = '1'">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">开立日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">到期日</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">币种</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">反担保方式</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">保证金比例</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">风险敞口</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">授信协议编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04A/ED04AI01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04A/ED04AR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04A/ED04AR02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name="3003"><xsl:value-of select="ED04A/ED04AD04"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04A/ED04AJ01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name="2095"><xsl:value-of select="ED01A/ED04AD05"/></span></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04A/ED04AQ01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04B/ED04BJ01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04B/ED04BJ02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04A/ED04AI03"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04B/ED04BR01"/></font>
				</td>
			</tr>
			</xsl:if>
			<xsl:if test="ED04B/ED04BD01 = '2'">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">开立日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">到期日</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">币种</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">关闭日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle"> 
					<font style="font-size: 12.0pt;font-weight:bold;">垫款标志</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04A/ED04AI01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04A/ED04AR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04A/ED04AR02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name="3003"><xsl:value-of select="ED04A/ED04AD04"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04A/ED04AJ01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04B/ED04BR02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name="2013"><xsl:value-of select="ED04B/ED04BD03"/></span></font>
				</td>
			</tr>			
			</xsl:if>
		</table>
		<br/>
		</xsl:for-each>
		<br/>
			
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">(七)银行保函及其他业务的信贷明细</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="../EDB/ED04[ED04A/ED04AD03 != '51' and ED04A/ED04AD03 != '61']">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">授信机构：</font>
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04A/ED04AI02"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">业务种类：</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2034"><xsl:value-of select="ED04A/ED04AD03"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">账户状态：</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2010"><xsl:value-of select="ED04B/ED04BD01"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">五级分类：</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2045"><xsl:value-of select="ED04B/ED04BD02"/></span></font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<xsl:if test="ED04B/ED04BD01 = '1'">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">开立日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">到期日</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">币种</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">反担保方式</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">保证金比例</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">风险敞口</font>
				</td>
				<td height="25px" align="center" colspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04A/ED04AI01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04A/ED04AR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04A/ED04AR02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name="3003"><xsl:value-of select="ED04A/ED04AD04"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04A/ED04AJ01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name="2095"><xsl:value-of select="ED04A/ED04AD05"/></span></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04A/ED04AQ01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04B/ED04BJ01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04B/ED04BJ02"/></font>
				</td>
				<td height="25px" align="center" colspan="2">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04B/ED04BR01"/></font>
				</td>
			</tr>
			</xsl:if>
			<xsl:if test="ED04B/ED04BD01 = '2'">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">开立日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">到期日</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">币种</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">关闭日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">垫款标志</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04A/ED04AI01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04A/ED04AR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04A/ED04AR02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name="3003"><xsl:value-of select="ED04A/ED04AD04"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04A/ED04AJ01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04B/ED04BR02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name="2013"><xsl:value-of select="ED04B/ED04BD03"/></span></font>
				</td>
			</tr>			
			</xsl:if>
		</table>
		<br/>
		</xsl:for-each>
		<!-- 担保账户分机构汇总信息 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">担保账户分机构汇总信息</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">银行承兑汇票和信用证</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">担保账户分机构汇总信息编号</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构类型</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">授信机构代码</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务种类</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">五级分类</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" colspan="5" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">到期日≤30天</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">到期日≤60天</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">到期日≤90天</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">到期日>90天</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额合计</font>
				</td>
			</tr>
			<xsl:for-each select="../EDB/ED05[ED050S01 != '' and (ED050D02 ='51' or ED050D02 ='61')]">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED050I01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2013"><xsl:value-of select="ED050D01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED050I02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2034"><xsl:value-of select="ED050D02"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2045"><xsl:value-of select="ED050D03"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED050S01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED050J02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED050J03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED050J04"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED050J05"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED050J01"/></font>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">银行保函及其他业务</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">担保账户分机构汇总信息编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构代码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">担保交易业务种类细分</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">五级分类</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">未结清账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
			</tr>
			<xsl:for-each select="../EDB/ED05[ED050S01 != '' and ED050D02 !='51' and ED050D02 !='61']">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED050I01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2021"><xsl:value-of select="ED050D01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED050I02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2034"><xsl:value-of select="ED050D02"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2045"><xsl:value-of select="ED050D03"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED050S01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED050J01"/></font>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">授信信息</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">授信协议编号</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构代码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">授信额度类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">额度循环标志</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">生效日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">到期日</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">币种</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">授信额度</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">已用额度</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">授信限额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">授信限额编号</font>
				</td>
			</tr>
			<xsl:for-each select="../EDC/ED06">
				<tr style="line-height:20px">
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED060I01"/></font>
					</td>
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;<span name="2021"><xsl:value-of select="ED060D01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED060I02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2039"><xsl:value-of select="ED060D02"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2046"><xsl:value-of select="ED060D03"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED060R01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED060R02"/></font>
					</td>
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED060R03"/></font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="3003"><xsl:value-of select="ED060D04"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED060J01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED060J04"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED060J03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED060I03"/></font>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
		<br/>
		<!-- 相关还款责任 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">相关还款责任</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">为其他借款人承担的相关还款责任</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">除贴现外的其他业务</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">主借款人身份类别</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户类型</font>
				</td>
				
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">责任类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">保证合同编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">还款责任币种</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">还款责任金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务机构代码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务种类细分</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">开立日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">到期日</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">币种</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信用额度</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务种类</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借款金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">五级分类</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期总额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期本金</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期月数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">还款状态</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">剩余还款月数</font>
				</td>
				<td height="25px" align="center" colspan="3" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
				</td>
			</tr>
			<xsl:for-each select="../EDD/ED07">
				<tr style="line-height:20px">
					<td height="25px" align="center" rowspan="2">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED070I01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2001"><xsl:value-of select="ED070D01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;
						<xsl:if test="ED070D01 = '1'"><span name="2014"><xsl:value-of select="ED070D02"/></span></xsl:if>
						<xsl:if test="ED070D01 = '2'"><span name="2011"><xsl:value-of select="ED070D02"/></span></xsl:if>
						</font>
					</td>
					
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2011"><xsl:value-of select="ED070D03"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED070I03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="3003"><xsl:value-of select="ED070D10"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED070J01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED070I02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;
						<xsl:if test="ED070D01 = '1'"><span name="1058"><xsl:value-of select="ED070D06"/></span></xsl:if>
						<xsl:if test="ED070D01 = '2'"><span name="2022"><xsl:value-of select="ED070D06"/></span></xsl:if>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED070R01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED070R02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="3003"><xsl:value-of select="ED070D07"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED070J06"/></font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2021"><xsl:value-of select="ED070D04"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;
						<xsl:if test="ED070D01 = '1'"><span name="1058"><xsl:value-of select="ED070D05"/></span></xsl:if>
						<xsl:if test="ED070D01 = '2'"><span name="2022"><xsl:value-of select="ED070D05"/></span></xsl:if>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED070J05"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED070J02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2045"><xsl:value-of select="ED070D08"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED070J03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED070J04"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED070S01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;
						<!-- 当为C1账户的时候返回空 -->
						<xsl:if test="ED070D02 = 'C1'"></xsl:if>
						<!-- 当主借款人是企业的时候，返回空 -->
						<xsl:if test="ED070D01 = '2'"></xsl:if>
						<!-- 当主借款人是个人的其他账户时，参见附录A -->
						<xsl:if test="ED070D01 = '1'"><span name="2019"><xsl:value-of select="ED070D09"/></span></xsl:if>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED070S02"/></font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED070R03"/></font>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">相关还款责任贴现账户分机构汇总信息</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">贴现账户分机构汇总信息编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">相关还款责任类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构代码 </font>
				</td>
				
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">还款责任金额</font>
				</td>
				
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务种类细分</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">五级分类</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借款金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期总额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期本金</font>
				</td>
				<td height="25px" width="10%" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">保证合同编号</font>
				</td>
			</tr>
			<xsl:for-each select="../EDD/ED08">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED080I01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2019"><xsl:value-of select="ED080D01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2021"><xsl:value-of select="ED080D02"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED080I02"/></font>
					</td>
					
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED080J01"/></font>
					</td>
					
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2030"><xsl:value-of select="ED080D03"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2045"><xsl:value-of select="ED080D04"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED080S01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED080J05"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED080J02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED080J03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED080J04"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED080I03"/></font>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">为担保交易承担的相关还款责任</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">担保账户分机构汇总信息编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">相关还款责任类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构代码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">还款责任金额</font>
				</td>
				
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务种类细分</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">五级分类</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">担保金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">保证合同编号</font>
				</td>
			</tr>
			<xsl:for-each select="../EDD/ED09">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED090I01"/></font> 
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2021"><xsl:value-of select="ED090D02"/></span></font> 
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2019"><xsl:value-of select="ED090D01"/></span></font> 
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED090I02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED090J01"/></font>
					</td>
					
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2030"><xsl:value-of select="ED090D03"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="2045"><xsl:value-of select="ED090D04"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED090S01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED090J03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED090J02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED090I03"/></font>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
	</xsl:template>
	
<!-- 非信贷记录明细 -->
	<xsl:template match="EEA">
		<br/>
		<div align="center">
			<font style="font-size: 22.0pt;font-weight:bold;">非信贷记录明细</font>
		</div>
		<br/><br/>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">公用事业缴费信息</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">公用事业缴费账户编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">公用事业单位名称</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">缴费状态</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">累计欠费金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">统计年月</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">查看过去 24 个月缴费情况</font>
				</td>
			</tr>
			<xsl:for-each select="EE01">
			<tr style="line-height:20px">
			<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EE01A/EE01AI01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EE01A/EE01AQ01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name="2051"><xsl:value-of select="EE01A/EE01AD01"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;
					<xsl:if test="EE01A/EE01AD01 = '1'"><span name="2052"><xsl:value-of select="EE01A/EE01AD02"/></span></xsl:if>
					<xsl:if test="EE01A/EE01AD01 = '2'"><span name="2053"><xsl:value-of select="EE01A/EE01AD02"/></span></xsl:if>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EE01A/EE01AJ01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EE01A/EE01AR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">见附件</font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<br/>	
	</xsl:template>
<!-- 公共记录明细 -->
	<!-- 欠税信息 -->
	<xsl:template match="EFA">
		<br/>
		<div align="center">
			<font style="font-size: 22.0pt;font-weight:bold;">公共记录明细</font>
		</div>
		<br/>
		<xsl:if test="EF01 !=''">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;" color="red">欠税记录</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">欠税记录编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">主管税务机关</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">欠税总额（元）</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">欠税统计日期</font>
				</td>
			</tr>
			<xsl:for-each select="EF01">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF010I01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF010Q01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF010J01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF010R01"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<br/>
		</xsl:if>
	</xsl:template>
	<!-- 民事判决记录 强制执行记录 -->
	<xsl:template match="EFB">
		<xsl:if test="count(EF02/child::*) != 0">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;" color="red">民事判决记录</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="EF02">
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">民事判决记录编号</font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF020I01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">立案法院：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF020Q01"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">立案日期：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF020R01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">案由：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF020Q02"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">诉讼地位：</font>
					<font style="font-size: 12.0pt;"><span name="2055"><xsl:value-of select="EF020D01"/></span></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">案号：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF020I02"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">审判程序：</font>
					<font style="font-size: 12.0pt;"><span name="2056"><xsl:value-of select="EF020D02"/></span></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">诉讼标的：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF020Q03"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">诉讼标的金额（元）：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF020J01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">结案方式：</font>
					<font style="font-size: 12.0pt;"><span name="2057"><xsl:value-of select="EF020D03"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">判决/调解生效日期：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF020R02"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left" colspan="2">
					<font style="font-size: 12.0pt;font-weight:bold;">判决/调解结果：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF020Q04"/></font>
				</td>
			</tr>
		</table>
		<br/>
		</xsl:for-each>
		</xsl:if>		
		<xsl:if test="count(EF03/child::*) != 0">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;" color="red">强制执行记录</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="EF03">
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
		<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">强制执行记录编号</font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF030I01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">立案法院：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF030Q01"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">立案日期：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF030R01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">案由：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF030Q02"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">案号：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF030I02"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">申请执行标的：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF030Q03"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">申请执行标的金额（元）：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF030J01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">案件状态：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF030Q04"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">结案方式：</font>
					<font style="font-size: 12.0pt;"><span name="2058"><xsl:value-of select="EF030D01"/></span></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">已执行标的：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF030Q05"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">已执行标的金额（元）：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF030J02"/></font>
				</td>
			</tr>
		</table>
		<br/>
		</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- 行政处罚信息 -->
	<xsl:template match="EFC">
		<xsl:if test="count(child::*) != 0">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;" color="red">行政处罚信息</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="EF04">
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
		<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">行政处罚记录编号</font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF040I01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">处罚机构：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF040Q01"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">处罚决定书文号：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF040I02"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">违法行为：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF040Q02"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">处罚日期：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF040R01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">处罚决定：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF040Q03"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">处罚金额（元）：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF040J01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">处罚执行情况：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF040Q04"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">行政复议结果：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF040Q05"/></font>
				</td>
			</tr>
		</table>
		<br/>
		</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- 住房公积金参缴信息 -->
	<xsl:template match="EFD">
		<xsl:if test="count(child::*) != 0">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">住房公积金参缴信息</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<xsl:for-each select="EF05">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">账户编号</font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF05A/EF05AI01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">统计年月：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF05A/EF05AR04"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">初缴年月：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF05A/EF05AR01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">职工人数：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF05A/EF05AS01"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">缴费基数（元）：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF05A/EF05AJ01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次缴费日期：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF05A/EF05AR02"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">缴至年月：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF05A/EF05AR03"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">缴费状态：</font>
					<font style="font-size: 12.0pt;"><span name="2059"><xsl:value-of select="EF05A/EF05AD01"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">累计欠费金额（元）：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF05A/EF05AJ02"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<br/>
		</xsl:if>
	</xsl:template>
	<!-- 获得许可记录 获得认证记录 获得资质记录 获得奖励记录 拥有专利情况 -->
	<xsl:template match="EFE">
		<xsl:if test="count(EF06/child::*) != 0">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">获得许可记录</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">许可记录编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">许可部门</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">许可类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">许可日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">截止日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">许可内容</font>
				</td>
			</tr>
			<xsl:for-each select="EF06">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF060I01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF060Q01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF060Q02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF060R01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF060R02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF060Q03"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<br/>
		</xsl:if>
		<xsl:if test="count(EF07/child::*) != 0">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">获得认证记录</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">认证记录编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">认证部门</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">认证类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">认证日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">截止日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">认证内容</font>
				</td>
			</tr>
			<xsl:for-each select="EF07">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF070I01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF070Q01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF070Q02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF070R01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF070R02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF070Q03"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<br/>
		</xsl:if>
		<xsl:if test="count(EF08/child::*) != 0">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">获得资质记录</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">资质记录编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">认定部门</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">资质类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">批准日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">截止日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">资质内容</font>
				</td>
			</tr>
			<xsl:for-each select="EF08">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF080I01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF080Q01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF080Q02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF080R01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF080R02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF080Q03"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<br/>
		</xsl:if>
		<xsl:if test="count(EF09/child::*) != 0">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">获得奖励记录</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">奖励记录编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">奖励部门</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">奖励名称</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">授予日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">截止日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">奖励事实</font>
				</td>
			</tr>
			<xsl:for-each select="EF09">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF090I01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF090Q01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF090Q02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF090R01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF090R02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF090Q03"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<br/>
		</xsl:if>
		<xsl:if test="count(EF10/child::*) != 0">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">拥有专利情况</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">专利名称</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">专利号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">申请日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">授予日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">专利有效期（单位：年）</font>
				</td>
			</tr>
			<xsl:for-each select="EF10">
			<tr style="line-height:20px">
			 	<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF100I01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF100Q01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF100I02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF100R01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF100R02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF100S01"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<br/>
		</xsl:if>
	</xsl:template>
	<!-- 出入境检验检疫绿色通道信息 进出口商品免验信息 进出口商品检验分类监管信息 -->
	<xsl:template match="EFF">
		<xsl:if test="count(EF11/child::*) != 0">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">出入境检验检疫绿色通道信息</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">批准部门</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">出口商品名称</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">生效日期</font>
				</td>
			</tr>
			<xsl:for-each select="EF11">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF110I01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF110Q01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF110Q02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF110R01"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<br/>
		</xsl:if>
		<xsl:if test="count(EF12/child::*) != 0">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">进出口商品免验信息</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">批准部门</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">免验商品名称</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">免验号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">截止日期</font>
				</td>
			</tr>
			<xsl:for-each select="EF12">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF120I01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF120Q01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF120Q02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF120I02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF120R02"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<br/>
		</xsl:if>
		<xsl:if test="count(EF13/child::*) != 0">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">进出口商品检验分类监管信息</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">监管部门</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">管辖直属局</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">监管级别</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">生效日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">截止日期</font>
				</td>
			</tr>
			<xsl:for-each select="EF13">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF130I01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF130Q01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF130Q02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name="2060"><xsl:value-of select="EF130D01"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF130R01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF130R02"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<br/>
		</xsl:if>
	</xsl:template>
	
	<!-- 融资规模控制信息 -->
	<xsl:template match="EFG">
		<xsl:if test="count(child::*) != 0">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">融资规模控制信息</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">所属名录</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">融资控制类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">年度</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">规模</font>
				</td>
			</tr>
			<xsl:for-each select="EF14">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF140I01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name="2094"><xsl:value-of select="EF140D01"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name="2093"><xsl:value-of select="EF140D02"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF140R01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF140J01"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<br/>
		</xsl:if>
	</xsl:template>
<!-- 财务报表 -->
	<xsl:template match="EGA"/>
<!-- 评级信息 -->
	<xsl:template match="EHA">
		<br/>
		<div align="center">
			<font style="font-size: 22.0pt;font-weight:bold;">评级信息</font>
		</div>
		<br/><br/>
		<xsl:if test="count(child::*) != 0">
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">评级信息编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">评级日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">评级结果</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">评级机构</font>
				</td>
			</tr>
			<xsl:for-each select="EH01">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EH010I01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EH010R01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EH010D01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EH010Q01"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<br/>
		</xsl:if>
		<xsl:if test="count(child::*) = 0">		
			<div align="center">
				<font style="font-size: 16.0pt;font-weight:bold;">无</font>
			</div>
			<br/>
		</xsl:if>
	</xsl:template>
<!-- 声明及异议标注信息 -->
	<xsl:template match="EIA">
		<br/>
		<div align="center">
			<font style="font-size: 22.0pt;font-weight:bold;">声明及异议标注信息</font>
		</div>
		<br/><br/>
		<xsl:if test="EI01[EI010D02='1']">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">数据提供机构说明</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" width="70%" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">数据提供机构说明</font>
				</td>
				<td height="25px" align="center" width="20%" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">添加日期</font>
				</td>
			</tr>
			<xsl:for-each select="EI01[EI010D02='1']">
			<tr style="line-height:20px">
				<td height="25px" align="center" width="70%">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EI010Q01"/></font>
				</td>
				<td height="25px" align="center" width="20%">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EI010R01"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<br/>
		</xsl:if>
		<xsl:if test="EI01[EI010D02='2']">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">征信中心说明</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" width="70%" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">征信中心说明</font>
				</td>
				<td height="25px" align="center" width="20%" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">添加日期</font>
				</td>
			</tr>
			<xsl:for-each select="EI01[EI010D02='2']">
			<tr style="line-height:20px">
				<td height="25px" align="center" width="70%">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EI010Q01"/></font>
				</td>
				<td height="25px" align="center" width="20%">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EI010R01"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<br/>
		</xsl:if>
		<xsl:if test="EI01[EI010D02='3']">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">信息主体声明</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" width="70%" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息主体声明</font>
				</td>
				<td height="25px" align="center" width="20%" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">添加日期</font>
				</td>
			</tr>
			<xsl:for-each select="EI01[EI010D02='3']">
			<tr style="line-height:20px">
				<td height="25px" align="center" width="70%">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EI010Q01"/></font>
				</td>
				<td height="25px" align="center" width="20%">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EI010R01"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<br/>
		</xsl:if>
		<xsl:if test="EI01[EI010D02='4']">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">异议标注</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" width="70%" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">异议标注</font>
				</td>
				<td height="25px" align="center" width="20%" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">添加日期</font>
				</td>
			</tr>
			<xsl:for-each select="EI01[EI010D02='4']">
			<tr style="line-height:20px">
				<td height="25px" align="center" width="70%">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EI010Q01"/></font>
				</td>
				<td height="25px" align="center" width="20%">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EI010R01"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<br/>
		</xsl:if>
		<xsl:if test="count(child::*) = 0">		
			<div align="center">
				<font style="font-size: 16.0pt;font-weight:bold;">无</font>
			</div>
			<br/>
		</xsl:if>
	</xsl:template>
<!-- 附件 1：信用记录补充信息 -->
	<xsl:template name="annex1">
		<br/>
		<div align="left" style="padding-left:70pt;">
			<font style="font-size: 22.0pt;font-weight:bold;">附件 1：信用记录补充信息</font>
		</div>
		<br/><br/>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left" style="padding-left:30pt;">
					<font style="font-size: 20.0pt;font-weight:bold;">一、信贷记录明细</font>
				</td>
			</tr>
		</table>
		<br/>
		<!-- (一)被追偿记录的历史表现 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">(一)被追偿记录的历史表现</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="EDA/ED01[ED01A/ED01AD02='C1']">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">账户编号：</font>
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01A/ED01AI01"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">账户状态：</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2010"><xsl:value-of select="ED01A/ED01AD01"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构代码：</font>
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01A/ED01AI02"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类大类：</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2022"><xsl:value-of select="ED01AD05"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类细分：</font>
					<font style="font-size: 12.0pt;">&#160;
						<xsl:if test="ED01AD05 = '10'"><span name="2023"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '11'"><span name="2024"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '12'"><span name="2025"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '13'"><span name="2026"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '14'"><span name="2027"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '15'"><span name="2028"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '16'"><span name="2029"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '21'"><span name="2030"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '31'"><span name="2031"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '41'"><span name="2032"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '51'"><span name="2033"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额变化日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">五级分类</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">五级分类认定日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次实际还款日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次实际还款总额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次还款形式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次约定还款日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次应还总额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期总额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期本金</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期月数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">剩余还款月数</font>
				</td>
			</tr>
			<xsl:for-each select="ED01B/ED01BH">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BD01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR03"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BD02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR05"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ03"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ05"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BS02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BS03"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<xsl:if test="ED01C !='' and ED01C/ED01CS01 !=0">
		<table bgcolor="" width="1000pt" align="center" border="1" style="border-top:medium none" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" style="border-top:medium none" colspan="5">
					<font style="font-size: 12.0pt;font-weight:bold;">特定交易提示</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">交易类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">交易日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">交易金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">到期日期变更月数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">交易明细信息</font>
				</td>
			</tr>
			<xsl:for-each select="ED01C/ED01CH">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01CD01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01CR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01CJ01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01CS02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01CQ01"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		</xsl:if>
		</xsl:for-each>
		
		<br/>
		<!-- (二)中长期借款的历史表现 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">(二)中长期借款的历史表现</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="EDA/ED01">
		<xsl:if test="(ED01A/ED01AD02 = 'D1' or ED01A/ED01AD02 = 'R4') and (ED01A/ED01AD03 = '20' or ED01A/ED01AD03 ='30')">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">账户编号：</font>
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01A/ED01AI01"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">账户状态：</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2010"><xsl:value-of select="ED01A/ED01AD01"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构代码：</font>
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01A/ED01AI02"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类大类：</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2022"><xsl:value-of select="ED01AD05"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类细分：</font>
					<font style="font-size: 12.0pt;">&#160;
						<xsl:if test="ED01AD05 = '10'"><span name="2023"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '11'"><span name="2024"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '12'"><span name="2025"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '13'"><span name="2026"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '14'"><span name="2027"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '15'"><span name="2028"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '16'"><span name="2029"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '21'"><span name="2030"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '31'"><span name="2031"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '41'"><span name="2032"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '51'"><span name="2033"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额变化日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">五级分类</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">五级分类认定日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次实际还款日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次实际还款总额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次还款形式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次约定还款日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次应还总额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期总额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期本金</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期月数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">剩余还款月数</font>
				</td>
			</tr>
			<xsl:for-each select="ED01B/ED01BH">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BD01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR03"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BD02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR05"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ03"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ05"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BS02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BS03"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<xsl:if test="ED01C !='' and ED01C/ED01CS01 !=0">
		<table bgcolor="" width="1000pt" align="center" border="1" style="border-top:medium none" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" style="border-top:medium none" colspan="5">
					<font style="font-size: 12.0pt;font-weight:bold;">特定交易提示</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">交易类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">交易日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">交易金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">到期日期变更月数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">交易明细信息</font>
				</td>
			</tr>
			<xsl:for-each select="ED01C/ED01CH">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01CD01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01CR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01CJ01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01CS02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01CQ01"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		</xsl:if>
		<br/>
		</xsl:if>
		</xsl:for-each>
		<br/>
		<!-- (三)短期借款的历史表现 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">(三)短期借款的历史表现</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="EDA/ED01[(ED01A/ED01AD02 = 'D1' or ED01A/ED01AD02 = 'R4') and ED01A/ED01AD03 = '10']">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">账户编号：</font>
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01A/ED01AI01"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">账户状态：</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2010"><xsl:value-of select="ED01A/ED01AD01"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构代码：</font>
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01A/ED01AI02"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类大类：</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2022"><xsl:value-of select="ED01AD05"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类细分：</font>
					<font style="font-size: 12.0pt;">&#160;
						<xsl:if test="ED01AD05 = '10'"><span name="2023"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '11'"><span name="2024"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '12'"><span name="2025"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '13'"><span name="2026"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '14'"><span name="2027"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '15'"><span name="2028"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '16'"><span name="2029"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '21'"><span name="2030"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '31'"><span name="2031"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '41'"><span name="2032"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '51'"><span name="2033"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额变化日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">五级分类</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">五级分类认定日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次实际还款日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次实际还款总额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次还款形式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次约定还款日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次应还总额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期总额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期本金</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期月数</font>
				</td>
				<td height="25px" width="5%" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">剩余还款月数</font>
				</td>
			</tr>
			<xsl:for-each select="ED01B/ED01BH">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BD01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR03"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BD02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR05"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ03"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ05"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BS02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BS03"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<xsl:if test="ED01C !='' and ED01C/ED01CS01 !=0">
		<table bgcolor="" width="1000pt" align="center" border="1" style="border-top:medium none" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" style="border-top:medium none" colspan="5">
					<font style="font-size: 12.0pt;font-weight:bold;">特定交易提示</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">交易类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">交易日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">交易金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">到期日期变更月数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">交易明细信息</font>
				</td>
			</tr>
			<xsl:for-each select="ED01C/ED01CH">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01CD01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01CR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01CJ01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01CS02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01CQ01"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		</xsl:if>
		<br/>
		</xsl:for-each>
		<br/>
		<!-- (四)循环透支的历史表现 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">(四)循环透支的历史表现</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="EDA/ED01[ED01A/ED01AD02 = 'R1']">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">账户编号：</font>
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01A/ED01AI01"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">账户状态：</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2010"><xsl:value-of select="ED01A/ED01AD01"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构代码：</font>
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01A/ED01AI02"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类大类：</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2022"><xsl:value-of select="ED01AD05"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类细分：</font>
					<font style="font-size: 12.0pt;">&#160;
						<xsl:if test="ED01AD05 = '10'"><span name="2023"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '11'"><span name="2024"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '12'"><span name="2025"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '13'"><span name="2026"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '14'"><span name="2027"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '15'"><span name="2028"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '16'"><span name="2029"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '21'"><span name="2030"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '31'"><span name="2031"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '41'"><span name="2032"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '51'"><span name="2033"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额变化日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">五级分类</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">五级分类认定日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次实际还款日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次实际还款总额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次还款形式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次约定还款日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次应还总额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期总额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期本金</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期月数</font>
				</td>
				<td height="25px" width="5%" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">剩余还款月数</font>
				</td>
			</tr>
			<xsl:for-each select="ED01B/ED01BH">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BD01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR03"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BD02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR05"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ03"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ05"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BS02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BS03"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<xsl:if test="ED01C !='' and ED01C/ED01CS01 !=0">
		<table bgcolor="" width="1000pt" align="center" border="1" style="border-top:medium none" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" style="border-top:medium none" colspan="5">
					<font style="font-size: 12.0pt;font-weight:bold;">特定交易提示</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">交易类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">交易日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">交易金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">到期日期变更月数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">交易明细信息</font>
				</td>
			</tr>
			<xsl:for-each select="ED01C/ED01CH">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01CD01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01CR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01CJ01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01CS02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01CQ01"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		</xsl:if>
		<br/>
		</xsl:for-each>
		<br/>
		<!-- (五)贴现的信贷明细、历史表现 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">(五)贴现的信贷明细、历史表现</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="EDA/ED01[ED01A/ED01AD02 = 'D2']">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">账户编号：</font>
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01A/ED01AI01"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">账户状态：</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2010"><xsl:value-of select="ED01A/ED01AD01"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构代码：</font>
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01A/ED01AI02"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类大类：</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2022"><xsl:value-of select="ED01AD05"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">借贷业务种类细分：</font>
					<font style="font-size: 12.0pt;">&#160;
						<xsl:if test="ED01AD05 = '10'"><span name="2023"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '11'"><span name="2024"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '12'"><span name="2025"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '13'"><span name="2026"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '14'"><span name="2027"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '15'"><span name="2028"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '16'"><span name="2029"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '21'"><span name="2030"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '31'"><span name="2031"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '41'"><span name="2032"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						<xsl:if test="ED01AD05 = '51'"><span name="2033"><xsl:value-of select="ED01AD06"/></span></xsl:if>
						</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<xsl:if test="ED01A/ED01AD01 = '1'">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额变化日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">五级分类</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">五级分类认定日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次实际还款日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次实际还款总额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次还款形式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次约定还款日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次应还总额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期总额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期本金</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期月数</font>
				</td>
				<td height="25px" width="5%" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">剩余还款月数</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BD01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR03"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BD02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR05"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ03"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ05"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BS02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BS03"/></font>
				</td>
			</tr>
			</xsl:if>
			<xsl:if test="ED01A/ED01AD01 = '2'">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额变化日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">五级分类</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">五级分类认定日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次实际还款日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次实际还款总额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次还款形式</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次约定还款日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近一次应还总额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期总额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期本金</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">逾期月数</font>
				</td>
				<td height="25px" width="5%" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">剩余还款月数</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BD01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR03"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BD02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BR05"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ03"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BJ05"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BS02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01BS03"/></font>
				</td>
			</tr>
			</xsl:if>
		</table>
		<xsl:if test="ED01C !='' and ED01C/ED01CS01 !=0">
		<table bgcolor="" width="1000pt" align="center" border="1" style="border-top:medium none" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" style="border-top:medium none" colspan="5">
					<font style="font-size: 12.0pt;font-weight:bold;">特定交易提示</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">交易类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">交易日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">交易金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">到期日期变更月数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">交易明细信息</font>
				</td>
			</tr>
			<xsl:for-each select="ED01C/ED01CH">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01CD01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01CR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01CJ01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01CS02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01CQ01"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		</xsl:if>
		<br/>
		</xsl:for-each>
		<br/>
		<!-- (六)银行承兑汇票和信用证的信贷明细 -->
		
		<br/><br/>
		<!-- 二、非信贷记录明细 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left" style="padding-left:30pt;">
					<font style="font-size: 20.0pt;font-weight:bold;">二、非信贷记录明细</font>
				</td>
			</tr>
		</table>
		<br/>
		<!-- 公用事业历史缴费记录明细 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">公用事业历史缴费记录明细</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="EEA/EE01">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left" width="50%">
					<font style="font-size: 12.0pt;font-weight:bold;">公用事业单位名称：</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EE01A/EE01AQ01"/></font>
				</td>
				<td height="25px" align="left" width="30%">
					<font style="font-size: 12.0pt;font-weight:bold;">业务类型：</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2051"><xsl:value-of select="EE01A/EE01AD01"/></span></font>
				</td>
				<td height="25px" align="left" width="50%">
					<font style="font-size: 12.0pt;font-weight:bold;">缴费记录条数：</font>
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EE01B/EE01BS01"/></font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">统计年月</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">缴费状态</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">本月应缴金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">本月实缴金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">累计欠费金额</font>
				</td>
			</tr>
			<xsl:for-each select="EE01B/EE01BH">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EE01BR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EE01BD01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EE01BJ01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EE01BJ02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EE01BJ03"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<br/>
		</xsl:for-each>
		<br/><br/>
		<!-- 三、公共记录明细 -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left" style="padding-left:30pt;">
					<font style="font-size: 20.0pt;font-weight:bold;">三、公共记录明细</font>
				</td>
			</tr>
		</table>
		<br/>
		<!-- 住房公积金历史缴费记录明细 -->
		<xsl:for-each select="EFD/EF05">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">住房公积金历史缴费记录明细</font>
				</td>
				<td height="25px" align="left" width="50%">
					<font style="font-size: 12.0pt;font-weight:bold;">缴费记录条数：</font>
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="../EF05B/EF05BS01"/></font>
				</td>
			</tr>
		</table>
		
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">统计年月</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">缴费状态</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">本月应缴金额（元）</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">本月实缴金额（元）</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">累计欠费金额（元）</font>
				</td>
			</tr>
			<xsl:for-each select="EF05B/EF05BH">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF05BR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name="2059"><xsl:value-of select="EF05BD01"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF05BJ01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF05BJ02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EF05BJ03"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		</xsl:for-each>
	
	</xsl:template>
<!-- 附件 2：财务报表信息 -->
	<xsl:template name="annex2">
		<br/>
		<div align="left" style="padding-left:70pt;">
			<font style="font-size: 22.0pt;font-weight:bold;">附件 2：财务报表信息</font>
		</div>
		<br/><br/>
		<!-- 企业资产负债表(2002 版) -->
		<xsl:for-each select="EGA/EG01">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">企业资产负债表(2002 版)</font>
				</td>
				
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">财务报表编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">业务管理机构类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">业务管理机构代码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表年份</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表类型细分</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG01A/EG01AI01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2021"><xsl:value-of select="EG01A/EG01AD01"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG01A/EG01AI02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG01A/EG01AR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2063"><xsl:value-of select="EG01A/EG01AD02"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2064"><xsl:value-of select="EG01A/EG01AD03"/></span></font>
				</td>
			</tr>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">项目</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">期末值</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">项目</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">期末值</font>
				</td>
			</tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">货币资金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ01"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">短期借款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ45"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">短期投资</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ02"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">应付票据</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ46"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">应收票据</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ03"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">应付账款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ47"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">应收股利</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ04"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">预收账款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ48"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">应收利息</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ05"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">应付工资</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ49"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">应收账款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ06"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">应付福利费</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ50"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">其他应收款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ07"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">应付利润</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ51"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">预付账款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ08"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">应交税金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ52"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">期货保证金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ09"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">其他应交款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ53"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">应收补贴款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ10 "/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">其他应付款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ54"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">应收出口退税</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ11"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">预提费用</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ55"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">存货</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ12"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">预计负债</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ56"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">存货原材料</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ13"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">一年内到期的长期负债</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ57"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">存货产成品</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ14"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">其他流动负债</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ58"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">待摊费用</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ15"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">流动负债合计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ59"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">待处理流动资产净损失</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ16"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">长期借款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ60"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">一年内到期的长期债权投资</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ17"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">应付债券</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ61"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">其他流动资产</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ18"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">长期应付款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ62"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">流动资产合计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ19"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">专项应付款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ63"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">长期投资</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ20"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">其他长期负债</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ64"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">长期股权投资</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ21"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">（其他长期负债科目下）特准储备基金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ65"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">长期债权投资</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ22"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">长期负债合计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ66"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">合并价差</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ23"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">递延税款贷项</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ67"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">长期投资合计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ24"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">负债合计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ68"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">固定资产原价</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ25"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">少数股东权益</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ69"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">累计折旧</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ26"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">实收资本</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ70"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">固定资产净值</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ27"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">国家资本</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ71"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">固定资产值减值准备</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ28"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">集体资本</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ72"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">固定资产净额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ29"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">法人资本</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ73 "/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">固定资产清理</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ30"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">（法人资本科目下）国有法人资本</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ74"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">工程物资</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ31"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">（法人资本科目下）集体法人资本</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ75"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">在建工程</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ32"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">个人资本</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ76"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">待处理固定资产净损失</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ33"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">外商资本</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ77"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">固定资产合计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ34"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">资本公积</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ78"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">无形资产</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ35"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">盈余公积</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ79"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">（无形资产科目下）土地使用权</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ36"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">（盈余公积科目下）法定盈余公积</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ80"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">递延资产</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ37"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">（盈余公积科目下）公益金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ81"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">（递延资产科目下）固定资产修理</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ38"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">（盈余公积科目下）补充流动资本</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ82"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">（递延资产科目下）固定资产改良支出</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ39"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">未确认的投资损失</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ83"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">其他长期资产</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ40"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">未分配利润</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ84"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">（其他长期资产科目下）特准储备物资</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ41 "/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">外币报表折算差额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ85"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">无形及其他资产合计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ42"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">所有者权益合计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ86"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">递延税款借项</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ43"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">负债和所有者权益总计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ87"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">资产总计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ44"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;</font></td></tr>
		</table>
		<br/>
		</xsl:for-each>
		<!-- 企业资产负债表(2007 版) -->
		<xsl:for-each select="EGA/EG02">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">企业资产负债表(2007 版)</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">财务报表编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">业务管理机构类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">业务管理机构代码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表年份</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表类型细分</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG02A/EG02AI01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2021"><xsl:value-of select="EG02A/EG02AD01"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG02A/EG02AI02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG02A/EG02AR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2063"><xsl:value-of select="EG02A/EG02AD02"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2064"><xsl:value-of select="EG02A/EG02AD03"/></span></font>
				</td>
			</tr>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">项目</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">期末值</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">项目</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">期末值</font>
				</td>
			</tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">货币资金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ01 "/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">短期借款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ32"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">交易性金融资产</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ02"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">交易性金融负债</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ33"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">应收票据</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ03"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">应付票据</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ34 "/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">应收账款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ04"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">应付账款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ35"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">预付账款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ05"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">预收账款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ36"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">应收利息</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ06"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">应付利息</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ37"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">应收股利</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ07"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">应付职工薪酬</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ38"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">其他应收款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ08"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">应交税费</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ39"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">存货</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ09"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">应付股利</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ40"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">一年内到期的非流动资产</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ10"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">其他应付款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ41"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">其他流动资产</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ11"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">一年内到期的非流动负债</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ42"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">流动资产合计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ12"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">其他流动负债</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ43"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">可供出售的金融资产</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ13"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">流动负债合计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ44"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">持有至到期投资</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ14"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">长期借款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ45"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">长期股权投资</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ15"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">应付债券</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ46"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">长期应收款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ16"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">长期应付款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ47"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">投资性房地产</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ17"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">专项应付款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ48"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">固定资产</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ18"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">预计负债</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ49"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">在建工程</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ19"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">递延所得税负债</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ50"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">工程物资</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ20"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">其他非流动负债</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ51"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">固定资产清理</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ21"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">非流动负债合计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ52"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">生产性生物资产</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ22"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">负债合计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ53"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">油气资产</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ23"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">实收资本（或股本）</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ54"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">无形资产</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ24"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">资本公积</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ55"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">开发支出</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ25"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">减：库存股</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ56"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">商誉</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ26"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">盈余公积</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ57"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">长期待摊费用</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ27"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">未分配利润</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ58"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">递延所得税资产</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ28"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">所有者权益合计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ59"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">其他非流动资产</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ29"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">负债和所有者权益合计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ60"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">非流动资产合计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ30"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;</font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">资产总计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ31"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;</font></td></tr>
		</table>
		<br/>
		</xsl:for-each>
		<!-- 企业利润及利润分配表（2002 版） -->
		<xsl:for-each select="EGA/EG03">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">企业利润及利润分配表（2002 版）</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">财务报表编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">业务管理机构类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">业务管理机构代码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表年份</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表类型细分</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG03A/EG03AI01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2021"><xsl:value-of select="EG03A/EG03AD01"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG03A/EG03AI02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG03A/EG03AR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2063"><xsl:value-of select="EG03A/EG03AD02"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2064"><xsl:value-of select="EG03A/EG03AD03"/></span></font>
				</td>
			</tr>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">项目</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">期末值</font>
				</td>
			</tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">主营业务收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ01"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">（主营业务收入科目下）出口产品销售收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ02"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">（主营业务收入科目下）进口产品销售收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ03"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">销售折扣与折让</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ04"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">主营业务收入净额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ05"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">主营业务成本</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ06"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">（主营业务成本科目下）出口产品销售成本</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ07"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">主营业务税金及附加</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ08"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">经营费用</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ09"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">其他（业务成本）</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ10"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">递延收益</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ11"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">代购代销收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ12"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">其他（收入）</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ13"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">主营业务利润</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ14"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">其他业务利润</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ15"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">营业费用</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ16"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">管理费用</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ17"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">财务费用</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ18"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">其他（费用）</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ19"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">营业利润</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ20"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">投资收益</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ21"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">期货收益</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ22"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">补贴收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ23 "/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">（补贴收入科目下）补贴前亏损的企业补贴收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ24"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">营业外收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ25"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">（营业外收入科目下）处置固定资产净收益</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ26"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">（营业外收入科目下）非货币性交易收益</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ27"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">（营业外收入科目下）出售无形资产收益</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ28"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">（营业外收入科目下）罚款净收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ29"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">其他（利润）</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ30"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">（其他科目下）用以前年度含量工资节余弥补利润</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ31"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">营业外支出</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ32"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">（营业外支出科目下）处置固定资产净损失</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ33"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">（营业外支出科目下）债务重组损失</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ34"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">（营业外支出科目下）罚款支出</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ35"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">（营业外支出科目下）捐赠支出</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ36"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">其他支出</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ37"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">（其他支出）结转的含量工资包干节余</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ38"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">利润总额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ39"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">所得税</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ40"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">少数股东损益</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ41"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">未确认的投资损失</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ42"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">净利润</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ43"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">年初未分配利润</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ44"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">盈余公积补亏</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ45"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">其他调整因素</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ46"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">可供分配的利润</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ47 "/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">单项留用的利润</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ48"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">补充流动资本</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ49"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">提取法定盈余公积</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ50"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">提取法定公益金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ51"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">提取职工奖励及福利基金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ52"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">提取储备基金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ53"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">提取企业发展基金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ54"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">利润归还投资</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ55"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">（可供分配的利润科目下）其他</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ56"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">可供投资者分配的利润</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ57"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">应付优先股股利</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ58"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">提取任意盈余公积</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ59"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">应付普通股股利</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ60"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">转作资本的普通股股利</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ61"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">（可供投资者分配的利润科目下）其他</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ62"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">未分配利润</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ63"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">（未分配利润科目下）应由以后年度税前利润弥补的亏损</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ64"/></font></td></tr>
		</table>
		<br/>
		</xsl:for-each>
		<!-- 企业利润及利润分配表（2007 版） -->
		<xsl:for-each select="EGA/EG04">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">企业利润及利润分配表（2007 版）</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">财务报表编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">业务管理机构类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">业务管理机构代码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表年份</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表类型细分</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG04A/EG04AI01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2021"><xsl:value-of select="EG04A/EG04AD01"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG04A/EG04AI02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG04A/EG04AR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2063"><xsl:value-of select="EG04A/EG04AD02"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2064"><xsl:value-of select="EG04A/EG04AD03"/></span></font>
				</td>
			</tr>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">项目</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">期末值</font>
				</td>
			</tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">营业收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ01"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">营业成本</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ02"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">营业税金及附加</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ03"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">销售费用</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ04"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">管理费用</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ05"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">财务费用</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ06"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">资产减值损失</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ07"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">公允价值变动净收益</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ08"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">投资净收益</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ09"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">对联营企业和合营企业的投资收益</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ10"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">营业利润</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ11"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">营业外收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ12"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">营业外支出</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ13"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">非流动资产损失（其中：非流动资产处置损失）</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ14"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">利润总额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ15"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">所得税费用</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ16"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">净利润</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ17"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">基本每股收益</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ18"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">稀释每股收益</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ19"/></font></td></tr>
		</table>
		<br/>
		</xsl:for-each>
		<!-- 企业现金流量表（2002 版） -->
		<xsl:for-each select="EGA/EG05">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">企业现金流量表（2002 版）</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">财务报表编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">业务管理机构类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">业务管理机构代码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表年份</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表类型细分</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG05A/EG05AI01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2021"><xsl:value-of select="EG05A/EG05AD01"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG05A/EG05AI02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG05A/EG05AR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2063"><xsl:value-of select="EG05A/EG05AD02"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2064"><xsl:value-of select="EG05A/EG05AD03"/></span></font>
				</td>
			</tr>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">项目</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">期末值</font>
				</td>
			</tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">销售商品和提供劳务收到的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ01"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">收到的税费返还</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ02"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">收到的其他与经营活动有关的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ03"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">经营活动现金流入小计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ04"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">购买商品、接受劳务支付的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ05"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">支付给职工以及为职工支付的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ06"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">支付的各项税费</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ07"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">支付的其他与经营活动有关的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ08"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">经营活动现金流出小计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ09"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">经营活动产生的现金流量净额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ10"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">收回投资所收到的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ11"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">取得投资收益所收到的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ12"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">处置固定资产无形资产和其他长期资产所收回的现金净额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ13"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">收到的其他与投资活动有关的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ14"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">投资活动现金流入小计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ15"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">购建固定资产无形资产和其他长期资产所支付的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ16"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">投资所支付的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ17"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">支付的其他与投资活动有关的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ18"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">投资活动现金流出小计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ19"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">投资活动产生的现金流量净额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ20"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">吸收投资所收到的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ21"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">借款所收到的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ22 "/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">收到的其他与筹资活动有关的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ23"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">筹资活动现金流入小计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ24"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">偿还债务所支付的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ25"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">分配股利、利润或偿付利息所支付的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ26"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">支付的其他与筹资活动有关的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ27"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">筹资活动现金流出小计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ28"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">筹集活动产生的现金流量净额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ29"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">汇率变动对现金的影响</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ30"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">现金及现金等价物净增加额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ31"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">净利润</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ32"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">计提的资产减值准备</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ33"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">固定资产拆旧</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ34"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">无形资产摊销</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ35"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">长期待摊费用摊销</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ36"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">待摊费用减少</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ37"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">预提费用增加</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ38"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">处置固定资产无形资产和其他长期资产的损失</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ39"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">固定资产报废损失</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ40"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">财务费用</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ41"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">投资损失</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ42"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">递延税款贷项</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ43"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">存货的减少</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ44"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">经营性应收项目的减少</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ45"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">经营性应付项目的增加</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ46"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">（净利润调节为经营活动现金流量科目下）其他</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ47"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">经营活动产生的现金流量净额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ48"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">债务转为资本</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ49"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">一年内到期的可转换公司债券</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ50"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">融资租入固定资产</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ51"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">（不涉及现金收支的投资和筹资活动科目下）其他</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ52 "/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">现金的期末余额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ53"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">现金的期初余额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ54"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">现金等价物的期末余额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ55"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">现金等价物的期初余额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ56"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">现金及现金等价物净增加额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ57"/></font></td></tr>
		</table>
		<br/>
		</xsl:for-each>
		<!-- 企业现金流量表（2007 版） -->
		<xsl:for-each select="EGA/EG06">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">企业现金流量表（2007 版）</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">财务报表编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">业务管理机构类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">业务管理机构代码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表年份</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表类型细分</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG06A/EG06AI01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2021"><xsl:value-of select="EG06A/EG06AD01"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG06A/EG06AI02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG06A/EG06AR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2063"><xsl:value-of select="EG06A/EG06AD02"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2064"><xsl:value-of select="EG06A/EG06AD03"/></span></font>
				</td>
			</tr>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">项目</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">期末值</font>
				</td>
			</tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">销售商品和提供劳务收到的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ01"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">收到的税费返还</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ02"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">收到其他与经营活动有关的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ03"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">经营活动现金流入小计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ04"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">购买商品、接受劳务支付的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ05"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">支付给职工以及为职工支付的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ06"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">支付的各项税费</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ07"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">支付其他与经营活动有关的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ08 "/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">经营活动现金流出小计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ09"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">经营活动产生的现金流量净额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ10"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">收回投资所收到的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ11"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">取得投资收益所收到的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ12"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">处置固定资产无形资产和其他长期资产所收回的现金净额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ13"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">处置子公司及其他营业单位收到的现金净额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ14"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">收到其他与投资活动有关的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ15"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">投资活动现金流入小计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ16"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">购建固定资产无形资产和其他长期资产所支付的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ17"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">投资所支付的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ18"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">取得子公司及其他营业单位支付的现金净额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ19"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">支付其他与投资活动有关的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ20"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">投资活动现金流出小计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ21"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">投资活动产生的现金流量净额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ22"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">吸收投资收到的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ23"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">取得借款收到的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ24"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">收到其他与筹资活动有关的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ25"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">筹资活动现金流入小计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ26"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">偿还债务所支付的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ27"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">分配股利、利润或偿付利息所支付的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ28"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">支付其他与筹资活动有关的现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ29"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">筹资活动现金流出小计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ30"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">筹集活动产生的现金流量净额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ31"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">汇率变动对现金及现金等价物的影响</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ32 "/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">现金及现金等价物净增加额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ33"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">期初现金及现金等价物余额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ34"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">期末现金及现金等价物余额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ35"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">净利润</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ36"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">资产减值准备</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ37"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">固定资产折旧、油气资产折耗、生产性生物资产折旧</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ38"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">无形资产摊销</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ39"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">长期待摊费用摊销</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ40"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">待摊费用减少</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ41"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">预提费用增加</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ42"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">处置固定资产无形资产和其他长期资产的损失</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ43"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">固定资产报废损失</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ44"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">公允价值变动损失</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ45"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">财务费用</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ46"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">投资损失</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ47"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">递延所得税资产减少</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ48"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">递延所得税负债增加</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ49"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">存货的减少</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ50"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">经营性应收项目的减少</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ51"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">经营性应付项目的增加</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ52"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">（净利润调节为经营活动现金流量科目下）其他</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ53"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">经营活动产生的现金流量净额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ54"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">债务转为资本</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ55"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">一年内到期的可转换公司债券</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ56"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">融资租入固定资产</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ57"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">现金的期末余额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ58"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">现金的期初余额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ59"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">现金等价物的期末余额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ60"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">现金等价物的期初余额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ61"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">现金及现金等价物净增加额</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ62 "/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">（不涉及现金收支的投资和筹资活动科目下）其他</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ63 "/></font></td></tr>
		</table>
		<br/>
		</xsl:for-each>
		<!-- 事业单位资产负债表(1997 版) -->
		<xsl:for-each select="EGA/EG07">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">事业单位资产负债表(1997 版)</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">财务报表编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">业务管理机构类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">业务管理机构代码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表年份</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表类型细分</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG07A/EG07AI01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2021"><xsl:value-of select="EG07A/EG07AD01"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG07A/EG07AI02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG07A/EG07AR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2063"><xsl:value-of select="EG07A/EG07AD02"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2064"><xsl:value-of select="EG07A/EG07AD03"/></span></font>
				</td>
			</tr>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">项目</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">期末值</font>
				</td>
			</tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">现金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ01"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">银行存款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ02"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">应收票据</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ03"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">应收账款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ04"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">预付账款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ05"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">其他应收款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ06"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">材料</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ07"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">产成品</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ08"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">对外投资</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ09"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">固定资产</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ10"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">无形资产</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ11"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">资产合计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ12"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">拨出经费</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ13"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">拨出专款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ14"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">专款支出</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ15"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">事业支出</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ16"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">经营支出</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ17 "/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">成本费用</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ18"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">销售税金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ19"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">上缴上级支出</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ20"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">对附属单位补助</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ21"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">结转自筹基建</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ22"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">支出合计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ23"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">资产部类总计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ24"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">借记款项</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ25"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">应付票据</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ26"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">应付账款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ27"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">预收账款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ28"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">其他应付款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ29"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">应缴预算款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ30"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">应缴财政专户款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ31"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">应交税金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ32"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">负债合计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ33"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">事业基金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ34"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">一般基金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ35"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">投资基金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ36"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">固定基金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ37"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">专用基金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ38"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">事业结余</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ39"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">经营结余</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ40"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">净资产合计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ41"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">财政补助收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ42"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">上级补助收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ43"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">拨入专款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ44"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">事业收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ45"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">经营收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ46"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">附属单位缴款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ47"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">其他收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ48"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">收入合计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ49"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">负债部类总计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ50 "/></font></td></tr>
		</table>
		<br/>
		</xsl:for-each>
		<!-- 事业单位资产负债表(2013 版) -->
		<xsl:for-each select="EGA/EG08">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">事业单位资产负债表(2013 版)</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">财务报表编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">业务管理机构类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">业务管理机构代码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表年份</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表类型细分</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG08A/EG08AI01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2021"><xsl:value-of select="EG08A/EG08AD01"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG08A/EG08AI02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG08A/EG08AR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2063"><xsl:value-of select="EG08A/EG08AD02"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2064"><xsl:value-of select="EG08A/EG08AD03"/></span></font>
				</td>
			</tr>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">项目</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">期末值</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">项目</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">期末值</font>
				</td>
			</tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">货币资金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ01"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">短期借款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ22"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">短期投资</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ02"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">应缴税费</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ23"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">财政应返还额度</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ03"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">应缴国库款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ24"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">应收票据</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ04"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">应缴财政专户款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ25"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">应收账款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ05"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">应付职工薪酬</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ26"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">预付账款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ06"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">应付票据</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ27"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">其他应收款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ07"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">应付账款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ28"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">存货</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ08"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">预收账款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ29"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">其他流动资产</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ09"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">其他应付款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ30"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">流动资产合计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ10"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">其他流动负债</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ31"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">长期投资</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ11"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">流动负债合计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ32"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">固定资产</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ12"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">长期借款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ33"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">固定资产原价</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ13"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">长期应付款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ34"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">累计折旧</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ14"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">非流动负债合计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ35"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">在建工程</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ15"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">负债合计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ36"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">无形资产</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ16"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">事业基金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ37"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">无形资产原价</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ17"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">非流动资产基金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ38"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">累计摊销</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ18"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">专用基金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ39"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">待处置资产损溢</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ19"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">财政补助结转</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ40"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">非流动资产合计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ20 "/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">财政补助结余</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ41"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">资产总计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ21"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">非财政补助结转</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ42"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">非财政补助结余</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ43"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">事业结余</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ44"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">经营结余</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ45"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">净资产合计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ46"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">负债和净资产总计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ47 "/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">未分配利润</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG02BJ58"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">所有者权益合计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG02BJ59"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">负债和所有者权益合计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG02BJ60"/></font></td></tr>
		</table>
		<br/>
		</xsl:for-each>
		<!-- 事业单位收入支出表（1997 版） -->
		<xsl:for-each select="EGA/EG09">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">事业单位收入支出表（1997 版）</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">财务报表编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">业务管理机构类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">业务管理机构代码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表年份</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表类型细分</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG09A/EG09AI01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2021"><xsl:value-of select="EG09A/EG09AD01"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG09A/EG09AI02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG09A/EG09AR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2063"><xsl:value-of select="EG09A/EG09AD02"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2064"><xsl:value-of select="EG09A/EG09AD03"/></span></font>
				</td>
			</tr>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">项目</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">期末值</font>
				</td>
			</tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">财政补助收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ01"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">上级补助收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ02"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">附属单位缴款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ03"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">事业收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ04"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">预算外资金收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ05"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">其他收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ06"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">事业收入小计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ07"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">经营收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ08"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">经营收入小计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ09"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">拨入专款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ10"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">拨入专款小计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ11"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">收入总计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ12"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">拨出经费</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ13"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">上缴上级支出</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ14"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">对附属单位补助</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ15"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">事业支出</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ16"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">财政补助支出</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ17"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">预算外资金支出</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ18"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">销售税金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ19"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">结转自筹基建</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ20 "/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">事业支出小计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ21"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">经营支出</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ22"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">销售税金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ23"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">经营支出小计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ24"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">拨出专款</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ25"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">专款支出</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ26"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">专款小计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ27"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">支出总计</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ28"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">事业结余</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ29"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">正常收入结余</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ30"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">收回以前年度事业支出</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ31"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">经营结余</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ32"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">以前年度经营亏损</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ33"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">结余分配</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ34"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">应交所得税</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ35"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">提取专用基金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ36"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">转入事业基金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ37"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">其他结余分配</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ38"/></font></td></tr>
		</table>
		<br/>
		</xsl:for-each>
		<!-- 事业单位收入支出表（2013 版） -->
		<xsl:for-each select="EGA/EG10">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">事业单位收入支出表（2013 版）</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">财务报表编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">业务管理机构类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">业务管理机构代码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表年份</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">报表类型细分</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG010A/EG010AI01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2021"><xsl:value-of select="EG010A/EG010AD01"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG010A/EG010AI02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><xsl:value-of select="EG010A/EG010AR01"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2063"><xsl:value-of select="EG010A/EG010AD02"/></span></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 14.0pt;"><span name="2064"><xsl:value-of select="EG010A/EG010AD03"/></span></font>
				</td>
			</tr>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">项目</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">期末值</font>
				</td>
			</tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">本期财政补助结转结余</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ01"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">财政补助收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ02"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">事业支出（财政补助支出）</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ03"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">本期事业结转结余</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ04"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">事业类收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ05"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">事业收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ06"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">上级补助收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ07"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">附属单位上缴收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ08"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">其他收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ09"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">（其他收入科目下）捐赠收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ10"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">事业类支出</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ11"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">事业支出（非财政补助支出）</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ12"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">上缴上级支出</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ13"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">对附属单位补助支出</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ14"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">其他支出</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ15"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">本期经营结余</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ16"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">经营收入</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ17"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">经营支出</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ18"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">弥补以前年度亏损后的经营结余</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ19"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">本年非财政补助结转结余</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ20"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">非财政补助结转</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ21"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">本年非财政补助结余</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ22"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">应缴企业所得税</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ23"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">提取专用基金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ24"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">转入事业基金</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ25"/></font></td></tr>
		</table>
		<br/>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
