<?xml version="1.0" encoding="GB2312"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
	<xsl:output method="html" version="1.0" encoding="GB2312"/>  
	<xsl:template match="/Document">
		<html oncontextmenu="return false" onselectstart="return false">
			<head>
				<title>企业信用报告</title>
				<meta name="generator"
				content="HTML Tidy for HTML5 (experimental) for Windows https://github.com/w3c/tidy-html5/tree/c63cc39" />
				<META name="robots" content="noindex,nofollow"/>
				<META charset="utf-8"/>
				<META content="IE=edge" http-equiv="X-UA-Compatible"/>
				<LINK rel="shortcut icon" href="favicon.png"/>
				<script src="../../../static/reportStyle/jquery.min.js"></script>
				<script src="../../../static/reportStyle/report.js"></script>
				<LINK rel="stylesheet" href="../../../static/reportStyle/report.css"/>
				<META name="GENERATOR" content="MSHTML 8.00.7601.18305"/>				
			</head>
			
			<body class="m-mainbox" background="../../../static/reportStyle/pbccrc_watermark3.gif">
			<div class="m-repbox"><!--logo和提示信息-->
				<div class="m-hd">
				<div class="u-logo">
				<img src="../../../static/reportStyle/logo.gif" />
				</div>
				</div>
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
				<script src="../../js/common/jquery-1.10.2.js"></script><SCRIPT>function printReport(){ javascript:document.execCommand('print');$.ajax({async:false,cache:false,data:{"ID":'a8b7037f48cf4924a2a62b9e048f7d3ea6d2b0c985a540279085e38db3f05163'},url:'../../../PersonReportInquiry/isPrint.do',type:"post" });}</SCRIPT><script>document.oncontextmenu = function(){return false;}</script>
				<form method="POST" action="--WEBBOT-SELF--"> 
				   <p align="center"> 
					<input onMouseOver="msover();" style="border:1px solid #cc9966; FONT-WEIGHT: normal; FONT-SIZE: 10pt; BACKGROUND: #fff6dc; COLOR: #000000; LINE-HEIGHT: normal; FONT-STYLE: normal; HEIGHT: 30; FONT-VARIANT: normal; width:58" onMouseOut="msout();" type="button" name="doPrint" value="打  印" class="button2" onclick="printReport()"/>
					<input onMouseOver="msover();" style="border:1px solid #cc9966; FONT-WEIGHT: normal; FONT-SIZE: 10pt; BACKGROUND: #fff6dc; COLOR: #000000; LINE-HEIGHT: normal; FONT-STYLE: normal; HEIGHT: 30; FONT-VARIANT: normal; width:58" onMouseOut="msout();" type="button" name="goBack" value="关  闭" class="button1" onclick="window.location.href=document.referrer;"/> </p> 
				</form>
			</div>
			</body>
		</html>
	</xsl:template>
<!-- 报告说明 -->
	<xsl:template match="EAA">
<div class="m-repbody">
        <div class="t1">报告说明</div>
        <ul class="u-msg-list">
          <li>1. 本报告由中心出具，依据截至报告时点的个人征信系统记录的信息生成。除查询记录外，其他信息均由相关机构提供，征信中心不保证其真实性和准确性，但承诺在信息汇总、加工、整合的全过程中保持客观、中立的地位。</li>
          <li>2. 本报告的信贷交易信息提示中，“业务类型”为“其他”的汇总信息不包含“资产处置”和“垫款”业务。</li>
          <li>3. 本报告中如果没有“信贷交易违约信息概要”信息，说明信用主体最近5年内没有连续逾期。</li>
          <li>4. 对于存在授信限额的协议信息，信息主体的可用额度需结合“授信协议信息”中的授信额度、授信限额信息和余额进行估算。</li>
          <li>5. 本报告中的信贷交易授信及负债信息概要展示的信息是指未结清/未销户的授信及负债信息。</li>
          <li>6. 本报告的借贷交易明细信息中，循环贷账户的到期日期是指账户授信额度的到期日期。</li>
          <li>7. 本报告的借贷交易明细信息中，借贷账户展示最近5年的还款情况，包括当前还款状态和当前逾期总额。</li>
          <li>8.
          对于通过自助渠道办理的“小额、高频”业务，金融机构将合并报送相关账户，展示在本报告的借贷交易明细信息中；此时账户的还款方式为“不区分还款方式”，该账户的还款频率统一约定为“月”，“还款期数”按月计算，其还款信息按月进行观测和更新。</li>
          <li>9. 本报告中的逾期准贷记卡账户是指该账户60天以上的透支行为。</li>
          <li>10. 本报告中的还款期数为“--”是指该账户是非分期还款。</li>
          <li>11. 本报告不展示5年前已经结束的违约行为，以及5年前的欠税记录、强制执行记录、民事判决记录、行政处罚记录、电信欠费记录。</li>
          <li>12. 机构说明是数据提供机构对具体业务添加的特别说明信息。</li>
          <li>13. 本人声明是信息主体对信用报告中的信息所附注的简要说明，信用主体对本人声明的真实性负责。</li>
          <li>14. 异议标注是征信中心添加的，用于说明信用主体对信用报告中的哪些信息有异议。</li>
          <li>15. 本报告内容涉及个人隐私，查询者应依法使用、妥善保管。因使用不当造成个人信息泄露的，征信中心将不承担相关责任。</li>
          <li>16. 除“有相关还款责任的企业借款”中的金额展示对应币种金额外，本报告中所有金额均为折合人民币金额。</li>
          <li>17. 本报告整合了数据提供机构以信息主体不同证件报送的信息。</li>
        </ul>
      </div>
	</xsl:template>
<!-- 报文头信息模块 -->
	<xsl:template match="EAA/EA01">
      <!--报告头-->
      <div class="m-rephead">
        <!--产品名称，版本-->
        <div class="m-reptitle">
          <h1 class="u-repname">企业信用报告</h1>
          <h3 class="u-repver">(授信机构版)</h3>
        </div>
		<!--产品名称，版本-->
		<table class="g-tab-bor">
          <tbody>
            <tr>
              <td style="TEXT-ALIGN: left; WIDTH: 50%" colspan="3">报告编号： <xsl:value-of select="EA01A/EA01AI01"/></td>
              <td style="TEXT-ALIGN: right; WIDTH: 50%" colspan="3">报告时间：<xsl:value-of select="EA01A/EA01AR01"/></td>
            </tr>
            <tr>
              <th style="WIDTH: 16%">查询机构</th>
              <th style="WIDTH: 16%">查询原因</th>
              <th style="WIDTH: 16%">企业名称</th>
              <th style="WIDTH: 16%">企业身份标识个数</th>
              <th style="WIDTH: 16%">企业身份标识类型</th>
              <th style="WIDTH: 16%">企业身份标识号码</th>
            </tr>
            <tr>
              <td><xsl:value-of select="EA01B/EA01BI01"/></td>
              <td><span name="2004"><xsl:value-of select="EA01B/EA01BD02"/></span></td>
              <td><xsl:value-of select="EA01C/EA01CQ01"/></td>
              <td><xsl:value-of select="EA01C/EA01CS01"/></td>
              <td><span name="2002"><xsl:value-of select="EA01C/EA01CH/EA01CD01"/></span></td>
              <td><span name="2002"><xsl:value-of select="EA01C/EA01CH/EA01CI01"/></span></td>
            </tr>
          </tbody>
        </table>
		<!-- 异议提示 -->
        <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="t2-2">异议信息提示</th>
            </tr>
            <tr>
              <td>
				<xsl:if test="EA01D/EA01DS01 != 0">			  
					信息主体对信用报告内容提出了 <xsl:value-of select="EA01D/EA01DS01"/>笔异议且正在处理中，请浏览时注意阅读相关内容。
				</xsl:if>
				<xsl:if test="EA01D/EA01DS01 = 0">			  
					没有正在处理的异议。
				</xsl:if>
			  </td>
            </tr>
          </tbody>
        </table>
      </div>
	</xsl:template>	
<!-- 企业基本信息 -->
	<xsl:template match="ECA">
      <div class="m-repbody">
        <div class="t1">一 企业基本信息</div>
        <div class="t2 f-mgtop">（一）基本概况信息</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-9">经济类型</th>
              <th class="g-w-9">组织机构类型</th>
              <th class="g-w-9">企业规模</th>
              <th class="g-w-9">所属行业</th>
              <th class="g-w-9">成立年份</th>
              <th class="g-w-9">登记证书有效截止日期</th>
              <th class="g-w-9">登记地址</th>
              <th class="g-w-9">办公/经营地址</th>
              <th class="g-w-9">存续状态</th>
            </tr>
            <tr>
              <td><span name=""><xsl:value-of select="EC01/EC010D01"/></span></td>
              <td><span name=""><xsl:value-of select="EC01/EC010D02"/></span></td>
              <td><span name="2005"><xsl:value-of select="EC01/EC010D03"/></span></td>
              <td><span name=""><xsl:value-of select="EC01/EC010D04"/></span></td>
              <td><xsl:value-of select="EC01/EC010R01"/></td>
              <td><xsl:value-of select="EC01/EC010R02"/></td>
              <td><xsl:value-of select="EC01/EC010Q01"/></td>
              <td><xsl:value-of select="EC01/EC010Q02"/></td>
              <td><span name="2006"/><xsl:value-of select="EC01/EC010D05"/></td>
            </tr>
          </tbody>
        </table>		
        <div class="t2 f-mgtop">（二）注册资本及主要出资人信息</div>		
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-3">注册资本折人民币合计</th>
              <th class="g-w-3">主要出资人个数</th>
              <th class="g-w-3">更新日期</th>
            </tr>
            <tr>
              <td><xsl:value-of select="EC02/EC020J01"/></td>
              <td><xsl:value-of select="EC02/EC020S01"/></td>
              <td><xsl:value-of select="EC02/EC020R01"/></td>
            </tr>
          </tbody>
        </table>
        <table class="g-subtab-bor">
          <!--抵消上边框-->
          <tbody>
            <tr>
              <th class="g-w-6">出资人类型</th>
              <th class="g-w-6">出资人身份类型</th>
              <th class="g-w-6">出资人名称</th>
              <th class="g-w-6">出资人身份标识类型</th>
              <th class="g-w-6">出资人身份标识号码</th>
              <th class="g-w-6">出资比例</th>
            </tr>
			<xsl:for-each select="EC02/EC020H">
			<tr>
				<td>
					<span name="2007"><xsl:value-of select="EC020D01"/></span>
				</td>
				<td>
					<span name="3004"><xsl:value-of select="EC020D02"/></span>
				</td>
				<td>
					<xsl:value-of select="EC020Q01"/>
				</td>
				<td>
					<xsl:if test="EC020D02 = '1'"><span name="3005"><xsl:value-of select="EC020D03"/></span></xsl:if>
					<xsl:if test="EC020D02 = '2'"><span name="2002"><xsl:value-of select="EC020D03"/></span></xsl:if>
				</td>
				<td>
					<xsl:value-of select="EC020I01"/>
				</td>
				<td>
					<xsl:value-of select="EC020Q02"/>
				</td>
			</tr>
			</xsl:for-each>
          </tbody>
        </table>
        <div class="t2 f-mgtop">（三）主要组成人员信息</div>
		<table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-2">主要成员个数</th>
              <th class="g-w-2">更新日期</th>
            </tr>
            <tr>
              <td><xsl:value-of select="EC03/EC030S01"/></td>
              <td><xsl:value-of select="EC03/EC030R01"/></td>
            </tr>
          </tbody>
        </table>
		<table class="g-subtab-bor">
          <!--抵消上边框-->
          <tbody>
            <tr>
              <th class="g-w-4">姓名</th>
              <th class="g-w-4">证件类型</th>
              <th class="g-w-4">证件号码</th>
              <th class="g-w-4">职位</th>
            </tr>
			<xsl:for-each select="EC03/EC030H">
			<tr>
				<td>
					<xsl:value-of select="EC030Q01"/>
				</td>
				<td>
					<span name="3005"><xsl:value-of select="EC030D01"/></span>
				</td> 
				<td>
					<xsl:value-of select="EC030I01"/>
				</td>
				<td>
					<span name="2008"><xsl:value-of select="EC030D02"/></span>
				</td>
			</tr>
			</xsl:for-each>
          </tbody>
        </table>
        <div class="t2 f-mgtop">（四）上级机构信息</div> 
		<table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-5">上级机构类型</th>
              <th class="g-w-5">上级机构名称</th>
              <th class="g-w-5">上级机构身份标识类型</th>
              <th class="g-w-5">上级机构身份标识号码</th>
              <th class="g-w-5">更新日期</th>
            </tr>
            <tr>
              <td><span name="2009"><xsl:value-of select="EC04/EC040D01"/></span></td>
              <td><xsl:value-of select="EC04/EC040Q01"/></td>
              <td><span name="2002"><xsl:value-of select="EC04/EC040D02"/></span></td>
              <td><xsl:value-of select="EC04/EC040I01"/></td>
              <td><xsl:value-of select="EC04/EC040R01"/></td>
            </tr>
          </tbody>
        </table>
        <div class="t2 f-mgtop">（五）实际控制人信息</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-2">实际控制人个数</th>
              <th class="g-w-2">更新日期</th>
            </tr>
            <tr>
              <td><xsl:value-of select="EC05/EC050S01"/></td>
              <td><xsl:value-of select="EC05/EC050R01"/></td>
            </tr>
          </tbody>
        </table>
		<table class="g-subtab-bor">
          <!--抵消上边框-->
          <tbody>
            <tr>
              <th class="g-w-4">实际控制人身份类型</th>
              <th class="g-w-4">实际控制人名称</th>
              <th class="g-w-4">实际控制人身份标识类型</th>
              <th class="g-w-4">实际控制人身份标识号码</th>
            </tr>
			<xsl:for-each select="EC05/EC050H">
            <tr>
              <td><span name="2001"><xsl:value-of select="EC050D01"/></span></td>
              <td><xsl:value-of select="EC050Q01"/></td>
				<td>
					<xsl:if test="EC020D02 = '1'"><span name="3005"><xsl:value-of select="EC050D02"/></span></xsl:if>
					<xsl:if test="EC020D02 = '2'"><span name="2002"><xsl:value-of select="EC020D03"/></span></xsl:if>
				</td>
              <td><xsl:value-of select="EC050I01"/></td>
            </tr>
			</xsl:for-each>
          </tbody>
        </table>
		</div>
	</xsl:template>
<!-- 信息概要 -->
	<!-- 信用提示信息 -->
	<xsl:template match="EBA/EB01">
		<br/>
        <div class="t1">二 信用提示信息</div>
        <!-- 设置三级标题变量 -->
        <div class="t2 f-mgtop">（一）信贷交易提示信息</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-11">首次有信贷交易的年份</th>
              <th class="g-w-11">首次有相关还款责任的年份</th>
              <th class="g-w-11">发生信贷交易的机构数</th>
              <th class="g-w-11">当前有未结清信贷交易的机构数</th>
              <th class="g-w-11">借贷交易余额</th>
              <th class="g-w-11">被追偿的借贷交易余额</th>
              <th class="g-w-11">关注类借贷交易余额</th>
              <th class="g-w-11">不良类借贷交易余额</th>
              <th class="g-w-11">担保交易余额</th>
              <th class="g-w-11">关注类担保交易余额</th>
              <th class="g-w-11">不良类担保交易余额</th>
            </tr>
			<tr>
				<td><xsl:value-of select="EB01A/EB01AR01"/></td>
				<td><xsl:value-of select="EB01A/EB01AR02"/></td>
				<td><xsl:value-of select="EB01A/EB01AS01"/></td>
				<td><xsl:value-of select="EB01A/EB01AS02"/></td>
				<td><xsl:value-of select="EB01A/EB01AJ01"/></td>
				<td><xsl:value-of select="EB01A/EB01AJ02"/></td>
				<td><xsl:value-of select="EB01A/EB01AJ03"/></td>
				<td><xsl:value-of select="EB01A/EB01AJ04"/></td>
				<td><xsl:value-of select="EB01A/EB01AJ05"/></td>
				<td><xsl:value-of select="EB01A/EB01AJ06"/></td>
				<td><xsl:value-of select="EB01A/EB01AJ07"/></td>
			</tr>
          </tbody>
        </table>
        <div class="t2 f-mgtop">（二）非信贷交易及公共信息提示信息</div>
		<!-- 非信贷交易 -->
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-5">非信贷交易账户数</th>
              <th class="g-w-5">欠税记录条数</th>
              <th class="g-w-5">民事判决记录条数</th>
              <th class="g-w-5">强制执行记录条数</th>
              <th class="g-w-5">行政处罚记录条数</th>
            </tr>
			<tr>
				<td><xsl:value-of select="EB01B/EB01BS01"/></td>
				<td><xsl:value-of select="EB01B/EB01BS02"/></td>
				<td><xsl:value-of select="EB01B/EB01BS03"/></td>
				<td><xsl:value-of select="EB01B/EB01BS04"/></td>
				<td><xsl:value-of select="EB01B/EB01BS05"/></td>
			</tr>
          </tbody>
        </table>
	</xsl:template>

	<xsl:template match="EBB">
		<!-- 未结清信贷及授信信息概要 -->
        <div class="t2 f-mgtop">（二）未结清信贷及授信信息概要</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-10">资产处置业务账户数</th>
              <th class="g-w-10">资产处置业务余额</th>
              <th class="g-w-10">最近一次处置日期</th>
              <th class="g-w-10">垫款业务账户数</th>
              <th class="g-w-10">垫款业务余额</th>
              <th class="g-w-10">垫款最近一次还款日期</th>
              <th class="g-w-10">逾期总额</th>
              <th class="g-w-10">逾期本金</th>
              <th class="g-w-10">逾期利息及其他</th>
              <th class="g-w-10">其他借贷交易分类汇总条目数量</th>
            </tr>
			<tr>
				<td><xsl:value-of select="EB02/EB02A/EB02AS01"/></td>
				<td><xsl:value-of select="EB02/EB02A/EB02AJ01"/></td>
				<td><xsl:value-of select="EB02/EB02A/EB02AR01"/></td>
				<td><xsl:value-of select="EB02/EB02A/EB02AS02"/></td>
				<td><xsl:value-of select="EB02/EB02A/EB02AJ02"/></td>
				<td><xsl:value-of select="EB02/EB02A/EB02AR02"/></td>
				<td><xsl:value-of select="EB02/EB02A/EB02AJ03"/></td>
				<td><xsl:value-of select="EB02/EB02A/EB02AJ04"/></td>
				<td><xsl:value-of select="EB02/EB02A/EB02AJ05"/></td>
				<td><xsl:value-of select="EB02/EB02A/EB02AS03"/></td>
			</tr>
          </tbody>
        </table>
		<!-- 未接清其他借贷交易信息 -->
        <div class="t2 f-mgtop">（三）未接清其他借贷交易信息</div>

        <table class="g-tab-bor f-tab-nomargin">
			<tbody>
			<tr>
				<td style="WIDTH: 20%" rowspan="2"></td>
				<td style="WIDTH: 20%" colspan="2">
					正常类
				</td>
				<td style="WIDTH: 20%" colspan="2">
					关注类
				</td>
				<td style="WIDTH: 20%" colspan="2">
					不良类
				</td>
				<td style="WIDTH: 20%" colspan="2">
					合计
				</td>
			</tr>
			<tr>
				<td>账户数</td>
				<td>余额</td>
				<td>账户数</td>
				<td>余额</td>
				<td>账户数</td>
				<td>余额</td>
				<td>账户数</td>
				<td>余额</td>
			</tr>
			<tr>
				<td>
					中长期借款
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '1' and EB02AD02 = 1">					
							<xsl:value-of select="EB02AS04"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '1' and EB02AD02 = 1">	
							<xsl:value-of select="EB02AJ06"/>
						</xsl:if>
					</xsl:for-each>	
				</td>		
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '1' and EB02AD02 = 2">					
							<xsl:value-of select="EB02AS04"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '1' and EB02AD02 = 2">	
							<xsl:value-of select="EB02AJ06"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '1' and EB02AD02 = 3">					
							<xsl:value-of select="EB02AS04"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '1' and EB02AD02 = 3">	
							<xsl:value-of select="EB02AJ06"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '1' and EB02AD02 = 0">					
							<xsl:value-of select="EB02AS04"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '1' and EB02AD02 = 0">	
							<xsl:value-of select="EB02AJ06"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
			</tr>
			<tr>
				<td>
					短期借款
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '2' and EB02AD02 = 1">					
							<xsl:value-of select="EB02AS04"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '2' and EB02AD02 = 1">	
							<xsl:value-of select="EB02AJ06"/>
						</xsl:if>
					</xsl:for-each>	
				</td>		
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '2' and EB02AD02 = 2">					
							<xsl:value-of select="EB02AS04"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '2' and EB02AD02 = 2">	
							<xsl:value-of select="EB02AJ06"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '2' and EB02AD02 = 3">					
							<xsl:value-of select="EB02AS04"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '2' and EB02AD02 = 3">	
							<xsl:value-of select="EB02AJ06"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '2' and EB02AD02 = 0">					
							<xsl:value-of select="EB02AS04"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '2' and EB02AD02 = 0">	
							<xsl:value-of select="EB02AJ06"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
			</tr>
			<tr>
				<td>
					循环透支
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '3' and EB02AD02 = 1">					
							<xsl:value-of select="EB02AS04"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '3' and EB02AD02 = 1">	
							<xsl:value-of select="EB02AJ06"/>
						</xsl:if>
					</xsl:for-each>	
				</td>		
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '3' and EB02AD02 = 2">					
							<xsl:value-of select="EB02AS04"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '3' and EB02AD02 = 2">	
							<xsl:value-of select="EB02AJ06"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '3' and EB02AD02 = 3">					
							<xsl:value-of select="EB02AS04"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '3' and EB02AD02 = 3">	
							<xsl:value-of select="EB02AJ06"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '3' and EB02AD02 = 0">					
							<xsl:value-of select="EB02AS04"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '3' and EB02AD02 = 0">	
							<xsl:value-of select="EB02AJ06"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
			</tr>
			<tr>
				<td>
					贴现
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '4' and EB02AD02 = 1">					
							<xsl:value-of select="EB02AS04"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '4' and EB02AD02 = 1">	
							<xsl:value-of select="EB02AJ06"/>
						</xsl:if>
					</xsl:for-each>	
				</td>		
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '4' and EB02AD02 = 2">					
							<xsl:value-of select="EB02AS04"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '4' and EB02AD02 = 2">	
							<xsl:value-of select="EB02AJ06"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '4' and EB02AD02 = 3">					
							<xsl:value-of select="EB02AS04"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '4' and EB02AD02 = 3">	
							<xsl:value-of select="EB02AJ06"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '4' and EB02AD02 = 0">					
							<xsl:value-of select="EB02AS04"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '4' and EB02AD02 = 0">	
							<xsl:value-of select="EB02AJ06"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
			</tr>
			<tr>
				<td>
					合计
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '0' and EB02AD02 = 1">					
							<xsl:value-of select="EB02AS04"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '0' and EB02AD02 = 1">	
							<xsl:value-of select="EB02AJ06"/>
						</xsl:if>
					</xsl:for-each>	
				</td>		
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '0' and EB02AD02 = 2">					
							<xsl:value-of select="EB02AS04"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '0' and EB02AD02 = 2">	
							<xsl:value-of select="EB02AJ06"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '0' and EB02AD02 = 3">					
							<xsl:value-of select="EB02AS04"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '0' and EB02AD02 = 3">	
							<xsl:value-of select="EB02AJ06"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '0' and EB02AD02 = 0">					
							<xsl:value-of select="EB02AS04"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
				<td>
					<xsl:for-each select="EB02/EB02A/EB02AH">
						<xsl:if test="EB02AD01 = '0' and EB02AD02 = 0">	
							<xsl:value-of select="EB02AJ06"/>
						</xsl:if>
					</xsl:for-each>	
				</td>
			</tr>
		</tbody>
		</table>
		<!-- 已结清信贷交易 -->
		<!-- 已结清信贷信息概要 -->
		<div class="t2 f-mgtop">（四）已结清信贷信息概要</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-7">资产处置业务账户数</th>
              <th class="g-w-7">资产处置业务金额</th>
              <th class="g-w-7">处置完成日期</th>
              <th class="g-w-7">结清日期</th>
              <th class="g-w-7">垫款业务账户数</th>
              <th class="g-w-7">垫款业务金额</th>
              <th class="g-w-7">其他借贷交易分类汇总条目数量</th>
            </tr>
            <tr>
              <td><xsl:value-of select="EB02/EB02B/EB02BS01"/></td>
              <td><xsl:value-of select="EB02/EB02B/EB02BJ01"/></td>
              <td><xsl:value-of select="EB02/EB02B/EB02BR01"/></td>
              <td><xsl:value-of select="EB02/EB02B/EB02BR02"/></td>
              <td><xsl:value-of select="EB02/EB02B/EB02BS02"/></td>
              <td><xsl:value-of select="EB02/EB02B/EB02BJ02"/></td>
              <td><xsl:value-of select="EB02/EB02B/EB02BS03"/></td>
            </tr>
          </tbody>
        </table>
		<div class="t2 f-mgtop">（五）已结清其他借贷交易分类汇总信息</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-5"></th>
              <th class="g-w-5">正常类账户数</th>
              <th class="g-w-5">关注类账户数</th>
              <th class="g-w-5">不良类账户数</th>
              <th class="g-w-5">合计</th>
            </tr>
            <tr>
              <td>中长期借款</td>
              <td>
			  <xsl:for-each select="EB02/EB02B/EB02BH">
					<xsl:if test="EB02BD01 = '1' and EB02BD02 = 1">
						<xsl:value-of select="EB02BS04"/>
					</xsl:if>
				</xsl:for-each>
				</td>
              <td>
				<xsl:for-each select="EB02/EB02B/EB02BH">
					<xsl:if test="EB02BD01 = '1' and EB02BD02 = 2">
						<xsl:value-of select="EB02BS04"/>
					</xsl:if>
				</xsl:for-each>
			  </td>
              <td>
				<xsl:for-each select="EB02/EB02B/EB02BH">
					<xsl:if test="EB02BD01 = '1' and EB02BD02 = 3">
						<xsl:value-of select="EB02BS04"/>
					</xsl:if>
				</xsl:for-each>
			  </td>
              <td>
				<xsl:for-each select="EB02/EB02B/EB02BH">
					<xsl:if test="EB02BD01 = '1' and EB02BD02 = 0">
						<xsl:value-of select="EB02BS04"/>
					</xsl:if>
				</xsl:for-each>			  
			  </td>
            </tr>
            <tr>
              <td>短期借款</td>
              <td>
			  <xsl:for-each select="EB02/EB02B/EB02BH">
					<xsl:if test="EB02BD01 = '2' and EB02BD02 = 1">
						<xsl:value-of select="EB02BS04"/>
					</xsl:if>
				</xsl:for-each>
				</td>
              <td>
				<xsl:for-each select="EB02/EB02B/EB02BH">
					<xsl:if test="EB02BD01 = '2' and EB02BD02 = 2">
						<xsl:value-of select="EB02BS04"/>
					</xsl:if>
				</xsl:for-each>
			  </td>
              <td>
				<xsl:for-each select="EB02/EB02B/EB02BH">
					<xsl:if test="EB02BD01 = '2' and EB02BD02 = 3">
						<xsl:value-of select="EB02BS04"/>
					</xsl:if>
				</xsl:for-each>
			  </td>
              <td>
				<xsl:for-each select="EB02/EB02B/EB02BH">
					<xsl:if test="EB02BD01 = '2' and EB02BD02 = 0">
						<xsl:value-of select="EB02BS04"/>
					</xsl:if>
				</xsl:for-each>			  
			  </td>
            </tr>
            <tr>
              <td>循环透支</td>
              <td>
			  <xsl:for-each select="EB02/EB02B/EB02BH">
					<xsl:if test="EB02BD01 = '3' and EB02BD02 = 1">
						<xsl:value-of select="EB02BS04"/>
					</xsl:if>
				</xsl:for-each>
				</td>
              <td>
				<xsl:for-each select="EB02/EB02B/EB02BH">
					<xsl:if test="EB02BD01 = '3' and EB02BD02 = 2">
						<xsl:value-of select="EB02BS04"/>
					</xsl:if>
				</xsl:for-each>
			  </td>
              <td>
				<xsl:for-each select="EB02/EB02B/EB02BH">
					<xsl:if test="EB02BD01 = '3' and EB02BD02 = 3">
						<xsl:value-of select="EB02BS04"/>
					</xsl:if>
				</xsl:for-each>
			  </td>
              <td>
				<xsl:for-each select="EB02/EB02B/EB02BH">
					<xsl:if test="EB02BD01 = '3' and EB02BD02 = 0">
						<xsl:value-of select="EB02BS04"/>
					</xsl:if>
				</xsl:for-each>			  
			  </td>
            </tr>
            <tr>
              <td>贴现</td>
              <td>
			  <xsl:for-each select="EB02/EB02B/EB02BH">
					<xsl:if test="EB02BD01 = '4' and EB02BD02 = 1">
						<xsl:value-of select="EB02BS04"/>
					</xsl:if>
				</xsl:for-each>
				</td>
              <td>
				<xsl:for-each select="EB02/EB02B/EB02BH">
					<xsl:if test="EB02BD01 = '4' and EB02BD02 = 2">
						<xsl:value-of select="EB02BS04"/>
					</xsl:if>
				</xsl:for-each>
			  </td>
              <td>
				<xsl:for-each select="EB02/EB02B/EB02BH">
					<xsl:if test="EB02BD01 = '4' and EB02BD02 = 3">
						<xsl:value-of select="EB02BS04"/>
					</xsl:if>
				</xsl:for-each>
			  </td>
              <td>
				<xsl:for-each select="EB02/EB02B/EB02BH">
					<xsl:if test="EB02BD01 = '4' and EB02BD02 = 0">
						<xsl:value-of select="EB02BS04"/>
					</xsl:if>
				</xsl:for-each>			  
			  </td>
            </tr>
            <tr>
              <td>合计</td>
              <td>
			  <xsl:for-each select="EB02/EB02B/EB02BH">
					<xsl:if test="EB02BD01 = '0' and EB02BD02 = 1">
						<xsl:value-of select="EB02BS04"/>
					</xsl:if>
				</xsl:for-each>
				</td>
              <td>
				<xsl:for-each select="EB02/EB02B/EB02BH">
					<xsl:if test="EB02BD01 = '0' and EB02BD02 = 2">
						<xsl:value-of select="EB02BS04"/>
					</xsl:if>
				</xsl:for-each>
			  </td>
              <td>
				<xsl:for-each select="EB02/EB02B/EB02BH">
					<xsl:if test="EB02BD01 = '0' and EB02BD02 = 3">
						<xsl:value-of select="EB02BS04"/>
					</xsl:if>
				</xsl:for-each>
			  </td>
              <td>
				<xsl:for-each select="EB02/EB02B/EB02BH">
					<xsl:if test="EB02BD01 = '0' and EB02BD02 = 0">
						<xsl:value-of select="EB02BS04"/>
					</xsl:if>
				</xsl:for-each>			  
			  </td>
            </tr>
          </tbody>
        </table>		
		<br/>
		<!-- 负债历史汇总信息 -->
		<div class="t2 f-mgtop">（六）负债历史</div>
        <table class="g-tab-bor f-tab-nomargin">
		<tbody>
			<tr>
				<th style="WIDTH: 10%" rowspan="2">
				</th>
				<th style="WIDTH: 20%" colspan="2">
					全部负债
				</th>
				<th style="WIDTH: 20%" colspan="2">
					关注类负债
				</th>
				<th style="WIDTH: 20%" colspan="2">
					不良类负债
				</th>
				<th style="WIDTH: 30%" colspan="4">
					逾期类负债
				</th>
			</tr>
			<tr>
				<th>
					账户数
				</th>
				<th>
					余额
				</th>
				<th>
					账户数
				</th>
				<th>
					余额
				</th>
				<th>
					账户数
				</th>
				<th>
					余额
				</th>
				<th>
					逾期账户数
				</th>
				<th>
					逾期总额
				</th>
				<th>
					本金逾期账户数
				</th>
				<th>
					逾期本金
				</th>
			</tr> 
			<xsl:for-each select="EB02/EB02C/EB02CH">
			<xsl:sort select="EB02CR01" order="descending"/>
			<tr>
				<td>
					<xsl:value-of select="EB02CR01"/>
				</td>
				<td>
					<xsl:value-of select="EB02CS02"/>
				</td>
				<td>
					<xsl:value-of select="EB02CJ01"/>
				</td>
				<td>
					<xsl:value-of select="EB02CS03"/>
				</td>
				<td>
					<xsl:value-of select="EB02CJ02"/>
				</td>
				<td>
					<xsl:value-of select="EB02CS04"/>
				</td>
				<td>
					<xsl:value-of select="EB02CJ03"/>
				</td>
				<td>
					<xsl:value-of select="EB02CS05"/>
				</td>
				<td>
					<xsl:value-of select="EB02CJ04"/>
				</td>
				<td>
					<xsl:value-of select="EB02CS06"/>
				</td>
				<td>
					<xsl:value-of select="EB02CJ05"/>
				</td>
			</tr>
			</xsl:for-each>
		</tbody>
		</table>
		<!-- 未结清担保交易 -->
		<div class="t2 f-mgtop">（七）未结清担保交易</div>
        <table class="g-tab-bor f-tab-nomargin">
			<tbody>
			<tr>
				<td style="WIDTH: 20%" rowspan="2"></td>
				<td style="WIDTH: 20%" colspan="2">
					正常类
				</td>
				<td style="WIDTH: 20%" colspan="2">
					关注类
				</td>
				<td style="WIDTH: 20%" colspan="2">
					不良类
				</td>
				<td style="WIDTH: 20%" colspan="2">
					合计
				</td>
			</tr>
			<tr>
				<td>账户数</td>
				<td>余额</td>
				<td>账户数</td>
				<td>余额</td>
				<td>账户数</td>
				<td>余额</td>
				<td>账户数</td>
				<td>余额</td>
			</tr>
			<tr>
				<td>
					银行承兑汇票
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '1' and EB03AD02 = 1">
						<xsl:value-of select="EB03AS02"/>
					</xsl:if>
				</xsl:for-each>	
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '1' and EB03AD02 = 1">
						<xsl:value-of select="EB03AJ01"/>
					</xsl:if>
				</xsl:for-each>			
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '1' and EB03AD02 = 2">
						<xsl:value-of select="EB03AS02"/>
					</xsl:if>
				</xsl:for-each>	
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '1' and EB03AD02 = 2">
						<xsl:value-of select="EB03AJ01"/>
					</xsl:if>
				</xsl:for-each>			
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '1' and EB03AD02 = 3">
						<xsl:value-of select="EB03AS02"/>
					</xsl:if>
				</xsl:for-each>	
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '1' and EB03AD02 = 3">
						<xsl:value-of select="EB03AJ01"/>
					</xsl:if>
				</xsl:for-each>			
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '1' and EB03AD02 = 0">
						<xsl:value-of select="EB03AS02"/>
					</xsl:if>
				</xsl:for-each>	
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '1' and EB03AD02 = 0">
						<xsl:value-of select="EB03AJ01"/>
					</xsl:if>
				</xsl:for-each>			
				</td>
			</tr>
			<tr>
				<td>
					信用证
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '2' and EB03AD02 = 1">
						<xsl:value-of select="EB03AS02"/>
					</xsl:if>
				</xsl:for-each>	
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '2' and EB03AD02 = 1">
						<xsl:value-of select="EB03AJ01"/>
					</xsl:if>
				</xsl:for-each>			
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '2' and EB03AD02 = 2">
						<xsl:value-of select="EB03AS02"/>
					</xsl:if>
				</xsl:for-each>	
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '2' and EB03AD02 = 2">
						<xsl:value-of select="EB03AJ01"/>
					</xsl:if>
				</xsl:for-each>			
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '2' and EB03AD02 = 3">
						<xsl:value-of select="EB03AS02"/>
					</xsl:if>
				</xsl:for-each>	
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '2' and EB03AD02 = 3">
						<xsl:value-of select="EB03AJ01"/>
					</xsl:if>
				</xsl:for-each>			
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '2' and EB03AD02 = 0">
						<xsl:value-of select="EB03AS02"/>
					</xsl:if>
				</xsl:for-each>	
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '2' and EB03AD02 = 0">
						<xsl:value-of select="EB03AJ01"/>
					</xsl:if>
				</xsl:for-each>			
				</td>
			</tr>
			<tr>
				<td>
					银行保函
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '3' and EB03AD02 = 1">
						<xsl:value-of select="EB03AS02"/>
					</xsl:if>
				</xsl:for-each>	
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '3' and EB03AD02 = 1">
						<xsl:value-of select="EB03AJ01"/>
					</xsl:if>
				</xsl:for-each>			
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '3' and EB03AD02 = 2">
						<xsl:value-of select="EB03AS02"/>
					</xsl:if>
				</xsl:for-each>	
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '3' and EB03AD02 = 2">
						<xsl:value-of select="EB03AJ01"/>
					</xsl:if>
				</xsl:for-each>			
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '3' and EB03AD02 = 3">
						<xsl:value-of select="EB03AS02"/>
					</xsl:if>
				</xsl:for-each>	
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '3' and EB03AD02 = 3">
						<xsl:value-of select="EB03AJ01"/>
					</xsl:if>
				</xsl:for-each>			
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '3' and EB03AD02 = 0">
						<xsl:value-of select="EB03AS02"/>
					</xsl:if>
				</xsl:for-each>	
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '3' and EB03AD02 = 0">
						<xsl:value-of select="EB03AJ01"/>
					</xsl:if>
				</xsl:for-each>			
				</td>
			</tr>
			<tr>
				<td>
					其他
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '9' and EB03AD02 = 1">
						<xsl:value-of select="EB03AS02"/>
					</xsl:if>
				</xsl:for-each>	
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '9' and EB03AD02 = 1">
						<xsl:value-of select="EB03AJ01"/>
					</xsl:if>
				</xsl:for-each>			
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '9' and EB03AD02 = 2">
						<xsl:value-of select="EB03AS02"/>
					</xsl:if>
				</xsl:for-each>	
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '9' and EB03AD02 = 2">
						<xsl:value-of select="EB03AJ01"/>
					</xsl:if>
				</xsl:for-each>			
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '9' and EB03AD02 = 3">
						<xsl:value-of select="EB03AS02"/>
					</xsl:if>
				</xsl:for-each>	
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '9' and EB03AD02 = 3">
						<xsl:value-of select="EB03AJ01"/>
					</xsl:if>
				</xsl:for-each>			
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '9' and EB03AD02 = 0">
						<xsl:value-of select="EB03AS02"/>
					</xsl:if>
				</xsl:for-each>	
				</td>
				<td>
				<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
					<xsl:if test="EB03AD01 = '9' and EB03AD02 = 0">
						<xsl:value-of select="EB03AJ01"/>
					</xsl:if>
				</xsl:for-each>			
				</td>
			</tr>
		</tbody>
		</table>
		<!-- 已结清担保交易 -->
		<div class="t2 f-mgtop">（八）已结清担保交易</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-5"></th>
              <th class="g-w-5">正常类账户数</th>
              <th class="g-w-5">关注类账户数</th>
              <th class="g-w-5">不良类账户数</th>
              <th class="g-w-5">合计</th>
            </tr>
            <tr>
              <td>银行承兑汇票</td>
              <td>
				<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
					<xsl:if test="EB03BD01 = '1' and EB03BD02 = 1">
						<xsl:value-of select="EB03BS02"/>
					</xsl:if>
				</xsl:for-each>	
				</td>
              <td>
				<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
					<xsl:if test="EB03BD01 = '1' and EB03BD02 = 2">
						<xsl:value-of select="EB03BS02"/>
					</xsl:if>
				</xsl:for-each>
			  </td>
              <td>
				<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
					<xsl:if test="EB03BD01 = '1' and EB03BD02 = 3">
						<xsl:value-of select="EB03BS02"/>
					</xsl:if>
				</xsl:for-each>
			  </td>
              <td>
				<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
					<xsl:if test="EB03BD01 = '1' and EB03BD02 = 0">
						<xsl:value-of select="EB03BS02"/>
					</xsl:if>
				</xsl:for-each>		  
			  </td>
            </tr>
            <tr>
              <td>信用证</td>
              <td>
				<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
					<xsl:if test="EB03BD01 = '2' and EB03BD02 = 1">
						<xsl:value-of select="EB03BS02"/>
					</xsl:if>
				</xsl:for-each>	
				</td>
              <td>
				<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
					<xsl:if test="EB03BD01 = '2' and EB03BD02 = 2">
						<xsl:value-of select="EB03BS02"/>
					</xsl:if>
				</xsl:for-each>
			  </td>
              <td>
				<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
					<xsl:if test="EB03BD01 = '2' and EB03BD02 = 3">
						<xsl:value-of select="EB03BS02"/>
					</xsl:if>
				</xsl:for-each>
			  </td>
              <td>
				<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
					<xsl:if test="EB03BD01 = '2' and EB03BD02 = 0">
						<xsl:value-of select="EB03BS02"/>
					</xsl:if>
				</xsl:for-each>		  
			  </td>
            </tr>
            <tr>
              <td>银行保函</td>
              <td>
				<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
					<xsl:if test="EB03BD01 = '3' and EB03BD02 = 1">
						<xsl:value-of select="EB03BS02"/>
					</xsl:if>
				</xsl:for-each>	
				</td>
              <td>
				<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
					<xsl:if test="EB03BD01 = '3' and EB03BD02 = 2">
						<xsl:value-of select="EB03BS02"/>
					</xsl:if>
				</xsl:for-each>
			  </td>
              <td>
				<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
					<xsl:if test="EB03BD01 = '3' and EB03BD02 = 3">
						<xsl:value-of select="EB03BS02"/>
					</xsl:if>
				</xsl:for-each>
			  </td>
              <td>
				<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
					<xsl:if test="EB03BD01 = '3' and EB03BD02 = 0">
						<xsl:value-of select="EB03BS02"/>
					</xsl:if>
				</xsl:for-each>		  
			  </td>
            </tr>
            <tr>
              <td>其他</td>
              <td>
				<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
					<xsl:if test="EB03BD01 = '9' and EB03BD02 = 1">
						<xsl:value-of select="EB03BS02"/>
					</xsl:if>
				</xsl:for-each>	
				</td>
              <td>
				<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
					<xsl:if test="EB03BD01 = '9' and EB03BD02 = 2">
						<xsl:value-of select="EB03BS02"/>
					</xsl:if>
				</xsl:for-each>
			  </td>
              <td>
				<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
					<xsl:if test="EB03BD01 = '9' and EB03BD02 = 3">
						<xsl:value-of select="EB03BS02"/>
					</xsl:if>
				</xsl:for-each>
			  </td>
              <td>
				<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
					<xsl:if test="EB03BD01 = '9' and EB03BD02 = 0">
						<xsl:value-of select="EB03BS02"/>
					</xsl:if>
				</xsl:for-each>		  
			  </td>
            </tr>
          </tbody>
		</table>
		<!-- 授信协议汇总信息 -->
		<div class="t2 f-mgtop">（九）授信协议汇总信息</div>
        <table class="g-tab-bor f-mgtop-s">
          <tbody>
            <tr>
              <th class="g-w-7" width="10%">非循环信用额度合计</th>
              <th class="g-w-7" width="10%">已使用的非循环信用额度合计</th>
              <th class="g-w-7" width="10%">剩余可用的非循环额度合计</th>
              <th class="g-w-7" width="10%">循环信用额度合计</th>
              <th class="g-w-7" width="10%">已使用的循环信用额度合计</th>
              <th class="g-w-7" width="10%">剩余可用的循环额度合计</th>
              <th class="g-w-7" width="10%">是否包含授信限额</th>
			</tr>
            <tr>
              <td><xsl:value-of select="../EBD/EB04/EB040J01"/></td>
              <td><xsl:value-of select="../EBD/EB04/EB040J02"/></td>
              <td><xsl:value-of select="../EBD/EB04/EB040J03"/></td>
              <td><xsl:value-of select="../EBD/EB04/EB040J04"/></td>
              <td><xsl:value-of select="../EBD/EB04/EB040J05"/></td>
              <td><xsl:value-of select="../EBD/EB04/EB040J06"/></td>
              <td><xsl:value-of select="../EBD/EB04/EB040D01"/></td>
            </tr>
		  </tbody>
		</table>
		<!-- 相关还款责任信息概要 -->
		<div class="t2 f-mgtop">（九）相关还款责任信息概要</div>
        <table class="g-tab-bor f-mgtop-s">
          <tbody>
            <tr>
              <th rowspan="2"  width="20%">责任类型</th>
              <th colspan="3"  width="30%">被追偿业务</th>
              <th colspan="5"  width="50%">其他借贷交易</th>
			</tr>
			<tr>
              <th  width="10%">还款责任金额</th>
              <th  width="10%">账户数</th>
              <th  width="10%">余额</th>
              <th  width="10%">还款责任金额</th>
              <th  width="10%">账户数</th>
              <th  width="10%">余额</th>
              <th  width="10%">关注类余额</th>
              <th  width="10%">不良类余额</th>
			</tr>
			<xsl:for-each select="../EBE/EB05/EB05A/EB05AH">
			<xsl:sort select="EB05AD01"/>
				<xsl:if test="EB05AD01 != 0">
				<tr>
					<td>
						<span name="2019"><xsl:value-of select="EB05AD01"/></span>
					</td>
					<td>
						<xsl:value-of select="EB05AJ01"/>
					</td>
					<td>
						<xsl:value-of select="EB05AS02"/>
					</td>
					<td>
						<xsl:value-of select="EB05AJ02"/>
					</td>
					<td>
						<xsl:value-of select="EB05AJ03"/>
					</td>
					<td>
						<xsl:value-of select="EB05AS03"/>
					</td>
					<td>
						<xsl:value-of select="EB05AJ04"/>
					</td>
					<td>
						<xsl:value-of select="EB05AJ05"/>
					</td>
					<td>
						<xsl:value-of select="EB05AJ06"/>
					</td>
				</tr>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="../EBE/EB05/EB05A/EB05AH">
				<xsl:if test="EB05AD01 = 0">
				<tr>
					<td>
						<span name="2019"><xsl:value-of select="EB05AD01"/></span>
					</td>
					<td>
						<xsl:value-of select="EB05AJ01"/>
					</td>
					<td>
						<xsl:value-of select="EB05AS02"/>
					</td>
					<td>
						<xsl:value-of select="EB05AJ02"/>
					</td>
					<td>
						<xsl:value-of select="EB05AJ03"/>
					</td>
					<td>
						<xsl:value-of select="EB05AS03"/>
					</td>
					<td>
						<xsl:value-of select="EB05AJ04"/>
					</td>
					<td>
						<xsl:value-of select="EB05AJ05"/>
					</td>
					<td>
						<xsl:value-of select="EB05AJ06"/>
					</td>
				</tr>
				</xsl:if>
			</xsl:for-each>
		 </tbody>
		</table>
		<br/>
		<!-- 担保交易相关还款责任汇总信息 -->
		<div class="t2 f-mgtop">（十）担保交易相关还款责任汇总信息</div>	
        <table class="g-tab-bor f-mgtop-s">
          <tbody>
            <tr>
              <th class="g-w-6" width="10%">责任类型</th>
              <th class="g-w-6" width="11%">还款责任金额</th>
              <th class="g-w-6" width="10%">账户数</th>
              <th class="g-w-6" width="10%">余额</th>
              <th class="g-w-6" width="10%">关注类余额</th>
              <th class="g-w-6" width="10%">不良类余额</th>
            </tr>
			<xsl:for-each select="../EBE/EB05/EB05B/EB05BH">
			<xsl:sort select="EB05BD01"/>
				<xsl:if test="EB05BD01 != 0">
				<tr>
					<td>
						<span name="2019"><xsl:value-of select="EB05BD01"/></span>
					</td>
					<td>
						<xsl:value-of select="EB05BJ01"/>
					</td>
					<td>
						<xsl:value-of select="EB05BS02"/>
					</td>
					<td>
						<xsl:value-of select="EB05BJ02"/>
					</td>
					<td>
						<xsl:value-of select="EB05BJ03"/>
					</td>
					<td>
						<xsl:value-of select="EB05BJ04"/>
					</td>
				</tr>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="../EBE/EB05/EB05B/EB05BH">
				<xsl:if test="EB05BD01 = 0">
				<tr>
					<td>
						<span name="2019"><xsl:value-of select="EB05BD01"/></span>
					</td>
					<td>
						<xsl:value-of select="EB05BJ01"/>
					</td>
					<td>
						<xsl:value-of select="EB05BS02"/>
					</td>
					<td>
						<xsl:value-of select="EB05BJ02"/>
					</td>
					<td>
						<xsl:value-of select="EB05BJ03"/>
					</td>
					<td>
						<xsl:value-of select="EB05BJ04"/>
					</td>
				</tr>
				</xsl:if>
			</xsl:for-each>
		</tbody>
		</table>
	</xsl:template>
<!-- 信贷记录明细 -->
	<xsl:template match="EDA">
	<br/>
		<div class="t1">二 信贷记录明细</div>
        <div class="t2 f-mgtop">（一）被追偿业务</div>
		<table class="g-tab-bor f-tab-nomargin">
			<tr>
				<th rowspan="2">借贷账户编号</th>
				<th>账户活动状态</th>
				<th>借贷账户类型</th>
				<th>借款期限</th>
				<th>业务管理机构类型</th>
				<th>业务管理机构代码</th>
				<th>授信协议编号</th>
				<th>借贷业务种类大类</th>
				<th>借贷业务种类细分</th>
				<th>开户日期</th>
				<th>币种</th>
				<th rowspan="2">特定交易个数</th>
				<th rowspan="2">历史表现</th>
			</tr>
			<tr>
				<th>借款金额</th>
				<th>信用额度</th>
				<th>到期日期</th>
				<th>担保方式</th>
				<th>其他还款保证方式</th>
				<th>发放形式</th>
				<th>共同借款标识</th>
				<th>关闭日期</th>
				<th>信息报告日期</th>
				<th>还款表现记录条数</th>
			</tr>
			<xsl:for-each select="ED01/ED01A[ED01AD02 = 'C1']">
				<tr>
					<td rowspan="2"><xsl:value-of select="ED01AI01"/></td>
					<td><span name="2010"><xsl:value-of select="ED01AD01"/></span></td>
					<td><span name="2011"><xsl:value-of select="ED01AD02"/></span></td>
					<td><span name="2020"><xsl:value-of select="ED01AD03"/></span></td>
					<td><span name="2021"><xsl:value-of select="ED01AD04"/></span></td>
					<td><xsl:value-of select="ED01AI02"/></td>
					<td><xsl:value-of select="ED01AI03"/></td>
					<td><span name="2022"><xsl:value-of select="ED01AD05"/></span></td>
					<td>
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
					</td>
					<td><xsl:value-of select="ED01AR01"/></td>
					<td><span name="3003"><xsl:value-of select="ED01AD07"/></span></td>
					<td rowspan="2"><xsl:value-of select="../ED01C/ED01CS01"/></td>
					<td rowspan="2">见附件</td>
				</tr>
				<tr>
					<td><xsl:value-of select="ED01AJ01"/></td>
					<td><xsl:value-of select="ED01AJ02"/></td>
					<td><xsl:value-of select="ED01AR02"/></td>
					<td><span name="2037"><xsl:value-of select="ED01AD08"/></span></td>
					<td><span name="2038"><xsl:value-of select="ED01AD09"/></span></td>
					<td><span name="2040"><xsl:value-of select="ED01AD10"/></span></td>
					<td><span name="2097"><xsl:value-of select="ED01AD11"/></span></td>
					<td><xsl:value-of select="ED01AR03"/></td>
					<td><xsl:value-of select="ED01AR04"/></td>
					<td><xsl:value-of select="../ED01B/ED01BS01"/></td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
		<!-- 中长期借款 -->
        <div class="t2 f-mgtop">（二）未结清中长期借款</div>
		<table class="g-tab-bor f-tab-nomargin">
			<tr>
				<th rowspan="2">借贷账户编号</th>
				<th>账户活动状态</th>
				<th>借贷账户类型</th>
				<th>借款期限</th>
				<th>业务管理机构类型</th>
				<th>业务管理机构代码</th>
				<th>授信协议编号</th>
				<th>借贷业务种类大类</th>
				<th>借贷业务种类细分</th>
				<th>开户日期</th>
				<th>币种</th>
				<th rowspan="2">特定交易个数</th>
				<th rowspan="2">历史表现</th>
			</tr>
			<tr>
				<th>借款金额</th>
				<th>信用额度</th>
				<th>到期日期</th>
				<th>担保方式</th>
				<th>其他还款保证方式</th>
				<th>发放形式</th>
				<th>共同借款标识</th>
				<th>关闭日期</th>
				<th>信息报告日期</th>
				<th>还款表现记录条数</th>
			</tr>
			<xsl:for-each select="ED01/ED01A[ED01AD01 ='1' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and (ED01AD03 = '20' or ED01AD03 ='30')]">
				<tr>
					<td rowspan="2"><xsl:value-of select="ED01AI01"/></td>
					<td><span name="2010"><xsl:value-of select="ED01AD01"/></span></td>
					<td><span name="2011"><xsl:value-of select="ED01AD02"/></span></td>
					<td><span name="2020"><xsl:value-of select="ED01AD03"/></span></td>
					<td><span name="2021"><xsl:value-of select="ED01AD04"/></span></td>
					<td><xsl:value-of select="ED01AI02"/></td>
					<td><xsl:value-of select="ED01AI03"/></td>
					<td><span name="2022"><xsl:value-of select="ED01AD05"/></span></td>
					<td>
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
					</td>
					<td><xsl:value-of select="ED01AR01"/></td>
					<td><span name="3003"><xsl:value-of select="ED01AD07"/></span></td>
					<td rowspan="2"><xsl:value-of select="../ED01C/ED01CS01"/></td>
					<td rowspan="2">见附件</td>
				</tr>
				<tr>
					<td><xsl:value-of select="ED01AJ01"/></td>
					<td><xsl:value-of select="ED01AJ02"/></td>
					<td><xsl:value-of select="ED01AR02"/></td>
					<td><span name="2037"><xsl:value-of select="ED01AD08"/></span></td>
					<td><span name="2038"><xsl:value-of select="ED01AD09"/></span></td>
					<td><span name="2040"><xsl:value-of select="ED01AD10"/></span></td>
					<td><span name="2097"><xsl:value-of select="ED01AD11"/></span></td>
					<td><xsl:value-of select="ED01AR03"/></td>
					<td><xsl:value-of select="ED01AR04"/></td>
					<td><xsl:value-of select="../ED01B/ED01BS01"/></td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
		<!-- 短期借贷 -->
        <div class="t2 f-mgtop">（三）短期借贷</div>
		<table class="g-tab-bor f-tab-nomargin">
			<tr>
				<th rowspan="2">借贷账户编号</th>
				<th>账户活动状态</th>
				<th>借贷账户类型</th>
				<th>借款期限</th>
				<th>业务管理机构类型</th>
				<th>业务管理机构代码</th>
				<th>授信协议编号</th>
				<th>借贷业务种类大类</th>
				<th>借贷业务种类细分</th>
				<th>开户日期</th>
				<th>币种</th>
				<th rowspan="2">特定交易个数</th>
				<th rowspan="2">历史表现</th>
			</tr>
			<tr>
				<th>借款金额</th>
				<th>信用额度</th>
				<th>到期日期</th>
				<th>担保方式</th>
				<th>其他还款保证方式</th>
				<th>发放形式</th>
				<th>共同借款标识</th>
				<th>关闭日期</th>
				<th>信息报告日期</th>
				<th>还款表现记录条数</th>
			</tr>
			<xsl:for-each select="ED01/ED01A[ED01AD01 ='1' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and ED01AD03 = '10']">
				<tr>
					<td rowspan="2"><xsl:value-of select="ED01AI01"/></td>
					<td><span name="2010"><xsl:value-of select="ED01AD01"/></span></td>
					<td><span name="2011"><xsl:value-of select="ED01AD02"/></span></td>
					<td><span name="2020"><xsl:value-of select="ED01AD03"/></span></td>
					<td><span name="2021"><xsl:value-of select="ED01AD04"/></span></td>
					<td><xsl:value-of select="ED01AI02"/></td>
					<td><xsl:value-of select="ED01AI03"/></td>
					<td><span name="2022"><xsl:value-of select="ED01AD05"/></span></td>
					<td>
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
					</td>
					<td><xsl:value-of select="ED01AR01"/></td>
					<td><span name="3003"><xsl:value-of select="ED01AD07"/></span></td>
					<td rowspan="2"><xsl:value-of select="../ED01C/ED01CS01"/></td>
					<td rowspan="2">见附件</td>
				</tr>
				<tr>
					<td><xsl:value-of select="ED01AJ01"/></td>
					<td><xsl:value-of select="ED01AJ02"/></td>
					<td><xsl:value-of select="ED01AR02"/></td>
					<td><span name="2037"><xsl:value-of select="ED01AD08"/></span></td>
					<td><span name="2038"><xsl:value-of select="ED01AD09"/></span></td>
					<td><span name="2040"><xsl:value-of select="ED01AD10"/></span></td>
					<td><span name="2097"><xsl:value-of select="ED01AD11"/></span></td>
					<td><xsl:value-of select="ED01AR03"/></td>
					<td><xsl:value-of select="ED01AR04"/></td>
					<td><xsl:value-of select="../ED01B/ED01BS01"/></td>
				</tr>
			</xsl:for-each>
		</table>
        <div class="t2 f-mgtop">（四）循环透支</div>		
		<!-- 未结清循环透支 -->
		<table class="g-tab-bor f-tab-nomargin">
			<tr>
				<th rowspan="2">借贷账户编号</th>
				<th>账户活动状态</th>
				<th>借贷账户类型</th>
				<th>借款期限</th>
				<th>业务管理机构类型</th>
				<th>业务管理机构代码</th>
				<th>授信协议编号</th>
				<th>借贷业务种类大类</th>
				<th>借贷业务种类细分</th>
				<th>开户日期</th>
				<th>币种</th>
				<th rowspan="2">特定交易个数</th>
				<th rowspan="2">历史表现</th>
			</tr>
			<tr>
				<th>借款金额</th>
				<th>信用额度</th>
				<th>到期日期</th>
				<th>担保方式</th>
				<th>其他还款保证方式</th>
				<th>发放形式</th>
				<th>共同借款标识</th>
				<th>关闭日期</th>
				<th>信息报告日期</th>
				<th>还款表现记录条数</th>
			</tr>
			<xsl:for-each select="ED01/ED01A">
			<xsl:if test="ED01AD01 ='1' and ED01AD02 = 'R1'">
				<tr>
					<td rowspan="2"><xsl:value-of select="ED01AI01"/></td>
					<td><span name="2010"><xsl:value-of select="ED01AD01"/></span></td>
					<td><span name="2011"><xsl:value-of select="ED01AD02"/></span></td>
					<td><span name="2020"><xsl:value-of select="ED01AD03"/></span></td>
					<td><span name="2021"><xsl:value-of select="ED01AD04"/></span></td>
					<td><xsl:value-of select="ED01AI02"/></td>
					<td><xsl:value-of select="ED01AI03"/></td>
					<td><span name="2022"><xsl:value-of select="ED01AD05"/></span></td>
					<td>
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
					</td>
					<td><xsl:value-of select="ED01AR01"/></td>
					<td><span name="3003"><xsl:value-of select="ED01AD07"/></span></td>
					<td rowspan="2"><xsl:value-of select="../ED01C/ED01CS01"/></td>
					<td rowspan="2">见附件</td>
				</tr>
				<tr>
					<td><xsl:value-of select="ED01AJ01"/></td>
					<td><xsl:value-of select="ED01AJ02"/></td>
					<td><xsl:value-of select="ED01AR02"/></td>
					<td><span name="2037"><xsl:value-of select="ED01AD08"/></span></td>
					<td><span name="2038"><xsl:value-of select="ED01AD09"/></span></td>
					<td><span name="2040"><xsl:value-of select="ED01AD10"/></span></td>
					<td><span name="2097"><xsl:value-of select="ED01AD11"/></span></td>
					<td><xsl:value-of select="ED01AR03"/></td>
					<td><xsl:value-of select="ED01AR04"/></td>
					<td><xsl:value-of select="../ED01B/ED01BS01"/></td>
				</tr>
			</xsl:if>
			</xsl:for-each>
		</table>
		<!-- 未结清贴现账户 -->
        <div class="t2 f-mgtop">（五）未结清贴现账户</div>
		<table class="g-tab-bor f-tab-nomargin">
			<tr>
				<th rowspan="2">借贷账户编号</th>
				<th>账户活动状态</th>
				<th>借贷账户类型</th>
				<th>借款期限</th>
				<th>业务管理机构类型</th>
				<th>业务管理机构代码</th>
				<th>授信协议编号</th>
				<th>借贷业务种类大类</th>
				<th>借贷业务种类细分</th>
				<th>开户日期</th>
				<th>币种</th>
				<th rowspan="2">特定交易个数</th>
				<th rowspan="2">历史表现</th>
			</tr>
			<tr>
				<th>借款金额</th>
				<th>信用额度</th>
				<th>到期日期</th>
				<th>担保方式</th>
				<th>其他还款保证方式</th>
				<th>发放形式</th>
				<th>共同借款标识</th>
				<th>关闭日期</th>
				<th>信息报告日期</th>
				<th>还款表现记录条数</th>
			</tr>
			<xsl:for-each select="ED01/ED01A">
			<xsl:if test="ED01AD01 ='1' and ED01AD02 = 'D2'">
				<tr>
					<td rowspan="2"><xsl:value-of select="ED01AI01"/></td>
					<td><span name="2010"><xsl:value-of select="ED01AD01"/></span></td>
					<td><span name="2011"><xsl:value-of select="ED01AD02"/></span></td>
					<td><span name="2020"><xsl:value-of select="ED01AD03"/></span></td>
					<td><span name="2021"><xsl:value-of select="ED01AD04"/></span></td>
					<td><xsl:value-of select="ED01AI02"/></td>
					<td><xsl:value-of select="ED01AI03"/></td>
					<td><span name="2022"><xsl:value-of select="ED01AD05"/></span></td>
					<td>
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
					</td>
					<td><xsl:value-of select="ED01AR01"/></td>
					<td><span name="3003"><xsl:value-of select="ED01AD07"/></span></td>
					<td rowspan="2"><xsl:value-of select="../ED01C/ED01CS01"/></td>
					<td rowspan="2">见附件</td>
				</tr>
				<tr>
					<td><xsl:value-of select="ED01AJ01"/></td>
					<td><xsl:value-of select="ED01AJ02"/></td>
					<td><xsl:value-of select="ED01AR02"/></td>
					<td><span name="2037"><xsl:value-of select="ED01AD08"/></span></td>
					<td><span name="2038"><xsl:value-of select="ED01AD09"/></span></td>
					<td><span name="2040"><xsl:value-of select="ED01AD10"/></span></td>
					<td><span name="2097"><xsl:value-of select="ED01AD11"/></span></td>
					<td><xsl:value-of select="ED01AR03"/></td>
					<td><xsl:value-of select="ED01AR04"/></td>
					<td><xsl:value-of select="../ED01B/ED01BS01"/></td>
				</tr>
			</xsl:if>
			</xsl:for-each>
		</table>
		<!-- 已结清信贷 -->
		<!-- 被追偿业务 -->
		<div class="t2 f-mgtop">（六）已结清被追偿业务</div>
		<table class="g-tab-bor f-tab-nomargin">
			<tr>
				<th rowspan="2">借贷账户编号</th>
				<th>账户活动状态</th>
				<th>借贷账户类型</th>
				<th>借款期限</th>
				<th>业务管理机构类型</th>
				<th>业务管理机构代码</th>
				<th>授信协议编号</th>
				<th>借贷业务种类大类</th>
				<th>借贷业务种类细分</th>
				<th>开户日期</th>
				<th>币种</th>
				<th rowspan="2">特定交易个数</th>
				<th rowspan="2">历史表现</th>
			</tr>
			<tr>
				<th>借款金额</th>
				<th>信用额度</th>
				<th>到期日期</th>
				<th>担保方式</th>
				<th>其他还款保证方式</th>
				<th>发放形式</th>
				<th>共同借款标识</th>
				<th>关闭日期</th>
				<th>信息报告日期</th>
				<th>还款表现记录条数</th>
			</tr>
			<xsl:for-each select="ED01/ED01A[ED01AD02 = 'C1' and ED01AD01 = '2']">
				<tr>
					<td rowspan="2"><xsl:value-of select="ED01AI01"/></td>
					<td><span name="2010"><xsl:value-of select="ED01AD01"/></span></td>
					<td><span name="2011"><xsl:value-of select="ED01AD02"/></span></td>
					<td><span name="2020"><xsl:value-of select="ED01AD03"/></span></td>
					<td><span name="2021"><xsl:value-of select="ED01AD04"/></span></td>
					<td><xsl:value-of select="ED01AI02"/></td>
					<td><xsl:value-of select="ED01AI03"/></td>
					<td><span name="2022"><xsl:value-of select="ED01AD05"/></span></td>
					<td>
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
					</td>
					<td><xsl:value-of select="ED01AR01"/></td>
					<td><span name="3003"><xsl:value-of select="ED01AD07"/></span></td>
					<td rowspan="2"><xsl:value-of select="../ED01C/ED01CS01"/></td>
					<td rowspan="2">见附件</td>
				</tr>
				<tr>
					<td><xsl:value-of select="ED01AJ01"/></td>
					<td><xsl:value-of select="ED01AJ02"/></td>
					<td><xsl:value-of select="ED01AR02"/></td>
					<td><span name="2037"><xsl:value-of select="ED01AD08"/></span></td>
					<td><span name="2038"><xsl:value-of select="ED01AD09"/></span></td>
					<td><span name="2040"><xsl:value-of select="ED01AD10"/></span></td>
					<td><span name="2097"><xsl:value-of select="ED01AD11"/></span></td>
					<td><xsl:value-of select="ED01AR03"/></td>
					<td><xsl:value-of select="ED01AR04"/></td>
					<td><xsl:value-of select="../ED01B/ED01BS01"/></td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
		<!-- 中长期借款 -->
        <div class="t2 f-mgtop">（七）已结清中长期借款</div>
		<table class="g-tab-bor f-tab-nomargin">
			<tr>
				<th rowspan="2">借贷账户编号</th>
				<th>账户活动状态</th>
				<th>借贷账户类型</th>
				<th>借款期限</th>
				<th>业务管理机构类型</th>
				<th>业务管理机构代码</th>
				<th>授信协议编号</th>
				<th>借贷业务种类大类</th>
				<th>借贷业务种类细分</th>
				<th>开户日期</th>
				<th>币种</th>
				<th rowspan="2">特定交易个数</th>
				<th rowspan="2">历史表现</th>
			</tr>
			<tr>
				<th>借款金额</th>
				<th>信用额度</th>
				<th>到期日期</th>
				<th>担保方式</th>
				<th>其他还款保证方式</th>
				<th>发放形式</th>
				<th>共同借款标识</th>
				<th>关闭日期</th>
				<th>信息报告日期</th>
				<th>还款表现记录条数</th>
			</tr>
			<xsl:for-each select="ED01/ED01A[ED01AD01 ='2' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and (ED01AD03 = '20' or ED01AD03 ='30')]">
				<tr>
					<td rowspan="2"><xsl:value-of select="ED01AI01"/></td>
					<td><span name="2010"><xsl:value-of select="ED01AD01"/></span></td>
					<td><span name="2011"><xsl:value-of select="ED01AD02"/></span></td>
					<td><span name="2020"><xsl:value-of select="ED01AD03"/></span></td>
					<td><span name="2021"><xsl:value-of select="ED01AD04"/></span></td>
					<td><xsl:value-of select="ED01AI02"/></td>
					<td><xsl:value-of select="ED01AI03"/></td>
					<td><span name="2022"><xsl:value-of select="ED01AD05"/></span></td>
					<td>
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
					</td>
					<td><xsl:value-of select="ED01AR01"/></td>
					<td><span name="3003"><xsl:value-of select="ED01AD07"/></span></td>
					<td rowspan="2"><xsl:value-of select="../ED01C/ED01CS01"/></td>
					<td rowspan="2">见附件</td>
				</tr>
				<tr>
					<td><xsl:value-of select="ED01AJ01"/></td>
					<td><xsl:value-of select="ED01AJ02"/></td>
					<td><xsl:value-of select="ED01AR02"/></td>
					<td><span name="2037"><xsl:value-of select="ED01AD08"/></span></td>
					<td><span name="2038"><xsl:value-of select="ED01AD09"/></span></td>
					<td><span name="2040"><xsl:value-of select="ED01AD10"/></span></td>
					<td><span name="2097"><xsl:value-of select="ED01AD11"/></span></td>
					<td><xsl:value-of select="ED01AR03"/></td>
					<td><xsl:value-of select="ED01AR04"/></td>
					<td><xsl:value-of select="../ED01B/ED01BS01"/></td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
		<!-- 短期借贷 -->
        <div class="t2 f-mgtop">（八）已结清短期借贷</div>
		<table class="g-tab-bor f-tab-nomargin">
			<tr>
				<th rowspan="2">借贷账户编号</th>
				<th>账户活动状态</th>
				<th>借贷账户类型</th>
				<th>借款期限</th>
				<th>业务管理机构类型</th>
				<th>业务管理机构代码</th>
				<th>授信协议编号</th>
				<th>借贷业务种类大类</th>
				<th>借贷业务种类细分</th>
				<th>开户日期</th>
				<th>币种</th>
				<th rowspan="2">特定交易个数</th>
				<th rowspan="2">历史表现</th>
			</tr>
			<tr>
				<th>借款金额</th>
				<th>信用额度</th>
				<th>到期日期</th>
				<th>担保方式</th>
				<th>其他还款保证方式</th>
				<th>发放形式</th>
				<th>共同借款标识</th>
				<th>关闭日期</th>
				<th>信息报告日期</th>
				<th>还款表现记录条数</th>
			</tr>
			<xsl:for-each select="ED01/ED01A[ED01AD01 ='2' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and ED01AD03 = '10']">
				<tr>
					<td rowspan="2"><xsl:value-of select="ED01AI01"/></td>
					<td><span name="2010"><xsl:value-of select="ED01AD01"/></span></td>
					<td><span name="2011"><xsl:value-of select="ED01AD02"/></span></td>
					<td><span name="2020"><xsl:value-of select="ED01AD03"/></span></td>
					<td><span name="2021"><xsl:value-of select="ED01AD04"/></span></td>
					<td><xsl:value-of select="ED01AI02"/></td>
					<td><xsl:value-of select="ED01AI03"/></td>
					<td><span name="2022"><xsl:value-of select="ED01AD05"/></span></td>
					<td>
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
					</td>
					<td><xsl:value-of select="ED01AR01"/></td>
					<td><span name="3003"><xsl:value-of select="ED01AD07"/></span></td>
					<td rowspan="2"><xsl:value-of select="../ED01C/ED01CS01"/></td>
					<td rowspan="2">见附件</td>
				</tr>
				<tr>
					<td><xsl:value-of select="ED01AJ01"/></td>
					<td><xsl:value-of select="ED01AJ02"/></td>
					<td><xsl:value-of select="ED01AR02"/></td>
					<td><span name="2037"><xsl:value-of select="ED01AD08"/></span></td>
					<td><span name="2038"><xsl:value-of select="ED01AD09"/></span></td>
					<td><span name="2040"><xsl:value-of select="ED01AD10"/></span></td>
					<td><span name="2097"><xsl:value-of select="ED01AD11"/></span></td>
					<td><xsl:value-of select="ED01AR03"/></td>
					<td><xsl:value-of select="ED01AR04"/></td>
					<td><xsl:value-of select="../ED01B/ED01BS01"/></td>
				</tr>
			</xsl:for-each>
		</table>
		<!-- 已结清循环透支 -->
        <div class="t2 f-mgtop">（九）已结清循环透支</div>
		<table class="g-tab-bor f-tab-nomargin">
			<tr>
				<th rowspan="2">借贷账户编号</th>
				<th>账户活动状态</th>
				<th>借贷账户类型</th>
				<th>借款期限</th>
				<th>业务管理机构类型</th>
				<th>业务管理机构代码</th>
				<th>授信协议编号</th>
				<th>借贷业务种类大类</th>
				<th>借贷业务种类细分</th>
				<th>开户日期</th>
				<th>币种</th>
				<th rowspan="2">特定交易个数</th>
				<th rowspan="2">历史表现</th>
			</tr>
			<tr>
				<th>借款金额</th>
				<th>信用额度</th>
				<th>到期日期</th>
				<th>担保方式</th>
				<th>其他还款保证方式</th>
				<th>发放形式</th>
				<th>共同借款标识</th>
				<th>关闭日期</th>
				<th>信息报告日期</th>
				<th>还款表现记录条数</th>
			</tr>
			<xsl:for-each select="ED01/ED01A">
			<xsl:if test="ED01AD01 ='2' and ED01AD02 = 'R1'">
				<tr>
					<td rowspan="2"><xsl:value-of select="ED01AI01"/></td>
					<td><span name="2010"><xsl:value-of select="ED01AD01"/></span></td>
					<td><span name="2011"><xsl:value-of select="ED01AD02"/></span></td>
					<td><span name="2020"><xsl:value-of select="ED01AD03"/></span></td>
					<td><span name="2021"><xsl:value-of select="ED01AD04"/></span></td>
					<td><xsl:value-of select="ED01AI02"/></td>
					<td><xsl:value-of select="ED01AI03"/></td>
					<td><span name="2022"><xsl:value-of select="ED01AD05"/></span></td>
					<td>
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
					</td>
					<td><xsl:value-of select="ED01AR01"/></td>
					<td><span name="3003"><xsl:value-of select="ED01AD07"/></span></td>
					<td rowspan="2"><xsl:value-of select="../ED01C/ED01CS01"/></td>
					<td rowspan="2">见附件</td>
				</tr>
				<tr>
					<td><xsl:value-of select="ED01AJ01"/></td>
					<td><xsl:value-of select="ED01AJ02"/></td>
					<td><xsl:value-of select="ED01AR02"/></td>
					<td><span name="2037"><xsl:value-of select="ED01AD08"/></span></td>
					<td><span name="2038"><xsl:value-of select="ED01AD09"/></span></td>
					<td><span name="2040"><xsl:value-of select="ED01AD10"/></span></td>
					<td><span name="2097"><xsl:value-of select="ED01AD11"/></span></td>
					<td><xsl:value-of select="ED01AR03"/></td>
					<td><xsl:value-of select="ED01AR04"/></td>
					<td><xsl:value-of select="../ED01B/ED01BS01"/></td>
				</tr>
			</xsl:if>
			</xsl:for-each>
		</table>
		<!-- 未结清贴现账户 -->
        <div class="t2 f-mgtop">（十）已结清结清贴现账户</div>
		<table class="g-tab-bor f-tab-nomargin">
			<tr>
				<th rowspan="2">借贷账户编号</th>
				<th>账户活动状态</th>
				<th>借贷账户类型</th>
				<th>借款期限</th>
				<th>业务管理机构类型</th>
				<th>业务管理机构代码</th>
				<th>授信协议编号</th>
				<th>借贷业务种类大类</th>
				<th>借贷业务种类细分</th>
				<th>开户日期</th>
				<th>币种</th>
				<th rowspan="2">特定交易个数</th>
				<th rowspan="2">历史表现</th>
			</tr>
			<tr>
				<th>借款金额</th>
				<th>信用额度</th>
				<th>到期日期</th>
				<th>担保方式</th>
				<th>其他还款保证方式</th>
				<th>发放形式</th>
				<th>共同借款标识</th>
				<th>关闭日期</th>
				<th>信息报告日期</th>
				<th>还款表现记录条数</th>
			</tr>
			<xsl:for-each select="ED01/ED01A">
			<xsl:if test="ED01AD01 ='2' and ED01AD02 = 'D2'">
				<tr>
					<td rowspan="2"><xsl:value-of select="ED01AI01"/></td>
					<td><span name="2010"><xsl:value-of select="ED01AD01"/></span></td>
					<td><span name="2011"><xsl:value-of select="ED01AD02"/></span></td>
					<td><span name="2020"><xsl:value-of select="ED01AD03"/></span></td>
					<td><span name="2021"><xsl:value-of select="ED01AD04"/></span></td>
					<td><xsl:value-of select="ED01AI02"/></td>
					<td><xsl:value-of select="ED01AI03"/></td>
					<td><span name="2022"><xsl:value-of select="ED01AD05"/></span></td>
					<td>
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
					</td>
					<td><xsl:value-of select="ED01AR01"/></td>
					<td><span name="3003"><xsl:value-of select="ED01AD07"/></span></td>
					<td rowspan="2"><xsl:value-of select="../ED01C/ED01CS01"/></td>
					<td rowspan="2">见附件</td>
				</tr>
				<tr>
					<td><xsl:value-of select="ED01AJ01"/></td>
					<td><xsl:value-of select="ED01AJ02"/></td>
					<td><xsl:value-of select="ED01AR02"/></td>
					<td><span name="2037"><xsl:value-of select="ED01AD08"/></span></td>
					<td><span name="2038"><xsl:value-of select="ED01AD09"/></span></td>
					<td><span name="2040"><xsl:value-of select="ED01AD10"/></span></td>
					<td><span name="2097"><xsl:value-of select="ED01AD11"/></span></td>
					<td><xsl:value-of select="ED01AR03"/></td>
					<td><xsl:value-of select="ED01AR04"/></td>
					<td><xsl:value-of select="../ED01B/ED01BS01"/></td>
				</tr>
			</xsl:if>
			</xsl:for-each>
		</table>
		<!-- 贴现账户分机构汇总信息 -->
		<!-- 贴现 -->
        <div class="t2 f-mgtop">（十一）贴现账户分机构汇总信息</div>
		<table class="g-tab-bor f-tab-nomargin">
			<tr>
				<th class="g-w-11">贴现账户分机构汇总信息编号</th>
				<th class="g-w-11">业务管理机构类型</th>
				<th class="g-w-11">业务管理机构代码</th>
				<th class="g-w-11">业务种类</th>
				<th class="g-w-11">五级分类</th>
				<th class="g-w-11">未结清账户数</th>
				<th class="g-w-11">余额合计</th>
				<th class="g-w-11">逾期总额合计</th>
				<th class="g-w-11">逾期本金合计</th>
				<th class="g-w-11">已结清账户数</th>
				<th class="g-w-11">已结清账户贴现金额合计</th>
			</tr>
			<xsl:for-each select="ED02[ED020S01 != '']">
				<tr>
				  <td><xsl:value-of select="ED020I01"/></td>
				  <td><span name="2021"><xsl:value-of select="ED020D01"/></span></td>
				  <td><xsl:value-of select="ED020I02"/></td>
				  <td><span name="2096"><xsl:value-of select="ED020D02"/></span></td>
				  <td><span name="2045"><xsl:value-of select="ED020D03"/></span></td>
				  <td><xsl:value-of select="ED020S01"/></td>
				  <td><xsl:value-of select="ED020J01"/></td>
				  <td><xsl:value-of select="ED020J02"/></td>
				  <td><xsl:value-of select="ED020J03"/></td>
				  <td><xsl:value-of select="ED020S02"/></td>
				  <td><xsl:value-of select="ED020J04"/></td>
				</tr>
			</xsl:for-each>
		</table>	
		<!-- 欠息信息 -->
        <div class="t2 f-mgtop">（十二）欠息信息</div>
		<xsl:if test="ED03 != ''">	
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-8">欠息信息编号</th>
              <th class="g-w-8">业务管理机构类型</th>
              <th class="g-w-8">业务管理机构代码</th>
              <th class="g-w-8">币种</th>
              <th class="g-w-8">欠息余额</th>
              <th class="g-w-8">余额变化日期</th>
              <th class="g-w-8">欠息类型</th>
              <th class="g-w-8">信息报告日期</th>
            </tr>
			<xsl:for-each select="ED03">
            <tr>
              <td><xsl:value-of select="ED030I01"/></td>
              <td><span name="2021"><xsl:value-of select="ED030D01"/></span></td>
              <td><xsl:value-of select="ED030I02"/></td>
              <td><span name="3003"><xsl:value-of select="ED030D02"/></span></td>
              <td><xsl:value-of select="ED030J01"/></td>
              <td><xsl:value-of select="ED030R01"/></td>
              <td><span name="2044"><xsl:value-of select="ED030D03"/></span></td>
              <td><xsl:value-of select="ED030R02"/></td>
            </tr>
			</xsl:for-each>
          </tbody>
        </table>
		</xsl:if>
		<!-- 担保账户信息单元 -->
        <div class="t2 f-mgtop">（十三）银行承兑汇票和信用证的信用证明细</div>
		<xsl:for-each select="../EDB/ED04[ED04A/ED04AD03 = '51' or ED04A/ED04AD03 = '61']">
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-4">授信机构</th>
              <th class="g-w-4">业务种类</th>
              <th class="g-w-4">账户状态</th>
              <th class="g-w-4">五级分类</th>
            </tr>
            <tr>
              <td><xsl:value-of select="ED04A/ED04AI02"/></td>
              <td><span name="2034"><xsl:value-of select="ED04A/ED04AD03"/></span></td>
              <td><span name="2010"><xsl:value-of select="ED04B/ED04BD01"/></span></td>
              <td><span name="2045"><xsl:value-of select="ED04B/ED04BD02"/></span></td>
            </tr>
          </tbody>
        </table>
        <table class="g-subtab-bor">
          <tbody>
			<xsl:if test="ED04B/ED04BD01 = '1'">
            <tr>
              <th rowspan="2">编号</th>
              <th>开立日期</th>
              <th>到期日</th>
              <th>币种</th>
              <th>金额</th>
              <th>反担保方式</th>
		    </tr>
		    <tr>
              <th>保证金比例</th>
              <th>余额</th>
              <th>风险敞口</th>
              <th>授信协议编号</th>
              <th>信息报告日期</th>
            </tr>
            <tr>
              <td rowspan="2"><xsl:value-of select="ED04A/ED04AI01"/></td>
              <td><xsl:value-of select="ED04A/ED04AR01"/></td>
              <td><xsl:value-of select="ED04A/ED04AR02"/></td>
              <td><span name="3003"><xsl:value-of select="ED04A/ED04AD04"/></span></td>
              <td><xsl:value-of select="ED04A/ED04AJ01"/></td>
              <td><span name="2095"><xsl:value-of select="ED01A/ED04AD05"/></span></td>
            </tr>
			<tr>
              <td><xsl:value-of select="ED04A/ED04AQ01"/></td>
              <td><xsl:value-of select="ED04B/ED04BJ01"/></td>
              <td><xsl:value-of select="ED04B/ED04BJ02"/></td>
              <td><xsl:value-of select="ED04A/ED04AI03"/></td>
              <td><xsl:value-of select="ED04B/ED04BR01"/></td>
			</tr>
			</xsl:if>
			<xsl:if test="ED04B/ED04BD01 = '2'">
			<tr>
				<th class="g-w-7">账户编号</th>
				<th class="g-w-7">开立日期</th>
				<th class="g-w-7">到期日</th>
				<th class="g-w-7">币种</th>
				<th class="g-w-7">金额</th>
				<th class="g-w-7">关闭日期</th>
				<th class="g-w-7">垫款标志</th>
			</tr>
			<tr>
				  <td><xsl:value-of select="ED04A/ED04AI01"/></td>
				  <td><xsl:value-of select="ED04A/ED04AR01"/></td>
				  <td><xsl:value-of select="ED04A/ED04AR02"/></td>
				  <td><span name="3003"><xsl:value-of select="ED04A/ED04AD04"/></span></td>
				  <td><xsl:value-of select="ED04A/ED04AJ01"/></td>
				  <td><xsl:value-of select="ED04B/ED04BR02"/></td>
				  <td><span name="2013"><xsl:value-of select="ED04B/ED04BD03"/></span></td>
			</tr>			
			</xsl:if>
          </tbody>
        </table>
		</xsl:for-each>
        <div class="t2 f-mgtop">（十四）银行保函及其他业务的信贷明细</div>
		<xsl:for-each select="../EDB/ED04[ED04A/ED04AD03 != '51' and ED04A/ED04AD03 != '61']">
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-4">授信机构</th>
              <th class="g-w-4">业务种类</th>
              <th class="g-w-4">账户状态</th>
              <th class="g-w-4">五级分类</th>
            </tr>
            <tr>
              <td><xsl:value-of select="ED04A/ED04AI02"/></td>
              <td><span name="2034"><xsl:value-of select="ED04A/ED04AD03"/></span></td>
              <td><span name="2010"><xsl:value-of select="ED04B/ED04BD01"/></span></td>
              <td><span name="2045"><xsl:value-of select="ED04B/ED04BD02"/></span></td>
            </tr>
          </tbody>
        </table>
        <table class="g-tab-bor f-tab-nomargin">
         <tbody>
		  <xsl:if test="ED04B/ED04BD01 = '1'">
            <tr>
              <th rowspan="2">编号</th>
              <th>开立日期</th>
              <th>到期日</th>
              <th>币种</th>
              <th>金额</th>
              <th>反担保方式</th>
		    </tr>
		    <tr>
              <th>保证金比例</th>
              <th>余额</th>
              <th>风险敞口</th>
              <th>授信协议编号</th>
              <th>信息报告日期</th>
            </tr>
            <tr>
              <td rowspan="2"><xsl:value-of select="ED04A/ED04AI01"/></td>
              <td><xsl:value-of select="ED04A/ED04AR01"/></td>
              <td><xsl:value-of select="ED04A/ED04AR02"/></td>
              <td><span name="3003"><xsl:value-of select="ED04A/ED04AD04"/></span></td>
              <td><xsl:value-of select="ED04A/ED04AJ01"/></td>
              <td><span name="2095"><xsl:value-of select="ED01A/ED04AD05"/></span></td>
            </tr>
			<tr>
              <td><xsl:value-of select="ED04A/ED04AQ01"/></td>
              <td><xsl:value-of select="ED04B/ED04BJ01"/></td>
              <td><xsl:value-of select="ED04B/ED04BJ02"/></td>
              <td><xsl:value-of select="ED04A/ED04AI03"/></td>
              <td><xsl:value-of select="ED04B/ED04BR01"/></td>
			</tr>
			</xsl:if>
			<xsl:if test="ED04B/ED04BD01 = '2'">
			<tr>
				<th class="g-w-7">账户编号</th>
				<th class="g-w-7">开立日期</th>
				<th class="g-w-7">到期日</th>
				<th class="g-w-7">币种</th>
				<th class="g-w-7">金额</th>
				<th class="g-w-7">关闭日期</th>
				<th class="g-w-7">垫款标志</th>
			</tr>
			<tr>
				  <td><xsl:value-of select="ED04A/ED04AI01"/></td>
				  <td><xsl:value-of select="ED04A/ED04AR01"/></td>
				  <td><xsl:value-of select="ED04A/ED04AR02"/></td>
				  <td><span name="3003"><xsl:value-of select="ED04A/ED04AD04"/></span></td>
				  <td><xsl:value-of select="ED04A/ED04AJ01"/></td>
				  <td><xsl:value-of select="ED04B/ED04BR02"/></td>
				  <td><span name="2013"><xsl:value-of select="ED04B/ED04BD03"/></span></td>
			</tr>			
			</xsl:if>
       </tbody>
		</table>
		</xsl:for-each>
		<!-- 担保账户分机构汇总信息 -->
        <div class="t2 f-mgtop">（十五）担保账户分机构汇总信息</div>
        <table class="g-tab-bor f-tab-nomargin">
		<tbody>
			<tr>
				<td rowspan="2">担保账户分机构汇总信息编号</td>
				<td rowspan="2">业务管理机构类型</td>
				<td rowspan="2">授信机构代码</td>
				<td rowspan="2">业务种类</td>
				<td rowspan="2">五级分类</td>
				<td rowspan="2">账户数</td>
				<td colspan="5">余额</td>
			</tr>
			<tr>
				<td>到期日≤30天</td>
				<td>到期日≤60天</td>
				<td>到期日≤90天</td>
				<td>到期日>90天</td>
				<td>余额合计</td>
			</tr>
			<xsl:for-each select="../EDB/ED05[ED050S01 != '' and (ED050D02 ='51' or ED050D02 ='61')]">
				<tr>
					<td><xsl:value-of select="ED050I01"/></td>
					<td><span name="2013"><xsl:value-of select="ED050D01"/></span></td>
					<td><xsl:value-of select="ED050I02"/></td>
					<td><span name="2034"><xsl:value-of select="ED050D02"/></span></td>
					<td><span name="2045"><xsl:value-of select="ED050D03"/></span></td>
					<td><xsl:value-of select="ED050S01"/></td>
					<td><xsl:value-of select="ED050J02"/></td>
					<td><xsl:value-of select="ED050J03"/></td>
					<td><xsl:value-of select="ED050J04"/></td>
					<td><xsl:value-of select="ED050J05"/></td>
					<td><xsl:value-of select="ED050J01"/></td>
				</tr>
			</xsl:for-each>
			</tbody>
		</table>
		<br/>
		<!-- 银行保函及其他业务 -->
        <div class="t2 f-mgtop">（十六）银行保函及其他业务</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-7">担保账户分机构汇总信息编号</th>
              <th class="g-w-7">业务管理机构类型</th>
              <th class="g-w-7">业务管理机构代码</th>
              <th class="g-w-7">担保交易业务种类细分</th>
              <th class="g-w-7">五级分类</th>
              <th class="g-w-7">未结清账户数</th>
              <th class="g-w-7">余额</th>
			</tr>
			<xsl:for-each select="../EDB/ED05[ED050S01 != '' and ED050D02 !='51' and ED050D02 !='61']">
				<tr>
				  <td><xsl:value-of select="ED050I01"/></td>
				  <td><span name="2021"><xsl:value-of select="ED050D01"/></span></td>
				  <td><xsl:value-of select="ED050I02"/></td>
				  <td><span name="2034"><xsl:value-of select="ED050D02"/></span></td>
				  <td><span name="2045"><xsl:value-of select="ED050D03"/></span></td>
				  <td><xsl:value-of select="ED050S01"/></td>
				  <td><xsl:value-of select="ED050J01"/></td>
				</tr>
			</xsl:for-each>
		  </tbody>
		</table>
		<!-- 授信信息 -->
        <div class="t2 f-mgtop">（十六）授信信息</div>
        <table class="g-tab-bor">
          <tbody>
            <tr>
              <th rowspan="2">授信协议编号</th>
              <th rowspan="2">业务管理机构类型</th>
              <th>业务管理机构代码</th>
              <th>授信额度类型</th>
              <th>额度循环标志</th>
              <th>生效日期</th>
              <th>到期日</th>
              <th rowspan="2">信息报告日期</th>
            </tr>
            <tr>
              <th>币种</th>
              <th>授信额度</th>
              <th>已用额度</th>
              <th>授信限额</th>
              <th>授信限额编号</th>
            </tr>
			<xsl:for-each select="../EDC/ED06">			
            <tr>
              <th rowspan="2"><xsl:value-of select="ED060I01"/></th>
              <th rowspan="2"><span name="2021"><xsl:value-of select="ED060D01"/></span></th>
              <th><xsl:value-of select="ED060I02"/></th>
              <th><span name="2039"><xsl:value-of select="ED060D02"/></span></th>
              <th><span name="2046"><xsl:value-of select="ED060D03"/></span></th>
              <th><xsl:value-of select="ED060R01"/></th>
              <th><xsl:value-of select="ED060R02"/></th>
              <th rowspan="2"><xsl:value-of select="ED060R03"/></th>
            </tr>
            <tr>
              <th><span name="3003"><xsl:value-of select="ED060D04"/></span></th>
              <th><xsl:value-of select="ED060J01"/></th>
              <th><xsl:value-of select="ED060J04"/></th>
              <th><xsl:value-of select="ED060J03"/></th>
              <th><xsl:value-of select="ED060I03"/></th>
            </tr>
			</xsl:for-each>
          </tbody>
        </table>
		<!-- 相关还款责任 -->
        <div class="t2 f-mgtop">（十七）相关还款责任</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th rowspan="2">账户编号</th>
              <th>主借款人身份类别</th>
              <th>账户类型</th>
              <th>责任类型</th>
              <th>保证合同编号</th>
              <th>还款责任币种</th>
              <th>还款责任金额</th>
              <th>业务机构代码</th>
              <th>业务种类细分</th>
              <th>开立日期</th>
              <th>到期日</th>
              <th>币种</th>
              <th>信用额度</th>
            </tr>
            <tr>
              <th>业务管理机构类型</th>
              <th>业务种类</th>
              <th>借款金额</th>
              <th>余额</th>
              <th>五级分类</th>
              <th>逾期总额</th>
              <th>逾期本金</th>
              <th>逾期月数</th>
              <th>还款状态</th>
              <th>剩余还款月数</th>
              <th colspan="2">信息报告日期</th>
            </tr>		
			<xsl:for-each select="../EDD/ED07">
            <tr>
              <td rowspan="2"><xsl:value-of select="ED070I01"/></td>
              <td><span name="2001"><xsl:value-of select="ED070D01"/></span></td>
              <td>
				  <xsl:if test="ED070D01 = '1'"><span name="2014"><xsl:value-of select="ED070D02"/></span></xsl:if>
				  <xsl:if test="ED070D01 = '2'"><span name="2011"><xsl:value-of select="ED070D02"/></span></xsl:if>
			  </td>
              <td><span name="2011"><xsl:value-of select="ED070D03"/></span></td>
              <td><xsl:value-of select="ED070I03"/></td>
              <td><span name="3003"><xsl:value-of select="ED070D10"/></span></td>
              <td><xsl:value-of select="ED070J01"/></td>
              <td><xsl:value-of select="ED070I02"/></td>
              <td>
				  <xsl:if test="ED070D01 = '1'"><span name="1058"><xsl:value-of select="ED070D06"/></span></xsl:if>
				  <xsl:if test="ED070D01 = '2'"><span name="2022"><xsl:value-of select="ED070D06"/></span></xsl:if>
			  </td>
              <td><xsl:value-of select="ED070R01"/></td>
              <td><xsl:value-of select="ED070R02"/></td>
              <td><span name="3003"><xsl:value-of select="ED070D07"/></span></td>
              <td><xsl:value-of select="ED070J06"/></td>
            </tr>
            <tr>
              <td><span name="2021"><xsl:value-of select="ED070D04"/></span></td>
              <td>
			    <xsl:if test="ED070D01 = '1'"><span name="1058"><xsl:value-of select="ED070D05"/></span></xsl:if>
			    <xsl:if test="ED070D01 = '2'"><span name="2022"><xsl:value-of select="ED070D05"/></span></xsl:if>
			  </td>
              <td><xsl:value-of select="ED070J05"/></td>
              <td><xsl:value-of select="ED070J02"/></td>
              <td><span name="2045"><xsl:value-of select="ED070D08"/></span></td>
              <td><xsl:value-of select="ED070J03"/></td>
              <td><xsl:value-of select="ED070J04"/></td>
              <td><xsl:value-of select="ED070S01"/></td>
              <td>
						<!-- 当为C1账户的时候返回空 -->
						<xsl:if test="ED070D02 = 'C1'"></xsl:if>
						<!-- 当主借款人是企业的时候，返回空 -->
						<xsl:if test="ED070D01 = '2'"></xsl:if>
						<!-- 当主借款人是个人的其他账户时，参见附录A -->
						<xsl:if test="ED070D01 = '1'"><span name="2019"><xsl:value-of select="ED070D09"/></span></xsl:if>
			  </td>
              <td><xsl:value-of select="ED070S02"/></td>
              <td colspan="2"><xsl:value-of select="ED070R03"/></td>
            </tr>
			</xsl:for-each>
		 </tbody>
		</table>
		<br/>
		<!-- 相关还款责任贴现账户分机构汇总信息 -->
        <div class="t2 f-mgtop">（十八）相关还款责任贴现账户分机构汇总信息</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-13">贴现账户分机构汇总信息编号</th>
              <th class="g-w-13">相关还款责任类型</th>
              <th class="g-w-13">业务管理机构类型</th>
              <th class="g-w-13">业务管理机构代码</th>
              <th class="g-w-13">还款责任金额</th>
              <th class="g-w-13">业务种类细分</th>
              <th class="g-w-13">五级分类</th>
              <th class="g-w-13">账户数</th>
              <th class="g-w-13">借款金额</th>
              <th class="g-w-13">余额</th>
              <th class="g-w-13">逾期总额</th>
              <th class="g-w-13">逾期本金</th>
              <th class="g-w-13">保证合同编号</th>
            </tr>
			<xsl:for-each select="../EDD/ED08">
            <tr>
              <td><xsl:value-of select="ED080I01"/></td>
              <td><span name="2019"><xsl:value-of select="ED080D01"/></span></td>
              <td><span name="2021"><xsl:value-of select="ED080D02"/></span></td>
              <td><xsl:value-of select="ED080I02"/></td>
              <td><xsl:value-of select="ED080J01"/></td>
              <td><span name="2030"><xsl:value-of select="ED080D03"/></span></td>
              <td><span name="2045"><xsl:value-of select="ED080D04"/></span></td>
              <td><xsl:value-of select="ED080S01"/></td>
              <td><xsl:value-of select="ED080J05"/></td>
              <td><xsl:value-of select="ED080J02"/></td>
              <td><xsl:value-of select="ED080J03"/></td>
              <td><xsl:value-of select="ED080J04"/></td>
              <td><xsl:value-of select="ED080I03"/></td>
            </tr>
			</xsl:for-each>
          </tbody>
        </table>
		<!-- 为担保交易承担的相关还款责任 -->
        <div class="t2 f-mgtop">（十八）为担保交易承担的相关还款责任</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-11">担保账户分机构汇总信息编号</th>
              <th class="g-w-11">业务管理机构类型</th>
              <th class="g-w-11">相关还款责任类型</th>
              <th class="g-w-11">业务管理机构代码</th>
              <th class="g-w-11">还款责任金额</th>
              <th class="g-w-11">业务种类细分</th>
              <th class="g-w-11">五级分类</th>
              <th class="g-w-11">账户数</th>
              <th class="g-w-11">担保金额</th>
              <th class="g-w-11">余额</th>
              <th class="g-w-11">保证合同编号</th>
            </tr>
			<xsl:for-each select="../EDD/ED09">
				<tr>
				  <td><xsl:value-of select="ED090I01"/></td>
				  <td><span name="2021"><xsl:value-of select="ED090D02"/></span></td>
				  <td><span name="2019"><xsl:value-of select="ED090D01"/></span></td>
				  <td><xsl:value-of select="ED090I02"/></td>
				  <td><xsl:value-of select="ED090J01"/></td>
				  <td><span name="2030"><xsl:value-of select="ED090D03"/></span></td>
				  <td><span name="2045"><xsl:value-of select="ED090D04"/></span></td>
				  <td><xsl:value-of select="ED090S01"/></td>
				  <td><xsl:value-of select="ED090J03"/></td>
				  <td><xsl:value-of select="ED090J02"/></td>
				  <td><xsl:value-of select="ED090I03"/></td>
				</tr>
			</xsl:for-each>
		  </tbody>
		</table>
		<br/>
	</xsl:template>
	
<!-- 非信贷记录明细 -->
<!-- 非信贷记录明细 -->
	<xsl:template match="EEA">
        <div class="t1">四 非信贷记录明细</div>
        <div class="t2 f-mgtop">（一）公用事业缴费信息</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-7">公用事业缴费账户编号</th>
              <th class="g-w-7">公用事业单位名称</th>
              <th class="g-w-7">业务类型</th>
              <th class="g-w-7">缴费状态</th>
              <th class="g-w-7">累计欠费金额</th>
              <th class="g-w-7">统计年月</th>
              <th class="g-w-7">查看过去 24 个月缴费情况</th>
            </tr>
            <tr>
              <td><xsl:value-of select="EE01A/EE01AI01"/></td>
              <td><xsl:value-of select="EE01A/EE01AQ01"/></td>
              <td><span name="2051"><xsl:value-of select="EE01A/EE01AD01"/></span></td>
              <td>
			  <xsl:if test="EE01A/EE01AD01 = '1'"><span name="2052"><xsl:value-of select="EE01A/EE01AD02"/></span></xsl:if>
			  <xsl:if test="EE01A/EE01AD01 = '2'"><span name="2053"><xsl:value-of select="EE01A/EE01AD02"/></span></xsl:if>
			  </td>
              <td><xsl:value-of select="EE01A/EE01AJ01"/></td>
              <td><xsl:value-of select="EE01A/EE01AR01"/></td>
              <td>见附件</td>
            </tr>
          </tbody>
        </table>
	</xsl:template>
<!-- 公共记录明细 -->
	<!-- 欠税信息 -->
	<xsl:template match="EFA">
        <div class="t1">五 公共记录明细</div>
        <div class="t2 f-mgtop">（一）欠税信息</div>
		<xsl:if test="EF01 !=''">
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-4">欠税记录编号</th>
              <th class="g-w-4">主管税务机关</th>
              <th class="g-w-4">欠税总额（元）</th>
              <th class="g-w-4">欠税统计日期</th>
            </tr>
			<xsl:for-each select="EF01">
            <tr>
              <td><xsl:value-of select="EF010I01"/></td>
              <td><xsl:value-of select="EF010Q01"/></td>
              <td><xsl:value-of select="EF010J01"/></td>
              <td><xsl:value-of select="EF010R01"/></td>
            </tr>
			</xsl:for-each>
          </tbody>
        </table>
		</xsl:if>
	</xsl:template>
	<!-- 民事判决记录 强制执行记录 -->
	<xsl:template match="EFB">
		<xsl:if test="count(EF02/child::*) != 0">
        <div class="t2 f-mgtop">（二）民事判决记录</div>
		<xsl:for-each select="EF02">
        <table class="g-tab-bor f-mgtop-s f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-8">民事判决记录编号</th>
              <th class="g-w-8">立案法院</th>
              <th class="g-w-8">立案日期</th>
              <th class="g-w-8">案由</th>
              <th class="g-w-8">诉讼地位</th>
              <th class="g-w-8">案号</th>
              <th class="g-w-8">审判程序</th>
              <th class="g-w-8">诉讼标的</th>
              <th class="g-w-8">诉讼标的金额（元）</th>
              <th class="g-w-8">结案方式</th>
            </tr>
            <tr>
              <td><xsl:value-of select="EF020I01"/></td>
              <td><xsl:value-of select="EF020Q01"/></td>
              <td><xsl:value-of select="EF020R01"/></td>
              <td><xsl:value-of select="EF020Q02"/></td>
              <td><span name="2055"><xsl:value-of select="EF020D01"/></span></td>
              <td><xsl:value-of select="EF020I02"/></td>
              <td><span name="2056"><xsl:value-of select="EF020D02"/></span></td>
              <td><xsl:value-of select="EF020Q03"/></td>
              <td><xsl:value-of select="EF020J01"/></td>
              <td><span name="2057"><xsl:value-of select="EF020D03"/></span></td>
            </tr>
            <tr>
              <th style="WIDTH: 70%" colspan="7">判决/调解结果</th>
              <th style="WIDTH: 30%" colspan="3">判决/调解生效日期：</th>
            </tr>
            <tr>
              <td colspan="7"><xsl:value-of select="EF020Q04"/></td>
              <td colspan="3"><xsl:value-of select="EF020R02"/></td>
            </tr>
          </tbody>
        </table>
		</xsl:for-each>
		</xsl:if>		
		<xsl:if test="count(EF03/child::*) != 0">
        <div class="t2 f-mgtop">（三）强制执行记录</div>
		<xsl:for-each select="EF03">
        <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-11">强制执行记录编号</th>
              <th class="g-w-11">立案法院</th>
              <th class="g-w-11">立案日期</th>
              <th class="g-w-11">案由</th>
              <th class="g-w-11">案号</th>
              <th class="g-w-11">申请执行标的</th>
              <th class="g-w-11">申请执行标的金额（元）</th>
              <th class="g-w-11">案件状态</th>
              <th class="g-w-11">结案方式</th>
              <th class="g-w-11">已执行标的</th>
              <th class="g-w-11">已执行标的金额（元）</th>
            </tr>
            <tr>
              <td><xsl:value-of select="EF030I01"/></td>
              <td><xsl:value-of select="EF030Q01"/></td>
              <td><xsl:value-of select="EF030R01"/></td>
              <td><xsl:value-of select="EF030Q02"/></td>
              <td><xsl:value-of select="EF030I02"/></td>
              <td><xsl:value-of select="EF030Q03"/></td>
              <td><xsl:value-of select="EF030J01"/></td>
              <td><xsl:value-of select="EF030Q04"/></td>
              <td><span name="2058"><xsl:value-of select="EF030D01"/></span></td>
              <td><xsl:value-of select="EF030Q05"/></td>
              <td><xsl:value-of select="EF030J02"/></td>
            </tr>
          </tbody>
        </table>		
		</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- 行政处罚信息 -->
	<xsl:template match="EFC">
		<xsl:if test="count(child::*) != 0">
        <div class="t2 f-mgtop">（四）行政处罚信息</div>
		<xsl:for-each select="EF04">
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-9">行政处罚记录编号</th>
              <th class="g-w-9">处罚机构</th>
              <th class="g-w-9">处罚决定书文号</th>
              <th class="g-w-9">违法行为</th>
              <th class="g-w-9">处罚日期</th>
              <th class="g-w-9">处罚决定</th>
              <th class="g-w-9">处罚金额（元）</th>
              <th class="g-w-9">处罚执行情况</th>
              <th class="g-w-9">行政复议结果</th>
            </tr>
            <tr>
              <td><xsl:value-of select="EF040I01"/></td>
              <td><xsl:value-of select="EF040Q01"/></td>
              <td><xsl:value-of select="EF040I02"/></td>
              <td><xsl:value-of select="EF040Q02"/></td>
              <td><xsl:value-of select="EF040R01"/></td>
              <td><xsl:value-of select="EF040Q03"/></td>
              <td><xsl:value-of select="EF040J01"/></td>
              <td><xsl:value-of select="EF040Q04"/></td>
              <td><xsl:value-of select="EF040Q05"/></td>
            </tr>
          </tbody>
        </table>
		</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- 住房公积金参缴信息 -->
	<xsl:template match="EFD">
		<xsl:if test="count(child::*) != 0">
        <div class="t2 f-mgtop">（五）住房公积金参缴信息</div>
       <table class="g-tab-bor">
		<xsl:for-each select="EF05">
          <tbody>
            <tr>
              <th class="g-w-9">账户编号</th>
              <th class="g-w-9">统计年月</th>
              <th class="g-w-9">初缴年月</th>
              <th class="g-w-9">职工人数</th>
              <th class="g-w-9">缴费基数（元）</th>
              <th class="g-w-9">最近一次缴费日期</th>
              <th class="g-w-9">缴至年月</th>
              <th class="g-w-9">缴费状态</th>
              <th class="g-w-9">累计欠费金额（元）</th>
              <th class="g-w-9">缴费记录条数</th>
            </tr>
            <tr>
              <td><xsl:value-of select="EF05A/EF05AI01"/></td>
              <td><xsl:value-of select="EF05A/EF05AR04"/></td>
              <td><xsl:value-of select="EF05A/EF05AR01"/></td>
              <td><xsl:value-of select="EF05A/EF05AS01"/></td>
              <td><xsl:value-of select="EF05A/EF05AJ01"/></td>
              <td><xsl:value-of select="EF05A/EF05AR02"/></td>
              <td><xsl:value-of select="EF05A/EF05AR03"/></td>
              <td><span name="2059"><xsl:value-of select="EF05A/EF05AD01"/></span></td>
              <td><xsl:value-of select="EF05A/EF05AJ02"/></td>
              <td><xsl:value-of select="EF05B/EF05BS01"/></td>
            </tr>
          </tbody>
		</xsl:for-each>
        </table>
		</xsl:if>
	</xsl:template>
	<!-- 获得许可记录 获得认证记录 获得资质记录 获得奖励记录 拥有专利情况 -->
	<xsl:template match="EFE">
		<xsl:if test="count(EF06/child::*) != 0">
        <div class="t2 f-mgtop">（六）获得许可记录</div>
        <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-6">许可记录编号</th>
              <th class="g-w-6">许可部门</th>
              <th class="g-w-6">许可类型</th>
              <th class="g-w-6">许可日期</th>
              <th class="g-w-6">截止日期</th>
              <th class="g-w-6">许可内容</th>
            </tr>
			<xsl:for-each select="EF06">
            <tr>
              <td><xsl:value-of select="EF060I01"/></td>
              <td><xsl:value-of select="EF060Q01"/></td>
              <td><xsl:value-of select="EF060Q02"/></td>
              <td><xsl:value-of select="EF060R01"/></td>
              <td><xsl:value-of select="EF060R02"/></td>
              <td><xsl:value-of select="EF060Q03"/></td>
            </tr>
			</xsl:for-each>
          </tbody>
        </table>
		<br/>
		</xsl:if>
		<xsl:if test="count(EF07/child::*) != 0">
        <div class="t2 f-mgtop">（七）获得认证记录</div>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-6">认证记录编号</th>
              <th class="g-w-6">认证部门</th>
              <th class="g-w-6">认证类型</th>
              <th class="g-w-6">认证日期</th>
              <th class="g-w-6">截止日期</th>
              <th class="g-w-6">认证内容</th>
            </tr>
			<xsl:for-each select="EF07">
            <tr>
              <td><xsl:value-of select="EF070I01"/></td>
              <td><xsl:value-of select="EF070Q01"/></td>
              <td><xsl:value-of select="EF070Q02"/></td>
              <td><xsl:value-of select="EF070R01"/></td>
              <td><xsl:value-of select="EF070R02"/></td>
              <td><xsl:value-of select="EF070Q03"/></td>
            </tr>
			</xsl:for-each>
          </tbody>
        </table>
		</xsl:if>
		<xsl:if test="count(EF08/child::*) != 0">
        <div class="t2 f-mgtop">（八）获得资质记录</div>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-6">资质记录编号</th>
              <th class="g-w-6">认定部门</th>
              <th class="g-w-6">资质类型</th>
              <th class="g-w-6">批准日期</th>
              <th class="g-w-6">截止日期</th>
              <th class="g-w-6">资质内容</th>
            </tr>
			<xsl:for-each select="EF08">
            <tr>
              <td><xsl:value-of select="EF080I01"/></td>
              <td><xsl:value-of select="EF080Q01"/></td>
              <td><xsl:value-of select="EF080Q02"/></td>
              <td><xsl:value-of select="EF080R01"/></td>
              <td><xsl:value-of select="EF080R02"/></td>
              <td><xsl:value-of select="EF080Q03"/></td>
            </tr>
			</xsl:for-each>
          </tbody>
        </table>
		</xsl:if>
		<xsl:if test="count(EF09/child::*) != 0">
        <div class="t2 f-mgtop">（九）获得奖励记录</div>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-6">奖励记录编号</th>
              <th class="g-w-6">奖励部门</th>
              <th class="g-w-6">奖励名称</th>
              <th class="g-w-6">授予日期</th>
              <th class="g-w-6">截止日期</th>
              <th class="g-w-6">奖励事实</th>
            </tr>
			<xsl:for-each select="EF09">
            <tr>
              <td><xsl:value-of select="EF090I01"/></td>
              <td><xsl:value-of select="EF090Q01"/></td>
              <td><xsl:value-of select="EF090Q02"/></td>
              <td><xsl:value-of select="EF090R01"/></td>
              <td><xsl:value-of select="EF090R02"/></td>
              <td><xsl:value-of select="EF090Q03"/></td>
            </tr>
			</xsl:for-each>
          </tbody>
        </table>	
		</xsl:if>
		<xsl:if test="count(EF10/child::*) != 0">
        <div class="t2 f-mgtop">（十）拥有专利情况</div>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-6">信息编号</th>
              <th class="g-w-6">专利名称</th>
              <th class="g-w-6">专利号</th>
              <th class="g-w-6">申请日期</th>
              <th class="g-w-6">授予日期</th>
              <th class="g-w-6">专利有效期（单位：年）</th>
            </tr>
			<xsl:for-each select="EF10">
            <tr>
              <td><xsl:value-of select="EF100I01"/></td>
              <td><xsl:value-of select="EF100Q01"/></td>
              <td><xsl:value-of select="EF100I02"/></td>
              <td><xsl:value-of select="EF100R01"/></td>
              <td><xsl:value-of select="EF100R02"/></td>
              <td><xsl:value-of select="EF100S01"/></td>
            </tr>
			</xsl:for-each>
          </tbody>
        </table>
		</xsl:if>
	</xsl:template>
	<!-- 出入境检验检疫绿色通道信息 进出口商品免验信息 进出口商品检验分类监管信息 -->
	<xsl:template match="EFF">
		<xsl:if test="count(EF11/child::*) != 0">
        <div class="t2 f-mgtop">（十一）出入境检验检疫绿色通道信息</div>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-4">信息编号</th>
              <th class="g-w-4">批准部门</th>
              <th class="g-w-4">出口商品名称</th>
              <th class="g-w-4">生效日期</th>
            </tr>
			<xsl:for-each select="EF11">
            <tr>
              <td><xsl:value-of select="EF110I01"/></td>
              <td><xsl:value-of select="EF110Q01"/></td>
              <td><xsl:value-of select="EF110Q02"/></td>
              <td><xsl:value-of select="EF110R01"/></td>
            </tr>
			</xsl:for-each>
          </tbody>
        </table>
		</xsl:if>
		<xsl:if test="count(EF12/child::*) != 0">
        <div class="t2 f-mgtop">（十二）进出口商品免验信息</div>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-5">信息编号</th>
              <th class="g-w-5">批准部门</th>
              <th class="g-w-5">免验商品名称</th>
              <th class="g-w-5">免验号</th>
              <th class="g-w-5">截止日期</th>
            </tr>
			<xsl:for-each select="EF12">
            <tr>
              <td><xsl:value-of select="EF120I01"/></td>
              <td><xsl:value-of select="EF120Q01"/></td>
              <td><xsl:value-of select="EF120Q02"/></td>
              <td><xsl:value-of select="EF120I02"/></td>
              <td><xsl:value-of select="EF120R02"/></td>
            </tr>
			</xsl:for-each>
          </tbody>
        </table>
		</xsl:if>
		<xsl:if test="count(EF13/child::*) != 0">
        <div class="t2 f-mgtop">（十三）进出口商品检验分类监管信息</div>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-6">信息编号</th>
              <th class="g-w-6">监管部门</th>
              <th class="g-w-6">管辖直属局</th>
              <th class="g-w-6">监管级别</th>
              <th class="g-w-6">生效日期</th>
              <th class="g-w-6">截止日期</th>
            </tr>
			<xsl:for-each select="EF13">
            <tr>
              <td><xsl:value-of select="EF130I01"/></td>
              <td><xsl:value-of select="EF130Q01"/></td>
              <td><xsl:value-of select="EF130Q02"/></td>
              <td><span name="2060"><xsl:value-of select="EF130D01"/></span></td>
              <td><xsl:value-of select="EF130R01"/></td>
              <td><xsl:value-of select="EF130R02"/></td>
            </tr>
			</xsl:for-each>
          </tbody>
        </table>		
		</xsl:if>
	</xsl:template>
	
	<!-- 融资规模控制信息 -->
	<xsl:template match="EFG">
		<xsl:if test="count(child::*) != 0">
        <div class="t2 f-mgtop">（十四）融资规模控制信息</div>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-5">信息编号</th>
              <th class="g-w-5">所属名录</th>
              <th class="g-w-5">融资控制类型</th>
              <th class="g-w-5">年度</th>
              <th class="g-w-5">规模</th>
            </tr>
			<xsl:for-each select="EF14">
            <tr>
              <td><xsl:value-of select="EF140I01"/></td>
              <td><span name="2094"><xsl:value-of select="EF140D01"/></span></td>
              <td><span name="2093"><xsl:value-of select="EF140D02"/></span></td>
              <td><xsl:value-of select="EF140R01"/></td>
              <td><xsl:value-of select="EF140J01"/></td>
            </tr>
			</xsl:for-each>
          </tbody>
        </table>
		</xsl:if>
	</xsl:template>
<!-- 财务报表 -->
	<xsl:template match="EGA"/>
<!-- 评级信息 -->
	<xsl:template match="EHA">
        <div class="t1">六 评级信息</div>
		<xsl:if test="count(child::*) != 0">
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-9">评级信息编号</th>
              <th class="g-w-9">评级日期</th>
              <th class="g-w-9">评级结果</th>
              <th class="g-w-9">评级机构</th>
            </tr>
			<xsl:for-each select="EH01">
            <tr>
              <td><xsl:value-of select="EH010I01"/></td>
              <td><xsl:value-of select="EH010R01"/></td>
              <td><xsl:value-of select="EH010D01"/></td>
              <td><xsl:value-of select="EH010Q01"/></td>
            </tr>
			</xsl:for-each>
          </tbody>
        </table>
		</xsl:if>
		<xsl:if test="count(child::*) = 0">		
			<div align="center">
				无
			</div>
			<br/>
		</xsl:if>
	</xsl:template>
<!-- 声明及异议标注信息 -->
	<xsl:template match="EIA">
		<br/>
        <div class="t1">七 声明及异议标注信息</div>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-5">对象类型</th>
              <th class="g-w-5">对象标识</th>
              <th class="g-w-5">标注及声明类型</th>
              <th class="g-w-5">标注或声明内容</th>
              <th class="g-w-5">添加日期</th>
            </tr>
			<xsl:for-each select="EI01">
            <tr>
              <td><span name="2065"><xsl:value-of select="EI010D01"/></span></td>
              <td><xsl:value-of select="EI010I01"/></td>
              <td><span name="2066"><xsl:value-of select="EI010D02"/></span></td>
              <td><xsl:value-of select="EI010Q01"/></td>
              <td><xsl:value-of select="EI010R01"/></td>
            </tr>
			</xsl:for-each>
          </tbody>
        </table>		
		<xsl:if test="count(child::*) = 0">		
			<div align="center">
				无
			</div>
		</xsl:if>
	</xsl:template>
<!-- 附件 1：信用记录补充信息 -->
	<xsl:template name="annex1">
        <div class="t1">附件 1：信用记录补充信息</div>
        <div class="t2 f-mgtop">(一)被追偿记录的历史表现</div>
		<xsl:for-each select="EDA/ED01[ED01A/ED01AD02='C1']">
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-5">账户编号</th>
              <th class="g-w-5">账户状态</th>
              <th class="g-w-5">业务管理机构代码</th>
              <th class="g-w-5">借贷业务种类大类</th>
              <th class="g-w-5">借贷业务种类细分</th>
            </tr>
            <tr>
              <td><xsl:value-of select="ED01A/ED01AI01"/></td>
              <td><span name="2010"><xsl:value-of select="ED01A/ED01AD01"/></span></td>
              <td><xsl:value-of select="ED01A/ED01AI02"/></td>
              <td><span name="2022"><xsl:value-of select="ED01AD05"/></span></td>
              <td>
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
			  </td>
            </tr>
          </tbody>
        </table>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-14">信息报告日期</th>
              <th class="g-w-14">余额</th>
              <th class="g-w-14">余额变化日期</th>
              <th class="g-w-14">五级分类</th>
              <th class="g-w-14">五级分类认定日期</th>
              <th class="g-w-14">最近一次实际还款日期</th>
              <th class="g-w-14">最近一次实际还款总额</th>
              <th class="g-w-14">最近一次还款形式</th>
              <th class="g-w-14">最近一次约定还款日期</th>
              <th class="g-w-14">最近一次应还总额</th>
              <th class="g-w-14">逾期总额</th>
              <th class="g-w-14">逾期本金</th>
              <th class="g-w-14">逾期月数</th>
              <th class="g-w-14">剩余还款月数</th>
            </tr>
			<xsl:for-each select="ED01B/ED01BH">
            <tr>
              <td><xsl:value-of select="ED01BR01"/></td>
              <td><xsl:value-of select="ED01BJ01"/></td>
              <td><xsl:value-of select="ED01BR02"/></td>
              <td><xsl:value-of select="ED01BD01"/></td>
              <td><xsl:value-of select="ED01BR03"/></td>
              <td><xsl:value-of select="ED01BR04"/></td>
              <td><xsl:value-of select="ED01BJ02"/></td>
              <td><xsl:value-of select="ED01BD02"/></td>
              <td><xsl:value-of select="ED01BR05"/></td>
              <td><xsl:value-of select="ED01BJ03"/></td>
              <td><xsl:value-of select="ED01BJ04"/></td>
              <td><xsl:value-of select="ED01BJ05"/></td>
              <td><xsl:value-of select="ED01BS02"/></td>
              <td><xsl:value-of select="ED01BS03"/></td>
            </tr>
			</xsl:for-each>
          </tbody>
        </table>	
		<xsl:if test="ED01C !='' and ED01C/ED01CS01 !=0">
        <div class="t2 f-mgtop">特定交易提示</div>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-5">交易类型</th>
              <th class="g-w-5">交易日期</th>
              <th class="g-w-5">交易金额</th>
              <th class="g-w-5">到期日期变更月数</th>
              <th class="g-w-5">交易明细信息</th>
            </tr>
			<xsl:for-each select="ED01C/ED01CH">
            <tr>
              <td><xsl:value-of select="ED01CD01"/></td>
              <td><xsl:value-of select="ED01CR01"/></td>
              <td><xsl:value-of select="ED01CJ01"/></td>
              <td><xsl:value-of select="ED01CS02"/></td>
              <td><xsl:value-of select="ED01CQ01"/></td>
            </tr>
			</xsl:for-each>
          </tbody>
        </table>
		</xsl:if>
		</xsl:for-each>
		<!-- (二)中长期借款的历史表现 -->
        <div class="t2 f-mgtop">(二)中长期借款的历史表现</div>
		<xsl:for-each select="EDA/ED01">
		<xsl:if test="(ED01A/ED01AD02 = 'D1' or ED01A/ED01AD02 = 'R4') and (ED01A/ED01AD03 = '20' or ED01A/ED01AD03 ='30')">
		<table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-5">账户编号</th>
              <th class="g-w-5">账户状态</th>
              <th class="g-w-5">业务管理机构代码</th>
              <th class="g-w-5">借贷业务种类大类</th>
              <th class="g-w-5">借贷业务种类细分</th>
            </tr>
            <tr>
              <td><xsl:value-of select="ED01A/ED01AI01"/></td>
              <td><span name="2010"><xsl:value-of select="ED01A/ED01AD01"/></span></td>
              <td><xsl:value-of select="ED01A/ED01AI02"/></td>
              <td><span name="2022"><xsl:value-of select="ED01AD05"/></span></td>
              <td>
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
			  </td>
            </tr>
          </tbody>
        </table>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-14">信息报告日期</th>
              <th class="g-w-14">余额</th>
              <th class="g-w-14">余额变化日期</th>
              <th class="g-w-14">五级分类</th>
              <th class="g-w-14">五级分类认定日期</th>
              <th class="g-w-14">最近一次实际还款日期</th>
              <th class="g-w-14">最近一次实际还款总额</th>
              <th class="g-w-14">最近一次还款形式</th>
              <th class="g-w-14">最近一次约定还款日期</th>
              <th class="g-w-14">最近一次应还总额</th>
              <th class="g-w-14">逾期总额</th>
              <th class="g-w-14">逾期本金</th>
              <th class="g-w-14">逾期月数</th>
              <th class="g-w-14">剩余还款月数</th>
            </tr>
			<xsl:for-each select="ED01B/ED01BH">
            <tr>
              <td><xsl:value-of select="ED01BR01"/></td>
              <td><xsl:value-of select="ED01BJ01"/></td>
              <td><xsl:value-of select="ED01BR02"/></td>
              <td><xsl:value-of select="ED01BD01"/></td>
              <td><xsl:value-of select="ED01BR03"/></td>
              <td><xsl:value-of select="ED01BR04"/></td>
              <td><xsl:value-of select="ED01BJ02"/></td>
              <td><xsl:value-of select="ED01BD02"/></td>
              <td><xsl:value-of select="ED01BR05"/></td>
              <td><xsl:value-of select="ED01BJ03"/></td>
              <td><xsl:value-of select="ED01BJ04"/></td>
              <td><xsl:value-of select="ED01BJ05"/></td>
              <td><xsl:value-of select="ED01BS02"/></td>
              <td><xsl:value-of select="ED01BS03"/></td>
            </tr>
			</xsl:for-each>
          </tbody>
        </table>		
		<xsl:if test="ED01C !='' and ED01C/ED01CS01 !=0">
	   <div class="t2 f-mgtop">特定交易提示</div>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-5">交易类型</th>
              <th class="g-w-5">交易日期</th>
              <th class="g-w-5">交易金额</th>
              <th class="g-w-5">到期日期变更月数</th>
              <th class="g-w-5">交易明细信息</th>
            </tr>
			<xsl:for-each select="ED01C/ED01CH">
            <tr>
              <td><xsl:value-of select="ED01CD01"/></td>
              <td><xsl:value-of select="ED01CR01"/></td>
              <td><xsl:value-of select="ED01CJ01"/></td>
              <td><xsl:value-of select="ED01CS02"/></td>
              <td><xsl:value-of select="ED01CQ01"/></td>
            </tr>
			</xsl:for-each>
          </tbody>
        </table>
		</xsl:if>
		</xsl:if>
		</xsl:for-each>
		<!-- (三)短期借款的历史表现 -->
        <div class="t2 f-mgtop">(三)短期借款的历史表现</div>
		<xsl:for-each select="EDA/ED01[(ED01A/ED01AD02 = 'D1' or ED01A/ED01AD02 = 'R4') and ED01A/ED01AD03 = '10']">
		<table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-5">账户编号</th>
              <th class="g-w-5">账户状态</th>
              <th class="g-w-5">业务管理机构代码</th>
              <th class="g-w-5">借贷业务种类大类</th>
              <th class="g-w-5">借贷业务种类细分</th>
            </tr>
            <tr>
              <td><xsl:value-of select="ED01A/ED01AI01"/></td>
              <td><span name="2010"><xsl:value-of select="ED01A/ED01AD01"/></span></td>
              <td><xsl:value-of select="ED01A/ED01AI02"/></td>
              <td><span name="2022"><xsl:value-of select="ED01AD05"/></span></td>
              <td>
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
			  </td>
            </tr>
          </tbody>
        </table>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-14">信息报告日期</th>
              <th class="g-w-14">余额</th>
              <th class="g-w-14">余额变化日期</th>
              <th class="g-w-14">五级分类</th>
              <th class="g-w-14">五级分类认定日期</th>
              <th class="g-w-14">最近一次实际还款日期</th>
              <th class="g-w-14">最近一次实际还款总额</th>
              <th class="g-w-14">最近一次还款形式</th>
              <th class="g-w-14">最近一次约定还款日期</th>
              <th class="g-w-14">最近一次应还总额</th>
              <th class="g-w-14">逾期总额</th>
              <th class="g-w-14">逾期本金</th>
              <th class="g-w-14">逾期月数</th>
              <th class="g-w-14">剩余还款月数</th>
            </tr>
			<xsl:for-each select="ED01B/ED01BH">
            <tr>
              <td><xsl:value-of select="ED01BR01"/></td>
              <td><xsl:value-of select="ED01BJ01"/></td>
              <td><xsl:value-of select="ED01BR02"/></td>
              <td><xsl:value-of select="ED01BD01"/></td>
              <td><xsl:value-of select="ED01BR03"/></td>
              <td><xsl:value-of select="ED01BR04"/></td>
              <td><xsl:value-of select="ED01BJ02"/></td>
              <td><xsl:value-of select="ED01BD02"/></td>
              <td><xsl:value-of select="ED01BR05"/></td>
              <td><xsl:value-of select="ED01BJ03"/></td>
              <td><xsl:value-of select="ED01BJ04"/></td>
              <td><xsl:value-of select="ED01BJ05"/></td>
              <td><xsl:value-of select="ED01BS02"/></td>
              <td><xsl:value-of select="ED01BS03"/></td>
            </tr>
			</xsl:for-each>
          </tbody>
        </table>	
		<xsl:if test="ED01C !='' and ED01C/ED01CS01 !=0">
	   <div class="t2 f-mgtop">特定交易提示</div>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-5">交易类型</th>
              <th class="g-w-5">交易日期</th>
              <th class="g-w-5">交易金额</th>
              <th class="g-w-5">到期日期变更月数</th>
              <th class="g-w-5">交易明细信息</th>
            </tr>
			<xsl:for-each select="ED01C/ED01CH">
            <tr>
              <td><xsl:value-of select="ED01CD01"/></td>
              <td><xsl:value-of select="ED01CR01"/></td>
              <td><xsl:value-of select="ED01CJ01"/></td>
              <td><xsl:value-of select="ED01CS02"/></td>
              <td><xsl:value-of select="ED01CQ01"/></td>
            </tr>
			</xsl:for-each>
          </tbody>
        </table>
		</xsl:if>
		</xsl:for-each>
		<br/>
		<!-- (四)循环透支的历史表现 -->
        <div class="t2 f-mgtop">(四)循环透支的历史表现</div>
		<xsl:for-each select="EDA/ED01[ED01A/ED01AD02 = 'R1']">
		<table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-5">账户编号</th>
              <th class="g-w-5">账户状态</th>
              <th class="g-w-5">业务管理机构代码</th>
              <th class="g-w-5">借贷业务种类大类</th>
              <th class="g-w-5">借贷业务种类细分</th>
            </tr>
            <tr>
              <td><xsl:value-of select="ED01A/ED01AI01"/></td>
              <td><span name="2010"><xsl:value-of select="ED01A/ED01AD01"/></span></td>
              <td><xsl:value-of select="ED01A/ED01AI02"/></td>
              <td><span name="2022"><xsl:value-of select="ED01AD05"/></span></td>
              <td>
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
			  </td>
            </tr>
          </tbody>
        </table>
      <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-14">信息报告日期</th>
              <th class="g-w-14">余额</th>
              <th class="g-w-14">余额变化日期</th>
              <th class="g-w-14">五级分类</th>
              <th class="g-w-14">五级分类认定日期</th>
              <th class="g-w-14">最近一次实际还款日期</th>
              <th class="g-w-14">最近一次实际还款总额</th>
              <th class="g-w-14">最近一次还款形式</th>
              <th class="g-w-14">最近一次约定还款日期</th>
              <th class="g-w-14">最近一次应还总额</th>
              <th class="g-w-14">逾期总额</th>
              <th class="g-w-14">逾期本金</th>
              <th class="g-w-14">逾期月数</th>
              <th class="g-w-14">剩余还款月数</th>
            </tr>
			<xsl:for-each select="ED01B/ED01BH">
            <tr>
              <td><xsl:value-of select="ED01BR01"/></td>
              <td><xsl:value-of select="ED01BJ01"/></td>
              <td><xsl:value-of select="ED01BR02"/></td>
              <td><xsl:value-of select="ED01BD01"/></td>
              <td><xsl:value-of select="ED01BR03"/></td>
              <td><xsl:value-of select="ED01BR04"/></td>
              <td><xsl:value-of select="ED01BJ02"/></td>
              <td><xsl:value-of select="ED01BD02"/></td>
              <td><xsl:value-of select="ED01BR05"/></td>
              <td><xsl:value-of select="ED01BJ03"/></td>
              <td><xsl:value-of select="ED01BJ04"/></td>
              <td><xsl:value-of select="ED01BJ05"/></td>
              <td><xsl:value-of select="ED01BS02"/></td>
              <td><xsl:value-of select="ED01BS03"/></td>
            </tr>
			</xsl:for-each>
          </tbody>
        </table>
		<xsl:if test="ED01C !='' and ED01C/ED01CS01 !=0">
	   <div class="t2 f-mgtop">特定交易提示</div>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-5">交易类型</th>
              <th class="g-w-5">交易日期</th>
              <th class="g-w-5">交易金额</th>
              <th class="g-w-5">到期日期变更月数</th>
              <th class="g-w-5">交易明细信息</th>
            </tr>
			<xsl:for-each select="ED01C/ED01CH">
            <tr>
              <td><xsl:value-of select="ED01CD01"/></td>
              <td><xsl:value-of select="ED01CR01"/></td>
              <td><xsl:value-of select="ED01CJ01"/></td>
              <td><xsl:value-of select="ED01CS02"/></td>
              <td><xsl:value-of select="ED01CQ01"/></td>
            </tr>
			</xsl:for-each>
          </tbody>
        </table>
		</xsl:if>
		</xsl:for-each>
		<!-- (五)贴现的信贷明细、历史表现 -->
        <div class="t2 f-mgtop">(五)贴现的信贷明细、历史表现</div>
		<xsl:for-each select="EDA/ED01[ED01A/ED01AD02 = 'D2']">
		<table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-5">账户编号</th>
              <th class="g-w-5">账户状态</th>
              <th class="g-w-5">业务管理机构代码</th>
              <th class="g-w-5">借贷业务种类大类</th>
              <th class="g-w-5">借贷业务种类细分</th>
            </tr>
            <tr>
              <td><xsl:value-of select="ED01A/ED01AI01"/></td>
              <td><span name="2010"><xsl:value-of select="ED01A/ED01AD01"/></span></td>
              <td><xsl:value-of select="ED01A/ED01AI02"/></td>
              <td><span name="2022"><xsl:value-of select="ED01AD05"/></span></td>
              <td>
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
			  </td>
            </tr>
          </tbody>
        </table>
	<xsl:if test="ED01A/ED01AD01 = '1'">
		<table class="g-tab-bor">
		 <tbody>
            <tr>
              <th class="g-w-14">信息报告日期</th>
              <th class="g-w-14">余额</th>
              <th class="g-w-14">余额变化日期</th>
              <th class="g-w-14">五级分类</th>
              <th class="g-w-14">五级分类认定日期</th>
              <th class="g-w-14">最近一次实际还款日期</th>
              <th class="g-w-14">最近一次实际还款总额</th>
              <th class="g-w-14">最近一次还款形式</th>
              <th class="g-w-14">最近一次约定还款日期</th>
              <th class="g-w-14">最近一次应还总额</th>
              <th class="g-w-14">逾期总额</th>
              <th class="g-w-14">逾期本金</th>
              <th class="g-w-14">逾期月数</th>
              <th class="g-w-14">剩余还款月数</th>
            </tr>
            <tr>
              <td><xsl:value-of select="ED01BR01"/></td>
              <td><xsl:value-of select="ED01BJ01"/></td>
              <td><xsl:value-of select="ED01BR02"/></td>
              <td><xsl:value-of select="ED01BD01"/></td>
              <td><xsl:value-of select="ED01BR03"/></td>
              <td><xsl:value-of select="ED01BR04"/></td>
              <td><xsl:value-of select="ED01BJ02"/></td>
              <td><xsl:value-of select="ED01BD02"/></td>
              <td><xsl:value-of select="ED01BR05"/></td>
              <td><xsl:value-of select="ED01BJ03"/></td>
              <td><xsl:value-of select="ED01BJ04"/></td>
              <td><xsl:value-of select="ED01BJ05"/></td>
              <td><xsl:value-of select="ED01BS02"/></td>
              <td><xsl:value-of select="ED01BS03"/></td>
            </tr>
			</tbody>
			</table>
		</xsl:if>
		<xsl:if test="ED01A/ED01AD01 = '2'">
		<table class="g-tab-bor">
		<tbody>
            <tr>
              <th class="g-w-14">信息报告日期</th>
              <th class="g-w-14">余额</th>
              <th class="g-w-14">余额变化日期</th>
              <th class="g-w-14">五级分类</th>
              <th class="g-w-14">五级分类认定日期</th>
              <th class="g-w-14">最近一次实际还款日期</th>
              <th class="g-w-14">最近一次实际还款总额</th>
              <th class="g-w-14">最近一次还款形式</th>
              <th class="g-w-14">最近一次约定还款日期</th>
              <th class="g-w-14">最近一次应还总额</th>
              <th class="g-w-14">逾期总额</th>
              <th class="g-w-14">逾期本金</th>
              <th class="g-w-14">逾期月数</th>
              <th class="g-w-14">剩余还款月数</th>
            </tr>
            <tr>
              <td><xsl:value-of select="ED01BR01"/></td>
              <td><xsl:value-of select="ED01BJ01"/></td>
              <td><xsl:value-of select="ED01BR02"/></td>
              <td><xsl:value-of select="ED01BD01"/></td>
              <td><xsl:value-of select="ED01BR03"/></td>
              <td><xsl:value-of select="ED01BR04"/></td>
              <td><xsl:value-of select="ED01BJ02"/></td>
              <td><xsl:value-of select="ED01BD02"/></td>
              <td><xsl:value-of select="ED01BR05"/></td>
              <td><xsl:value-of select="ED01BJ03"/></td>
              <td><xsl:value-of select="ED01BJ04"/></td>
              <td><xsl:value-of select="ED01BJ05"/></td>
              <td><xsl:value-of select="ED01BS02"/></td>
              <td><xsl:value-of select="ED01BS03"/></td>
            </tr>
			</tbody>
		</table>
		</xsl:if>
		<xsl:if test="ED01C !='' and ED01C/ED01CS01 !=0">
		   <div class="t2 f-mgtop">特定交易提示</div>
		   <table class="g-tab-bor">
			  <tbody>
				<tr>
				  <th class="g-w-5">交易类型</th>
				  <th class="g-w-5">交易日期</th>
				  <th class="g-w-5">交易金额</th>
				  <th class="g-w-5">到期日期变更月数</th>
				  <th class="g-w-5">交易明细信息</th>
				</tr>
				<xsl:for-each select="ED01C/ED01CH">
				<tr>
				  <td><xsl:value-of select="ED01CD01"/></td>
				  <td><xsl:value-of select="ED01CR01"/></td>
				  <td><xsl:value-of select="ED01CJ01"/></td>
				  <td><xsl:value-of select="ED01CS02"/></td>
				  <td><xsl:value-of select="ED01CQ01"/></td>
				</tr>
				</xsl:for-each>
			  </tbody>
			</table>
			</xsl:if>
		</xsl:for-each>
		<!-- 二、非信贷记录明细 -->
        <div class="t1">二、非信贷记录明细</div>
        <div class="t2 f-mgtop">（一）公用事业历史缴费记录明细</div>
		<xsl:for-each select="EEA/EE01">
        <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-3">公用事业单位名称</th>
              <th class="g-w-3">业务类型</th>
              <th class="g-w-3">缴费记录条数</th>
            </tr>
            <tr>
              <td><xsl:value-of select="EE01A/EE01AQ01"/></td>
              <td><span name="2051"><xsl:value-of select="EE01A/EE01AD01"/></span></td>
              <td><xsl:value-of select="EE01B/EE01BS01"/></td>
            </tr>
          </tbody>
        </table>
       <table class="g-subtab-bor">
          <tbody>
            <tr>
              <th class="g-w-5">统计年月</th>
              <th class="g-w-5">缴费状态</th>
              <th class="g-w-5">本月应缴金额</th>
              <th class="g-w-5">本月实缴金额</th>
              <th class="g-w-5">累计欠费金额</th>
            </tr>
			<xsl:for-each select="EE01B/EE01BH">
            <tr>
              <td><xsl:value-of select="EE01BR01"/></td>
              <td><xsl:value-of select="EE01BD01"/></td>
              <td><xsl:value-of select="EE01BJ01"/></td>
              <td><xsl:value-of select="EE01BJ02"/></td>
              <td><xsl:value-of select="EE01BJ03"/></td>
            </tr>
			</xsl:for-each>
          </tbody>
        </table>
		</xsl:for-each>
		<!-- 三、公共记录明细 -->
        <div class="t1">三、公共记录明细</div>
		<div class="t2 f-mgtop">（一）住房公积金历史缴费记录明细</div>
		<!-- 住房公积金历史缴费记录明细 -->
		<xsl:for-each select="EFD/EF05">
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-5">统计年月</th>
              <th class="g-w-5">缴费状态</th>
              <th class="g-w-5">本月应缴金额（元）</th>
              <th class="g-w-5">本月实缴金额（元）</th>
              <th class="g-w-5">累计欠费金额（元）</th>
            </tr>
			<xsl:for-each select="EF05B/EF05BH">
            <tr>
              <td><xsl:value-of select="EF05BR01"/></td>
              <td><span name="2059"><xsl:value-of select="EF05BD01"/></span></td>
              <td><xsl:value-of select="EF05BJ01"/></td>
              <td><xsl:value-of select="EF05BJ02"/></td>
              <td><xsl:value-of select="EF05BJ03"/></td>
            </tr>
			</xsl:for-each>
          </tbody>
        </table>
		</xsl:for-each>
	</xsl:template>
<!-- 附件 2：财务报表信息 -->
	<xsl:template name="annex2">
        <div class="t1">附件 2：财务报表信息</div>
        <div class="t2 f-mgtop">企业资产负债表(2002 版)</div>		
		<!-- 企业资产负债表(2002 版) -->
		<xsl:for-each select="EGA/EG01">
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-8">财务报表编号</th>
              <th class="g-w-8">业务管理机构类型</th>
              <th class="g-w-8">业务管理机构代码</th>
              <th class="g-w-8">报表年份</th>
              <th class="g-w-8">报表类型</th>
              <th class="g-w-8">报表类型细分</th>
            </tr>
            <tr>
              <td><xsl:value-of select="EG01A/EG01AI01"/></td>
              <td><span name="2021"><xsl:value-of select="EG01A/EG01AD01"/></span></td>
              <td><xsl:value-of select="EG01A/EG01AI02"/></td>
              <td><xsl:value-of select="EG01A/EG01AR01"/></td>
              <td><span name="2063"><xsl:value-of select="EG01A/EG01AD02"/></span></td>
              <td><span name="2064"><xsl:value-of select="EG01A/EG01AD03"/></span></td>
            </tr>
          </tbody>
        </table>
       <table class="g-subtab-bor">
          <!--抵消上边框-->
          <tbody>
			<tr>
				<th>
					项目
				</th>
				<th>
					期末值
				</th>
				<th>
					项目
				</th>
				<th>
					期末值
				</th>
			</tr>
			<tr><td>货币资金</td><td><xsl:value-of select="EG01B/EG01BJ01"/></td>
			<td>短期借款</td><td><xsl:value-of select="EG01B/EG01BJ45"/></td></tr>
			<tr><td>短期投资</td><td><xsl:value-of select="EG01B/EG01BJ02"/></td><td>应付票据</td><td><xsl:value-of select="EG01B/EG01BJ46"/></td></tr>
			<tr><td>应收票据</td><td><xsl:value-of select="EG01B/EG01BJ03"/></td><td>应付账款</td><td><xsl:value-of select="EG01B/EG01BJ47"/></td></tr>
			<tr><td>应收股利</td><td><xsl:value-of select="EG01B/EG01BJ04"/></td><td>预收账款</td><td><xsl:value-of select="EG01B/EG01BJ48"/></td></tr>
			<tr><td>应收利息</td><td><xsl:value-of select="EG01B/EG01BJ05"/></td><td>应付工资</td><td><xsl:value-of select="EG01B/EG01BJ49"/></td></tr>
			<tr><td>应收账款</td><td><xsl:value-of select="EG01B/EG01BJ06"/></td><td>应付福利费</td><td><xsl:value-of select="EG01B/EG01BJ50"/></td></tr>
			<tr><td>其他应收款</td><td><xsl:value-of select="EG01B/EG01BJ07"/></td><td>应付利润</td><td><xsl:value-of select="EG01B/EG01BJ51"/></td></tr>
			<tr><td>预付账款</td><td><xsl:value-of select="EG01B/EG01BJ08"/></td><td>应交税金</td><td><xsl:value-of select="EG01B/EG01BJ52"/></td></tr>
			<tr><td>期货保证金</td><td><xsl:value-of select="EG01B/EG01BJ09"/></td><td>其他应交款</td><td><xsl:value-of select="EG01B/EG01BJ53"/></td></tr>
			<tr><td>应收补贴款</td><td><xsl:value-of select="EG01B/EG01BJ10 "/></td><td>其他应付款</td><td><xsl:value-of select="EG01B/EG01BJ54"/></td></tr>
			<tr><td>应收出口退税</td><td><xsl:value-of select="EG01B/EG01BJ11"/></td><td>预提费用</td><td><xsl:value-of select="EG01B/EG01BJ55"/></td></tr>
			<tr><td>存货</td><td><xsl:value-of select="EG01B/EG01BJ12"/></td><td>预计负债</td><td><xsl:value-of select="EG01B/EG01BJ56"/></td></tr>
			<tr><td>存货原材料</td><td><xsl:value-of select="EG01B/EG01BJ13"/></td><td>一年内到期的长期负债</td><td><xsl:value-of select="EG01B/EG01BJ57"/></td></tr>
			<tr><td>存货产成品</td><td><xsl:value-of select="EG01B/EG01BJ14"/></td><td>其他流动负债</td><td><xsl:value-of select="EG01B/EG01BJ58"/></td></tr>
			<tr><td>待摊费用</td><td><xsl:value-of select="EG01B/EG01BJ15"/></td><td>流动负债合计</td><td><xsl:value-of select="EG01B/EG01BJ59"/></td></tr>
			<tr><td>待处理流动资产净损失</td><td><xsl:value-of select="EG01B/EG01BJ16"/></td><td>长期借款</td><td><xsl:value-of select="EG01B/EG01BJ60"/></td></tr>
			<tr><td>一年内到期的长期债权投资</td><td><xsl:value-of select="EG01B/EG01BJ17"/></td><td>应付债券</td><td><xsl:value-of select="EG01B/EG01BJ61"/></td></tr>
			<tr><td>其他流动资产</td><td><xsl:value-of select="EG01B/EG01BJ18"/></td><td>长期应付款</td><td><xsl:value-of select="EG01B/EG01BJ62"/></td></tr>
			<tr><td>流动资产合计</td><td><xsl:value-of select="EG01B/EG01BJ19"/></td><td>专项应付款</td><td><xsl:value-of select="EG01B/EG01BJ63"/></td></tr>
			<tr><td>长期投资</td><td><xsl:value-of select="EG01B/EG01BJ20"/></td><td>其他长期负债</td><td><xsl:value-of select="EG01B/EG01BJ64"/></td></tr>
			<tr><td>长期股权投资</td><td><xsl:value-of select="EG01B/EG01BJ21"/></td><td>（其他长期负债科目下）特准储备基金</td><td><xsl:value-of select="EG01B/EG01BJ65"/></td></tr>
			<tr><td>长期债权投资</td><td><xsl:value-of select="EG01B/EG01BJ22"/></td><td>长期负债合计</td><td><xsl:value-of select="EG01B/EG01BJ66"/></td></tr>
			<tr><td>合并价差</td><td><xsl:value-of select="EG01B/EG01BJ23"/></td><td>递延税款贷项</td><td><xsl:value-of select="EG01B/EG01BJ67"/></td></tr>
			<tr><td>长期投资合计</td><td><xsl:value-of select="EG01B/EG01BJ24"/></td><td>负债合计</td><td><xsl:value-of select="EG01B/EG01BJ68"/></td></tr>
			<tr><td>固定资产原价</td><td><xsl:value-of select="EG01B/EG01BJ25"/></td><td>少数股东权益</td><td><xsl:value-of select="EG01B/EG01BJ69"/></td></tr>
			<tr><td>累计折旧</td><td><xsl:value-of select="EG01B/EG01BJ26"/></td><td>实收资本</td><td><xsl:value-of select="EG01B/EG01BJ70"/></td></tr>
			<tr><td>固定资产净值</td><td><xsl:value-of select="EG01B/EG01BJ27"/></td><td>国家资本</td><td><xsl:value-of select="EG01B/EG01BJ71"/></td></tr>
			<tr><td>固定资产值减值准备</td><td><xsl:value-of select="EG01B/EG01BJ28"/></td><td>集体资本</td><td><xsl:value-of select="EG01B/EG01BJ72"/></td></tr>
			<tr><td>固定资产净额</td><td><xsl:value-of select="EG01B/EG01BJ29"/></td><td>法人资本</td><td><xsl:value-of select="EG01B/EG01BJ73 "/></td></tr>
			<tr><td>固定资产清理</td><td><xsl:value-of select="EG01B/EG01BJ30"/></td><td>（法人资本科目下）国有法人资本</td><td><xsl:value-of select="EG01B/EG01BJ74"/></td></tr>
			<tr><td>工程物资</td><td><xsl:value-of select="EG01B/EG01BJ31"/></td><td>（法人资本科目下）集体法人资本</td><td><xsl:value-of select="EG01B/EG01BJ75"/></td></tr>
			<tr><td>在建工程</td><td><xsl:value-of select="EG01B/EG01BJ32"/></td><td>个人资本</td><td><xsl:value-of select="EG01B/EG01BJ76"/></td></tr>
			<tr><td>待处理固定资产净损失</td><td><xsl:value-of select="EG01B/EG01BJ33"/></td><td>外商资本</td><td><xsl:value-of select="EG01B/EG01BJ77"/></td></tr>
			<tr><td>固定资产合计</td><td><xsl:value-of select="EG01B/EG01BJ34"/></td><td>资本公积</td><td><xsl:value-of select="EG01B/EG01BJ78"/></td></tr>
			<tr><td>无形资产</td><td><xsl:value-of select="EG01B/EG01BJ35"/></td><td>盈余公积</td><td><xsl:value-of select="EG01B/EG01BJ79"/></td></tr>
			<tr><td>（无形资产科目下）土地使用权</td><td><xsl:value-of select="EG01B/EG01BJ36"/></td><td>（盈余公积科目下）法定盈余公积</td><td><xsl:value-of select="EG01B/EG01BJ80"/></td></tr>
			<tr><td>递延资产</td><td><xsl:value-of select="EG01B/EG01BJ37"/></td><td>（盈余公积科目下）公益金</td><td><xsl:value-of select="EG01B/EG01BJ81"/></td></tr>
			<tr><td>（递延资产科目下）固定资产修理</td><td><xsl:value-of select="EG01B/EG01BJ38"/></td><td>（盈余公积科目下）补充流动资本</td><td><xsl:value-of select="EG01B/EG01BJ82"/></td></tr>
			<tr><td>（递延资产科目下）固定资产改良支出</td><td><xsl:value-of select="EG01B/EG01BJ39"/></td><td>未确认的投资损失</td><td><xsl:value-of select="EG01B/EG01BJ83"/></td></tr>
			<tr><td>其他长期资产</td><td><xsl:value-of select="EG01B/EG01BJ40"/></td><td>未分配利润</td><td><xsl:value-of select="EG01B/EG01BJ84"/></td></tr>
			<tr><td>（其他长期资产科目下）特准储备物资</td><td><xsl:value-of select="EG01B/EG01BJ41 "/></td><td>外币报表折算差额</td><td><xsl:value-of select="EG01B/EG01BJ85"/></td></tr>
			<tr><td>无形及其他资产合计</td><td><xsl:value-of select="EG01B/EG01BJ42"/></td><td>所有者权益合计</td><td><xsl:value-of select="EG01B/EG01BJ86"/></td></tr>
			<tr><td>递延税款借项</td><td><xsl:value-of select="EG01B/EG01BJ43"/></td><td>负债和所有者权益总计</td><td><xsl:value-of select="EG01B/EG01BJ87"/></td></tr>
			<tr><td>资产总计</td><td><xsl:value-of select="EG01B/EG01BJ44"/></td><td></td><td></td></tr>
		</tbody>
		</table>
		<br/>
		</xsl:for-each>
		<!-- 企业资产负债表(2007 版) -->
		<xsl:for-each select="EGA/EG02">
       <div class="t2 f-mgtop">企业资产负债表(2007 版)</div>
        <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-6">财务报表编号</th>
              <th class="g-w-6">业务管理机构类型</th>
              <th class="g-w-6">业务管理机构代码</th>
              <th class="g-w-6">报表年份</th>
              <th class="g-w-6">报表类型</th>
              <th class="g-w-6">报表类型细分</th>
            </tr>
            <tr>
              <td><xsl:value-of select="EG02A/EG02AI01"/></td>
              <td><span name="2021"><xsl:value-of select="EG02A/EG02AD01"/></span></td>
              <td><xsl:value-of select="EG02A/EG02AI02"/></td>
              <td><xsl:value-of select="EG02A/EG02AR01"/></td>
              <td><span name="2063"><xsl:value-of select="EG02A/EG02AD02"/></span></td>
              <td><span name="2064"><xsl:value-of select="EG02A/EG02AD03"/></span></td>
            </tr>
          </tbody>
        </table>
       <table class="g-subtab-bor">
          <!--抵消上边框-->
          <tbody>
			<tr>
				<th>
					项目
				</th>
				<th>
					期末值
				</th>
				<th>
					项目
				</th>
				<th>
					期末值
				</th>
			</tr>
			<tr><td>货币资金</td><td><xsl:value-of select="EG02B/EG02BJ01 "/></td><td>短期借款</td><td><xsl:value-of select="EG02B/EG02BJ32"/></td></tr>
			<tr><td>交易性金融资产</td><td><xsl:value-of select="EG02B/EG02BJ02"/></td><td>交易性金融负债</td><td><xsl:value-of select="EG02B/EG02BJ33"/></td></tr>
			<tr><td>应收票据</td><td><xsl:value-of select="EG02B/EG02BJ03"/></td><td>应付票据</td><td><xsl:value-of select="EG02B/EG02BJ34 "/></td></tr>
			<tr><td>应收账款</td><td><xsl:value-of select="EG02B/EG02BJ04"/></td><td>应付账款</td><td><xsl:value-of select="EG02B/EG02BJ35"/></td></tr>
			<tr><td>预付账款</td><td><xsl:value-of select="EG02B/EG02BJ05"/></td><td>预收账款</td><td><xsl:value-of select="EG02B/EG02BJ36"/></td></tr>
			<tr><td>应收利息</td><td><xsl:value-of select="EG02B/EG02BJ06"/></td><td>应付利息</td><td><xsl:value-of select="EG02B/EG02BJ37"/></td></tr>
			<tr><td>应收股利</td><td><xsl:value-of select="EG02B/EG02BJ07"/></td><td>应付职工薪酬</td><td><xsl:value-of select="EG02B/EG02BJ38"/></td></tr>
			<tr><td>其他应收款</td><td><xsl:value-of select="EG02B/EG02BJ08"/></td><td>应交税费</td><td><xsl:value-of select="EG02B/EG02BJ39"/></td></tr>
			<tr><td>存货</td><td><xsl:value-of select="EG02B/EG02BJ09"/></td><td>应付股利</td><td><xsl:value-of select="EG02B/EG02BJ40"/></td></tr>
			<tr><td>一年内到期的非流动资产</td><td><xsl:value-of select="EG02B/EG02BJ10"/></td><td>其他应付款</td><td><xsl:value-of select="EG02B/EG02BJ41"/></td></tr>
			<tr><td>其他流动资产</td><td><xsl:value-of select="EG02B/EG02BJ11"/></td><td>一年内到期的非流动负债</td><td><xsl:value-of select="EG02B/EG02BJ42"/></td></tr>
			<tr><td>流动资产合计</td><td><xsl:value-of select="EG02B/EG02BJ12"/></td><td>其他流动负债</td><td><xsl:value-of select="EG02B/EG02BJ43"/></td></tr>
			<tr><td>可供出售的金融资产</td><td><xsl:value-of select="EG02B/EG02BJ13"/></td><td>流动负债合计</td><td><xsl:value-of select="EG02B/EG02BJ44"/></td></tr>
			<tr><td>持有至到期投资</td><td><xsl:value-of select="EG02B/EG02BJ14"/></td><td>长期借款</td><td><xsl:value-of select="EG02B/EG02BJ45"/></td></tr>
			<tr><td>长期股权投资</td><td><xsl:value-of select="EG02B/EG02BJ15"/></td><td>应付债券</td><td><xsl:value-of select="EG02B/EG02BJ46"/></td></tr>
			<tr><td>长期应收款</td><td><xsl:value-of select="EG02B/EG02BJ16"/></td><td>长期应付款</td><td><xsl:value-of select="EG02B/EG02BJ47"/></td></tr>
			<tr><td>投资性房地产</td><td><xsl:value-of select="EG02B/EG02BJ17"/></td><td>专项应付款</td><td><xsl:value-of select="EG02B/EG02BJ48"/></td></tr>
			<tr><td>固定资产</td><td><xsl:value-of select="EG02B/EG02BJ18"/></td><td>预计负债</td><td><xsl:value-of select="EG02B/EG02BJ49"/></td></tr>
			<tr><td>在建工程</td><td><xsl:value-of select="EG02B/EG02BJ19"/></td><td>递延所得税负债</td><td><xsl:value-of select="EG02B/EG02BJ50"/></td></tr>
			<tr><td>工程物资</td><td><xsl:value-of select="EG02B/EG02BJ20"/></td><td>其他非流动负债</td><td><xsl:value-of select="EG02B/EG02BJ51"/></td></tr>
			<tr><td>固定资产清理</td><td><xsl:value-of select="EG02B/EG02BJ21"/></td><td>非流动负债合计</td><td><xsl:value-of select="EG02B/EG02BJ52"/></td></tr>
			<tr><td>生产性生物资产</td><td><xsl:value-of select="EG02B/EG02BJ22"/></td><td>负债合计</td><td><xsl:value-of select="EG02B/EG02BJ53"/></td></tr>
			<tr><td>油气资产</td><td><xsl:value-of select="EG02B/EG02BJ23"/></td><td>实收资本（或股本）</td><td><xsl:value-of select="EG02B/EG02BJ54"/></td></tr>
			<tr><td>无形资产</td><td><xsl:value-of select="EG02B/EG02BJ24"/></td><td>资本公积</td><td><xsl:value-of select="EG02B/EG02BJ55"/></td></tr>
			<tr><td>开发支出</td><td><xsl:value-of select="EG02B/EG02BJ25"/></td><td>减：库存股</td><td><xsl:value-of select="EG02B/EG02BJ56"/></td></tr>
			<tr><td>商誉</td><td><xsl:value-of select="EG02B/EG02BJ26"/></td><td>盈余公积</td><td><xsl:value-of select="EG02B/EG02BJ57"/></td></tr>
			<tr><td>长期待摊费用</td><td><xsl:value-of select="EG02B/EG02BJ27"/></td><td>未分配利润</td><td><xsl:value-of select="EG02B/EG02BJ58"/></td></tr>
			<tr><td>递延所得税资产</td><td><xsl:value-of select="EG02B/EG02BJ28"/></td><td>所有者权益合计</td><td><xsl:value-of select="EG02B/EG02BJ59"/></td></tr>
			<tr><td>其他非流动资产</td><td><xsl:value-of select="EG02B/EG02BJ29"/></td><td>负债和所有者权益合计</td><td><xsl:value-of select="EG02B/EG02BJ60"/></td></tr>
			<tr><td>非流动资产合计</td><td><xsl:value-of select="EG02B/EG02BJ30"/></td><td></td><td></td></tr>
			<tr><td>资产总计</td><td><xsl:value-of select="EG02B/EG02BJ31"/></td><td></td><td></td></tr>
			</tbody>
		</table>
		<br/>
		</xsl:for-each>
		<!-- 企业利润及利润分配表（2002 版） -->
		<xsl:for-each select="EGA/EG03">
       <div class="t2 f-mgtop">企业利润及利润分配表（2002 版）</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-8">财务报表编号</th>
              <th class="g-w-8">业务管理机构类型</th>
              <th class="g-w-8">业务管理机构代码</th>
              <th class="g-w-8">报表年份</th>
              <th class="g-w-8">报表类型</th>
              <th class="g-w-8">报表类型细分</th>
            </tr>
            <tr>
              <td><xsl:value-of select="EG03A/EG03AI01"/></td>
              <td><span name="2021"><xsl:value-of select="EG03A/EG03AD01"/></span></td>
              <td><xsl:value-of select="EG03A/EG03AI02"/></td>
              <td><xsl:value-of select="EG03A/EG03AR01"/></td>
              <td><span name="2063"><xsl:value-of select="EG03A/EG03AD02"/></span></td>
              <td><span name="2064"><xsl:value-of select="EG03A/EG03AD03"/></span></td>
            </tr>
          </tbody>
        </table>
       <table class="g-subtab-bor">
			<tr>
				<th>
					项目
				</th>
				<th>
					期末值
				</th>
			</tr>
			<tr><td>主营业务收入</td><td><xsl:value-of select="EG03B/EG03BJ01"/></td></tr>
			<tr><td>（主营业务收入科目下）出口产品销售收入</td><td><xsl:value-of select="EG03B/EG03BJ02"/></td></tr>
			<tr><td>（主营业务收入科目下）进口产品销售收入</td><td><xsl:value-of select="EG03B/EG03BJ03"/></td></tr>
			<tr><td>销售折扣与折让</td><td><xsl:value-of select="EG03B/EG03BJ04"/></td></tr>
			<tr><td>主营业务收入净额</td><td><xsl:value-of select="EG03B/EG03BJ05"/></td></tr>
			<tr><td>主营业务成本</td><td><xsl:value-of select="EG03B/EG03BJ06"/></td></tr>
			<tr><td>（主营业务成本科目下）出口产品销售成本</td><td><xsl:value-of select="EG03B/EG03BJ07"/></td></tr>
			<tr><td>主营业务税金及附加</td><td><xsl:value-of select="EG03B/EG03BJ08"/></td></tr>
			<tr><td>经营费用</td><td><xsl:value-of select="EG03B/EG03BJ09"/></td></tr>
			<tr><td>其他（业务成本）</td><td><xsl:value-of select="EG03B/EG03BJ10"/></td></tr>
			<tr><td>递延收益</td><td><xsl:value-of select="EG03B/EG03BJ11"/></td></tr>
			<tr><td>代购代销收入</td><td><xsl:value-of select="EG03B/EG03BJ12"/></td></tr>
			<tr><td>其他（收入）</td><td><xsl:value-of select="EG03B/EG03BJ13"/></td></tr>
			<tr><td>主营业务利润</td><td><xsl:value-of select="EG03B/EG03BJ14"/></td></tr>
			<tr><td>其他业务利润</td><td><xsl:value-of select="EG03B/EG03BJ15"/></td></tr>
			<tr><td>营业费用</td><td><xsl:value-of select="EG03B/EG03BJ16"/></td></tr>
			<tr><td>管理费用</td><td><xsl:value-of select="EG03B/EG03BJ17"/></td></tr>
			<tr><td>财务费用</td><td><xsl:value-of select="EG03B/EG03BJ18"/></td></tr>
			<tr><td>其他（费用）</td><td><xsl:value-of select="EG03B/EG03BJ19"/></td></tr>
			<tr><td>营业利润</td><td><xsl:value-of select="EG03B/EG03BJ20"/></td></tr>
			<tr><td>投资收益</td><td><xsl:value-of select="EG03B/EG03BJ21"/></td></tr>
			<tr><td>期货收益</td><td><xsl:value-of select="EG03B/EG03BJ22"/></td></tr>
			<tr><td>补贴收入</td><td><xsl:value-of select="EG03B/EG03BJ23 "/></td></tr>
			<tr><td>（补贴收入科目下）补贴前亏损的企业补贴收入</td><td><xsl:value-of select="EG03B/EG03BJ24"/></td></tr>
			<tr><td>营业外收入</td><td><xsl:value-of select="EG03B/EG03BJ25"/></td></tr>
			<tr><td>（营业外收入科目下）处置固定资产净收益</td><td><xsl:value-of select="EG03B/EG03BJ26"/></td></tr>
			<tr><td>（营业外收入科目下）非货币性交易收益</td><td><xsl:value-of select="EG03B/EG03BJ27"/></td></tr>
			<tr><td>（营业外收入科目下）出售无形资产收益</td><td><xsl:value-of select="EG03B/EG03BJ28"/></td></tr>
			<tr><td>（营业外收入科目下）罚款净收入</td><td><xsl:value-of select="EG03B/EG03BJ29"/></td></tr>
			<tr><td>其他（利润）</td><td><xsl:value-of select="EG03B/EG03BJ30"/></td></tr>
			<tr><td>（其他科目下）用以前年度含量工资节余弥补利润</td><td><xsl:value-of select="EG03B/EG03BJ31"/></td></tr>
			<tr><td>营业外支出</td><td><xsl:value-of select="EG03B/EG03BJ32"/></td></tr>
			<tr><td>（营业外支出科目下）处置固定资产净损失</td><td><xsl:value-of select="EG03B/EG03BJ33"/></td></tr>
			<tr><td>（营业外支出科目下）债务重组损失</td><td><xsl:value-of select="EG03B/EG03BJ34"/></td></tr>
			<tr><td>（营业外支出科目下）罚款支出</td><td><xsl:value-of select="EG03B/EG03BJ35"/></td></tr>
			<tr><td>（营业外支出科目下）捐赠支出</td><td><xsl:value-of select="EG03B/EG03BJ36"/></td></tr>
			<tr><td>其他支出</td><td><xsl:value-of select="EG03B/EG03BJ37"/></td></tr>
			<tr><td>（其他支出）结转的含量工资包干节余</td><td><xsl:value-of select="EG03B/EG03BJ38"/></td></tr>
			<tr><td>利润总额</td><td><xsl:value-of select="EG03B/EG03BJ39"/></td></tr>
			<tr><td>所得税</td><td><xsl:value-of select="EG03B/EG03BJ40"/></td></tr>
			<tr><td>少数股东损益</td><td><xsl:value-of select="EG03B/EG03BJ41"/></td></tr>
			<tr><td>未确认的投资损失</td><td><xsl:value-of select="EG03B/EG03BJ42"/></td></tr>
			<tr><td>净利润</td><td><xsl:value-of select="EG03B/EG03BJ43"/></td></tr>
			<tr><td>年初未分配利润</td><td><xsl:value-of select="EG03B/EG03BJ44"/></td></tr>
			<tr><td>盈余公积补亏</td><td><xsl:value-of select="EG03B/EG03BJ45"/></td></tr>
			<tr><td>其他调整因素</td><td><xsl:value-of select="EG03B/EG03BJ46"/></td></tr>
			<tr><td>可供分配的利润</td><td><xsl:value-of select="EG03B/EG03BJ47 "/></td></tr>
			<tr><td>单项留用的利润</td><td><xsl:value-of select="EG03B/EG03BJ48"/></td></tr>
			<tr><td>补充流动资本</td><td><xsl:value-of select="EG03B/EG03BJ49"/></td></tr>
			<tr><td>提取法定盈余公积</td><td><xsl:value-of select="EG03B/EG03BJ50"/></td></tr>
			<tr><td>提取法定公益金</td><td><xsl:value-of select="EG03B/EG03BJ51"/></td></tr>
			<tr><td>提取职工奖励及福利基金</td><td><xsl:value-of select="EG03B/EG03BJ52"/></td></tr>
			<tr><td>提取储备基金</td><td><xsl:value-of select="EG03B/EG03BJ53"/></td></tr>
			<tr><td>提取企业发展基金</td><td><xsl:value-of select="EG03B/EG03BJ54"/></td></tr>
			<tr><td>利润归还投资</td><td><xsl:value-of select="EG03B/EG03BJ55"/></td></tr>
			<tr><td>（可供分配的利润科目下）其他</td><td><xsl:value-of select="EG03B/EG03BJ56"/></td></tr>
			<tr><td>可供投资者分配的利润</td><td><xsl:value-of select="EG03B/EG03BJ57"/></td></tr>
			<tr><td>应付优先股股利</td><td><xsl:value-of select="EG03B/EG03BJ58"/></td></tr>
			<tr><td>提取任意盈余公积</td><td><xsl:value-of select="EG03B/EG03BJ59"/></td></tr>
			<tr><td>应付普通股股利</td><td><xsl:value-of select="EG03B/EG03BJ60"/></td></tr>
			<tr><td>转作资本的普通股股利</td><td><xsl:value-of select="EG03B/EG03BJ61"/></td></tr>
			<tr><td>（可供投资者分配的利润科目下）其他</td><td><xsl:value-of select="EG03B/EG03BJ62"/></td></tr>
			<tr><td>未分配利润</td><td><xsl:value-of select="EG03B/EG03BJ63"/></td></tr>
			<tr><td>（未分配利润科目下）应由以后年度税前利润弥补的亏损</td><td><xsl:value-of select="EG03B/EG03BJ64"/></td></tr>
		</table>
		<br/>
		</xsl:for-each>
		<!-- 企业利润及利润分配表（2007 版） -->
		<xsl:for-each select="EGA/EG04">
       <div class="t2 f-mgtop">企业利润及利润分配表（2007 版）</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-8">财务报表编号</th>
              <th class="g-w-8">业务管理机构类型</th>
              <th class="g-w-8">业务管理机构代码</th>
              <th class="g-w-8">报表年份</th>
              <th class="g-w-8">报表类型</th>
              <th class="g-w-8">报表类型细分</th>
            </tr>
            <tr>
              <td><xsl:value-of select="EG04A/EG04AI01"/></td>
              <td><span name="2021"><xsl:value-of select="EG04A/EG04AD01"/></span></td>
              <td><xsl:value-of select="EG04A/EG04AI02"/></td>
              <td><xsl:value-of select="EG04A/EG04AR01"/></td>
              <td><span name="2063"><xsl:value-of select="EG04A/EG04AD02"/></span></td>
              <td><span name="2064"><xsl:value-of select="EG04A/EG04AD03"/></span></td>
            </tr>
          </tbody>
        </table>
        <table class="g-subtab-bor">
			<tr>
				<td>
					项目
				</td>
				<td>
					期末值
				</td>
			</tr>
			<tr><td>营业收入</td><td><xsl:value-of select="EG04B/EG04BJ01"/></td></tr>
			<tr><td>营业成本</td><td><xsl:value-of select="EG04B/EG04BJ02"/></td></tr>
			<tr><td>营业税金及附加</td><td><xsl:value-of select="EG04B/EG04BJ03"/></td></tr>
			<tr><td>销售费用</td><td><xsl:value-of select="EG04B/EG04BJ04"/></td></tr>
			<tr><td>管理费用</td><td><xsl:value-of select="EG04B/EG04BJ05"/></td></tr>
			<tr><td>财务费用</td><td><xsl:value-of select="EG04B/EG04BJ06"/></td></tr>
			<tr><td>资产减值损失</td><td><xsl:value-of select="EG04B/EG04BJ07"/></td></tr>
			<tr><td>公允价值变动净收益</td><td><xsl:value-of select="EG04B/EG04BJ08"/></td></tr>
			<tr><td>投资净收益</td><td><xsl:value-of select="EG04B/EG04BJ09"/></td></tr>
			<tr><td>对联营企业和合营企业的投资收益</td><td><xsl:value-of select="EG04B/EG04BJ10"/></td></tr>
			<tr><td>营业利润</td><td><xsl:value-of select="EG04B/EG04BJ11"/></td></tr>
			<tr><td>营业外收入</td><td><xsl:value-of select="EG04B/EG04BJ12"/></td></tr>
			<tr><td>营业外支出</td><td><xsl:value-of select="EG04B/EG04BJ13"/></td></tr>
			<tr><td>非流动资产损失（其中：非流动资产处置损失）</td><td><xsl:value-of select="EG04B/EG04BJ14"/></td></tr>
			<tr><td>利润总额</td><td><xsl:value-of select="EG04B/EG04BJ15"/></td></tr>
			<tr><td>所得税费用</td><td><xsl:value-of select="EG04B/EG04BJ16"/></td></tr>
			<tr><td>净利润</td><td><xsl:value-of select="EG04B/EG04BJ17"/></td></tr>
			<tr><td>基本每股收益</td><td><xsl:value-of select="EG04B/EG04BJ18"/></td></tr>
			<tr><td>稀释每股收益</td><td><xsl:value-of select="EG04B/EG04BJ19"/></td></tr>
		</table>
		<br/>
		</xsl:for-each>
		<!-- 企业现金流量表（2002 版） -->

		<xsl:for-each select="EGA/EG05">
       <div class="t2 f-mgtop">企业现金流量表（2002 版）</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-6">财务报表编号</th>
              <th class="g-w-6">业务管理机构类型</th>
              <th class="g-w-6">业务管理机构代码</th>
              <th class="g-w-6">报表年份</th>
              <th class="g-w-6">报表类型</th>
              <th class="g-w-6">报表类型细分</th>
            </tr>
			<tr>
              <td><xsl:value-of select="EG05A/EG05AI01"/></td>
              <td><span name="2021"><xsl:value-of select="EG05A/EG05AD01"/></span></td>
              <td><xsl:value-of select="EG05A/EG05AI02"/></td>
              <td><xsl:value-of select="EG05A/EG05AR01"/></td>
              <td><span name="2063"><xsl:value-of select="EG05A/EG05AD02"/></span></td>
              <td><span name="2064"><xsl:value-of select="EG05A/EG05AD03"/></span></td>
			</tr>
			</tbody>
		</table>
        <table class="g-subtab-bor">
          <tbody>
			<tr>
				<th>
					项目
				</th>
				<th>
					期末值
				</th>
			</tr>
			<tr><td>销售商品和提供劳务收到的现金</td><td><xsl:value-of select="EG05B/EG05BJ01"/></td></tr>
			<tr><td>收到的税费返还</td><td><xsl:value-of select="EG05B/EG05BJ02"/></td></tr>
			<tr><td>收到的其他与经营活动有关的现金</td><td><xsl:value-of select="EG05B/EG05BJ03"/></td></tr>
			<tr><td>经营活动现金流入小计</td><td><xsl:value-of select="EG05B/EG05BJ04"/></td></tr>
			<tr><td>购买商品、接受劳务支付的现金</td><td><xsl:value-of select="EG05B/EG05BJ05"/></td></tr>
			<tr><td>支付给职工以及为职工支付的现金</td><td><xsl:value-of select="EG05B/EG05BJ06"/></td></tr>
			<tr><td>支付的各项税费</td><td><xsl:value-of select="EG05B/EG05BJ07"/></td></tr>
			<tr><td>支付的其他与经营活动有关的现金</td><td><xsl:value-of select="EG05B/EG05BJ08"/></td></tr>
			<tr><td>经营活动现金流出小计</td><td><xsl:value-of select="EG05B/EG05BJ09"/></td></tr>
			<tr><td>经营活动产生的现金流量净额</td><td><xsl:value-of select="EG05B/EG05BJ10"/></td></tr>
			<tr><td>收回投资所收到的现金</td><td><xsl:value-of select="EG05B/EG05BJ11"/></td></tr>
			<tr><td>取得投资收益所收到的现金</td><td><xsl:value-of select="EG05B/EG05BJ12"/></td></tr>
			<tr><td>处置固定资产无形资产和其他长期资产所收回的现金净额</td><td><xsl:value-of select="EG05B/EG05BJ13"/></td></tr>
			<tr><td>收到的其他与投资活动有关的现金</td><td><xsl:value-of select="EG05B/EG05BJ14"/></td></tr>
			<tr><td>投资活动现金流入小计</td><td><xsl:value-of select="EG05B/EG05BJ15"/></td></tr>
			<tr><td>购建固定资产无形资产和其他长期资产所支付的现金</td><td><xsl:value-of select="EG05B/EG05BJ16"/></td></tr>
			<tr><td>投资所支付的现金</td><td><xsl:value-of select="EG05B/EG05BJ17"/></td></tr>
			<tr><td>支付的其他与投资活动有关的现金</td><td><xsl:value-of select="EG05B/EG05BJ18"/></td></tr>
			<tr><td>投资活动现金流出小计</td><td><xsl:value-of select="EG05B/EG05BJ19"/></td></tr>
			<tr><td>投资活动产生的现金流量净额</td><td><xsl:value-of select="EG05B/EG05BJ20"/></td></tr>
			<tr><td>吸收投资所收到的现金</td><td><xsl:value-of select="EG05B/EG05BJ21"/></td></tr>
			<tr><td>借款所收到的现金</td><td><xsl:value-of select="EG05B/EG05BJ22 "/></td></tr>
			<tr><td>收到的其他与筹资活动有关的现金</td><td><xsl:value-of select="EG05B/EG05BJ23"/></td></tr>
			<tr><td>筹资活动现金流入小计</td><td><xsl:value-of select="EG05B/EG05BJ24"/></td></tr>
			<tr><td>偿还债务所支付的现金</td><td><xsl:value-of select="EG05B/EG05BJ25"/></td></tr>
			<tr><td>分配股利、利润或偿付利息所支付的现金</td><td><xsl:value-of select="EG05B/EG05BJ26"/></td></tr>
			<tr><td>支付的其他与筹资活动有关的现金</td><td><xsl:value-of select="EG05B/EG05BJ27"/></td></tr>
			<tr><td>筹资活动现金流出小计</td><td><xsl:value-of select="EG05B/EG05BJ28"/></td></tr>
			<tr><td>筹集活动产生的现金流量净额</td><td><xsl:value-of select="EG05B/EG05BJ29"/></td></tr>
			<tr><td>汇率变动对现金的影响</td><td><xsl:value-of select="EG05B/EG05BJ30"/></td></tr>
			<tr><td>现金及现金等价物净增加额</td><td><xsl:value-of select="EG05B/EG05BJ31"/></td></tr>
			<tr><td>净利润</td><td><xsl:value-of select="EG05B/EG05BJ32"/></td></tr>
			<tr><td>计提的资产减值准备</td><td><xsl:value-of select="EG05B/EG05BJ33"/></td></tr>
			<tr><td>固定资产拆旧</td><td><xsl:value-of select="EG05B/EG05BJ34"/></td></tr>
			<tr><td>无形资产摊销</td><td><xsl:value-of select="EG05B/EG05BJ35"/></td></tr>
			<tr><td>长期待摊费用摊销</td><td><xsl:value-of select="EG05B/EG05BJ36"/></td></tr>
			<tr><td>待摊费用减少</td><td><xsl:value-of select="EG05B/EG05BJ37"/></td></tr>
			<tr><td>预提费用增加</td><td><xsl:value-of select="EG05B/EG05BJ38"/></td></tr>
			<tr><td>处置固定资产无形资产和其他长期资产的损失</td><td><xsl:value-of select="EG05B/EG05BJ39"/></td></tr>
			<tr><td>固定资产报废损失</td><td><xsl:value-of select="EG05B/EG05BJ40"/></td></tr>
			<tr><td>财务费用</td><td><xsl:value-of select="EG05B/EG05BJ41"/></td></tr>
			<tr><td>投资损失</td><td><xsl:value-of select="EG05B/EG05BJ42"/></td></tr>
			<tr><td>递延税款贷项</td><td><xsl:value-of select="EG05B/EG05BJ43"/></td></tr>
			<tr><td>存货的减少</td><td><xsl:value-of select="EG05B/EG05BJ44"/></td></tr>
			<tr><td>经营性应收项目的减少</td><td><xsl:value-of select="EG05B/EG05BJ45"/></td></tr>
			<tr><td>经营性应付项目的增加</td><td><xsl:value-of select="EG05B/EG05BJ46"/></td></tr>
			<tr><td>（净利润调节为经营活动现金流量科目下）其他</td><td><xsl:value-of select="EG05B/EG05BJ47"/></td></tr>
			<tr><td>经营活动产生的现金流量净额</td><td><xsl:value-of select="EG05B/EG05BJ48"/></td></tr>
			<tr><td>债务转为资本</td><td><xsl:value-of select="EG05B/EG05BJ49"/></td></tr>
			<tr><td>一年内到期的可转换公司债券</td><td><xsl:value-of select="EG05B/EG05BJ50"/></td></tr>
			<tr><td>融资租入固定资产</td><td><xsl:value-of select="EG05B/EG05BJ51"/></td></tr>
			<tr><td>（不涉及现金收支的投资和筹资活动科目下）其他</td><td><xsl:value-of select="EG05B/EG05BJ52 "/></td></tr>
			<tr><td>现金的期末余额</td><td><xsl:value-of select="EG05B/EG05BJ53"/></td></tr>
			<tr><td>现金的期初余额</td><td><xsl:value-of select="EG05B/EG05BJ54"/></td></tr>
			<tr><td>现金等价物的期末余额</td><td><xsl:value-of select="EG05B/EG05BJ55"/></td></tr>
			<tr><td>现金等价物的期初余额</td><td><xsl:value-of select="EG05B/EG05BJ56"/></td></tr>
			<tr><td>现金及现金等价物净增加额</td><td><xsl:value-of select="EG05B/EG05BJ57"/></td></tr>
			</tbody>
		</table>
		<br/>
		</xsl:for-each>
		<!-- 企业现金流量表（2007 版） -->
		<xsl:for-each select="EGA/EG06">
       <div class="t2 f-mgtop">企业现金流量表（2007 版）</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-6">财务报表编号</th>
              <th class="g-w-6">业务管理机构类型</th>
              <th class="g-w-6">业务管理机构代码</th>
              <th class="g-w-6">报表年份</th>
              <th class="g-w-6">报表类型</th>
              <th class="g-w-6">报表类型细分</th>
            </tr>
			<tr>
				<td>
					<xsl:value-of select="EG06A/EG06AI01"/>
				</td>
				<td>
					<span name="2021"><xsl:value-of select="EG06A/EG06AD01"/></span>
				</td>
				<td>
					<xsl:value-of select="EG06A/EG06AI02"/>
				</td>
				<td>
					<xsl:value-of select="EG06A/EG06AR01"/>
				</td>
				<td>
					<span name="2063"><xsl:value-of select="EG06A/EG06AD02"/></span>
				</td>
				<td>
					<span name="2064"><xsl:value-of select="EG06A/EG06AD03"/></span>
				</td>
			</tr>
			</tbody>
		</table>
        <table class="g-subtab-bor">
          <tbody>
			<tr>
				<td>
					项目
				</td>
				<td>
					期末值
				</td>
			</tr>
			<tr><td>销售商品和提供劳务收到的现金</td><td><xsl:value-of select="EG06B/EG06BJ01"/></td></tr>
			<tr><td>收到的税费返还</td><td><xsl:value-of select="EG06B/EG06BJ02"/></td></tr>
			<tr><td>收到其他与经营活动有关的现金</td><td><xsl:value-of select="EG06B/EG06BJ03"/></td></tr>
			<tr><td>经营活动现金流入小计</td><td><xsl:value-of select="EG06B/EG06BJ04"/></td></tr>
			<tr><td>购买商品、接受劳务支付的现金</td><td><xsl:value-of select="EG06B/EG06BJ05"/></td></tr>
			<tr><td>支付给职工以及为职工支付的现金</td><td><xsl:value-of select="EG06B/EG06BJ06"/></td></tr>
			<tr><td>支付的各项税费</td><td><xsl:value-of select="EG06B/EG06BJ07"/></td></tr>
			<tr><td>支付其他与经营活动有关的现金</td><td><xsl:value-of select="EG06B/EG06BJ08 "/></td></tr>
			<tr><td>经营活动现金流出小计</td><td><xsl:value-of select="EG06B/EG06BJ09"/></td></tr>
			<tr><td>经营活动产生的现金流量净额</td><td><xsl:value-of select="EG06B/EG06BJ10"/></td></tr>
			<tr><td>收回投资所收到的现金</td><td><xsl:value-of select="EG06B/EG06BJ11"/></td></tr>
			<tr><td>取得投资收益所收到的现金</td><td><xsl:value-of select="EG06B/EG06BJ12"/></td></tr>
			<tr><td>处置固定资产无形资产和其他长期资产所收回的现金净额</td><td><xsl:value-of select="EG06B/EG06BJ13"/></td></tr>
			<tr><td>处置子公司及其他营业单位收到的现金净额</td><td><xsl:value-of select="EG06B/EG06BJ14"/></td></tr>
			<tr><td>收到其他与投资活动有关的现金</td><td><xsl:value-of select="EG06B/EG06BJ15"/></td></tr>
			<tr><td>投资活动现金流入小计</td><td><xsl:value-of select="EG06B/EG06BJ16"/></td></tr>
			<tr><td>购建固定资产无形资产和其他长期资产所支付的现金</td><td><xsl:value-of select="EG06B/EG06BJ17"/></td></tr>
			<tr><td>投资所支付的现金</td><td><xsl:value-of select="EG06B/EG06BJ18"/></td></tr>
			<tr><td>取得子公司及其他营业单位支付的现金净额</td><td><xsl:value-of select="EG06B/EG06BJ19"/></td></tr>
			<tr><td>支付其他与投资活动有关的现金</td><td><xsl:value-of select="EG06B/EG06BJ20"/></td></tr>
			<tr><td>投资活动现金流出小计</td><td><xsl:value-of select="EG06B/EG06BJ21"/></td></tr>
			<tr><td>投资活动产生的现金流量净额</td><td><xsl:value-of select="EG06B/EG06BJ22"/></td></tr>
			<tr><td>吸收投资收到的现金</td><td><xsl:value-of select="EG06B/EG06BJ23"/></td></tr>
			<tr><td>取得借款收到的现金</td><td><xsl:value-of select="EG06B/EG06BJ24"/></td></tr>
			<tr><td>收到其他与筹资活动有关的现金</td><td><xsl:value-of select="EG06B/EG06BJ25"/></td></tr>
			<tr><td>筹资活动现金流入小计</td><td><xsl:value-of select="EG06B/EG06BJ26"/></td></tr>
			<tr><td>偿还债务所支付的现金</td><td><xsl:value-of select="EG06B/EG06BJ27"/></td></tr>
			<tr><td>分配股利、利润或偿付利息所支付的现金</td><td><xsl:value-of select="EG06B/EG06BJ28"/></td></tr>
			<tr><td>支付其他与筹资活动有关的现金</td><td><xsl:value-of select="EG06B/EG06BJ29"/></td></tr>
			<tr><td>筹资活动现金流出小计</td><td><xsl:value-of select="EG06B/EG06BJ30"/></td></tr>
			<tr><td>筹集活动产生的现金流量净额</td><td><xsl:value-of select="EG06B/EG06BJ31"/></td></tr>
			<tr><td>汇率变动对现金及现金等价物的影响</td><td><xsl:value-of select="EG06B/EG06BJ32 "/></td></tr>
			<tr><td>现金及现金等价物净增加额</td><td><xsl:value-of select="EG06B/EG06BJ33"/></td></tr>
			<tr><td>期初现金及现金等价物余额</td><td><xsl:value-of select="EG06B/EG06BJ34"/></td></tr>
			<tr><td>期末现金及现金等价物余额</td><td><xsl:value-of select="EG06B/EG06BJ35"/></td></tr>
			<tr><td>净利润</td><td><xsl:value-of select="EG06B/EG06BJ36"/></td></tr>
			<tr><td>资产减值准备</td><td><xsl:value-of select="EG06B/EG06BJ37"/></td></tr>
			<tr><td>固定资产折旧、油气资产折耗、生产性生物资产折旧</td><td><xsl:value-of select="EG06B/EG06BJ38"/></td></tr>
			<tr><td>无形资产摊销</td><td><xsl:value-of select="EG06B/EG06BJ39"/></td></tr>
			<tr><td>长期待摊费用摊销</td><td><xsl:value-of select="EG06B/EG06BJ40"/></td></tr>
			<tr><td>待摊费用减少</td><td><xsl:value-of select="EG06B/EG06BJ41"/></td></tr>
			<tr><td>预提费用增加</td><td><xsl:value-of select="EG06B/EG06BJ42"/></td></tr>
			<tr><td>处置固定资产无形资产和其他长期资产的损失</td><td><xsl:value-of select="EG06B/EG06BJ43"/></td></tr>
			<tr><td>固定资产报废损失</td><td><xsl:value-of select="EG06B/EG06BJ44"/></td></tr>
			<tr><td>公允价值变动损失</td><td><xsl:value-of select="EG06B/EG06BJ45"/></td></tr>
			<tr><td>财务费用</td><td><xsl:value-of select="EG06B/EG06BJ46"/></td></tr>
			<tr><td>投资损失</td><td><xsl:value-of select="EG06B/EG06BJ47"/></td></tr>
			<tr><td>递延所得税资产减少</td><td><xsl:value-of select="EG06B/EG06BJ48"/></td></tr>
			<tr><td>递延所得税负债增加</td><td><xsl:value-of select="EG06B/EG06BJ49"/></td></tr>
			<tr><td>存货的减少</td><td><xsl:value-of select="EG06B/EG06BJ50"/></td></tr>
			<tr><td>经营性应收项目的减少</td><td><xsl:value-of select="EG06B/EG06BJ51"/></td></tr>
			<tr><td>经营性应付项目的增加</td><td><xsl:value-of select="EG06B/EG06BJ52"/></td></tr>
			<tr><td>（净利润调节为经营活动现金流量科目下）其他</td><td><xsl:value-of select="EG06B/EG06BJ53"/></td></tr>
			<tr><td>经营活动产生的现金流量净额</td><td><xsl:value-of select="EG06B/EG06BJ54"/></td></tr>
			<tr><td>债务转为资本</td><td><xsl:value-of select="EG06B/EG06BJ55"/></td></tr>
			<tr><td>一年内到期的可转换公司债券</td><td><xsl:value-of select="EG06B/EG06BJ56"/></td></tr>
			<tr><td>融资租入固定资产</td><td><xsl:value-of select="EG06B/EG06BJ57"/></td></tr>
			<tr><td>现金的期末余额</td><td><xsl:value-of select="EG06B/EG06BJ58"/></td></tr>
			<tr><td>现金的期初余额</td><td><xsl:value-of select="EG06B/EG06BJ59"/></td></tr>
			<tr><td>现金等价物的期末余额</td><td><xsl:value-of select="EG06B/EG06BJ60"/></td></tr>
			<tr><td>现金等价物的期初余额</td><td><xsl:value-of select="EG06B/EG06BJ61"/></td></tr>
			<tr><td>现金及现金等价物净增加额</td><td><xsl:value-of select="EG06B/EG06BJ62 "/></td></tr>
			<tr><td>（不涉及现金收支的投资和筹资活动科目下）其他</td><td><xsl:value-of select="EG06B/EG06BJ63 "/></td></tr>
			</tbody>
		</table>
		<br/>
		</xsl:for-each>
		<!-- 事业单位资产负债表(1997 版) -->
		<xsl:for-each select="EGA/EG07">
       <div class="t2 f-mgtop">事业单位资产负债表(1997 版)</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-6">财务报表编号</th>
              <th class="g-w-6">业务管理机构类型</th>
              <th class="g-w-6">业务管理机构代码</th>
              <th class="g-w-6">报表年份</th>
              <th class="g-w-6">报表类型</th>
              <th class="g-w-6">报表类型细分</th>
            </tr>
			<tr>
				<td>
					<xsl:value-of select="EG07A/EG07AI01"/>
				</td>
				<td>
					<span name="2021"><xsl:value-of select="EG07A/EG07AD01"/></span>
				</td>
				<td>
					<xsl:value-of select="EG07A/EG07AI02"/>
				</td>
				<td>
					<xsl:value-of select="EG07A/EG07AR01"/>
				</td>
				<td>
					<span name="2063"><xsl:value-of select="EG07A/EG07AD02"/></span>
				</td>
				<td>
					<span name="2064"><xsl:value-of select="EG07A/EG07AD03"/></span>
				</td>
			</tr>
			</tbody>
		</table>
        <table class="g-subtab-bor">
          <tbody>
			<tr>
				<td>
					项目
				</td>
				<td>
					期末值
				</td>
			</tr>
			<tr><td>现金</td><td><xsl:value-of select="EG07B/EG07BJ01"/></td></tr>
			<tr><td>银行存款</td><td><xsl:value-of select="EG07B/EG07BJ02"/></td></tr>
			<tr><td>应收票据</td><td><xsl:value-of select="EG07B/EG07BJ03"/></td></tr>
			<tr><td>应收账款</td><td><xsl:value-of select="EG07B/EG07BJ04"/></td></tr>
			<tr><td>预付账款</td><td><xsl:value-of select="EG07B/EG07BJ05"/></td></tr>
			<tr><td>其他应收款</td><td><xsl:value-of select="EG07B/EG07BJ06"/></td></tr>
			<tr><td>材料</td><td><xsl:value-of select="EG07B/EG07BJ07"/></td></tr>
			<tr><td>产成品</td><td><xsl:value-of select="EG07B/EG07BJ08"/></td></tr>
			<tr><td>对外投资</td><td><xsl:value-of select="EG07B/EG07BJ09"/></td></tr>
			<tr><td>固定资产</td><td><xsl:value-of select="EG07B/EG07BJ10"/></td></tr>
			<tr><td>无形资产</td><td><xsl:value-of select="EG07B/EG07BJ11"/></td></tr>
			<tr><td>资产合计</td><td><xsl:value-of select="EG07B/EG07BJ12"/></td></tr>
			<tr><td>拨出经费</td><td><xsl:value-of select="EG07B/EG07BJ13"/></td></tr>
			<tr><td>拨出专款</td><td><xsl:value-of select="EG07B/EG07BJ14"/></td></tr>
			<tr><td>专款支出</td><td><xsl:value-of select="EG07B/EG07BJ15"/></td></tr>
			<tr><td>事业支出</td><td><xsl:value-of select="EG07B/EG07BJ16"/></td></tr>
			<tr><td>经营支出</td><td><xsl:value-of select="EG07B/EG07BJ17 "/></td></tr>
			<tr><td>成本费用</td><td><xsl:value-of select="EG07B/EG07BJ18"/></td></tr>
			<tr><td>销售税金</td><td><xsl:value-of select="EG07B/EG07BJ19"/></td></tr>
			<tr><td>上缴上级支出</td><td><xsl:value-of select="EG07B/EG07BJ20"/></td></tr>
			<tr><td>对附属单位补助</td><td><xsl:value-of select="EG07B/EG07BJ21"/></td></tr>
			<tr><td>结转自筹基建</td><td><xsl:value-of select="EG07B/EG07BJ22"/></td></tr>
			<tr><td>支出合计</td><td><xsl:value-of select="EG07B/EG07BJ23"/></td></tr>
			<tr><td>资产部类总计</td><td><xsl:value-of select="EG07B/EG07BJ24"/></td></tr>
			<tr><td>借记款项</td><td><xsl:value-of select="EG07B/EG07BJ25"/></td></tr>
			<tr><td>应付票据</td><td><xsl:value-of select="EG07B/EG07BJ26"/></td></tr>
			<tr><td>应付账款</td><td><xsl:value-of select="EG07B/EG07BJ27"/></td></tr>
			<tr><td>预收账款</td><td><xsl:value-of select="EG07B/EG07BJ28"/></td></tr>
			<tr><td>其他应付款</td><td><xsl:value-of select="EG07B/EG07BJ29"/></td></tr>
			<tr><td>应缴预算款</td><td><xsl:value-of select="EG07B/EG07BJ30"/></td></tr>
			<tr><td>应缴财政专户款</td><td><xsl:value-of select="EG07B/EG07BJ31"/></td></tr>
			<tr><td>应交税金</td><td><xsl:value-of select="EG07B/EG07BJ32"/></td></tr>
			<tr><td>负债合计</td><td><xsl:value-of select="EG07B/EG07BJ33"/></td></tr>
			<tr><td>事业基金</td><td><xsl:value-of select="EG07B/EG07BJ34"/></td></tr>
			<tr><td>一般基金</td><td><xsl:value-of select="EG07B/EG07BJ35"/></td></tr>
			<tr><td>投资基金</td><td><xsl:value-of select="EG07B/EG07BJ36"/></td></tr>
			<tr><td>固定基金</td><td><xsl:value-of select="EG07B/EG07BJ37"/></td></tr>
			<tr><td>专用基金</td><td><xsl:value-of select="EG07B/EG07BJ38"/></td></tr>
			<tr><td>事业结余</td><td><xsl:value-of select="EG07B/EG07BJ39"/></td></tr>
			<tr><td>经营结余</td><td><xsl:value-of select="EG07B/EG07BJ40"/></td></tr>
			<tr><td>净资产合计</td><td><xsl:value-of select="EG07B/EG07BJ41"/></td></tr>
			<tr><td>财政补助收入</td><td><xsl:value-of select="EG07B/EG07BJ42"/></td></tr>
			<tr><td>上级补助收入</td><td><xsl:value-of select="EG07B/EG07BJ43"/></td></tr>
			<tr><td>拨入专款</td><td><xsl:value-of select="EG07B/EG07BJ44"/></td></tr>
			<tr><td>事业收入</td><td><xsl:value-of select="EG07B/EG07BJ45"/></td></tr>
			<tr><td>经营收入</td><td><xsl:value-of select="EG07B/EG07BJ46"/></td></tr>
			<tr><td>附属单位缴款</td><td><xsl:value-of select="EG07B/EG07BJ47"/></td></tr>
			<tr><td>其他收入</td><td><xsl:value-of select="EG07B/EG07BJ48"/></td></tr>
			<tr><td>收入合计</td><td><xsl:value-of select="EG07B/EG07BJ49"/></td></tr>
			<tr><td>负债部类总计</td><td><xsl:value-of select="EG07B/EG07BJ50 "/></td></tr>
			</tbody>
		</table>
		<br/>
		</xsl:for-each>
		<!-- 事业单位资产负债表(2013 版) -->
		<xsl:for-each select="EGA/EG08">
       <div class="t2 f-mgtop">事业单位资产负债表(2013 版)</div>
        <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-8">财务报表编号</th>
              <th class="g-w-8">业务管理机构类型</th>
              <th class="g-w-8">业务管理机构代码</th>
              <th class="g-w-8">报表年份</th>
              <th class="g-w-8">报表类型</th>
              <th class="g-w-8">报表类型细分</th>
            </tr>
			<tr>
				<td>
					<xsl:value-of select="EG08A/EG08AI01"/>
				</td>
				<td>
					<span name="2021"><xsl:value-of select="EG08A/EG08AD01"/></span>
				</td>
				<td>
					<xsl:value-of select="EG08A/EG08AI02"/>
				</td>
				<td>
					<xsl:value-of select="EG08A/EG08AR01"/>
				</td>
				<td>
					<span name="2063"><xsl:value-of select="EG08A/EG08AD02"/></span>
				</td>
				<td>
					<span name="2064"><xsl:value-of select="EG08A/EG08AD03"/></span>
				</td>
			</tr>
			</tbody>
		</table>
        <table class="g-subtab-bor">
          <!--抵消上边框-->
          <tbody>
			<tr>
				<th>
					项目
				</th>
				<th>
					期末值
				</th>
				<th>
					项目
				</th>
				<th>
					期末值
				</th>
			</tr>
			<tr><td>货币资金</td><td><xsl:value-of select="EG08B/EG08BJ01"/></td><td>短期借款</td><td><xsl:value-of select="EG08B/EG08BJ22"/></td></tr>
			<tr><td>短期投资</td><td><xsl:value-of select="EG08B/EG08BJ02"/></td><td>应缴税费</td><td><xsl:value-of select="EG08B/EG08BJ23"/></td></tr>
			<tr><td>财政应返还额度</td><td><xsl:value-of select="EG08B/EG08BJ03"/></td><td>应缴国库款</td><td><xsl:value-of select="EG08B/EG08BJ24"/></td></tr>
			<tr><td>应收票据</td><td><xsl:value-of select="EG08B/EG08BJ04"/></td><td>应缴财政专户款</td><td><xsl:value-of select="EG08B/EG08BJ25"/></td></tr>
			<tr><td>应收账款</td><td><xsl:value-of select="EG08B/EG08BJ05"/></td><td>应付职工薪酬</td><td><xsl:value-of select="EG08B/EG08BJ26"/></td></tr>
			<tr><td>预付账款</td><td><xsl:value-of select="EG08B/EG08BJ06"/></td><td>应付票据</td><td><xsl:value-of select="EG08B/EG08BJ27"/></td></tr>
			<tr><td>其他应收款</td><td><xsl:value-of select="EG08B/EG08BJ07"/></td><td>应付账款</td><td><xsl:value-of select="EG08B/EG08BJ28"/></td></tr>
			<tr><td>存货</td><td><xsl:value-of select="EG08B/EG08BJ08"/></td><td>预收账款</td><td><xsl:value-of select="EG08B/EG08BJ29"/></td></tr>
			<tr><td>其他流动资产</td><td><xsl:value-of select="EG08B/EG08BJ09"/></td><td>其他应付款</td><td><xsl:value-of select="EG08B/EG08BJ30"/></td></tr>
			<tr><td>流动资产合计</td><td><xsl:value-of select="EG08B/EG08BJ10"/></td><td>其他流动负债</td><td><xsl:value-of select="EG08B/EG08BJ31"/></td></tr>
			<tr><td>长期投资</td><td><xsl:value-of select="EG08B/EG08BJ11"/></td><td>流动负债合计</td><td><xsl:value-of select="EG08B/EG08BJ32"/></td></tr>
			<tr><td>固定资产</td><td><xsl:value-of select="EG08B/EG08BJ12"/></td><td>长期借款</td><td><xsl:value-of select="EG08B/EG08BJ33"/></td></tr>
			<tr><td>固定资产原价</td><td><xsl:value-of select="EG08B/EG08BJ13"/></td><td>长期应付款</td><td><xsl:value-of select="EG08B/EG08BJ34"/></td></tr>
			<tr><td>累计折旧</td><td><xsl:value-of select="EG08B/EG08BJ14"/></td><td>非流动负债合计</td><td><xsl:value-of select="EG08B/EG08BJ35"/></td></tr>
			<tr><td>在建工程</td><td><xsl:value-of select="EG08B/EG08BJ15"/></td><td>负债合计</td><td><xsl:value-of select="EG08B/EG08BJ36"/></td></tr>
			<tr><td>无形资产</td><td><xsl:value-of select="EG08B/EG08BJ16"/></td><td>事业基金</td><td><xsl:value-of select="EG08B/EG08BJ37"/></td></tr>
			<tr><td>无形资产原价</td><td><xsl:value-of select="EG08B/EG08BJ17"/></td><td>非流动资产基金</td><td><xsl:value-of select="EG08B/EG08BJ38"/></td></tr>
			<tr><td>累计摊销</td><td><xsl:value-of select="EG08B/EG08BJ18"/></td><td>专用基金</td><td><xsl:value-of select="EG08B/EG08BJ39"/></td></tr>
			<tr><td>待处置资产损溢</td><td><xsl:value-of select="EG08B/EG08BJ19"/></td><td>财政补助结转</td><td><xsl:value-of select="EG08B/EG08BJ40"/></td></tr>
			<tr><td>非流动资产合计</td><td><xsl:value-of select="EG08B/EG08BJ20 "/></td><td>财政补助结余</td><td><xsl:value-of select="EG08B/EG08BJ41"/></td></tr>
			<tr><td>资产总计</td><td><xsl:value-of select="EG08B/EG08BJ21"/></td><td>非财政补助结转</td><td><xsl:value-of select="EG08B/EG08BJ42"/></td></tr>
			<tr><td></td><td></td><td>非财政补助结余</td><td><xsl:value-of select="EG08B/EG08BJ43"/></td></tr>
			<tr><td></td><td></td><td>事业结余</td><td><xsl:value-of select="EG08B/EG08BJ44"/></td></tr>
			<tr><td></td><td></td><td>经营结余</td><td><xsl:value-of select="EG08B/EG08BJ45"/></td></tr>
			<tr><td></td><td></td><td>净资产合计</td><td><xsl:value-of select="EG08B/EG08BJ46"/></td></tr>
			<tr><td></td><td></td><td>负债和净资产总计</td><td><xsl:value-of select="EG08B/EG08BJ47 "/></td></tr>
			<tr><td></td><td></td><td>未分配利润</td><td><xsl:value-of select="EG08B/EG02BJ58"/></td></tr>
			<tr><td></td><td></td><td>所有者权益合计</td><td><xsl:value-of select="EG08B/EG02BJ59"/></td></tr>
			<tr><td></td><td></td><td>负债和所有者权益合计</td><td><xsl:value-of select="EG08B/EG02BJ60"/></td></tr>
			</tbody>
		</table>
		<br/>
		</xsl:for-each>
		<!-- 事业单位收入支出表（1997 版） -->
		<xsl:for-each select="EGA/EG09">
       <div class="t2 f-mgtop">事业单位收入支出表（1997 版）</div>
        <table class="g-tab-bor">
			<tr>
				<td>
					财务报表编号
				</td>
				<td>
					业务管理机构类型
				</td>
				<td>
					业务管理机构代码
				</td>
				<td>
					报表年份
				</td>
				<td>
					报表类型
				</td>
				<td>
					报表类型细分
				</td>
			</tr>
			<tr>
				<td>
					<xsl:value-of select="EG09A/EG09AI01"/>
				</td>
				<td>
					<span name="2021"><xsl:value-of select="EG09A/EG09AD01"/></span>
				</td>
				<td>
					<xsl:value-of select="EG09A/EG09AI02"/>
				</td>
				<td>
					<xsl:value-of select="EG09A/EG09AR01"/>
				</td>
				<td>
					<span name="2063"><xsl:value-of select="EG09A/EG09AD02"/></span>
				</td>
				<td>
					<span name="2064"><xsl:value-of select="EG09A/EG09AD03"/></span>
				</td>
			</tr>
		</table>
       <table class="g-subtab-bor">
			<tr>
				<td>
					项目
				</td>
				<td>
					期末值
				</td>
			</tr>
			<tr><td>财政补助收入</td><td><xsl:value-of select="EG09B/EG09BJ01"/></td></tr>
			<tr><td>上级补助收入</td><td><xsl:value-of select="EG09B/EG09BJ02"/></td></tr>
			<tr><td>附属单位缴款</td><td><xsl:value-of select="EG09B/EG09BJ03"/></td></tr>
			<tr><td>事业收入</td><td><xsl:value-of select="EG09B/EG09BJ04"/></td></tr>
			<tr><td>预算外资金收入</td><td><xsl:value-of select="EG09B/EG09BJ05"/></td></tr>
			<tr><td>其他收入</td><td><xsl:value-of select="EG09B/EG09BJ06"/></td></tr>
			<tr><td>事业收入小计</td><td><xsl:value-of select="EG09B/EG09BJ07"/></td></tr>
			<tr><td>经营收入</td><td><xsl:value-of select="EG09B/EG09BJ08"/></td></tr>
			<tr><td>经营收入小计</td><td><xsl:value-of select="EG09B/EG09BJ09"/></td></tr>
			<tr><td>拨入专款</td><td><xsl:value-of select="EG09B/EG09BJ10"/></td></tr>
			<tr><td>拨入专款小计</td><td><xsl:value-of select="EG09B/EG09BJ11"/></td></tr>
			<tr><td>收入总计</td><td><xsl:value-of select="EG09B/EG09BJ12"/></td></tr>
			<tr><td>拨出经费</td><td><xsl:value-of select="EG09B/EG09BJ13"/></td></tr>
			<tr><td>上缴上级支出</td><td><xsl:value-of select="EG09B/EG09BJ14"/></td></tr>
			<tr><td>对附属单位补助</td><td><xsl:value-of select="EG09B/EG09BJ15"/></td></tr>
			<tr><td>事业支出</td><td><xsl:value-of select="EG09B/EG09BJ16"/></td></tr>
			<tr><td>财政补助支出</td><td><xsl:value-of select="EG09B/EG09BJ17"/></td></tr>
			<tr><td>预算外资金支出</td><td><xsl:value-of select="EG09B/EG09BJ18"/></td></tr>
			<tr><td>销售税金</td><td><xsl:value-of select="EG09B/EG09BJ19"/></td></tr>
			<tr><td>结转自筹基建</td><td><xsl:value-of select="EG09B/EG09BJ20 "/></td></tr>
			<tr><td>事业支出小计</td><td><xsl:value-of select="EG09B/EG09BJ21"/></td></tr>
			<tr><td>经营支出</td><td><xsl:value-of select="EG09B/EG09BJ22"/></td></tr>
			<tr><td>销售税金</td><td><xsl:value-of select="EG09B/EG09BJ23"/></td></tr>
			<tr><td>经营支出小计</td><td><xsl:value-of select="EG09B/EG09BJ24"/></td></tr>
			<tr><td>拨出专款</td><td><xsl:value-of select="EG09B/EG09BJ25"/></td></tr>
			<tr><td>专款支出</td><td><xsl:value-of select="EG09B/EG09BJ26"/></td></tr>
			<tr><td>专款小计</td><td><xsl:value-of select="EG09B/EG09BJ27"/></td></tr>
			<tr><td>支出总计</td><td><xsl:value-of select="EG09B/EG09BJ28"/></td></tr>
			<tr><td>事业结余</td><td><xsl:value-of select="EG09B/EG09BJ29"/></td></tr>
			<tr><td>正常收入结余</td><td><xsl:value-of select="EG09B/EG09BJ30"/></td></tr>
			<tr><td>收回以前年度事业支出</td><td><xsl:value-of select="EG09B/EG09BJ31"/></td></tr>
			<tr><td>经营结余</td><td><xsl:value-of select="EG09B/EG09BJ32"/></td></tr>
			<tr><td>以前年度经营亏损</td><td><xsl:value-of select="EG09B/EG09BJ33"/></td></tr>
			<tr><td>结余分配</td><td><xsl:value-of select="EG09B/EG09BJ34"/></td></tr>
			<tr><td>应交所得税</td><td><xsl:value-of select="EG09B/EG09BJ35"/></td></tr>
			<tr><td>提取专用基金</td><td><xsl:value-of select="EG09B/EG09BJ36"/></td></tr>
			<tr><td>转入事业基金</td><td><xsl:value-of select="EG09B/EG09BJ37"/></td></tr>
			<tr><td>其他结余分配</td><td><xsl:value-of select="EG09B/EG09BJ38"/></td></tr>
		</table>
		<br/>
		</xsl:for-each>
		<!-- 事业单位收入支出表（2013 版） -->
		<xsl:for-each select="EGA/EG10">
       <div class="t2 f-mgtop">事业单位收入支出表（2013 版）</div>
        <table class="g-tab-bor">
			<tr>
				<td>
					财务报表编号
				</td>
				<td>
					业务管理机构类型
				</td>
				<td>
					业务管理机构代码
				</td>
				<td>
					报表年份
				</td>
				<td>
					报表类型
				</td>
				<td>
					报表类型细分
				</td>
			</tr>
			<tr>
				<td>
					<xsl:value-of select="EG010A/EG010AI01"/>
				</td>
				<td>
					<span name="2021"><xsl:value-of select="EG010A/EG010AD01"/></span>
				</td>
				<td>
					<xsl:value-of select="EG010A/EG010AI02"/>
				</td>
				<td>
					<xsl:value-of select="EG010A/EG010AR01"/>
				</td>
				<td>
					<span name="2063"><xsl:value-of select="EG010A/EG010AD02"/></span>
				</td>
				<td>
					<span name="2064"><xsl:value-of select="EG010A/EG010AD03"/></span>
				</td>
			</tr>
		</table>
        <table class="g-subtab-bor">
			<tr>
				<td>
					项目
				</td>
				<td>
					期末值
				</td>
			</tr>
			<tr><td>本期财政补助结转结余</td><td><xsl:value-of select="EG10B/EG10BJ01"/></td></tr>
			<tr><td>财政补助收入</td><td><xsl:value-of select="EG10B/EG10BJ02"/></td></tr>
			<tr><td>事业支出（财政补助支出）</td><td><xsl:value-of select="EG10B/EG10BJ03"/></td></tr>
			<tr><td>本期事业结转结余</td><td><xsl:value-of select="EG10B/EG10BJ04"/></td></tr>
			<tr><td>事业类收入</td><td><xsl:value-of select="EG10B/EG10BJ05"/></td></tr>
			<tr><td>事业收入</td><td><xsl:value-of select="EG10B/EG10BJ06"/></td></tr>
			<tr><td>上级补助收入</td><td><xsl:value-of select="EG10B/EG10BJ07"/></td></tr>
			<tr><td>附属单位上缴收入</td><td><xsl:value-of select="EG10B/EG10BJ08"/></td></tr>
			<tr><td>其他收入</td><td><xsl:value-of select="EG10B/EG10BJ09"/></td></tr>
			<tr><td>（其他收入科目下）捐赠收入</td><td><xsl:value-of select="EG10B/EG10BJ10"/></td></tr>
			<tr><td>事业类支出</td><td><xsl:value-of select="EG10B/EG10BJ11"/></td></tr>
			<tr><td>事业支出（非财政补助支出）</td><td><xsl:value-of select="EG10B/EG10BJ12"/></td></tr>
			<tr><td>上缴上级支出</td><td><xsl:value-of select="EG10B/EG10BJ13"/></td></tr>
			<tr><td>对附属单位补助支出</td><td><xsl:value-of select="EG10B/EG10BJ14"/></td></tr>
			<tr><td>其他支出</td><td><xsl:value-of select="EG10B/EG10BJ15"/></td></tr>
			<tr><td>本期经营结余</td><td><xsl:value-of select="EG10B/EG10BJ16"/></td></tr>
			<tr><td>经营收入</td><td><xsl:value-of select="EG10B/EG10BJ17"/></td></tr>
			<tr><td>经营支出</td><td><xsl:value-of select="EG10B/EG10BJ18"/></td></tr>
			<tr><td>弥补以前年度亏损后的经营结余</td><td><xsl:value-of select="EG10B/EG10BJ19"/></td></tr>
			<tr><td>本年非财政补助结转结余</td><td><xsl:value-of select="EG10B/EG10BJ20"/></td></tr>
			<tr><td>非财政补助结转</td><td><xsl:value-of select="EG10B/EG10BJ21"/></td></tr>
			<tr><td>本年非财政补助结余</td><td><xsl:value-of select="EG10B/EG10BJ22"/></td></tr>
			<tr><td>应缴企业所得税</td><td><xsl:value-of select="EG10B/EG10BJ23"/></td></tr>
			<tr><td>提取专用基金</td><td><xsl:value-of select="EG10B/EG10BJ24"/></td></tr>
			<tr><td>转入事业基金</td><td><xsl:value-of select="EG10B/EG10BJ25"/></td></tr>
		</table>
		<br/>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
