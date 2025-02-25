<?xml version="1.0" encoding="gb2312"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:user="com.dcits.cq.util.XslUtil" extension-element-prefixes="user">
	<xsl:output method="html" version="1.0" encoding="gb2312"/>
	<xsl:template match="/Document">
		<html>
			<head><title>个人信用报告</title>
				<meta name="robots" content="noindex,nofollow" />
				<meta charset="utf-8" />
				<meta content="IE=edge" http-equiv="X-UA-Compatible" />
				<link rel="shortcut icon" href="favicon.png" />
				<script src="../../../static/reportStyle/jquery.min.js"></script>
				<script src="../../../static/reportStyle/report.js"></script>
				<link rel="stylesheet" href="../../../static/reportStyle/report.css" />
				<meta name="generator" content="mshtml 8.00.7601.18305" />
			</head>
			<body class="m-mainbox" background="../../../static/reportStyle/pbccrc_watermark3.gif">
				<div class="m-repbox">
					<!--logo和提示信息-->
					<div class="m-hd">
						<div class="u-logo">
						<img src="../../../static/reportStyle/logo.gif" />
					</div>
					</div>
						<div class="m-rephead">
						<!-- 报文头信息 -->
						<xsl:apply-templates select="PRH/PA01"/>
					</div>
					  <!-- 设置一级标题变量         -->
					  <!--个人基本信息-->
					<div class="m-repbody">
						<div class="t1">一 个人基本信息</div>
						<!-- （一）身份信息 -->
						<xsl:apply-templates select="PIM/PB01"/>
						<!-- （二）婚姻信息 -->
						<xsl:apply-templates select="PMM/PB02"/>
						<!-- （三）居住信息 -->
						<xsl:apply-templates select="PRM"/>
						<!-- （四）职业信息 -->
						<xsl:apply-templates select="POM"/>
					</div>
						<!-- 二 信息概要 -->
					<div class="m-repbody m-infobox">
						<div class="t1">二 信息概要</div>
						<!-- （一）个人信用报告“数字解读” -->
						<xsl:apply-templates select="PSM/PC01"/>
						<!-- （二）信贷交易信息提示 （三）信贷交易违约信息概要 （四）信贷交易授信及负债信息概要 -->
						<xsl:apply-templates select="PCO/PC02"/>
						<!-- （五）非信贷交易信息概要 -->
						<xsl:apply-templates select="PNO/PC03"/>
						<!-- （六）公共信息概要 -->
						<xsl:apply-templates select="PPO/PC04"/>
						<!-- （七）查询记录概要 -->
						<xsl:apply-templates select="PQO/PC05"/>
					</div>
					<div class="m-repbody">
						<!-- 三 信贷交易信息明细 -->
						<div class="t1">三 信贷交易信息明细</div>
						<!-- （一）被追偿信息（二）非循环贷账户（三）循环额度下分账户（四）循环贷账户（五）贷记卡账户（六）准贷记卡账户  -->
						<xsl:apply-templates select="PDA"/>
						<!-- （七）授信协议信息 -->
						<xsl:apply-templates select="PCA"/>
						<!-- （八）相关还款责任信息 -->
						<xsl:apply-templates select="PCR"/>
					</div>
					<div class="m-repbody">
						<!-- 四 非信贷交易信息明细 -->
						<div class="t1">四 非信贷交易信息明细</div>
						<xsl:apply-templates select="PND"/>
					</div>
					<div class="m-repbody">
						<!-- 五 公共信息明细 -->
						<div class="t1">五 公共信息明细</div>
						<!-- （一）欠税记录 -->
						<xsl:apply-templates select="POT"/>
						<!-- （二）民事判决记录 -->
						<xsl:apply-templates select="PCJ"/>
						<!-- （三）强制执行记录 -->
						<xsl:apply-templates select="PCE"/>
						<!-- （四）行政处罚记录 -->
						<xsl:apply-templates select="PAP"/>
						<!-- （五）住房公积金参缴记录 -->
						<xsl:apply-templates select="PHF"/>
						<!-- （六）低保救助记录 -->
						<xsl:apply-templates select="PBS"/>
						<!-- （七）执业资格记录 -->
						<xsl:apply-templates select="PPQ"/>
						<!-- （八）行政奖励记录 -->
						<xsl:apply-templates select="PAH"/>
					</div>
					<div class="m-repbody">
						<!-- 六 本人声明 -->
						<div class="t1">六 本人声明</div>
						<xsl:apply-templates select="POS"/>
					</div>
					<div class="m-repbody">
						<!-- 七 查询记录 -->
						<div class="t1">七 查询记录</div>
						<xsl:apply-templates select="POQ"/>
						<!-- 报告说明 -->
						<xsl:apply-templates select="PRH"/>
					</div>
				</div>
				<script src="../../js/common/jquery-1.10.2.js"></script><SCRIPT>function printReport(){ javascript:document.execCommand('print');$.ajax({async:false,cache:false,data:{"ID":'a8b7037f48cf4924a2a62b9e048f7d3ea6d2b0c985a540279085e38db3f05163'},url:'../../../PersonReportInquiry/isPrint.do',type:"post" });}</SCRIPT><script>document.oncontextmenu = function(){return false;}</script>
				<form method="POST" action="--WEBBOT-SELF--"> 
				   <p align="center"> 
					<input onMouseOver="msover();" style="border:1px solid #cc9966; FONT-WEIGHT: normal; FONT-SIZE: 10pt; BACKGROUND: #fff6dc; COLOR: #000000; LINE-HEIGHT: normal; FONT-STYLE: normal; HEIGHT: 30; FONT-VARIANT: normal; width:58" onMouseOut="msout();" type="button" name="doPrint" value="打  印" class="button2" onclick="printReport()"/>&#160;&#160;
					<input onMouseOver="msover();" style="border:1px solid #cc9966; FONT-WEIGHT: normal; FONT-SIZE: 10pt; BACKGROUND: #fff6dc; COLOR: #000000; LINE-HEIGHT: normal; FONT-STYLE: normal; HEIGHT: 30; FONT-VARIANT: normal; width:58" onMouseOut="msout();" type="button" name="goBack" value="关  闭" class="button1" onclick="window.location.href=document.referrer;"/> </p> 
				</form>
			</body>
			<script src="../../../static/reportStyle/shuiyin.js"></script>
			<script type="text/javascript">
				var now = getNow();
				watermark({"watermark_txt":"张三提供"+now});
			</script>
		</html>
	</xsl:template>
<!-- 报告说明 -->
	<xsl:template match="PRH">
		<div class="m-repbody">
		<div class="t1">报告说明</div>
		<ul class="u-msg-list">		
			<li>1. 本报告由中国人民银行征信中心出具，依据截至报告时点的个人征信系统记录的信息生成。除查询记录外，其他信息均由相关机构提供，征信中心不保证其真实性和准确性，但承诺在信息汇总、加工、整合的全过程中保持客观、中立的地位。</li>
			<li>2. 本报告中的“数字解读”仅供使用本信用报告的银行等授信机构参考，授信机构应自行承担使用“数字解读”的相关法律责任。</li>
			<li>3.数字解读”将信用报告内容解读为一个数值，是对信用主体未来信贷违约可能性的预测，其取值范围为0到1000，分值越高，违约可能性越低；“相对位置”是信用主体的数字解读值在全部人群中的百分比排序位置，比如“>50%”代表该数字解读值高于50%的信用主体；“说明”中的“影响因素”是影响信用主体获得更高数字解读值的原因，根据当前信用报告的实际情况给出，最多有两条。“数字解读”显示为“--”的，仅代表无法根据当前信用报告内容给出数字解读值，并无其他含义。无法给出数字解读值的具体原因见“说明”。</li>
			<li>4.本报告的信贷交易信息提示中，“业务类型”为“其他”的汇总信息不包含“资产处置”和“垫款”业务。</li>
			<li>5.本报告中如果没有“信贷交易违约信息概要”信息，说明信用主体最近5年内没有连续逾期。</li>
			<li>6.对于存在授信限额的协议信息，信息主体的可用额度需结合“授信协议信息”中的授信额度、授信限额信息和余额进行估算。</li>
			<li>7.本报告中的信贷交易授信及负债信息概要展示的信息是指未结清/未销户的授信及负债信息。</li>
			<li>8.本报告的借贷交易明细信息中，循环贷账户的到期日期是指账户授信额度的到期日期。</li>
			<li>9.本报告的借贷交易明细信息中，借贷账户展示最近5年的还款情况，包括当前还款状态和当前逾期总额。</li>
			<li>10.对于通过自助渠道办理的“小额、高频”业务，金融机构将合并报送相关账户，展示在本报告的借贷交易明细信息中；此时账户的还款方式为“不区分还款方式”，该账户的还款频率统一约定为“月”，“还款期数”按月计算，其还款信息按月进行观测和更新。</li>
			<li>11.本报告中的逾期准贷记卡账户是指该账户60天以上的透支行为。</li>
			<li>12.本报告中的还款期数为“--”是指该账户是非分期还款。</li>
			<li>13.本报告不展示5年前已经结束的违约行为，以及5年前的欠税记录、强制执行记录、民事判决记录、行政处罚记录、电信欠费记录。</li>
			<li>14.机构说明是数据提供机构对具体业务添加的特别说明信息。</li>
			<li>15.本人声明是信息主体对信用报告中的信息所附注的简要说明，信用主体对本人声明的真实性负责。</li>
			<li>16.异议标注是征信中心添加的，用于说明信用主体对信用报告中的哪些信息有异议。</li>
			<li>17.本报告内容涉及个人隐私，查询者应依法使用、妥善保管。因使用不当造成个人信息泄露的，征信中心将不承担相关责任。</li>
			<li>18.本报告中所有金额（除“有相关还款责任的企业借款”中的金额外）均为人民币金额，参照查询日前一天的汇率。</li>
			<li>19.本报告整合了数据提供机构以信息主体不同证件报送的信息。</li>
		</ul></div>
	</xsl:template>
<!-- 报文头信息 -->
	<xsl:template match="PRH/PA01">
		<div class="m-reptitle">
          <h1 class="u-repname">个人信用报告</h1>
          <h3 class="u-repver">（机构版）</h3>
        </div>
		<table class="g-tab-bor">
          <tbody>
            <tr>
              <td style="TEXT-ALIGN: left; WIDTH: 60%" colspan="3">报告编号：<xsl:value-of select="PA01A/PA01AI01"/></td>
              <td style="TEXT-ALIGN: right; WIDTH: 40%" colspan="2">报告时间：<xsl:value-of select="PA01A/PA01AR01"/></td>
            </tr>
            <tr>
              <th style="WIDTH: 20%">被查询者姓名</th>
              <th style="WIDTH: 20%">被查询者证件类型</th>
              <th style="WIDTH: 20%">被查询者证件号码</th>
              <th style="WIDTH: 20%">查询机构</th>
              <th style="WIDTH: 20%">查询原因</th>
            </tr>
            <tr>
              <td><xsl:value-of select="PA01B/PA01BQ01"/></td>
              <td><span name="3005"><xsl:value-of select="PA01B/PA01BD01"/></span></td>
              <td><xsl:value-of select="PA01B/PA01BI01"/></td>
              <td><xsl:value-of select="PA01B/PA01BI02"/></td>
              <td><span name="1054"><xsl:value-of select="PA01B/PA01BD02"/></span></td>
            </tr>
          </tbody>
        </table>
		<xsl:if test="PA01C != ''">
			<div class="t2 f-mgtop">其他证件信息（证件个数：<xsl:value-of select="PA01C/PA01CS01"/>）</div>
			<table class="g-tab-bor">
			  <tbody>
				<tr>
				  <th style="WIDTH: 50%">证件类型</th>
				  <th style="WIDTH: 50%">证件号码</th>
				</tr>
				<xsl:for-each select="PA01C/PA01CH">
					<tr>
					  <td><span name="3005"><xsl:value-of select="PA01CD01"/></span></td>
					  <td><xsl:value-of select="PA01CI01"/></td>
					</tr>
				</xsl:for-each>
			  </tbody>
			</table>
		</xsl:if>
		<xsl:if test="PA01D/PA01DQ01 = '1'">
			<div class="t2 f-mgtop">防欺诈警示</div>
			<table class="g-tab-bor">
			  <tbody>
				<tr>
				  <th style="WIDTH: 25%">防欺诈警示标志</th>
				  <th style="WIDTH: 25%">防欺诈警示联系电话</th>
				  <th style="WIDTH: 25%">防欺诈警示生效日期</th>
				  <th style="WIDTH: 25%">防欺诈警示截止日期</th>
				</tr>
				<xsl:for-each select="PA01C/PA01CH">
					<tr>
					  <td><span name="3006"><xsl:value-of select="PA01D/PA01DQ01"/></span></td>
					  <td><xsl:value-of select="PA01D/PA01DQ02"/></td>
					  <td><xsl:value-of select="PA01D/PA01DR01"/></td>
					  <td><xsl:value-of select="PA01D/PA01DR02"/></td>
					</tr>
				</xsl:for-each>
			  </tbody>
			</table>
		</xsl:if>
		<xsl:if test="PA01E/PA01ES01 != 0">
			<div class="t2 f-mgtop">异议信息提示</div>
			<table class="g-tab-bor">
			  <tbody>
				<tr>
				  <th class="t2-2">异议标注数目</th>
				</tr>
				<tr>
				  <td><xsl:value-of select="PA01E/PA01ES01"/></td>
				</tr>
			  </tbody>
			</table>
		</xsl:if>
	</xsl:template>
<!-- 一 个人基本信息 -->
	<!-- （一）身份信息 -->
	<xsl:template match="PIM/PB01">
		<div class="t2 f-mgtop">（一）身份信息</div>
		<table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-8">性别</th>
              <th class="g-w-8">出生日期</th>
              <th class="g-w-8">婚姻状况</th>
              <th class="g-w-8">学历</th>
              <th class="g-w-8">学位</th>
              <th class="g-w-8">就业状况</th>
              <th class="g-w-8">国籍</th>
              <th class="g-w-8">电子邮箱</th>
            </tr>
            <tr>
              <td><span name="1002"><xsl:value-of select="PB01A/PB01AD01"/></span></td>
              <td><xsl:value-of select="PB01A/PB01AR01"/></td>
              <td><span name="1008"><xsl:value-of select="../../PMM/PB02/PB020D01"/></span></td>
              <td><span name="1005"><xsl:value-of select="PB01A/PB01AD02"/></span></td>
              <td><span name="1006"><xsl:value-of select="PB01A/PB01AD03"/></span></td>
              <td><span name="1007"><xsl:value-of select="PB01A/PB01AD04"/></span></td>
              <td><span name="3001"><xsl:value-of select="PB01A/PB01AD05"/></span></td>
              <td><xsl:value-of select="PB01A/PB01AQ01"/></td>
            </tr>
          </tbody>
        </table>
		<table class="g-subtab-bor">
          <!--抵消上边框-->
          <tbody>
            <tr>
              <th class="g-w-2">通讯地址</th>
              <th class="g-w-2">户籍地址</th>
            </tr>
            <tr>
              <td><xsl:value-of select="PB01A/PB01AQ02"/></td>
              <td><xsl:value-of select="PB01A/PB01AQ03"/></td>
            </tr>
          </tbody>
        </table>
		<table class="g-subtab-bor">
          <tbody>
            <tr>
              <th style="WIDTH: 6%">编号</th>
              <th style="WIDTH: 47%">手机号码</th>
              <th style="WIDTH: 47%">信息更新日期</th>
            </tr>
			<xsl:for-each select="PB01B/PB01BH">
				<tr>
				  <td><xsl:number value="position()"/></td>
				  <td><xsl:value-of select="PB01BQ01"/></td>
				  <td><xsl:value-of select="PB01BR01"/></td>
				</tr>
			</xsl:for-each>
          </tbody>
        </table>
	</xsl:template>
	<!-- （二）婚姻信息 -->
	<xsl:template match="PMM/PB02">
		<div class="t2 f-mgtop">（二）配偶信息</div>
		 <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-5">姓名</th>
              <th class="g-w-5">证件类型</th>
              <th class="g-w-5">证件号码</th>
              <th class="g-w-5">工作单位</th>
              <th class="g-w-5">联系电话</th>
            </tr>
            <tr>
              <td><xsl:value-of select="PB020Q01"/></td>
              <td><span name="3005"><xsl:value-of select="PB020D02"/></span></td>
              <td><xsl:value-of select="PB020I01"/></td>
              <td><xsl:value-of select="PB020Q02"/></td>
              <td><xsl:value-of select="PB020Q03"/></td>
            </tr>
          </tbody>
        </table>
	</xsl:template>
	<!-- （三）居住信息 -->
	<xsl:template match="PRM">
		<div class="t2 f-mgtop">（三）居住信息</div>
		 <table class="g-tab-bor f-tab-nomargin">
		 <tbody>
            <tr>
              <th style="WIDTH: 6%">编号</th>
              <th style="WIDTH: 46%">居住地址</th>
              <th style="WIDTH: 16%">住宅电话</th>
              <th style="WIDTH: 16%">居住状况</th>
              <th style="WIDTH: 16%">信息更新日期</th>
            </tr>
			<xsl:for-each select="PB03">
				<tr>
				  <td><xsl:number value="position()"/></td>
				  <td><xsl:value-of select="PB030Q01"/></td>
				  <td><xsl:value-of select="PB030Q02"/></td>
				  <td><span name="1009"><xsl:value-of select="PB030D01"/></span></td>
				  <td><xsl:value-of select="PB030R01"/></td>
				</tr>
			</xsl:for-each>
          </tbody>
        </table>
	</xsl:template>
	<!-- （四）职业信息 -->
	<xsl:template match="POM">
		<div class="t2 f-mgtop">（四）职业信息</div>
		<table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th style="WIDTH: 6%">编号</th>
              <th style="WIDTH: 15%">就业状况</th>
              <th style="WIDTH: 18%">工作单位</th>
              <th style="WIDTH: 12%">单位性质</th>
              <th style="WIDTH: 33%">单位地址</th>
              <th style="WIDTH: 16%">单位电话</th>
            </tr>
			<xsl:for-each select="PB04">
            <tr>
              <td><xsl:number value="position()"/></td>
              <td><span name="1007"><xsl:value-of select="PB040D01"/></span></td>
              <td><xsl:value-of select="PB040Q01"/></td>
              <td><span name="1010"><xsl:value-of select="PB040D02"/></span></td>
              <td><xsl:value-of select="PB040Q02"/></td>
              <td><xsl:value-of select="PB040Q03"/></td>
            </tr>
			</xsl:for-each>
          </tbody>
        </table>
		<table class="g-subtab-bor">
          <!--抵消上边框-->
          <tbody>
            <tr>
              <th style="WIDTH: 6%">编号</th>
              <th style="WIDTH: 18%">职业</th>
              <th style="WIDTH: 28%">行业</th>
              <th style="WIDTH: 10%">职务</th>
              <th style="WIDTH: 6%">职称</th>
              <th style="WIDTH: 15%">进入本单位年份</th>
              <th style="WIDTH: 15%">信息更新日期</th>
            </tr>
			<xsl:for-each select="PB04">
				<tr>
				  <td><xsl:number value="position()"/></td>
				  <td><span name="1012"><xsl:value-of select="PB040D04"/></span></td>
				  <td><span name="1011"><xsl:value-of select="PB040D03"/></span></td>
				  <td><span name="1013"><xsl:value-of select="PB040D05"/></span></td>
				  <td><span name="1014"><xsl:value-of select="PB040D06"/></span></td>
				  <td><xsl:value-of select="PB040R01"/></td>
				  <td><xsl:value-of select="PB040R02"/></td>
				</tr>
			</xsl:for-each>
          </tbody>
        </table>
	</xsl:template>
<!-- 二 信息概要 -->
	<!-- （一）个人信用报告“数字解读” -->
	<xsl:template match="PSM/PC01">
		<div class="t2 f-mgtop">数字解读</div>
		<table class="g-subtab-bor">
          <!--抵消上边框-->
          <tbody>
            <tr>
              <th class="g-w-4">数字解读</th>
              <th class="g-w-4">相对位置</th>
              <th class="g-w-4">分数说明条数</th>
              <th class="g-w-4">说明</th>
            </tr>
            <tr>
              <td rowspan="2"><xsl:value-of select="PC010Q01"/></td>
              <td rowspan="2"><xsl:value-of select="PC010Q02"/></td>
              <td rowspan="2"><xsl:value-of select="PC010S01"/></td>
              <td><span name="1015"><xsl:value-of select="PC010D01"/></span></td>
            </tr>
			<xsl:if test="PC010S01 = 2">
				<xsl:for-each select="PC010D01">
					<xsl:if test="position()=2">
						<tr><td><span name="1015"><xsl:value-of select="text()"/></span></td></tr>
					</xsl:if>
				 </xsl:for-each>
			 </xsl:if>
          </tbody>
        </table>
	</xsl:template>
	<!-- （二）信贷交易信息提示 （三）信贷交易违约信息概要 （四）信贷交易授信及负债信息概要 -->
	<xsl:template match="PCO/PC02">
		<div class="t2 f-mgtop">（二）信贷交易信息提示</div>
		<table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-4">业务类型</th>
              <th class="g-w-4">业务类型</th>
              <th class="g-w-4">账户数</th>
              <th class="g-w-4">首笔业务发放月份</th>
            </tr>
			<xsl:for-each select="PC02A/PC02AH">
				<tr>
					<td><span name="1004"><xsl:value-of select="PC02AD02"/></span></td>
					<td><span name="1003"><xsl:value-of select="PC02AD01"/></span></td>
					<td><xsl:value-of select="PC02AS03"/></td>
					<td><xsl:value-of select="PC02AR01"/></td>
				</tr>
			</xsl:for-each>
			<tr>
              <th colspan="2">合计</th>
              <td><xsl:value-of select="PC02A/PC02AS01"/></td>
              <td>-</td>
            </tr>
          </tbody>
        </table>
		<div class="t2 f-mgtop">（三）信贷交易违约信息概要</div>
		<table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="t2-2" colspan="3">被追偿信息汇总</th>
            </tr>
            <tr>
              <th class="g-w-3">账户类型</th>
              <th class="g-w-3">业务类型</th>
              <th class="g-w-3">余额</th>
            </tr>
			<xsl:for-each select="PC02B/PC02BH">
				<tr>
					<td><span name="1016"><xsl:value-of select="PC02BD01"/></span></td>
					<td><xsl:value-of select="PC02BS03"/></td>
					<td><xsl:value-of select="PC02BJ02"/></td>
				</tr>
			</xsl:for-each>
            <tr>
              <th>合计</th>
              <td><xsl:value-of select="PC02B/PC02BS02"/></td>
              <td><xsl:value-of select="PC02B/PC02BJ01"/></td>
            </tr>
          </tbody>
        </table>
		<table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="t2-2" colspan="3">呆账信息汇总</th>
            </tr>
            <tr>
              <th class="g-w-2">账户数</th>
              <th class="g-w-2">余额</th>
            </tr>
            <tr>
              <td><xsl:value-of select="PC02C/PC02CS01"/></td>
              <td><xsl:value-of select="PC02C/PC02CJ01"/></td>
            </tr>
          </tbody>
        </table>
		<table class="g-tab-bor f-tab-nomargin">
			<tbody>
				<tr>
				  <th class="t2-2" colspan="5">逾期（透支）信息汇总</th>
				</tr>
				<tr>
				  <th class="g-w-5">账户类型</th>
				  <th class="g-w-5">账户数</th>
				  <th class="g-w-5">月份数</th>
				  <th class="g-w-5">单月最高逾期/透支总额</th>
				  <th class="g-w-5">最长逾期/透支月数</th>
				</tr>
				<xsl:for-each select="PC02D/PC02DH">
					<tr>
						<td><span name="1017"><xsl:value-of select="PC02DD01"/></span></td>
						<td><xsl:value-of select="PC02DS02"/></td>
						<td><xsl:value-of select="PC02DS03"/></td>
						<td><xsl:value-of select="PC02DJ01"/></td>
						<td><xsl:value-of select="PC02DS04"/></td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
		<div class="t2 f-mgtop">（四）信贷交易授信及负债信息概要</div>
		<table class="g-tab-bor f-tab-nomargin">
			<tbody>
				<tr>
				  <th class="t2-2" colspan="5">非循环贷账户信息汇总</th>
				</tr>
				<tr>
				  <th class="g-w-5">管理机构数</th>
				  <th class="g-w-5">账户数</th>
				  <th class="g-w-5">授信总额</th>
				  <th class="g-w-5">余额</th>
				  <th class="g-w-5">最近6个月平均应还款</th>
				</tr>
				<tr>
				  <td><xsl:value-of select="PC02E/PC02ES01"/></td>
				  <td><xsl:value-of select="PC02E/PC02ES02"/></td>
				  <td><xsl:value-of select="PC02E/PC02EJ01"/></td>
				  <td><xsl:value-of select="PC02E/PC02EJ02"/></td>
				  <td><xsl:value-of select="PC02E/PC02EJ03"/></td>
				</tr>
			</tbody>
		</table>
		<table class="g-tab-bor f-tab-nomargin">
			<tbody>
				<tr>
				  <th class="t2-2" colspan="5">循环额度下分账户汇总信息</th>
				</tr>
				<tr>
				  <th class="g-w-5">管理机构数</th>
				  <th class="g-w-5">账户数</th>
				  <th class="g-w-5">授信总额</th>
				  <th class="g-w-5">余额</th>
				  <th class="g-w-5">最近6个月平均应还款</th>
				</tr>
				<tr>
				  <td><xsl:value-of select="PC02F/PC02FS01"/></td>
				  <td><xsl:value-of select="PC02F/PC02FS02"/></td>
				  <td><xsl:value-of select="PC02F/PC02FJ01"/></td>
				  <td><xsl:value-of select="PC02F/PC02FJ02"/></td>
				  <td><xsl:value-of select="PC02F/PC02FJ03"/></td>
				</tr>
			</tbody>
		</table>
		<table class="g-tab-bor f-tab-nomargin">
			<tbody>
				<tr>
				  <th class="t2-2" colspan="5">循环贷账户汇总信息</th>
				</tr>
				<tr>
				  <th class="g-w-5">管理机构数</th>
				  <th class="g-w-5">账户数</th>
				  <th class="g-w-5">授信总额</th>
				  <th class="g-w-5">余额</th>
				  <th class="g-w-5">最近6个月平均应还款</th>
				</tr>
				<tr>
				  <td><xsl:value-of select="PC02G/PC02GS01"/></td>
				  <td><xsl:value-of select="PC02G/PC02GS02"/></td>
				  <td><xsl:value-of select="PC02G/PC02GJ01"/></td>
				  <td><xsl:value-of select="PC02G/PC02GJ02"/></td>
				  <td><xsl:value-of select="PC02G/PC02GJ03"/></td>
				</tr>
			</tbody>
		</table>
		<table class="g-tab-bor f-tab-nomargin">
			<tbody>
				<tr>
				  <th class="t2-2" colspan="7">贷记卡账户信息汇总</th>
				</tr>
				<tr>
				  <th class="g-w-7">发卡机构数</th>
				  <th class="g-w-7">账户数</th>
				  <th class="g-w-7">授信总额</th>
				  <th class="g-w-7">单家机构
				  <br />最高授信额</th>
				  <th class="g-w-7">单家机构
				  <br />最低授信额</th>
				  <th class="g-w-7">已用额度</th>
				  <th class="g-w-7">最近6个月
				  <br />平均使用额度</th>
				</tr>
				 <tr>
				  <td><xsl:value-of select="PC02H/PC02HS01"/></td>
				  <td><xsl:value-of select="PC02H/PC02HS02"/></td>
				  <td><xsl:value-of select="PC02H/PC02HJ01"/></td>
				  <td><xsl:value-of select="PC02H/PC02HJ02"/></td>
				  <td><xsl:value-of select="PC02H/PC02HJ03"/></td>
				  <td><xsl:value-of select="PC02H/PC02HJ04"/></td>
				  <td><xsl:value-of select="PC02H/PC02HJ05"/></td>
				</tr>
			</tbody>
		</table>
		
		<table class="g-tab-bor f-tab-nomargin">
			<tbody>
				<tr>
				  <th class="t2-2" colspan="7">准贷记卡账户信息汇总</th>
				</tr>
				<tr>
				  <th class="g-w-7">发卡机构数</th>
				  <th class="g-w-7">账户数</th>
				  <th class="g-w-7">授信总额</th>
				  <th class="g-w-7">单家机构
				  <br />最高授信额</th>
				  <th class="g-w-7">单家机构
				  <br />最低授信额</th>
				  <th class="g-w-7">透支余额</th>
				  <th class="g-w-7">最近6个月
				  <br />平均使用额度</th>
				</tr>
				 <tr>
				  <td><xsl:value-of select="PC02I/PC02IS01"/></td>
				  <td><xsl:value-of select="PC02I/PC02IS02"/></td>
				  <td><xsl:value-of select="PC02I/PC02IJ01"/></td>
				  <td><xsl:value-of select="PC02I/PC02IJ02"/></td>
				  <td><xsl:value-of select="PC02I/PC02IJ03"/></td>
				  <td><xsl:value-of select="PC02I/PC02IJ04"/></td>
				  <td><xsl:value-of select="PC02I/PC02IJ05"/></td>
				</tr>
			</tbody>
		</table>
		<xsl:if test="PC02K != ''">
			<table class="g-tab-bor f-tab-nomargin">
				<tbody>
					<tr>
					  <th class="t2-2" colspan="5">相关还款责任信息汇总</th>
					</tr>
					<tr>
					  <th class="g-w-5">借款人身份类别</th>
					  <th class="g-w-5">还款责任类型</th>
					  <th class="g-w-5">账户数</th>
					  <th class="g-w-5">还款责任金额</th>
					  <th class="g-w-5">余额</th>
					</tr>
					<xsl:for-each select="PC02K/PC02KH">
						<tr>
						  <td><span name="3004"><xsl:value-of select="PC02KD01"/></span></td>
						  <td><span name="1019"><xsl:value-of select="PC02KD02"/></span></td>
						  <td><xsl:value-of select="PC02KS02"/></td>
						  <td><xsl:value-of select="PC02KJ01"/></td>
						  <td><xsl:value-of select="PC02KJ02"/></td>
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- （五）非信贷交易信息概要 -->
	<xsl:template match="PNO/PC03">
		<div class="t2 f-mgtop">（五）非信贷交易信息概要</div>
		<table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="t2-2" colspan="7">后付费业务欠费信息汇总</th>
            </tr>
            <tr>
              <th class="g-w-3">后付费业务类型</th>
              <th class="g-w-3">欠费账户数</th>
              <th class="g-w-3">欠费金额</th>
            </tr>
			<xsl:for-each select="PC030H">
				<tr>
				  <td><span name="1055"><xsl:value-of select="PC030D01"/></span></td>
				  <td><xsl:value-of select="PC030S02"/></td>
				  <td><xsl:value-of select="PC030J01"/></td>
				</tr>
			</xsl:for-each>
          </tbody>
        </table>
	</xsl:template>
	<!-- （六）公共信息概要 -->
	<xsl:template match="PPO/PC04">
		<div class="t2 f-mgtop">（六）公共信息概要</div>
		<table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-3">公共信息类型</th>
              <th class="g-w-3">记录数</th>
              <th class="g-w-3">涉及金额</th>
            </tr>
			<xsl:for-each select="PC040H">
				<tr>
				  <td><span name="1020"><xsl:value-of select="PC040D01"/></span></td>
				  <td><xsl:value-of select="PC040S02"/></td>
				  <td><xsl:value-of select="PC040J01"/></td>
				</tr>
			</xsl:for-each>
          </tbody>
        </table>
	</xsl:template>
	<!-- （七）查询记录概要 -->
	<xsl:template match="PQO/PC05">
		<div class="t2 f-mgtop">（七）查询记录概要</div>
		<xsl:if test="PC05A != ''">
			 <table class="g-tab-bor f-tab-nomargin">
			  <tbody>
				<tr>
				  <th colspan="4">上一次查询记录</th>
				</tr>
				<tr>
				  <th class="g-w-4">上一次查询日期</th>
				  <th class="g-w-4">上一次查询机构类型</th>
				  <th class="g-w-4">上一次查询机构代码</th>
				  <th class="g-w-4">上一次查询原因</th>
				</tr>
				<tr>
				  <td><xsl:value-of select="PC05A/PC05AR01"/></td>
				  <td><span name="1021"><xsl:value-of select="PC05A/PC05AD01"/></span></td>
				  <td><xsl:value-of select="PC05A/PC05AI01"/></td>
				  <td><span name="1054"><xsl:value-of select="PC05A/PC05AQ01"/></span></td>
				</tr>
			  </tbody>
			</table>
		</xsl:if>
		<table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-3" colspan="2">最近1个月内的查询机构数</th>
              <th class="g-w-3" colspan="3">最近1个月内的查询次数</th>
              <th class="g-w-3" colspan="3">最近2年内的查询次数</th>
            </tr>
            <tr>
              <td class="g-w-8">贷款审批</td>
              <td class="g-w-8">信用卡审批</td>
              <td class="g-w-8">贷款审批</td>
              <td class="g-w-8">信用卡
              <br />审批</td>
              <td class="g-w-8">本人查询</td>
              <td class="g-w-8">贷后管理</td>
              <td class="g-w-8">担保资格
              <br />审查</td>
              <td class="g-w-8">特约商户
              <br />实名审查</td>
            </tr>
            <tr>
              <td><xsl:value-of select="PC05B/PC05BS01"/></td>
              <td><xsl:value-of select="PC05B/PC05BS02"/></td>
              <td><xsl:value-of select="PC05B/PC05BS03"/></td>
              <td><xsl:value-of select="PC05B/PC05BS04"/></td>
              <td><xsl:value-of select="PC05B/PC05BS05"/></td>
              <td><xsl:value-of select="PC05B/PC05BS06"/></td>
              <td><xsl:value-of select="PC05B/PC05BS07"/></td>
              <td><xsl:value-of select="PC05B/PC05BS08"/></td>
            </tr>
          </tbody>
        </table>
	</xsl:template>
<!-- 三 信贷交易信息明细 -->
	<!-- （一）被追偿信息C1（二）非循环贷账户D1（三）循环额度下分账户R4（四）循环贷账户R1（五）贷记卡账户R2（六）准贷记卡账户R3  -->
	<xsl:template match="PDA">
		<div class="t2 f-mgtop">（一）催收账户</div>
		<xsl:for-each select="PD01[PD01A/PD01AD01 = 'C1']">
		<div class="tnt f-tleft f-mgtop">账户<xsl:number value="position()"/></div> 
			<table class="g-tab-bor f-tab-nomargin">
			  <tbody>
				<tr>
				  <th colspan="10">基本信息</th>
				</tr>
				<tr>
				  <th class="g-w-10">账户编号</th>
				  <th class="g-w-10">业务管理机构类型</th>
				  <th class="g-w-10">业务管理机构代码</th>
				  <th class="g-w-10">账户标识</th>
				  <th class="g-w-10">授信协议编号</th>
				  <th class="g-w-10">业务种类</th>
				  <th class="g-w-10">开立日期</th>
				  <th class="g-w-10">币种</th>
				  <th class="g-w-10">借款金额</th>
				  <th class="g-w-10">账户授信额度</th>
				</tr>
				<tr>
				  <td><xsl:value-of select="PD01A/PD01AI01"/></td>
				  <td><span name="1021"><xsl:value-of select="PD01A/PD01AD02"/></span></td>
				  <td><xsl:value-of select="PD01A/PD01AI02"/></td>
				  <td><xsl:value-of select="PD01A/PD01AI03"/></td>
				  <td><xsl:value-of select="PD01A/PD01AI04"/></td>
				  <td><span name="1023"><xsl:value-of select="PD01A/PD01AD03"/></span></td>
				  <td><xsl:value-of select="PD01A/PD01AR01"/></td>
				  <td><span name="3003"><xsl:value-of select="PD01A/PD01AD04"/></span></td>
				  <td><xsl:value-of select="PD01A/PD01AJ01"/></td>
				  <td><xsl:value-of select="PD01A/PD01AJ02"/></td>
				</tr>
				<tr>
				  <th>共享授信额度</th>
				  <th>到期日期</th>
				  <th>还款方式</th>
				  <th>还款频率</th>
				  <th>还款期数</th>
				  <th>担保方式</th>
				  <th>贷款发放形式</th>
				  <th>共同借款标志</th>
				  <th colspan="2">债权转移时的还款状态</th>
				</tr>
				<tr>
				  <td><xsl:value-of select="PD01A/PD01AJ03"/></td>
				  <td><xsl:value-of select="PD01A/PD01AR02"/></td>
				  <td><span name="1024"><xsl:value-of select="PD01A/PD01AD05"/></span></td>
				  <td><span name="1025"><xsl:value-of select="PD01A/PD01AD06"/></span></td>
				  <td><xsl:value-of select="PD01A/PD01AS01"/></td>
				  <td><span name="1026"><xsl:value-of select="PD01A/PD01AD07"/></span></td>
				  <td><span name="1027"><xsl:value-of select="PD01A/PD01AD08"/></span></td>
				  <td><span name="1028"><xsl:value-of select="PD01A/PD01AD09"/></span></td>
				  <td colspan="2"><span name="1029"><xsl:value-of select="PD01A/PD01AD10"/></span></td>
				</tr>
			  </tbody>
			</table>
			<table class="g-tab-bor f-tab-nomargin">
			  <tbody>
				<tr>
				  <th colspan="9">最新表现信息</th>
				</tr>
				<tr>
				  <th class="g-w-9">账户状态</th>
				  <th class="g-w-9">关闭日期</th>
				  <th class="g-w-9">转出月份</th>
				  <th class="g-w-9">余额</th>
				  <th class="g-w-9">最近一次还款日期</th>
				  <th class="g-w-9">最近一次还款金额</th>
				  <th class="g-w-9">五级分类</th>
				  <th class="g-w-9">还款状态</th>
				  <th class="g-w-9">信息报告日期</th>
				</tr>
				<tr>
				  <td><span name="1034"><xsl:value-of select="PD01B/PD01BD01"/></span></td>
				  <td><xsl:value-of select="PD01B/PD01BR01"/></td>
				  <td><xsl:value-of select="PD01B/PD01BR04"/></td>
				  <td><xsl:value-of select="PD01B/PD01BJ01"/></td>
				  <td><xsl:value-of select="PD01B/PD01BR02"/></td>
				  <td><xsl:value-of select="PD01B/PD01BJ02"/></td>
				  <td><span name="1035"><xsl:value-of select="PD01B/PD01BD03"/></span></td>
				  <td><xsl:value-of select="PD01B/PD01BD04"/></td>
				  <td><xsl:value-of select="PD01B/PD01BR03"/></td>
				</tr>
			  </tbody>
			</table>
			<xsl:if test="PD01C/PD01CR01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
				  <tbody>
					<tr>
					  <th colspan="12">最近一次月度表现</th>
					</tr>
					<tr>
					  <th class="g-w-12">月份</th>
					  <th class="g-w-12">账户状态</th>
					  <th class="g-w-12">余额</th>
					  <th class="g-w-12">已用额度</th>
					  <th class="g-w-12">未出单的大额专项分期余额</th>
					  <th class="g-w-12">五级分类</th>
					  <th class="g-w-12">剩余还款期数</th>
					  <th class="g-w-12">结算/应还款日</th>
					  <th class="g-w-12">本月应还款</th>
					  <th class="g-w-12">本月实还款</th>
					  <th class="g-w-12">最近一次还款日期</th>
					  <th class="g-w-12">当前逾期期数</th>
					</tr>
					<tr>
					  <td><xsl:value-of select="PD01C/PD01CR01"/></td>
					  <td><span name="1034"><xsl:value-of select="PD01C/PD01CD01"/></span></td>
					  <td><xsl:value-of select="PD01C/PD01CJ01"/></td>
					  <td><xsl:value-of select="PD01C/PD01CJ02"/></td>
					  <td><xsl:value-of select="PD01C/PD01CJ03"/></td>
					  <td><span name="1035"><xsl:value-of select="PD01C/PD01CD02"/></span></td>
					  <td><xsl:value-of select="PD01C/PD01CS01"/></td>
					  <td><xsl:value-of select="PD01C/PD01CR02"/></td>
					  <td><xsl:value-of select="PD01C/PD01CJ04"/></td>
					  <td><xsl:value-of select="PD01C/PD01CJ05"/></td>
					  <td><xsl:value-of select="PD01C/PD01CR03"/></td>
					  <td><xsl:value-of select="PD01C/PD01CS02"/></td>
					</tr>
					<tr>
					  <th>当前逾期总额</th>
					  <th>逾期 31—60 天未还本金</th>
					  <th>逾期 61－90 天未还本金</th>
					  <th>逾期 91－180 天未还本金</th>
					  <th>逾期 180 天以上未还本金</th>
					  <th>透支 180 天以上未付余额</th>
					  <th>最近 6 个月平均使用额度</th>
					  <th>最近 6 个月平均透支余额</th>
					  <th>最大使用额度</th>
					  <th>最大透支余额</th>
					  <th colspan="2">信息报告日期</th>
					</tr>
					<tr>
						<td><xsl:value-of select="PD01C/PD01CJ06"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ07"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ08"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ09"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ10"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ11"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ12"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ13"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ14"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ15"/></td>
						<td colspan="2"><xsl:value-of select="PD01C/PD01CR04"/></td>
					</tr>
				  </tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01D/PD01DR01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="13">最近 24 个月还款状态</th>
						</tr>
						<tr>
							<th class="g-w-13"></th>
							<th class="g-w-13">1</th>
							<th class="g-w-13">2</th>
							<th class="g-w-13">3</th>
							<th class="g-w-13">4</th>
							<th class="g-w-13">5</th>
							<th class="g-w-13">6</th>
							<th class="g-w-13">7</th>
							<th class="g-w-13">8</th>
							<th class="g-w-13">9</th>
							<th class="g-w-13">10</th>
							<th class="g-w-13">11</th>
							<th class="g-w-13">12</th>
						</tr>
						<xsl:variable name="v1" select ="substring(PD01D/PD01DR02,1,4)"/> <!--截止年月-->
						<xsl:variable name="v2" select ="substring(PD01D/PD01DR01,1,4)"/> <!--起始年月-->
						<tr>
							<td><xsl:value-of select="number($v1)"/></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-01')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-02')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-03')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-04')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-05')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-06')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-07')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-08')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-09')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-10')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-11')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-12')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
						</tr>
						<xsl:if test="number($v1)-number($v2)>0">
							<xsl:variable name="v3" select ="string(number($v1)-1)"/>
							<tr>
								<td><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-01')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-02')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-03')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-04')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-05')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-06')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-07')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-08')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-09')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-10')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-11')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-12')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)=2">
							<xsl:variable name="v3" select ="string(number($v1)-2)"/>
							<tr>
								<td><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-01')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-02')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-03')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-04')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-05')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-06')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-07')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-08')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-09')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-10')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-11')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-12')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01E/PD01ER01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="13">最近 5 年内的历史表现</th>
						</tr>
						<tr>
							<th class="g-w-13"></th>
							<th class="g-w-13">1</th>
							<th class="g-w-13">2</th>
							<th class="g-w-13">3</th>
							<th class="g-w-13">4</th>
							<th class="g-w-13">5</th>
							<th class="g-w-13">6</th>
							<th class="g-w-13">7</th>
							<th class="g-w-13">8</th>
							<th class="g-w-13">9</th>
							<th class="g-w-13">10</th>
							<th class="g-w-13">11</th>
							<th class="g-w-13">12</th>
						</tr>
						<xsl:variable name="v1" select ="substring(PD01E/PD01ER02,1,4)"/> <!--截止年月-->
						<xsl:variable name="v2" select ="substring(PD01E/PD01ER01,1,4)"/> <!--起始年月-->
						<tr>
							<td rowspan="2"><xsl:value-of select="$v1"/></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
						</tr>
						<tr>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
						</tr>
						<xsl:if test="number($v1)-number($v2)>0">
							<xsl:variable name="v3" select ="string(number($v1)-1)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)>1">
							<xsl:variable name="v3" select ="string(number($v1)-2)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)>2">
							<xsl:variable name="v3" select ="string(number($v1)-3)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)>3">
							<xsl:variable name="v3" select ="string(number($v1)-4)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)>4">
							<xsl:variable name="v3" select ="string(number($v1)-5)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01F/PD01FS01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="8">特殊交易信息</th>
						</tr>
						<tr>
							<th class="g-w-5">特殊交易类型</th>
							<th class="g-w-5">特殊交易发生日期</th>
							<th class="g-w-5">到期日期变更月数</th>
							<th class="g-w-5">特殊交易发生金额</th>
							<th class="g-w-5">特殊交易明细记录</th>
						</tr>
						<xsl:for-each select="PD01F/PD01FH">
							<tr>
								<td><span name="1040"><xsl:value-of select="PD01FD01"/></span></td>
								<td><xsl:value-of select="PD01FR01"/></td>
								<td><xsl:value-of select="PD01FS02"/></td>
								<td><xsl:value-of select="PD01FJ01"/></td>
								<td><xsl:value-of select="PD01FQ01"/></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01G/PD01GS01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="2">特殊事件说明</th>
						</tr>
						<tr>
							<th class="g-w-2">特殊事件发生月份</th>
							<th class="g-w-2">特殊事件类型</th>
						</tr>
						<xsl:for-each select="PD01G/PD01GH">
							<tr>
								<td><xsl:value-of select="PD01GR01"/></td>
								<td><span name="1056"><xsl:value-of select="PD01GD01"/></span></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01H/PD01HS01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="4">大额专项分期</th>
						</tr>
						<tr>
							<th class="g-w-4">大额专项分期额度</th>
							<th class="g-w-4">分期额度生效日期</th>
							<th class="g-w-4">分期额度到期日期</th>
							<th class="g-w-4">已用分期金额</th>
						</tr>
						<xsl:for-each select="PD01H/PD01HH">
							<tr>
								<td><xsl:value-of select="PD01HJ01"/></td>
								<td><xsl:value-of select="PD01HR01"/></td>
								<td><xsl:value-of select="PD01HR02"/></td>
								<td><xsl:value-of select="PD01HJ02"/></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01Z/PD01ZS01 != '' and PD01Z/PD01ZS01 !=0">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="3">标注及声明信息</th>
						</tr>
						<tr>
							<th class="g-w-3">标注及声明类型</th>
							<th class="g-w-3">标注或声明内容</th>
							<th class="g-w-3">添加日期</th>
						</tr>
						<xsl:for-each select="PD01Z/PD01ZH">
							<tr>
								<td><span name="1041"><xsl:value-of select="PD01ZD01"/></span></td>
								<td><xsl:value-of select="PD01ZQ01"/></td>
								<td><xsl:value-of select="PD01ZR01"/></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
		</xsl:for-each>
		<div class="t2 f-mgtop">（二）非循环贷账户</div>
		<xsl:for-each select="PD01[PD01A/PD01AD01 = 'D1']">
			<div class="tnt f-tleft f-mgtop">账户<xsl:number value="position()"/></div> 
			<table class="g-tab-bor f-tab-nomargin">
			  <tbody>
				<tr>
				  <th colspan="10">基本信息</th>
				</tr>
				<tr>
				  <th class="g-w-10">账户编号</th>
				  <th class="g-w-10">业务管理机构类型</th>
				  <th class="g-w-10">业务管理机构代码</th>
				  <th class="g-w-10">账户标识</th>
				  <th class="g-w-10">授信协议编号</th>
				  <th class="g-w-10">业务种类</th>
				  <th class="g-w-10">开立日期</th>
				  <th class="g-w-10">币种</th>
				  <th class="g-w-10">借款金额</th>
				  <th class="g-w-10">账户授信额度</th>
				</tr>
				<tr>
				  <td><xsl:value-of select="PD01A/PD01AI01"/></td>
				  <td><span name="1021"><xsl:value-of select="PD01A/PD01AD02"/></span></td>
				  <td><xsl:value-of select="PD01A/PD01AI02"/></td>
				  <td><xsl:value-of select="PD01A/PD01AI03"/></td>
				  <td><xsl:value-of select="PD01A/PD01AI04"/></td>
				  <td><span name="1023"><xsl:value-of select="PD01A/PD01AD03"/></span></td>
				  <td><xsl:value-of select="PD01A/PD01AR01"/></td>
				  <td><span name="3003"><xsl:value-of select="PD01A/PD01AD04"/></span></td>
				  <td><xsl:value-of select="PD01A/PD01AJ01"/></td>
				  <td><xsl:value-of select="PD01A/PD01AJ02"/></td>
				</tr>
				<tr>
				  <th>共享授信额度</th>
				  <th>到期日期</th>
				  <th>还款方式</th>
				  <th>还款频率</th>
				  <th>还款期数</th>
				  <th>担保方式</th>
				  <th>贷款发放形式</th>
				  <th>共同借款标志</th>
				  <th colspan="2">债权转移时的还款状态</th>
				</tr>
				<tr>
				  <td><xsl:value-of select="PD01A/PD01AJ03"/></td>
				  <td><xsl:value-of select="PD01A/PD01AR02"/></td>
				  <td><span name="1024"><xsl:value-of select="PD01A/PD01AD05"/></span></td>
				  <td><span name="1025"><xsl:value-of select="PD01A/PD01AD06"/></span></td>
				  <td><xsl:value-of select="PD01A/PD01AS01"/></td>
				  <td><span name="1026"><xsl:value-of select="PD01A/PD01AD07"/></span></td>
				  <td><span name="1027"><xsl:value-of select="PD01A/PD01AD08"/></span></td>
				  <td><span name="1028"><xsl:value-of select="PD01A/PD01AD09"/></span></td>
				  <td colspan="2"><span name="1029"><xsl:value-of select="PD01A/PD01AD10"/></span></td>
				</tr>
			  </tbody>
			</table>
			<table class="g-tab-bor f-tab-nomargin">
			  <tbody>
				<tr>
				  <th colspan="9">最新表现信息</th>
				</tr>
				<tr>
				  <th class="g-w-9">账户状态</th>
				  <th class="g-w-9">关闭日期</th>
				  <th class="g-w-9">转出月份</th>
				  <th class="g-w-9">余额</th>
				  <th class="g-w-9">最近一次还款日期</th>
				  <th class="g-w-9">最近一次还款金额</th>
				  <th class="g-w-9">五级分类</th>
				  <th class="g-w-9">还款状态</th>
				  <th class="g-w-9">信息报告日期</th>
				</tr>
				<tr>
				  <td><span name="1030"><xsl:value-of select="PD01B/PD01BD01"/></span></td>
				  <td><xsl:value-of select="PD01B/PD01BR01"/></td>
				  <td><xsl:value-of select="PD01B/PD01BR04"/></td>
				  <td><xsl:value-of select="PD01B/PD01BJ01"/></td>
				  <td><xsl:value-of select="PD01B/PD01BR02"/></td>
				  <td><xsl:value-of select="PD01B/PD01BJ02"/></td>
				  <td><span name="1035"><xsl:value-of select="PD01B/PD01BD03"/></span></td>
				  <td><span name="1036"><xsl:value-of select="PD01B/PD01BD04"/></span></td>
				  <td><xsl:value-of select="PD01B/PD01BR03"/></td>
				</tr>
			  </tbody>
			</table>
			<xsl:if test="PD01C/PD01CR01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
				  <tbody>
					<tr>
					  <th colspan="12">最近一次月度表现</th>
					</tr>
					<tr>
					  <th class="g-w-12">月份</th>
					  <th class="g-w-12">账户状态</th>
					  <th class="g-w-12">余额</th>
					  <th class="g-w-12">已用额度</th>
					  <th class="g-w-12">未出单的大额专项分期余额</th>
					  <th class="g-w-12">五级分类</th>
					  <th class="g-w-12">剩余还款期数</th>
					  <th class="g-w-12">结算/应还款日</th>
					  <th class="g-w-12">本月应还款</th>
					  <th class="g-w-12">本月实还款</th>
					  <th class="g-w-12">最近一次还款日期</th>
					  <th class="g-w-12">当前逾期期数</th>
					</tr>
					<tr>
					  <td><xsl:value-of select="PD01C/PD01CR01"/></td>
					  <td><span name="1030"><xsl:value-of select="PD01C/PD01CD01"/></span></td>
					  <td><xsl:value-of select="PD01C/PD01CJ01"/></td>
					  <td><xsl:value-of select="PD01C/PD01CJ02"/></td>
					  <td><xsl:value-of select="PD01C/PD01CJ03"/></td>
					  <td><span name="1035"><xsl:value-of select="PD01C/PD01CD02"/></span></td>
					  <td><xsl:value-of select="PD01C/PD01CS01"/></td>
					  <td><xsl:value-of select="PD01C/PD01CR02"/></td>
					  <td><xsl:value-of select="PD01C/PD01CJ04"/></td>
					  <td><xsl:value-of select="PD01C/PD01CJ05"/></td>
					  <td><xsl:value-of select="PD01C/PD01CR03"/></td>
					  <td><xsl:value-of select="PD01C/PD01CS02"/></td>
					</tr>
					<tr>
					  <th>当前逾期总额</th>
					  <th>逾期 31—60 天未还本金</th>
					  <th>逾期 61－90 天未还本金</th>
					  <th>逾期 91－180 天未还本金</th>
					  <th>逾期 180 天以上未还本金</th>
					  <th>透支 180 天以上未付余额</th>
					  <th>最近 6 个月平均使用额度</th>
					  <th>最近 6 个月平均透支余额</th>
					  <th>最大使用额度</th>
					  <th>最大透支余额</th>
					  <th colspan="2">信息报告日期</th>
					</tr>
					<tr>
						<td><xsl:value-of select="PD01C/PD01CJ06"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ07"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ08"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ09"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ10"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ11"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ12"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ13"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ14"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ15"/></td>
						<td colspan="2"><xsl:value-of select="PD01C/PD01CR04"/></td>
					</tr>
				  </tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01D/PD01DR01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="13">最近 24 个月还款状态</th>
						</tr>
						<tr>
							<th class="g-w-13"></th>
							<th class="g-w-13">1</th>
							<th class="g-w-13">2</th>
							<th class="g-w-13">3</th>
							<th class="g-w-13">4</th>
							<th class="g-w-13">5</th>
							<th class="g-w-13">6</th>
							<th class="g-w-13">7</th>
							<th class="g-w-13">8</th>
							<th class="g-w-13">9</th>
							<th class="g-w-13">10</th>
							<th class="g-w-13">11</th>
							<th class="g-w-13">12</th>
						</tr>
						<xsl:variable name="v1" select ="substring(PD01D/PD01DR02,1,4)"/> <!--截止年月-->
						<xsl:variable name="v2" select ="substring(PD01D/PD01DR01,1,4)"/> <!--起始年月-->
						<tr>
							<td><xsl:value-of select="number($v1)"/></td>
							<!--<td><span name="1036"><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-01')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></span></td>
							<td><span name="1036"><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-02')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></span></td>
							<td><span name="1036"><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-03')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></span></td>
							<td><span name="1036"><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-04')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></span></td>
							<td><span name="1036"><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-05')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></span></td>
							<td><span name="1036"><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-06')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></span></td>
							<td><span name="1036"><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-07')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></span></td>
							<td><span name="1036"><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-08')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></span></td>
							<td><span name="1036"><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-09')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></span></td>
							<td><span name="1036"><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-10')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></span></td>
							<td><span name="1036"><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-11')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></span></td>
							<td><span name="1036"><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-12')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></span></td>-->
							
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-01')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-02')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-03')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-04')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-05')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-06')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-07')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-08')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-09')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-10')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-11')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-12')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
						</tr>
						<xsl:if test="number($v1)-number($v2)>0">
							<xsl:variable name="v3" select ="string(number($v1)-1)"/>
							<tr>
								<td><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-01')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-02')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-03')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-04')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-05')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-06')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-07')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-08')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-09')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-10')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-11')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-12')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)=2">
							<xsl:variable name="v3" select ="string(number($v1)-2)"/>
							<tr>
								<td><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-01')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-02')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-03')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-04')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-05')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-06')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-07')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-08')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-09')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-10')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-11')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-12')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01E/PD01ER01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="13">最近 5 年内的历史表现</th>
						</tr>
						<tr>
							<th class="g-w-13"></th>
							<th class="g-w-13">1</th>
							<th class="g-w-13">2</th>
							<th class="g-w-13">3</th>
							<th class="g-w-13">4</th>
							<th class="g-w-13">5</th>
							<th class="g-w-13">6</th>
							<th class="g-w-13">7</th>
							<th class="g-w-13">8</th>
							<th class="g-w-13">9</th>
							<th class="g-w-13">10</th>
							<th class="g-w-13">11</th>
							<th class="g-w-13">12</th>
						</tr>
						<xsl:variable name="v1" select ="substring(PD01E/PD01ER02,1,4)"/> <!--截止年月-->
						<xsl:variable name="v2" select ="substring(PD01E/PD01ER01,1,4)"/> <!--起始年月-->
						<tr>
							<td rowspan="2"><xsl:value-of select="$v1"/></td>
							<!--<td><span name="1036"><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></span></td>
							<td><span name="1036"><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></span></td>
							<td><span name="1036"><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></span></td>
							<td><span name="1036"><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></span></td>
							<td><span name="1036"><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></span></td>
							<td><span name="1036"><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></span></td>
							<td><span name="1036"><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></span></td>
							<td><span name="1036"><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></span></td>
							<td><span name="1036"><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></span></td>
							<td><span name="1036"><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></span></td>
							<td><span name="1036"><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></span></td>
							<td><span name="1036"><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></span></td>-->
							
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
						</tr>
						<tr>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
						</tr>
						<xsl:if test="number($v1)-number($v2)>0">
							<xsl:variable name="v3" select ="string(number($v1)-1)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)>1">
							<xsl:variable name="v3" select ="string(number($v1)-2)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)>2">
							<xsl:variable name="v3" select ="string(number($v1)-3)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)>3">
							<xsl:variable name="v3" select ="string(number($v1)-4)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)>4">
							<xsl:variable name="v3" select ="string(number($v1)-5)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01F/PD01FS01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="8">特殊交易信息</th>
						</tr>
						<tr>
							<th class="g-w-5">特殊交易类型</th>
							<th class="g-w-5">特殊交易发生日期</th>
							<th class="g-w-5">到期日期变更月数</th>
							<th class="g-w-5">特殊交易发生金额</th>
							<th class="g-w-5">特殊交易明细记录</th>
						</tr>
						<xsl:for-each select="PD01F/PD01FH">
							<tr>
								<td><span name="1040"><xsl:value-of select="PD01FD01"/></span></td>
								<td><xsl:value-of select="PD01FR01"/></td>
								<td><xsl:value-of select="PD01FS02"/></td>
								<td><xsl:value-of select="PD01FJ01"/></td>
								<td><xsl:value-of select="PD01FQ01"/></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01G/PD01GS01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="2">特殊事件说明</th>
						</tr>
						<tr>
							<th class="g-w-2">特殊事件发生月份</th>
							<th class="g-w-2">特殊事件类型</th>
						</tr>
						<xsl:for-each select="PD01G/PD01GH">
							<tr>
								<td><xsl:value-of select="PD01GR01"/></td>
								<td><span name="1056"><xsl:value-of select="PD01GD01"/></span></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01H/PD01HS01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="4">大额专项分期</th>
						</tr>
						<tr>
							<th class="g-w-4">大额专项分期额度</th>
							<th class="g-w-4">分期额度生效日期</th>
							<th class="g-w-4">分期额度到期日期</th>
							<th class="g-w-4">已用分期金额</th>
						</tr>
						<xsl:for-each select="PD01H/PD01HH">
							<tr>
								<td><xsl:value-of select="PD01HJ01"/></td>
								<td><xsl:value-of select="PD01HR01"/></td>
								<td><xsl:value-of select="PD01HR02"/></td>
								<td><xsl:value-of select="PD01HJ02"/></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01Z/PD01ZS01 != '' and PD01Z/PD01ZS01 !=0">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="3">标注及声明信息</th>
						</tr>
						<tr>
							<th class="g-w-3">标注及声明类型</th>
							<th class="g-w-3">标注或声明内容</th>
							<th class="g-w-3">添加日期</th>
						</tr>
						<xsl:for-each select="PD01Z/PD01ZH">
							<tr>
								<td><span name="1041"><xsl:value-of select="PD01ZD01"/></span></td>
								<td><xsl:value-of select="PD01ZQ01"/></td>
								<td><xsl:value-of select="PD01ZR01"/></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
		</xsl:for-each>
		<div class="t2 f-mgtop">（三）循环额度下分账户</div>
		<xsl:for-each select="PD01[PD01A/PD01AD01 = 'R4']">
			<div class="tnt f-tleft f-mgtop">账户<xsl:number value="position()"/></div> 
			<table class="g-tab-bor f-tab-nomargin">
			  <tbody>
				<tr>
				  <th colspan="10">基本信息</th>
				</tr>
				<tr>
				  <th class="g-w-10">账户编号</th>
				  <th class="g-w-10">业务管理机构类型</th>
				  <th class="g-w-10">业务管理机构代码</th>
				  <th class="g-w-10">账户标识</th>
				  <th class="g-w-10">授信协议编号</th>
				  <th class="g-w-10">业务种类</th>
				  <th class="g-w-10">开立日期</th>
				  <th class="g-w-10">币种</th>
				  <th class="g-w-10">借款金额</th>
				  <th class="g-w-10">账户授信额度</th>
				</tr>
				<tr>
				  <td><xsl:value-of select="PD01A/PD01AI01"/></td>
				  <td><span name="1021"><xsl:value-of select="PD01A/PD01AD02"/></span></td>
				  <td><xsl:value-of select="PD01A/PD01AI02"/></td>
				  <td><xsl:value-of select="PD01A/PD01AI03"/></td>
				  <td><xsl:value-of select="PD01A/PD01AI04"/></td>
				  <td><span name="1023"><xsl:value-of select="PD01A/PD01AD03"/></span></td>
				  <td><xsl:value-of select="PD01A/PD01AR01"/></td>
				  <td><span name="3003"><xsl:value-of select="PD01A/PD01AD04"/></span></td>
				  <td><xsl:value-of select="PD01A/PD01AJ01"/></td>
				  <td><xsl:value-of select="PD01A/PD01AJ02"/></td>
				</tr>
				<tr>
				  <th>共享授信额度</th>
				  <th>到期日期</th>
				  <th>还款方式</th>
				  <th>还款频率</th>
				  <th>还款期数</th>
				  <th>担保方式</th>
				  <th>贷款发放形式</th>
				  <th>共同借款标志</th>
				  <th colspan="2">债权转移时的还款状态</th>
				</tr>
				<tr>
				  <td><xsl:value-of select="PD01A/PD01AJ03"/></td>
				  <td><xsl:value-of select="PD01A/PD01AR02"/></td>
				  <td><span name="1024"><xsl:value-of select="PD01A/PD01AD05"/></span></td>
				  <td><span name="1025"><xsl:value-of select="PD01A/PD01AD06"/></span></td>
				  <td><xsl:value-of select="PD01A/PD01AS01"/></td>
				  <td><span name="1026"><xsl:value-of select="PD01A/PD01AD07"/></span></td>
				  <td><span name="1027"><xsl:value-of select="PD01A/PD01AD08"/></span></td>
				  <td><span name="1028"><xsl:value-of select="PD01A/PD01AD09"/></span></td>
				  <td colspan="2"><span name="1029"><xsl:value-of select="PD01A/PD01AD10"/></span></td>
				</tr>
			  </tbody>
			</table>
			<table class="g-tab-bor f-tab-nomargin">
			  <tbody>
				<tr>
				  <th colspan="9">最新表现信息</th>
				</tr>
				<tr>
				  <th class="g-w-9">账户状态</th>
				  <th class="g-w-9">关闭日期</th>
				  <th class="g-w-9">转出月份</th>
				  <th class="g-w-9">余额</th>
				  <th class="g-w-9">最近一次还款日期</th>
				  <th class="g-w-9">最近一次还款金额</th>
				  <th class="g-w-9">五级分类</th>
				  <th class="g-w-9">还款状态</th>
				  <th class="g-w-9">信息报告日期</th>
				</tr>
				<tr>
				  <td><span name="1033"><xsl:value-of select="PD01B/PD01BD01"/></span></td>
				  <td><xsl:value-of select="PD01B/PD01BR01"/></td>
				  <td><xsl:value-of select="PD01B/PD01BR04"/></td>
				  <td><xsl:value-of select="PD01B/PD01BJ01"/></td>
				  <td><xsl:value-of select="PD01B/PD01BR02"/></td>
				  <td><xsl:value-of select="PD01B/PD01BJ02"/></td>
				  <td><span name="1035"><xsl:value-of select="PD01B/PD01BD03"/></span></td>
				  <td><span name="1036"><xsl:value-of select="PD01B/PD01BD04"/></span></td>
				  <td><xsl:value-of select="PD01B/PD01BR03"/></td>
				</tr>
			  </tbody>
			</table>
			<xsl:if test="PD01C/PD01CR01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
				  <tbody>
					<tr>
					  <th colspan="12">最近一次月度表现</th>
					</tr>
					<tr>
					  <th class="g-w-12">月份</th>
					  <th class="g-w-12">账户状态</th>
					  <th class="g-w-12">余额</th>
					  <th class="g-w-12">已用额度</th>
					  <th class="g-w-12">未出单的大额专项分期余额</th>
					  <th class="g-w-12">五级分类</th>
					  <th class="g-w-12">剩余还款期数</th>
					  <th class="g-w-12">结算/应还款日</th>
					  <th class="g-w-12">本月应还款</th>
					  <th class="g-w-12">本月实还款</th>
					  <th class="g-w-12">最近一次还款日期</th>
					  <th class="g-w-12">当前逾期期数</th>
					</tr>
					<tr>
					  <td><xsl:value-of select="PD01C/PD01CR01"/></td>
					  <td><span name="1033"><xsl:value-of select="PD01C/PD01CD01"/></span></td>
					  <td><xsl:value-of select="PD01C/PD01CJ01"/></td>
					  <td><xsl:value-of select="PD01C/PD01CJ02"/></td>
					  <td><xsl:value-of select="PD01C/PD01CJ03"/></td>
					  <td><span name="1035"><xsl:value-of select="PD01C/PD01CD02"/></span></td>
					  <td><xsl:value-of select="PD01C/PD01CS01"/></td>
					  <td><xsl:value-of select="PD01C/PD01CR02"/></td>
					  <td><xsl:value-of select="PD01C/PD01CJ04"/></td>
					  <td><xsl:value-of select="PD01C/PD01CJ05"/></td>
					  <td><xsl:value-of select="PD01C/PD01CR03"/></td>
					  <td><xsl:value-of select="PD01C/PD01CS02"/></td>
					</tr>
					<tr>
					  <th>当前逾期总额</th>
					  <th>逾期 31—60 天未还本金</th>
					  <th>逾期 61－90 天未还本金</th>
					  <th>逾期 91－180 天未还本金</th>
					  <th>逾期 180 天以上未还本金</th>
					  <th>透支 180 天以上未付余额</th>
					  <th>最近 6 个月平均使用额度</th>
					  <th>最近 6 个月平均透支余额</th>
					  <th>最大使用额度</th>
					  <th>最大透支余额</th>
					  <th colspan="2">信息报告日期</th>
					</tr>
					<tr>
						<td><xsl:value-of select="PD01C/PD01CJ06"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ07"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ08"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ09"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ10"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ11"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ12"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ13"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ14"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ15"/></td>
						<td colspan="2"><xsl:value-of select="PD01C/PD01CR04"/></td>
					</tr>
				  </tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01D/PD01DR01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="13">最近 24 个月还款状态</th>
						</tr>
						<tr>
							<th class="g-w-13"></th>
							<th class="g-w-13">1</th>
							<th class="g-w-13">2</th>
							<th class="g-w-13">3</th>
							<th class="g-w-13">4</th>
							<th class="g-w-13">5</th>
							<th class="g-w-13">6</th>
							<th class="g-w-13">7</th>
							<th class="g-w-13">8</th>
							<th class="g-w-13">9</th>
							<th class="g-w-13">10</th>
							<th class="g-w-13">11</th>
							<th class="g-w-13">12</th>
						</tr>
						<xsl:variable name="v1" select ="substring(PD01D/PD01DR02,1,4)"/> <!--截止年月-->
						<xsl:variable name="v2" select ="substring(PD01D/PD01DR01,1,4)"/> <!--起始年月-->
						<tr>
							<td><xsl:value-of select="number($v1)"/></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-01')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-02')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-03')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-04')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-05')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-06')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-07')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-08')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-09')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-10')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-11')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-12')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
						</tr>
						<xsl:if test="number($v1)-number($v2)>0">
							<xsl:variable name="v3" select ="string(number($v1)-1)"/>
							<tr>
								<td><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-01')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-02')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-03')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-04')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-05')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-06')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-07')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-08')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-09')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-10')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-11')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-12')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)=2">
							<xsl:variable name="v3" select ="string(number($v1)-2)"/>
							<tr>
								<td><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-01')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-02')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-03')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-04')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-05')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-06')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-07')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-08')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-09')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-10')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-11')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-12')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01E/PD01ER01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="13">最近 5 年内的历史表现</th>
						</tr>
						<tr>
							<th class="g-w-13"></th>
							<th class="g-w-13">1</th>
							<th class="g-w-13">2</th>
							<th class="g-w-13">3</th>
							<th class="g-w-13">4</th>
							<th class="g-w-13">5</th>
							<th class="g-w-13">6</th>
							<th class="g-w-13">7</th>
							<th class="g-w-13">8</th>
							<th class="g-w-13">9</th>
							<th class="g-w-13">10</th>
							<th class="g-w-13">11</th>
							<th class="g-w-13">12</th>
						</tr>
						<xsl:variable name="v1" select ="substring(PD01E/PD01ER02,1,4)"/> <!--截止年月-->
						<xsl:variable name="v2" select ="substring(PD01E/PD01ER01,1,4)"/> <!--起始年月-->
						<tr>
							<td rowspan="2"><xsl:value-of select="$v1"/></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
						</tr>
						<tr>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
						</tr>
						<xsl:if test="number($v1)-number($v2)>0">
							<xsl:variable name="v3" select ="string(number($v1)-1)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)>1">
							<xsl:variable name="v3" select ="string(number($v1)-2)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)>2">
							<xsl:variable name="v3" select ="string(number($v1)-3)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)>3">
							<xsl:variable name="v3" select ="string(number($v1)-4)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)>4">
							<xsl:variable name="v3" select ="string(number($v1)-5)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01F/PD01FS01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="8">特殊交易信息</th>
						</tr>
						<tr>
							<th class="g-w-5">特殊交易类型</th>
							<th class="g-w-5">特殊交易发生日期</th>
							<th class="g-w-5">到期日期变更月数</th>
							<th class="g-w-5">特殊交易发生金额</th>
							<th class="g-w-5">特殊交易明细记录</th>
						</tr>
						<xsl:for-each select="PD01F/PD01FH">
							<tr>
								<td><span name="1040"><xsl:value-of select="PD01FD01"/></span></td>
								<td><xsl:value-of select="PD01FR01"/></td>
								<td><xsl:value-of select="PD01FS02"/></td>
								<td><xsl:value-of select="PD01FJ01"/></td>
								<td><xsl:value-of select="PD01FQ01"/></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01G/PD01GS01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="2">特殊事件说明</th>
						</tr>
						<tr>
							<th class="g-w-2">特殊事件发生月份</th>
							<th class="g-w-2">特殊事件类型</th>
						</tr>
						<xsl:for-each select="PD01G/PD01GH">
							<tr>
								<td><xsl:value-of select="PD01GR01"/></td>
								<td><span name="1056"><xsl:value-of select="PD01GD01"/></span></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01H/PD01HS01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="4">大额专项分期</th>
						</tr>
						<tr>
							<th class="g-w-4">大额专项分期额度</th>
							<th class="g-w-4">分期额度生效日期</th>
							<th class="g-w-4">分期额度到期日期</th>
							<th class="g-w-4">已用分期金额</th>
						</tr>
						<xsl:for-each select="PD01H/PD01HH">
							<tr>
								<td><xsl:value-of select="PD01HJ01"/></td>
								<td><xsl:value-of select="PD01HR01"/></td>
								<td><xsl:value-of select="PD01HR02"/></td>
								<td><xsl:value-of select="PD01HJ02"/></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01Z/PD01ZS01 != '' and PD01Z/PD01ZS01 !=0">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="3">标注及声明信息</th>
						</tr>
						<tr>
							<th class="g-w-3">标注及声明类型</th>
							<th class="g-w-3">标注或声明内容</th>
							<th class="g-w-3">添加日期</th>
						</tr>
						<xsl:for-each select="PD01Z/PD01ZH">
							<tr>
								<td><span name="1041"><xsl:value-of select="PD01ZD01"/></span></td>
								<td><xsl:value-of select="PD01ZQ01"/></td>
								<td><xsl:value-of select="PD01ZR01"/></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
		</xsl:for-each>
		<div class="t2 f-mgtop">（四）循环贷账户</div>
		<xsl:for-each select="PD01[PD01A/PD01AD01 = 'R1']">
			<div class="tnt f-tleft f-mgtop">账户<xsl:number value="position()"/></div> 
			<table class="g-tab-bor f-tab-nomargin">
			  <tbody>
				<tr>
				  <th colspan="10">基本信息</th>
				</tr>
				<tr>
				  <th class="g-w-10">账户编号</th>
				  <th class="g-w-10">业务管理机构类型</th>
				  <th class="g-w-10">业务管理机构代码</th>
				  <th class="g-w-10">账户标识</th>
				  <th class="g-w-10">授信协议编号</th>
				  <th class="g-w-10">业务种类</th>
				  <th class="g-w-10">开立日期</th>
				  <th class="g-w-10">币种</th>
				  <th class="g-w-10">借款金额</th>
				  <th class="g-w-10">账户授信额度</th>
				</tr>
				<tr>
				  <td><xsl:value-of select="PD01A/PD01AI01"/></td>
				  <td><span name="1021"><xsl:value-of select="PD01A/PD01AD02"/></span></td>
				  <td><xsl:value-of select="PD01A/PD01AI02"/></td>
				  <td><xsl:value-of select="PD01A/PD01AI03"/></td>
				  <td><xsl:value-of select="PD01A/PD01AI04"/></td>
				  <td><span name="1023"><xsl:value-of select="PD01A/PD01AD03"/></span></td>
				  <td><xsl:value-of select="PD01A/PD01AR01"/></td>
				  <td><span name="3003"><xsl:value-of select="PD01A/PD01AD04"/></span></td>
				  <td><xsl:value-of select="PD01A/PD01AJ01"/></td>
				  <td><xsl:value-of select="PD01A/PD01AJ02"/></td>
				</tr>
				<tr>
				  <th>共享授信额度</th>
				  <th>到期日期</th>
				  <th>还款方式</th>
				  <th>还款频率</th>
				  <th>还款期数</th>
				  <th>担保方式</th>
				  <th>贷款发放形式</th>
				  <th>共同借款标志</th>
				  <th colspan="2">债权转移时的还款状态</th>
				</tr>
				<tr>
				  <td><xsl:value-of select="PD01A/PD01AJ03"/></td>
				  <td><xsl:value-of select="PD01A/PD01AR02"/></td>
				  <td><span name="1024"><xsl:value-of select="PD01A/PD01AD05"/></span></td>
				  <td><span name="1025"><xsl:value-of select="PD01A/PD01AD06"/></span></td>
				  <td><xsl:value-of select="PD01A/PD01AS01"/></td>
				  <td><span name="1026"><xsl:value-of select="PD01A/PD01AD07"/></span></td>
				  <td><span name="1027"><xsl:value-of select="PD01A/PD01AD08"/></span></td>
				  <td><span name="1028"><xsl:value-of select="PD01A/PD01AD09"/></span></td>
				  <td colspan="2"><span name="1029"><xsl:value-of select="PD01A/PD01AD10"/></span></td>
				</tr>
			  </tbody>
			</table>
			<table class="g-tab-bor f-tab-nomargin">
			  <tbody>
				<tr>
				  <th colspan="9">最新表现信息</th>
				</tr>
				<tr>
				  <th class="g-w-9">账户状态</th>
				  <th class="g-w-9">关闭日期</th>
				  <th class="g-w-9">转出月份</th>
				  <th class="g-w-9">余额</th>
				  <th class="g-w-9">最近一次还款日期</th>
				  <th class="g-w-9">最近一次还款金额</th>
				  <th class="g-w-9">五级分类</th>
				  <th class="g-w-9">还款状态</th>
				  <th class="g-w-9">信息报告日期</th>
				</tr>
				<tr>
				  <td><span name="1031"><xsl:value-of select="PD01B/PD01BD01"/></span></td>
				  <td><xsl:value-of select="PD01B/PD01BR01"/></td>
				  <td><xsl:value-of select="PD01B/PD01BR04"/></td>
				  <td><xsl:value-of select="PD01B/PD01BJ01"/></td>
				  <td><xsl:value-of select="PD01B/PD01BR02"/></td>
				  <td><xsl:value-of select="PD01B/PD01BJ02"/></td>
				  <td><span name="1035"><xsl:value-of select="PD01B/PD01BD03"/></span></td>
				  <td><span name="1037"><xsl:value-of select="PD01B/PD01BD04"/></span></td>
				  <td><xsl:value-of select="PD01B/PD01BR03"/></td>
				</tr>
			  </tbody>
			</table>
			<xsl:if test="PD01C/PD01CR01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
				  <tbody>
					<tr>
					  <th colspan="12">最近一次月度表现</th>
					</tr>
					<tr>
					  <th class="g-w-12">月份</th>
					  <th class="g-w-12">账户状态</th>
					  <th class="g-w-12">余额</th>
					  <th class="g-w-12">已用额度</th>
					  <th class="g-w-12">未出单的大额专项分期余额</th>
					  <th class="g-w-12">五级分类</th>
					  <th class="g-w-12">剩余还款期数</th>
					  <th class="g-w-12">结算/应还款日</th>
					  <th class="g-w-12">本月应还款</th>
					  <th class="g-w-12">本月实还款</th>
					  <th class="g-w-12">最近一次还款日期</th>
					  <th class="g-w-12">当前逾期期数</th>
					</tr>
					<tr>
					  <td><xsl:value-of select="PD01C/PD01CR01"/></td>
					  <td><span name="1031"><xsl:value-of select="PD01C/PD01CD01"/></span></td>
					  <td><xsl:value-of select="PD01C/PD01CJ01"/></td>
					  <td><xsl:value-of select="PD01C/PD01CJ02"/></td>
					  <td><xsl:value-of select="PD01C/PD01CJ03"/></td>
					  <td><span name="1035"><xsl:value-of select="PD01C/PD01CD02"/></span></td>
					  <td><xsl:value-of select="PD01C/PD01CS01"/></td>
					  <td><xsl:value-of select="PD01C/PD01CR02"/></td>
					  <td><xsl:value-of select="PD01C/PD01CJ04"/></td>
					  <td><xsl:value-of select="PD01C/PD01CJ05"/></td>
					  <td><xsl:value-of select="PD01C/PD01CR03"/></td>
					  <td><xsl:value-of select="PD01C/PD01CS02"/></td>
					</tr>
					<tr>
					  <th>当前逾期总额</th>
					  <th>逾期 31—60 天未还本金</th>
					  <th>逾期 61－90 天未还本金</th>
					  <th>逾期 91－180 天未还本金</th>
					  <th>逾期 180 天以上未还本金</th>
					  <th>透支 180 天以上未付余额</th>
					  <th>最近 6 个月平均使用额度</th>
					  <th>最近 6 个月平均透支余额</th>
					  <th>最大使用额度</th>
					  <th>最大透支余额</th>
					  <th colspan="2">信息报告日期</th>
					</tr>
					<tr>
						<td><xsl:value-of select="PD01C/PD01CJ06"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ07"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ08"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ09"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ10"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ11"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ12"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ13"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ14"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ15"/></td>
						<td colspan="2"><xsl:value-of select="PD01C/PD01CR04"/></td>
					</tr>
				  </tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01D/PD01DR01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="13">最近 24 个月还款状态</th>
						</tr>
						<tr>
							<th class="g-w-13"></th>
							<th class="g-w-13">1</th>
							<th class="g-w-13">2</th>
							<th class="g-w-13">3</th>
							<th class="g-w-13">4</th>
							<th class="g-w-13">5</th>
							<th class="g-w-13">6</th>
							<th class="g-w-13">7</th>
							<th class="g-w-13">8</th>
							<th class="g-w-13">9</th>
							<th class="g-w-13">10</th>
							<th class="g-w-13">11</th>
							<th class="g-w-13">12</th>
						</tr>
						<xsl:variable name="v1" select ="substring(PD01D/PD01DR02,1,4)"/> <!--截止年月-->
						<xsl:variable name="v2" select ="substring(PD01D/PD01DR01,1,4)"/> <!--起始年月-->
						<tr>
							<td><xsl:value-of select="number($v1)"/></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-01')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-02')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-03')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-04')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-05')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-06')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-07')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-08')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-09')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-10')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-11')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-12')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
						</tr>
						<xsl:if test="number($v1)-number($v2)>0">
							<xsl:variable name="v3" select ="string(number($v1)-1)"/>
							<tr>
								<td><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-01')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-02')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-03')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-04')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-05')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-06')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-07')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-08')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-09')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-10')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-11')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-12')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)=2">
							<xsl:variable name="v3" select ="string(number($v1)-2)"/>
							<tr>
								<td><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-01')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-02')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-03')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-04')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-05')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-06')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-07')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-08')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-09')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-10')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-11')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-12')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01E/PD01ER01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="13">最近 5 年内的历史表现</th>
						</tr>
						<tr>
							<th class="g-w-13"></th>
							<th class="g-w-13">1</th>
							<th class="g-w-13">2</th>
							<th class="g-w-13">3</th>
							<th class="g-w-13">4</th>
							<th class="g-w-13">5</th>
							<th class="g-w-13">6</th>
							<th class="g-w-13">7</th>
							<th class="g-w-13">8</th>
							<th class="g-w-13">9</th>
							<th class="g-w-13">10</th>
							<th class="g-w-13">11</th>
							<th class="g-w-13">12</th>
						</tr>
						<xsl:variable name="v1" select ="substring(PD01E/PD01ER02,1,4)"/> <!--截止年月-->
						<xsl:variable name="v2" select ="substring(PD01E/PD01ER01,1,4)"/> <!--起始年月-->
						<tr>
							<td rowspan="2"><xsl:value-of select="$v1"/></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
						</tr>
						<tr>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
						</tr>
						<xsl:if test="number($v1)-number($v2)>0">
							<xsl:variable name="v3" select ="string(number($v1)-1)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)>1">
							<xsl:variable name="v3" select ="string(number($v1)-2)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)>2">
							<xsl:variable name="v3" select ="string(number($v1)-3)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)>3">
							<xsl:variable name="v3" select ="string(number($v1)-4)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)>4">
							<xsl:variable name="v3" select ="string(number($v1)-5)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01F/PD01FS01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="8">特殊交易信息</th>
						</tr>
						<tr>
							<th class="g-w-5">特殊交易类型</th>
							<th class="g-w-5">特殊交易发生日期</th>
							<th class="g-w-5">到期日期变更月数</th>
							<th class="g-w-5">特殊交易发生金额</th>
							<th class="g-w-5">特殊交易明细记录</th>
						</tr>
						<xsl:for-each select="PD01F/PD01FH">
							<tr>
								<td><span name="1040"><xsl:value-of select="PD01FD01"/></span></td>
								<td><xsl:value-of select="PD01FR01"/></td>
								<td><xsl:value-of select="PD01FS02"/></td>
								<td><xsl:value-of select="PD01FJ01"/></td>
								<td><xsl:value-of select="PD01FQ01"/></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01G/PD01GS01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="2">特殊事件说明</th>
						</tr>
						<tr>
							<th class="g-w-2">特殊事件发生月份</th>
							<th class="g-w-2">特殊事件类型</th>
						</tr>
						<xsl:for-each select="PD01G/PD01GH">
							<tr>
								<td><xsl:value-of select="PD01GR01"/></td>
								<td><span name="1056"><xsl:value-of select="PD01GD01"/></span></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01H/PD01HS01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="4">大额专项分期</th>
						</tr>
						<tr>
							<th class="g-w-4">大额专项分期额度</th>
							<th class="g-w-4">分期额度生效日期</th>
							<th class="g-w-4">分期额度到期日期</th>
							<th class="g-w-4">已用分期金额</th>
						</tr>
						<xsl:for-each select="PD01H/PD01HH">
							<tr>
								<td><xsl:value-of select="PD01HJ01"/></td>
								<td><xsl:value-of select="PD01HR01"/></td>
								<td><xsl:value-of select="PD01HR02"/></td>
								<td><xsl:value-of select="PD01HJ02"/></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01Z/PD01ZS01 != '' and PD01Z/PD01ZS01 !=0">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="3">标注及声明信息</th>
						</tr>
						<tr>
							<th class="g-w-3">标注及声明类型</th>
							<th class="g-w-3">标注或声明内容</th>
							<th class="g-w-3">添加日期</th>
						</tr>
						<xsl:for-each select="PD01Z/PD01ZH">
							<tr>
								<td><span name="1041"><xsl:value-of select="PD01ZD01"/></span></td>
								<td><xsl:value-of select="PD01ZQ01"/></td>
								<td><xsl:value-of select="PD01ZR01"/></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
		</xsl:for-each>
		<div class="t2 f-mgtop">（五）贷记卡账户</div>
		<xsl:for-each select="PD01[PD01A/PD01AD01 = 'R2']">
			<div class="tnt f-tleft f-mgtop">账户<xsl:number value="position()"/></div> 
			<table class="g-tab-bor f-tab-nomargin">
			  <tbody>
				<tr>
				  <th colspan="10">基本信息</th>
				</tr>
				<tr>
				  <th class="g-w-10">账户编号</th>
				  <th class="g-w-10">业务管理机构类型</th>
				  <th class="g-w-10">业务管理机构代码</th>
				  <th class="g-w-10">账户标识</th>
				  <th class="g-w-10">授信协议编号</th>
				  <th class="g-w-10">业务种类</th>
				  <th class="g-w-10">开立日期</th>
				  <th class="g-w-10">币种</th>
				  <th class="g-w-10">借款金额</th>
				  <th class="g-w-10">账户授信额度</th>
				</tr>
				<tr>
				  <td><xsl:value-of select="PD01A/PD01AI01"/></td>
				  <td><span name="1021"><xsl:value-of select="PD01A/PD01AD02"/></span></td>
				  <td><xsl:value-of select="PD01A/PD01AI02"/></td>
				  <td><xsl:value-of select="PD01A/PD01AI03"/></td>
				  <td><xsl:value-of select="PD01A/PD01AI04"/></td>
				  <td><span name="1023"><xsl:value-of select="PD01A/PD01AD03"/></span></td>
				  <td><xsl:value-of select="PD01A/PD01AR01"/></td>
				  <td><span name="3003"><xsl:value-of select="PD01A/PD01AD04"/></span></td>
				  <td><xsl:value-of select="PD01A/PD01AJ01"/></td>
				  <td><xsl:value-of select="PD01A/PD01AJ02"/></td>
				</tr>
				<tr>
				  <th>共享授信额度</th>
				  <th>到期日期</th>
				  <th>还款方式</th>
				  <th>还款频率</th>
				  <th>还款期数</th>
				  <th>担保方式</th>
				  <th>贷款发放形式</th>
				  <th>共同借款标志</th>
				  <th colspan="2">债权转移时的还款状态</th>
				</tr>
				<tr>
				  <td><xsl:value-of select="PD01A/PD01AJ03"/></td>
				  <td><xsl:value-of select="PD01A/PD01AR02"/></td>
				  <td><span name="1024"><xsl:value-of select="PD01A/PD01AD05"/></span></td>
				  <td><span name="1025"><xsl:value-of select="PD01A/PD01AD06"/></span></td>
				  <td><xsl:value-of select="PD01A/PD01AS01"/></td>
				  <td><span name="1026"><xsl:value-of select="PD01A/PD01AD07"/></span></td>
				  <td><span name="1027"><xsl:value-of select="PD01A/PD01AD08"/></span></td>
				  <td><span name="1028"><xsl:value-of select="PD01A/PD01AD09"/></span></td>
				  <td colspan="2"><span name="1029"><xsl:value-of select="PD01A/PD01AD10"/></span></td>
				</tr>
			  </tbody>
			</table>
			<table class="g-tab-bor f-tab-nomargin">
			  <tbody>
				<tr>
				  <th colspan="9">最新表现信息</th>
				</tr>
				<tr>
				  <th class="g-w-9">账户状态</th>
				  <th class="g-w-9">关闭日期</th>
				  <th class="g-w-9">转出月份</th>
				  <th class="g-w-9">余额</th>
				  <th class="g-w-9">最近一次还款日期</th>
				  <th class="g-w-9">最近一次还款金额</th>
				  <th class="g-w-9">五级分类</th>
				  <th class="g-w-9">还款状态</th>
				  <th class="g-w-9">信息报告日期</th>
				</tr>
				<tr>
				  <td><span name="1032"><xsl:value-of select="PD01B/PD01BD01"/></span></td>
				  <td><xsl:value-of select="PD01B/PD01BR01"/></td>
				  <td><xsl:value-of select="PD01B/PD01BR04"/></td>
				  <td><xsl:value-of select="PD01B/PD01BJ01"/></td>
				  <td><xsl:value-of select="PD01B/PD01BR02"/></td>
				  <td><xsl:value-of select="PD01B/PD01BJ02"/></td>
				  <td><span name="1035"><xsl:value-of select="PD01B/PD01BD03"/></span></td>
				  <td><span name="1038"><xsl:value-of select="PD01B/PD01BD04"/></span></td>
				  <td><xsl:value-of select="PD01B/PD01BR03"/></td>
				</tr>
			  </tbody>
			</table>
			<xsl:if test="PD01C/PD01CR01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
				  <tbody>
					<tr>
					  <th colspan="12">最近一次月度表现</th>
					</tr>
					<tr>
					  <th class="g-w-12">月份</th>
					  <th class="g-w-12">账户状态</th>
					  <th class="g-w-12">余额</th>
					  <th class="g-w-12">已用额度</th>
					  <th class="g-w-12">未出单的大额专项分期余额</th>
					  <th class="g-w-12">五级分类</th>
					  <th class="g-w-12">剩余还款期数</th>
					  <th class="g-w-12">结算/应还款日</th>
					  <th class="g-w-12">本月应还款</th>
					  <th class="g-w-12">本月实还款</th>
					  <th class="g-w-12">最近一次还款日期</th>
					  <th class="g-w-12">当前逾期期数</th>
					</tr>
					<tr>
					  <td><xsl:value-of select="PD01C/PD01CR01"/></td>
					  <td><span name="1032"><xsl:value-of select="PD01C/PD01CD01"/></span></td>
					  <td><xsl:value-of select="PD01C/PD01CJ01"/></td>
					  <td><xsl:value-of select="PD01C/PD01CJ02"/></td>
					  <td><xsl:value-of select="PD01C/PD01CJ03"/></td>
					  <td><span name="1035"><xsl:value-of select="PD01C/PD01CD02"/></span></td>
					  <td><xsl:value-of select="PD01C/PD01CS01"/></td>
					  <td><xsl:value-of select="PD01C/PD01CR02"/></td>
					  <td><xsl:value-of select="PD01C/PD01CJ04"/></td>
					  <td><xsl:value-of select="PD01C/PD01CJ05"/></td>
					  <td><xsl:value-of select="PD01C/PD01CR03"/></td>
					  <td><xsl:value-of select="PD01C/PD01CS02"/></td>
					</tr>
					<tr>
					  <th>当前逾期总额</th>
					  <th>逾期 31—60 天未还本金</th>
					  <th>逾期 61－90 天未还本金</th>
					  <th>逾期 91－180 天未还本金</th>
					  <th>逾期 180 天以上未还本金</th>
					  <th>透支 180 天以上未付余额</th>
					  <th>最近 6 个月平均使用额度</th>
					  <th>最近 6 个月平均透支余额</th>
					  <th>最大使用额度</th>
					  <th>最大透支余额</th>
					  <th colspan="2">信息报告日期</th>
					</tr>
					<tr>
						<td><xsl:value-of select="PD01C/PD01CJ06"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ07"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ08"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ09"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ10"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ11"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ12"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ13"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ14"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ15"/></td>
						<td colspan="2"><xsl:value-of select="PD01C/PD01CR04"/></td>
					</tr>
				  </tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01D/PD01DR01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="13">最近 24 个月还款状态</th>
						</tr>
						<tr>
							<th class="g-w-13"></th>
							<th class="g-w-13">1</th>
							<th class="g-w-13">2</th>
							<th class="g-w-13">3</th>
							<th class="g-w-13">4</th>
							<th class="g-w-13">5</th>
							<th class="g-w-13">6</th>
							<th class="g-w-13">7</th>
							<th class="g-w-13">8</th>
							<th class="g-w-13">9</th>
							<th class="g-w-13">10</th>
							<th class="g-w-13">11</th>
							<th class="g-w-13">12</th>
						</tr>
						<xsl:variable name="v1" select ="substring(PD01D/PD01DR02,1,4)"/> <!--截止年月-->
						<xsl:variable name="v2" select ="substring(PD01D/PD01DR01,1,4)"/> <!--起始年月-->
						<tr>
							<td><xsl:value-of select="number($v1)"/></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-01')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-02')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-03')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-04')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-05')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-06')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-07')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-08')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-09')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-10')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-11')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-12')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
						</tr>
						<xsl:if test="number($v1)-number($v2)>0">
							<xsl:variable name="v3" select ="string(number($v1)-1)"/>
							<tr>
								<td><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-01')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-02')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-03')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-04')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-05')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-06')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-07')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-08')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-09')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-10')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-11')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-12')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)=2">
							<xsl:variable name="v3" select ="string(number($v1)-2)"/>
							<tr>
								<td><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-01')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-02')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-03')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-04')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-05')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-06')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-07')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-08')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-09')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-10')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-11')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-12')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01E/PD01ER01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="13">最近 5 年内的历史表现</th>
						</tr>
						<tr>
							<th class="g-w-13"></th>
							<th class="g-w-13">1</th>
							<th class="g-w-13">2</th>
							<th class="g-w-13">3</th>
							<th class="g-w-13">4</th>
							<th class="g-w-13">5</th>
							<th class="g-w-13">6</th>
							<th class="g-w-13">7</th>
							<th class="g-w-13">8</th>
							<th class="g-w-13">9</th>
							<th class="g-w-13">10</th>
							<th class="g-w-13">11</th>
							<th class="g-w-13">12</th>
						</tr>
						<xsl:variable name="v1" select ="substring(PD01E/PD01ER02,1,4)"/> <!--截止年月-->
						<xsl:variable name="v2" select ="substring(PD01E/PD01ER01,1,4)"/> <!--起始年月-->
						<tr>
							<td rowspan="2"><xsl:value-of select="$v1"/></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
						</tr>
						<tr>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
						</tr>
						<xsl:if test="number($v1)-number($v2)>0">
							<xsl:variable name="v3" select ="string(number($v1)-1)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)>1">
							<xsl:variable name="v3" select ="string(number($v1)-2)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)>2">
							<xsl:variable name="v3" select ="string(number($v1)-3)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)>3">
							<xsl:variable name="v3" select ="string(number($v1)-4)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)>4">
							<xsl:variable name="v3" select ="string(number($v1)-5)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01F/PD01FS01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="8">特殊交易信息</th>
						</tr>
						<tr>
							<th class="g-w-5">特殊交易类型</th>
							<th class="g-w-5">特殊交易发生日期</th>
							<th class="g-w-5">到期日期变更月数</th>
							<th class="g-w-5">特殊交易发生金额</th>
							<th class="g-w-5">特殊交易明细记录</th>
						</tr>
						<xsl:for-each select="PD01F/PD01FH">
							<tr>
								<td><span name="1040"><xsl:value-of select="PD01FD01"/></span></td>
								<td><xsl:value-of select="PD01FR01"/></td>
								<td><xsl:value-of select="PD01FS02"/></td>
								<td><xsl:value-of select="PD01FJ01"/></td>
								<td><xsl:value-of select="PD01FQ01"/></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01G/PD01GS01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="2">特殊事件说明</th>
						</tr>
						<tr>
							<th class="g-w-2">特殊事件发生月份</th>
							<th class="g-w-2">特殊事件类型</th>
						</tr>
						<xsl:for-each select="PD01G/PD01GH">
							<tr>
								<td><xsl:value-of select="PD01GR01"/></td>
								<td><span name="1056"><xsl:value-of select="PD01GD01"/></span></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01H/PD01HS01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="4">大额专项分期</th>
						</tr>
						<tr>
							<th class="g-w-4">大额专项分期额度</th>
							<th class="g-w-4">分期额度生效日期</th>
							<th class="g-w-4">分期额度到期日期</th>
							<th class="g-w-4">已用分期金额</th>
						</tr>
						<xsl:for-each select="PD01H/PD01HH">
							<tr>
								<td><xsl:value-of select="PD01HJ01"/></td>
								<td><xsl:value-of select="PD01HR01"/></td>
								<td><xsl:value-of select="PD01HR02"/></td>
								<td><xsl:value-of select="PD01HJ02"/></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01Z/PD01ZS01 != '' and PD01Z/PD01ZS01 !=0">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="3">标注及声明信息</th>
						</tr>
						<tr>
							<th class="g-w-3">标注及声明类型</th>
							<th class="g-w-3">标注或声明内容</th>
							<th class="g-w-3">添加日期</th>
						</tr>
						<xsl:for-each select="PD01Z/PD01ZH">
							<tr>
								<td><span name="1041"><xsl:value-of select="PD01ZD01"/></span></td>
								<td><xsl:value-of select="PD01ZQ01"/></td>
								<td><xsl:value-of select="PD01ZR01"/></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
		</xsl:for-each>
		<div class="t2 f-mgtop">（六）准贷记卡账户</div>
		<xsl:for-each select="PD01[PD01A/PD01AD01 = 'R3']">
			<div class="tnt f-tleft f-mgtop">账户<xsl:number value="position()"/></div> 
			<table class="g-tab-bor f-tab-nomargin">
			  <tbody>
				<tr>
				  <th colspan="10">基本信息</th>
				</tr>
				<tr>
				  <th class="g-w-10">账户编号</th>
				  <th class="g-w-10">业务管理机构类型</th>
				  <th class="g-w-10">业务管理机构代码</th>
				  <th class="g-w-10">账户标识</th>
				  <th class="g-w-10">授信协议编号</th>
				  <th class="g-w-10">业务种类</th>
				  <th class="g-w-10">开立日期</th>
				  <th class="g-w-10">币种</th>
				  <th class="g-w-10">借款金额</th>
				  <th class="g-w-10">账户授信额度</th>
				</tr>
				<tr>
				  <td><xsl:value-of select="PD01A/PD01AI01"/></td>
				  <td><span name="1021"><xsl:value-of select="PD01A/PD01AD02"/></span></td>
				  <td><xsl:value-of select="PD01A/PD01AI02"/></td>
				  <td><xsl:value-of select="PD01A/PD01AI03"/></td>
				  <td><xsl:value-of select="PD01A/PD01AI04"/></td>
				  <td><span name="1023"><xsl:value-of select="PD01A/PD01AD03"/></span></td>
				  <td><xsl:value-of select="PD01A/PD01AR01"/></td>
				  <td><span name="3003"><xsl:value-of select="PD01A/PD01AD04"/></span></td>
				  <td><xsl:value-of select="PD01A/PD01AJ01"/></td>
				  <td><xsl:value-of select="PD01A/PD01AJ02"/></td>
				</tr>
				<tr>
				  <th>共享授信额度</th>
				  <th>到期日期</th>
				  <th>还款方式</th>
				  <th>还款频率</th>
				  <th>还款期数</th>
				  <th>担保方式</th>
				  <th>贷款发放形式</th>
				  <th>共同借款标志</th>
				  <th colspan="2">债权转移时的还款状态</th>
				</tr>
				<tr>
				  <td><xsl:value-of select="PD01A/PD01AJ03"/></td>
				  <td><xsl:value-of select="PD01A/PD01AR02"/></td>
				  <td><span name="1024"><xsl:value-of select="PD01A/PD01AD05"/></span></td>
				  <td><span name="1025"><xsl:value-of select="PD01A/PD01AD06"/></span></td>
				  <td><xsl:value-of select="PD01A/PD01AS01"/></td>
				  <td><span name="1026"><xsl:value-of select="PD01A/PD01AD07"/></span></td>
				  <td><span name="1027"><xsl:value-of select="PD01A/PD01AD08"/></span></td>
				  <td><span name="1028"><xsl:value-of select="PD01A/PD01AD09"/></span></td>
				  <td colspan="2"><span name="1029"><xsl:value-of select="PD01A/PD01AD10"/></span></td>
				</tr>
			  </tbody>
			</table>
			<table class="g-tab-bor f-tab-nomargin">
			  <tbody>
				<tr>
				  <th colspan="9">最新表现信息</th>
				</tr>
				<tr>
				  <th class="g-w-9">账户状态</th>
				  <th class="g-w-9">关闭日期</th>
				  <th class="g-w-9">转出月份</th>
				  <th class="g-w-9">余额</th>
				  <th class="g-w-9">最近一次还款日期</th>
				  <th class="g-w-9">最近一次还款金额</th>
				  <th class="g-w-9">五级分类</th>
				  <th class="g-w-9">还款状态</th>
				  <th class="g-w-9">信息报告日期</th>
				</tr>
				<tr>
				  <td><span name="1032"><xsl:value-of select="PD01B/PD01BD01"/></span></td>
				  <td><xsl:value-of select="PD01B/PD01BR01"/></td>
				  <td><xsl:value-of select="PD01B/PD01BR04"/></td>
				  <td><xsl:value-of select="PD01B/PD01BJ01"/></td>
				  <td><xsl:value-of select="PD01B/PD01BR02"/></td>
				  <td><xsl:value-of select="PD01B/PD01BJ02"/></td>
				  <td><span name="1035"><xsl:value-of select="PD01B/PD01BD03"/></span></td>
				  <td><span name="1039"><xsl:value-of select="PD01B/PD01BD04"/></span></td>
				  <td><xsl:value-of select="PD01B/PD01BR03"/></td>
				</tr>
			  </tbody>
			</table>
			<xsl:if test="PD01C/PD01CR01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
				  <tbody>
					<tr>
					  <th colspan="12">最近一次月度表现</th>
					</tr>
					<tr>
					  <th class="g-w-12">月份</th>
					  <th class="g-w-12">账户状态</th>
					  <th class="g-w-12">余额</th>
					  <th class="g-w-12">已用额度</th>
					  <th class="g-w-12">未出单的大额专项分期余额</th>
					  <th class="g-w-12">五级分类</th>
					  <th class="g-w-12">剩余还款期数</th>
					  <th class="g-w-12">结算/应还款日</th>
					  <th class="g-w-12">本月应还款</th>
					  <th class="g-w-12">本月实还款</th>
					  <th class="g-w-12">最近一次还款日期</th>
					  <th class="g-w-12">当前逾期期数</th>
					</tr>
					<tr>
					  <td><xsl:value-of select="PD01C/PD01CR01"/></td>
					  <td><span name="1032"><xsl:value-of select="PD01C/PD01CD01"/></span></td>
					  <td><xsl:value-of select="PD01C/PD01CJ01"/></td>
					  <td><xsl:value-of select="PD01C/PD01CJ02"/></td>
					  <td><xsl:value-of select="PD01C/PD01CJ03"/></td>
					  <td><span name="1035"><xsl:value-of select="PD01C/PD01CD02"/></span></td>
					  <td><xsl:value-of select="PD01C/PD01CS01"/></td>
					  <td><xsl:value-of select="PD01C/PD01CR02"/></td>
					  <td><xsl:value-of select="PD01C/PD01CJ04"/></td>
					  <td><xsl:value-of select="PD01C/PD01CJ05"/></td>
					  <td><xsl:value-of select="PD01C/PD01CR03"/></td>
					  <td><xsl:value-of select="PD01C/PD01CS02"/></td>
					</tr>
					<tr>
					  <th>当前逾期总额</th>
					  <th>逾期 31—60 天未还本金</th>
					  <th>逾期 61－90 天未还本金</th>
					  <th>逾期 91－180 天未还本金</th>
					  <th>逾期 180 天以上未还本金</th>
					  <th>透支 180 天以上未付余额</th>
					  <th>最近 6 个月平均使用额度</th>
					  <th>最近 6 个月平均透支余额</th>
					  <th>最大使用额度</th>
					  <th>最大透支余额</th>
					  <th colspan="2">信息报告日期</th>
					</tr>
					<tr>
						<td><xsl:value-of select="PD01C/PD01CJ06"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ07"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ08"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ09"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ10"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ11"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ12"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ13"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ14"/></td>
						<td><xsl:value-of select="PD01C/PD01CJ15"/></td>
						<td colspan="2"><xsl:value-of select="PD01C/PD01CR04"/></td>
					</tr>
				  </tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01D/PD01DR01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="13">最近 24 个月还款状态</th>
						</tr>
						<tr>
							<th class="g-w-13"></th>
							<th class="g-w-13">1</th>
							<th class="g-w-13">2</th>
							<th class="g-w-13">3</th>
							<th class="g-w-13">4</th>
							<th class="g-w-13">5</th>
							<th class="g-w-13">6</th>
							<th class="g-w-13">7</th>
							<th class="g-w-13">8</th>
							<th class="g-w-13">9</th>
							<th class="g-w-13">10</th>
							<th class="g-w-13">11</th>
							<th class="g-w-13">12</th>
						</tr>
						<xsl:variable name="v1" select ="substring(PD01D/PD01DR02,1,4)"/> <!--截止年月-->
						<xsl:variable name="v2" select ="substring(PD01D/PD01DR01,1,4)"/> <!--起始年月-->
						<tr>
							<td><xsl:value-of select="number($v1)"/></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-01')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-02')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-03')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-04')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-05')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-06')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-07')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-08')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-09')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-10')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-11')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v1,'-12')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
						</tr>
						<xsl:if test="number($v1)-number($v2)>0">
							<xsl:variable name="v3" select ="string(number($v1)-1)"/>
							<tr>
								<td><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-01')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-02')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-03')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-04')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-05')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-06')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-07')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-08')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-09')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-10')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-11')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-12')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)=2">
							<xsl:variable name="v3" select ="string(number($v1)-2)"/>
							<tr>
								<td><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-01')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-02')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-03')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-04')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-05')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-06')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-07')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-08')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-09')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-10')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-11')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01D/PD01DH[PD01DR03=concat($v3,'-12')]"><xsl:value-of select="PD01DD01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01E/PD01ER01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="13">最近 5 年内的历史表现</th>
						</tr>
						<tr>
							<th class="g-w-13"></th>
							<th class="g-w-13">1</th>
							<th class="g-w-13">2</th>
							<th class="g-w-13">3</th>
							<th class="g-w-13">4</th>
							<th class="g-w-13">5</th>
							<th class="g-w-13">6</th>
							<th class="g-w-13">7</th>
							<th class="g-w-13">8</th>
							<th class="g-w-13">9</th>
							<th class="g-w-13">10</th>
							<th class="g-w-13">11</th>
							<th class="g-w-13">12</th>
						</tr>
						<xsl:variable name="v1" select ="substring(PD01E/PD01ER02,1,4)"/> <!--截止年月-->
						<xsl:variable name="v2" select ="substring(PD01E/PD01ER01,1,4)"/> <!--起始年月-->
						<tr>
							<td rowspan="2"><xsl:value-of select="$v1"/></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
						</tr>
						<tr>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v1,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
						</tr>
						<xsl:if test="number($v1)-number($v2)>0">
							<xsl:variable name="v3" select ="string(number($v1)-1)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)>1">
							<xsl:variable name="v3" select ="string(number($v1)-2)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)>2">
							<xsl:variable name="v3" select ="string(number($v1)-3)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)>3">
							<xsl:variable name="v3" select ="string(number($v1)-4)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
						<xsl:if test="number($v1)-number($v2)>4">
							<xsl:variable name="v3" select ="string(number($v1)-5)"/>
							<tr>
								<td rowspan="2"><xsl:value-of select="$v3"/></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01ED01"/></xsl:for-each></td>
							</tr>
							<tr>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-01')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-02')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-03')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-04')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-05')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-06')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-07')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-08')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-09')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-10')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-11')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
								<td><xsl:for-each select="PD01E/PD01EH[PD01ER03=concat($v3,'-12')]"><xsl:value-of select="PD01EJ01"/></xsl:for-each></td>
							</tr>
						</xsl:if>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01F/PD01FS01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="8">特殊交易信息</th>
						</tr>
						<tr>
							<th class="g-w-5">特殊交易类型</th>
							<th class="g-w-5">特殊交易发生日期</th>
							<th class="g-w-5">到期日期变更月数</th>
							<th class="g-w-5">特殊交易发生金额</th>
							<th class="g-w-5">特殊交易明细记录</th>
						</tr>
						<xsl:for-each select="PD01F/PD01FH">
							<tr>
								<td><span name="1040"><xsl:value-of select="PD01FD01"/></span></td>
								<td><xsl:value-of select="PD01FR01"/></td>
								<td><xsl:value-of select="PD01FS02"/></td>
								<td><xsl:value-of select="PD01FJ01"/></td>
								<td><xsl:value-of select="PD01FQ01"/></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01G/PD01GS01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="2">特殊事件说明</th>
						</tr>
						<tr>
							<th class="g-w-2">特殊事件发生月份</th>
							<th class="g-w-2">特殊事件类型</th>
						</tr>
						<xsl:for-each select="PD01G/PD01GH">
							<tr>
								<td><xsl:value-of select="PD01GR01"/></td>
								<td><span name="1056"><xsl:value-of select="PD01GD01"/></span></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01H/PD01HS01 != ''">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="4">大额专项分期</th>
						</tr>
						<tr>
							<th class="g-w-4">大额专项分期额度</th>
							<th class="g-w-4">分期额度生效日期</th>
							<th class="g-w-4">分期额度到期日期</th>
							<th class="g-w-4">已用分期金额</th>
						</tr>
						<xsl:for-each select="PD01H/PD01HH">
							<tr>
								<td><xsl:value-of select="PD01HJ01"/></td>
								<td><xsl:value-of select="PD01HR01"/></td>
								<td><xsl:value-of select="PD01HR02"/></td>
								<td><xsl:value-of select="PD01HJ02"/></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="PD01Z/PD01ZS01 != '' and PD01Z/PD01ZS01 !=0">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="3">标注及声明信息</th>
						</tr>
						<tr>
							<th class="g-w-3">标注及声明类型</th>
							<th class="g-w-3">标注或声明内容</th>
							<th class="g-w-3">添加日期</th>
						</tr>
						<xsl:for-each select="PD01Z/PD01ZH">
							<tr>
								<td><span name="1041"><xsl:value-of select="PD01ZD01"/></span></td>
								<td><xsl:value-of select="PD01ZQ01"/></td>
								<td><xsl:value-of select="PD01ZR01"/></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- （七）授信协议信息 -->
	<xsl:template match="PCA">
		<div class="t2 f-mgtop">（七）授信协议信息</div>
		<xsl:for-each select="PD02">
			<table class="g-subtab-bor f-tab-fix">
			  <tbody>
				<tr>
				  <th colspan="7">授信协议</th>
				</tr>
				<tr>
				  <th class="g-w-7">授信协议编号</th>
				  <th class="g-w-7">业务管理机构类型</th>
				  <th class="g-w-7">业务管理机构</th>
				  <th class="g-w-7">授信协议标识</th>
				  <th class="g-w-7">授信额度用途</th>
				  <th class="g-w-7">授信额度</th>
				  <th class="g-w-7">币种</th>
				</tr>
				<tr>
				  <td><xsl:value-of select="PD02A/PD02AI01"/></td>
				  <td><span name="1021"><xsl:value-of select="PD02A/PD02AD01"/></span></td>
				  <td><xsl:value-of select="PD02A/PD02AI02"/></td>
				  <td><xsl:value-of select="PD02A/PD02AI03"/></td>
				  <td><span name="1042"><xsl:value-of select="PD02A/PD02AD02"/></span></td>
				  <td><xsl:value-of select="PD02A/PD02AJ01"/></td>
				  <td><span name="3003"><xsl:value-of select="PD02A/PD02AD03"/></span></td>
				</tr>
				<tr>
				  <th>生效日期</th>
				  <th>到期日期</th>
				  <th>授信协议状态</th>
				  <th>已用额度</th>
				  <th>授信限额</th>
				  <th colspan="2">授信限额编号</th>
				</tr>
				<tr>
				  <td><xsl:value-of select="PD02A/PD02AR01"/></td>
				  <td><xsl:value-of select="PD02A/PD02AR02"/></td>
				  <td><span name="1057"><xsl:value-of select="PD02A/PD02AD04"/></span></td>
				  <td><xsl:value-of select="PD02A/PD02AJ04"/></td>
				  <td><xsl:value-of select="PD02A/PD02AJ03"/></td>
				  <td colspan="2"><xsl:value-of select="PD02A/PD02AI04"/></td>
				</tr>
			  </tbody>
			</table>
			<xsl:if test="PD02Z/PD02ZS01 != '' and PD02Z/PD02ZS01 !=0">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="3">标注及声明信息</th>
						</tr>
						<tr>
						  <th class="g-w-3">标注及声明类型</th>
						  <th class="g-w-3">标注或声明内容</th>
						  <th class="g-w-3">添加日期</th>
						</tr>
						<xsl:for-each select="PD02Z/PD02ZH">
							<tr>
							  <td><span name="1041"><xsl:value-of select="PD02ZD01"/></span></td>
							  <td><xsl:value-of select="PD02ZQ01"/></td>
							  <td><xsl:value-of select="PD02ZR01"/></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>	
		</xsl:for-each>
	</xsl:template>
	<!-- （八）相关还款责任信息 -->
	<xsl:template match="PCR">
		<div class="t2 f-mgtop">（八）相关还款责任信息</div>
		<div class="t2 f-mgtop">有相关还款责任的个人借款</div>
		<xsl:for-each select="PD03[PD03A/PD03AD08 = '1']">
			<div class="tnt f-tleft f-mgtop">账户<xsl:number value="position()"/></div>
			<table class="g-tab-bor f-mgtop-s f-tab-fix">
			  <tbody>
				<tr>
				  <th class="g-w-8">主借款人身份类别</th>
				  <th class="g-w-8">业务管理机构类型</th>
				  <th class="g-w-8">业务管理机构</th>
				  <th class="g-w-8">业务种类</th>
				  <th class="g-w-8">开立日期</th>
				  <th class="g-w-8">到期日期</th>
				  <th class="g-w-8">相关还款责任人类型</th>
				  <th class="g-w-8">保证合同编号</th>
				</tr>
				<tr>
				  <td><span name="3004"><xsl:value-of select="PD03A/PD03AD08"/></span></td>
				  <td><span name="1021"><xsl:value-of select="PD03A/PD03AD01"/></span></td>
				  <td><xsl:value-of select="PD03A/PD03AQ01"/></td>
				  <td><span name="1023"><xsl:value-of select="PD03A/PD03AD02"/></span></td>
				  <td><xsl:value-of select="PD03A/PD03AR01"/></td>
				  <td><xsl:value-of select="PD03A/PD03AR02"/></td>
				  <td><span name="1044"><xsl:value-of select="PD03A/PD03AD03"/></span></td>
				  <td><xsl:value-of select="PD03A/PD03AQ02"/></td>
				</tr>
				<tr>
				  <th class="g-w-8">相关还款责任金额</th>
				  <th class="g-w-8">币种</th>
				  <th class="g-w-8">余额</th>
				  <th class="g-w-8">五级分类</th>
				  <th class="g-w-8">账户类型</th>
				  <th class="g-w-8">还款状态</th>
				  <th class="g-w-8">逾期月数</th>
				  <th class="g-w-8">信息报告日期</th>
				</tr>
				<tr>
				  <td><xsl:value-of select="PD03A/PD03AJ01"/></td>
				  <td><span name="3003"><xsl:value-of select="PD03A/PD03AD04"/></span></td>
				  <td><xsl:value-of select="PD03A/PD03AJ02"/></td>
				  <td><span name="1035"><xsl:value-of select="PD03A/PD03AD05"/></span></td>
				  <td><span name="1022"><xsl:value-of select="PD03A/PD03AD06"/></span></td>
				  <td>
					<xsl:if test="PD03A/PD03AD06 = 'D1' or PD03A/PD03AD06 = 'R4'">
						<span name="1036"><xsl:value-of select="PD03A/PD03AD07"/></span>
					</xsl:if>
					<xsl:if test="PD03A/PD03AD06 = 'R1'">
						<span name="1037"><xsl:value-of select="PD03A/PD03AD07"/></span>
					</xsl:if>
					<xsl:if test="PD03A/PD03AD06 = 'R2'">
						<span name="1038"><xsl:value-of select="PD03A/PD03AD07"/></span>
					</xsl:if>
					<xsl:if test="PD03A/PD03AD06 = 'R3'">
						<span name="1039"><xsl:value-of select="PD03A/PD03AD07"/></span>
					</xsl:if>
				  </td>
				  <td><xsl:value-of select="PD03A/PD03AS01"/></td>
				  <td><xsl:value-of select="PD03A/PD03AR03"/></td>
				</tr>
			  </tbody>
			</table>
			<xsl:if test="PD03Z/PD03ZS01 != '' and PD03Z/PD03ZS01 !=0">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="3">标注及声明信息</th>
						</tr>
						<tr>
						  <th class="g-w-3">标注及声明类型</th>
						  <th class="g-w-3">标注或声明内容</th>
						  <th class="g-w-3">添加日期</th>
						</tr>
						<xsl:for-each select="PD03Z/PD03ZH">
							<tr>
							  <td><span name="1041"><xsl:value-of select="PD03ZD01"/></span></td>
							  <td><xsl:value-of select="PD03ZQ01"/></td>
							  <td><xsl:value-of select="PD03ZR01"/></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>	
		</xsl:for-each>
		<div class="t2 f-mgtop">有相关还款责任的企业借款</div>
		<xsl:for-each select="PD03[PD03A/PD03AD08 = '2']">
			<div class="tnt f-tleft f-mgtop">账户<xsl:number value="position()"/></div>
			<table class="g-tab-bor f-mgtop-s f-tab-fix">
			  <tbody>
				<tr>
				  <th class="g-w-8">主借款人身份类别</th>
				  <th class="g-w-8">业务管理机构类型</th>
				  <th class="g-w-8">业务管理机构</th>
				  <th class="g-w-8">业务种类</th>
				  <th class="g-w-8">开立日期</th>
				  <th class="g-w-8">到期日期</th>
				  <th class="g-w-8">相关还款责任人类型</th>
				  <th class="g-w-8">保证合同编号</th>
				</tr>
				<tr>
				  <td><span name="3004"><xsl:value-of select="PD03A/PD03AD08"/></span></td>
				  <td><span name="1021"><xsl:value-of select="PD03A/PD03AD01"/></span></td>
				  <td><xsl:value-of select="PD03A/PD03AQ01"/></td>
				  <td><span name="1043"><xsl:value-of select="PD03A/PD03AD02"/></span></td>
				  <td><xsl:value-of select="PD03A/PD03AR01"/></td>
				  <td><xsl:value-of select="PD03A/PD03AR02"/></td>
				  <td><span name="1044"><xsl:value-of select="PD03A/PD03AD03"/></span></td>
				  <td><xsl:value-of select="PD03A/PD03AQ02"/></td>
				</tr>
				<tr>
				  <th class="g-w-8">相关还款责任金额</th>
				  <th class="g-w-8">币种</th>
				  <th class="g-w-8">余额</th>
				  <th class="g-w-8">五级分类</th>
				  <th class="g-w-8">账户类型</th>
				  <th class="g-w-8">还款状态</th>
				  <th class="g-w-8">逾期月数</th>
				  <th class="g-w-8">信息报告日期</th>
				</tr>
				<tr>
				  <td><xsl:value-of select="PD03A/PD03AJ01"/></td>
				  <td><span name="3003"><xsl:value-of select="PD03A/PD03AD04"/></span></td>
				  <td><xsl:value-of select="PD03A/PD03AJ02"/></td>
				  <td><span name="1035"><xsl:value-of select="PD03A/PD03AD05"/></span></td>
				  <td><span name="1022"><xsl:value-of select="PD03A/PD03AD06"/></span></td>
				  <td>-</td>
				  <td><xsl:value-of select="PD03A/PD03AS01"/></td>
				  <td><xsl:value-of select="PD03A/PD03AR03"/></td>
				</tr>
			  </tbody>
			</table>
			<xsl:if test="PD03Z/PD03ZS01 != '' and PD03Z/PD03ZS01 !=0">
				<table class="g-tab-bor f-tab-nomargin">
					<tbody>
						<tr>
						  <th colspan="3">标注及声明信息</th>
						</tr>
						<tr>
						  <th class="g-w-3">标注及声明类型</th>
						  <th class="g-w-3">标注或声明内容</th>
						  <th class="g-w-3">添加日期</th>
						</tr>
						<xsl:for-each select="PD03Z/PD03ZH">
							<tr>
							  <td><span name="1041"><xsl:value-of select="PD03ZD01"/></span></td>
							  <td><xsl:value-of select="PD03ZQ01"/></td>
							  <td><xsl:value-of select="PD03ZR01"/></td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>	
		</xsl:for-each>
	</xsl:template>
	
<!-- 四 非信贷交易信息明细 -->
	<xsl:template match="PND">
		<div class="t2 f-mgtop">后付费记录</div>
		<table class="g-subtab-bor">
		  <tbody>
			<tr>
			  <th class="g-w-9">编号</th>
			  <th class="g-w-9">后付费账户类型</th>
			  <th class="g-w-9">机构名称</th>
			  <th class="g-w-9">业务类型</th>
			  <th class="g-w-9">业务开通日期</th>
			  <th class="g-w-9">当前缴费状态</th>
			  <th class="g-w-9">当前欠费金额</th>
			  <th class="g-w-9">记账年月</th>
			  <th class="g-w-9">最近 24 个月缴费记录</th>
			</tr>
			<xsl:for-each select="PE01">
				<tr>
				  <td><xsl:number value="position()"/></td>
				  <td><span name="1059"><xsl:value-of select="PE01A/PE01AD01"/></span></td>
				  <td><xsl:value-of select="PE01A/PE01AQ01"/></td>
				  <td><span name="1045"><xsl:value-of select="PE01A/PE01AD02"/></span></td>
				  <td><xsl:value-of select="PE01A/PE01AR01"/></td>
				  <td><span name="1046"><xsl:value-of select="PE01A/PE01AD03"/></span></td>
				  <td><xsl:value-of select="PE01A/PE01AJ01"/></td>
				  <td><xsl:value-of select="PE01A/PE01AR02"/></td>
				  <td><xsl:value-of select="PE01A/PE01AQ02"/></td>
				</tr>
				<xsl:if test="PE01Z/PE01ZS01 != '' and PE01Z/PE01ZS01 != 0">
					<tr>
					  <th colspan="9">标注及声明信息</th>
					</tr>
					<tr>
					  <th colspan="2">标注及声明类型</th>
					  <th colspan="6">标注或声明内容</th>
					  <th>添加日期</th>
					</tr>
					<xsl:for-each select="PE01Z/PE01ZH">
						<tr>
						  <td colspan="2"><span name="1041"><xsl:value-of select="PE01ZD01"/></span></td>
						  <td colspan="6"><xsl:value-of select="PE01ZQ01"/></td>
						  <td><xsl:value-of select="PE01ZR01"/></td>
						</tr>
					</xsl:for-each>
				</xsl:if>	
			</xsl:for-each>
		  </tbody>
		</table>
	</xsl:template>
<!-- 五 公共信息明细 -->
	<!-- （一）欠税记录 -->
	<xsl:template match="POT">
		<div class="t2 f-mgtop">（一）欠税记录</div>
		<xsl:if test="PF01 != ''">
			<table class="g-tab-bor f-mgtop-s f-tab-nomargin">
			  <tbody>
				<tr>
				  <th class="g-w-4">编号</th>
				  <th class="g-w-4">主管税务机关</th>
				  <th class="g-w-4">欠税总额</th>
				  <th class="g-w-4">欠税统计日期</th>
				</tr>
				<xsl:for-each select="PF01">
					<tr>
					  <td><xsl:value-of select="position()"/></td>
					  <td><xsl:value-of select="PF01A/PF01AQ01"/></td>
					  <td><xsl:value-of select="PF01A/PF01AJ01"/></td>
					  <td><xsl:value-of select="PF01A/PF01AR01"/></td>
					</tr>
					<xsl:if test="PF01Z/PF01ZS01 != '' and PF01Z/PF01ZS01 != 0">
						<tr>
						  <th colspan="4">标注及声明信息</th>
						</tr>
						<tr>
						  <th>标注及声明类型</th>
						  <th colspan="2">标注或声明内容</th>
						  <th>添加日期</th>
						</tr>
						<xsl:for-each select="PE01Z/PE01ZH">
							<tr>
							  <td><span name="1041"><xsl:value-of select="PF01ZD01"/></span></td>
							  <td colspan="2"><xsl:value-of select="PF01ZQ01"/></td>
							  <td><xsl:value-of select="PF01ZR01"/></td>
							</tr>
						</xsl:for-each>
					</xsl:if>	
				</xsl:for-each>
			  </tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- （二）民事判决记录 -->
	<xsl:template match="PCJ">
		<div class="t2 f-mgtop">（二）民事判决记录</div>
		<xsl:if test="PF02 != ''">
			<table class="g-tab-bor f-mgtop-s f-tab-nomargin">
			  <tbody>
				<tr>
				  <th class="g-w-8">立案法院</th>
				  <th class="g-w-8">案由</th>
				  <th class="g-w-8">立案日期</th>
				  <th class="g-w-8">结案方式</th>
				  <th class="g-w-8">判决/调解结果</th>
				  <th class="g-w-8">判决/调解生效日期</th>
				  <th class="g-w-8">诉讼标的</th>
				  <th class="g-w-8">诉讼标的金额</th>
				</tr>
				<xsl:for-each select="PF02">
					<tr>
					  <td><xsl:value-of select="PF02A/PF02AQ01"/></td>
					  <td><xsl:value-of select="PF02A/PF02AQ02"/></td>
					  <td><xsl:value-of select="PF02A/PF02AR01"/></td>
					  <td><span name="1047"><xsl:value-of select="PF02A/PF02AD01"/></span></td>
					  <td><xsl:value-of select="PF02A/PF02AQ03"/></td>
					  <td><xsl:value-of select="PF02A/PF02AR02"/></td>
					  <td><xsl:value-of select="PF02A/PF02AQ04"/></td>
					  <td><xsl:value-of select="PF02A/PF02AJ01"/></td>
					</tr>
					<xsl:if test="PF02Z/PF02ZS01 != '' and PF02Z/PF02ZS01 !=0">
						<tr>
						  <th colspan="8">标注及声明信息</th>
						</tr>
						<tr>
						  <th colspan="2">标注及声明类型</th>
						  <th colspan="5">标注或声明内容</th>
						  <th>添加日期</th>
						</tr>
						<xsl:for-each select="PF02Z/PF02ZH">
							<tr>
							  <td colspan="2"><span name="1041"><xsl:value-of select="PF02ZD01"/></span></td>
							  <td colspan="5"><xsl:value-of select="PF02ZQ01"/></td>
							  <td><xsl:value-of select="PF02ZR01"/></td>
							</tr>
						</xsl:for-each>
					</xsl:if>	
				</xsl:for-each>
			  </tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- （三）强制执行记录 -->
	<xsl:template match="PCE">
		<div class="t2 f-mgtop">（三）强制执行记录</div>
		<xsl:if test="PF03 != ''">
			<table class="g-tab-bor f-mgtop-s f-tab-nomargin">
			  <tbody>
				<tr>
				  <th class="g-w-10">执行法院</th>
				  <th class="g-w-10">执行案由</th>
				  <th class="g-w-10">立案日期</th>
				  <th class="g-w-10">结案方式</th>
				  <th class="g-w-10">案件状态</th>
				  <th class="g-w-10">结案日期</th>
				  <th class="g-w-10">申请执行标的</th>
				  <th class="g-w-10">申请执行标的</th>
				  <th class="g-w-10">已执行标的</th>
				  <th class="g-w-10">已执行标的金额</th>
				</tr>
				<xsl:for-each select="PF03">
					<tr>
					  <td><xsl:value-of select="PF03A/PF03AQ01"/></td>
					  <td><xsl:value-of select="PF03A/PF03AQ02"/></td>
					  <td><xsl:value-of select="PF03A/PF03AR01"/></td>
					  <td><span name="1048"><xsl:value-of select="PF03A/PF03AD01"/></span></td>
					  <td><xsl:value-of select="PF03A/PF03AQ03"/></td>
					  <td><xsl:value-of select="PF03A/PF03AR02"/></td>
					  <td><xsl:value-of select="PF03A/PF03AQ04"/></td>
					  <td><xsl:value-of select="PF03A/PF03AJ01"/></td>
					  <td><xsl:value-of select="PF03A/PF03AQ05"/></td>
					  <td><xsl:value-of select="PF03A/PF03AJ02"/></td>
					</tr>
					<xsl:if test="PF03Z/PF03ZS01 != '' and PF03Z/PF03ZS01 !=0">
						<tr>
						  <th colspan="10">标注及声明信息</th>
						</tr>
						<tr>
						  <th colspan="2">标注及声明类型</th>
						  <th colspan="7">标注或声明内容</th>
						  <th>添加日期</th>
						</tr>
						<xsl:for-each select="PF03Z/PF03ZH">
							<tr>
							  <td colspan="2"><span name="1041"><xsl:value-of select="PF03ZD01"/></span></td>
							  <td colspan="7"><xsl:value-of select="PF03ZQ01"/></td>
							  <td><xsl:value-of select="PF03ZR01"/></td>
							</tr>
						</xsl:for-each>
					</xsl:if>	
				</xsl:for-each>
			  </tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- （四）行政处罚记录 -->
	<xsl:template match="PAP">
		<div class="t2 f-mgtop">（四）行政处罚记录</div>
		<xsl:if test="PF04 != ''">
			<table class="g-tab-bor f-mgtop-s f-tab-nomargin">
			  <tbody>
				<tr>
				  <th class="g-w-7">编号</th>
				  <th class="g-w-7">处罚机构</th>
				  <th class="g-w-7">处罚内容</th>
				  <th class="g-w-7">处罚金额</th>
				  <th class="g-w-7">处罚生效日期</th>
				  <th class="g-w-7">处罚截止日期</th>
				  <th class="g-w-7">行政复议结果</th>
				</tr>
				<xsl:for-each select="PF04">
					<tr>
					  <td><xsl:value-of select="position()"/></td>
					  <td><xsl:value-of select="PF04A/PF04AQ01"/></td>
					  <td><xsl:value-of select="PF04A/PF04AQ02"/></td>
					  <td><xsl:value-of select="PF04A/PF04AJ01"/></td>
					  <td><xsl:value-of select="PF04A/PF04AR01"/></td>
					  <td><xsl:value-of select="PF04A/PF04AR02"/></td>
					  <td><xsl:value-of select="PF04A/PF04AQ03"/></td>
					</tr>
					<xsl:if test="PF04Z/PF04ZS01 != '' and PF04Z/PF04ZS01 !=0">
						<tr>
						  <th colspan="7">标注及声明信息</th>
						</tr>
						<tr>
						  <th colspan="2">标注及声明类型</th>
						  <th colspan="4">标注或声明内容</th>
						  <th>添加日期</th>
						</tr>
						<xsl:for-each select="PF04Z/PF04ZH">
							<tr>
							  <td colspan="2"><span name="1041"><xsl:value-of select="PF04ZD01"/></span></td>
							  <td colspan="4"><xsl:value-of select="PF04ZQ01"/></td>
							  <td><xsl:value-of select="PF04ZR01"/></td>
							</tr>
						</xsl:for-each>
					</xsl:if>	
				</xsl:for-each>
			  </tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- （五）住房公积金参缴记录 -->
	<xsl:template match="PHF">
		<div class="t2 f-mgtop">（五）住房公积金参缴记录</div>
		<xsl:if test="PF05 != ''">
			<table class="g-tab-bor f-mgtop-s f-tab-nomargin">
			  <tbody>
				<tr>
				  <th class="g-w-8">参缴地</th>
				  <th class="g-w-8">参缴日期</th>
				  <th class="g-w-8">缴费状态</th>
				  <th class="g-w-8">初缴月份</th>
				  <th class="g-w-8">缴至月份</th>
				  <th class="g-w-8">单位缴存
				  <br />比例</th>
				  <th class="g-w-8">个人缴存
				  <br />比例</th>
				  <th class="g-w-8">月缴存额</th>
				</tr>
				<tr>
				  <th style="WIDTH: 85%" colspan="7">缴费单位</th>
				  <th style="WIDTH: 15%">信息更新
				  <br />日期</th>
				</tr>
				<xsl:for-each select="PF05">
					<tr>
					  <td><span name="3002"><xsl:value-of select="PF05A/PF05AQ01"/></span></td>
					  <td><xsl:value-of select="PF05A/PF05AR01"/></td>
					  <td><span name="1049"><xsl:value-of select="PF05A/PF05AD01"/></span></td>
					  <td><xsl:value-of select="PF05A/PF05AR02"/></td>
					  <td><xsl:value-of select="PF05A/PF05AR03"/></td>
					  <td><xsl:value-of select="PF05A/PF05AQ02"/></td>
					  <td><xsl:value-of select="PF05A/PF05AQ03"/></td>
					  <td><xsl:value-of select="PF05A/PF05AJ01"/></td>
					</tr>
					<tr>
					  <td colspan="7"><xsl:value-of select="PF05A/PF05AQ04"/></td>
					  <td><xsl:value-of select="PF05A/PF05AR04"/></td>
					</tr>
					<xsl:if test="PF05Z/PF05ZS01 != '' and PF05Z/PF05ZS01 !=0">
						<tr>
						  <th colspan="8">标注及声明信息</th>
						</tr>
						<tr>
						  <th colspan="2">标注及声明类型</th>
						  <th colspan="5">标注或声明内容</th>
						  <th>添加日期</th>
						</tr>
						<xsl:for-each select="PF05Z/PF05ZH">
							<tr>
							  <td colspan="2"><span name="1041"><xsl:value-of select="PF05ZD01"/></span></td>
							  <td colspan="5"><xsl:value-of select="PF05ZQ01"/></td>
							  <td><xsl:value-of select="PF05ZR01"/></td>
							</tr>
						</xsl:for-each>
					</xsl:if>	
				</xsl:for-each>
			  </tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- （六）低保救助记录 -->
	<xsl:template match="PBS">
		<div class="t2 f-mgtop">（六）低保救助记录</div>
		<xsl:if test="PF06 != ''">
			<table class="g-tab-bor f-mgtop-s f-tab-nomargin">
			  <tbody>
				<tr>
				  <th class="g-w-8">编号</th>
				  <th class="g-w-8">人员类别</th>
				  <th class="g-w-8">所在地</th>
				  <th class="g-w-8">工作单位</th>
				  <th class="g-w-8">家庭月收入</th>
				  <th class="g-w-8">申请日期</th>
				  <th class="g-w-8">批准日期</th>
				  <th class="g-w-8">信息更新日期</th>
				</tr>
				<xsl:for-each select="PF06">
					<tr>
					  <td><xsl:value-of select="position()"/></td>
					  <td><span name="1050"><xsl:value-of select="PF06A/PF06AD01"/></span></td>
					  <td><span name="3002"><xsl:value-of select="PF06A/PF06AQ01"/></span></td>
					  <td><xsl:value-of select="PF06A/PF06AQ02"/></td>
					  <td><xsl:value-of select="PF06A/PF06AQ03"/></td>
					  <td><xsl:value-of select="PF06A/PF06AR01"/></td>
					  <td><xsl:value-of select="PF06A/PF06AR02"/></td>
					  <td><xsl:value-of select="PF06A/PF06AR03"/></td>
					</tr>
					<xsl:if test="PF06Z/PF06ZS01 != '' and PF06Z/PF06ZS01 !=0">
						<tr>
						  <th colspan="8">标注及声明信息</th>
						</tr>
						<tr>
						  <th colspan="2">标注及声明类型</th>
						  <th colspan="5">标注或声明内容</th>
						  <th>添加日期</th>
						</tr>
						<xsl:for-each select="PF06Z/PF06ZH">
							<tr>
							  <td colspan="2"><span name="1041"><xsl:value-of select="PF06ZD01"/></span></td>
							  <td colspan="5"><xsl:value-of select="PF06ZQ01"/></td>
							  <td><xsl:value-of select="PF06ZR01"/></td>
							</tr>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			  </tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- （七）执业资格记录 -->
	<xsl:template match="PPQ">
		<div class="t2 f-mgtop">（七）执业资格记录</div>
		<xsl:if test="PF07 != ''">
			<table class="g-tab-bor f-mgtop-s f-tab-nomargin">
			  <tbody>
				<tr>
				  <th class="g-w-8">编号</th>
				  <th class="g-w-8">执业资格名称</th>
				  <th class="g-w-8">颁发机构</th>
				  <th class="g-w-8">等级</th>
				  <th class="g-w-8">机构所在地</th>
				  <th class="g-w-8">获得日期</th>
				  <th class="g-w-8">到期日期</th>
				  <th class="g-w-8">吊销日期</th>
				</tr>
				<xsl:for-each select="PF07">
					<tr>
					  <td><xsl:value-of select="position()"/></td>
					  <td><xsl:value-of select="PF07A/PF07AQ01"/></td>
					  <td><xsl:value-of select="PF07A/PF07AQ02"/></td>
					  <td><span name="1051"><xsl:value-of select="PF07A/PF07AD01"/></span></td>
					  <td><span name="3002"><xsl:value-of select="PF07A/PF07AD02"/></span></td>
					  <td><xsl:value-of select="PF07A/PF07AR01"/></td>
					  <td><xsl:value-of select="PF07A/PF07AR02"/></td>
					  <td><xsl:value-of select="PF07A/PF07AR03"/></td>
					</tr>
					<xsl:if test="PF07Z/PF07ZS01 != '' and PF07Z/PF07ZS01 !=0">
						<tr>
						  <th colspan="8">标注及声明信息</th>
						</tr>
						<tr>
						  <th colspan="2">标注及声明类型</th>
						  <th colspan="5">标注或声明内容</th>
						  <th>添加日期</th>
						</tr>
						<xsl:for-each select="PF07Z/PF07ZH">
							<tr>
							  <td colspan="2"><span name="1041"><xsl:value-of select="PF07ZD01"/></span></td>
							  <td colspan="5"><xsl:value-of select="PF07ZQ01"/></td>
							  <td><xsl:value-of select="PF07ZR01"/></td>
							</tr>
						</xsl:for-each>
					</xsl:if>	
				</xsl:for-each>
			  </tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- （八）行政奖励记录 -->
	<xsl:template match="PAH">
		<div class="t2 f-mgtop">（八）行政奖励记录</div>
		<xsl:if test="PF08 != ''">
			<table class="g-tab-bor f-mgtop-s f-tab-nomargin">
			  <tbody>
				<tr>
				  <th class="g-w-5">编号</th>
				  <th class="g-w-5">奖励机构</th>
				  <th class="g-w-5">奖励内容</th>
				  <th class="g-w-5">生效日期</th>
				  <th class="g-w-5">截止日期</th>
				</tr>
				<xsl:for-each select="PF08">
					<tr>
					  <td><xsl:value-of select="position()"/></td>
					  <td><xsl:value-of select="PF08A/PF08AQ01"/></td>
					  <td><xsl:value-of select="PF08A/PF08AQ02"/></td>
					  <td><xsl:value-of select="PF08A/PF08AR01"/></td>
					  <td><xsl:value-of select="PF08A/PF08AR02"/></td>
					</tr>
					<xsl:if test="PF08Z/PF08ZS01 != '' and PF08Z/PF08ZS01 !=0">
						<tr>
						  <th colspan="5">标注及声明信息</th>
						</tr>
						<tr>
						  <th colspan="2">标注及声明类型</th>
						  <th colspan="2">标注或声明内容</th>
						  <th>添加日期</th>
						</tr>
						<xsl:for-each select="PF08Z/PF08ZH">
							<tr>
							  <td colspan="2"><span name="1041"><xsl:value-of select="PF08ZD01"/></span></td>
							  <td colspan="2"><xsl:value-of select="PF08ZQ01"/></td>
							  <td><xsl:value-of select="PF08ZR01"/></td>
							</tr>
						</xsl:for-each>
					</xsl:if>	
				</xsl:for-each>
			  </tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- 六 本人声明 -->
	<xsl:template match="POS">
		<xsl:if test="PG01 != ''">
			<table class="g-tab-bor f-mgtop-s">
			  <tbody>
				<tr>
				  <th style="WIDTH: 7%">编号</th>
				  <th style="WIDTH: 31%">对象类型</th>
				  <th style="WIDTH: 31%">对象标识</th>
				  <th style="WIDTH: 31%">标注及声明类型个数</th>
				</tr>
				<xsl:for-each select="PG01">
					<tr>
					  <td><xsl:value-of select="position()"/></td>
					  <td><span name="1052"><xsl:value-of select="PG010D01"/></span></td>
					  <td><span name="1053"><xsl:value-of select="PG010D02"/></span></td>
					  <td><xsl:value-of select="PG010S01"/></td>
					</tr>
					<xsl:if test="PG010S01 != '' and PG010S01 !=0">
						<tr>
						  <th colspan="2">标注及声明类型</th>
						  <th>标注或声明内容</th>
						  <th>添加日期</th>
						</tr>
						<xsl:for-each select="PG010H">
							<tr>
							  <td colspan="2"><span name="1041"><xsl:value-of select="PG010D03"/></span></td>
							  <td><xsl:value-of select="PG010Q01"/></td>
							  <td><xsl:value-of select="PG010R01"/></td>
							</tr>
						</xsl:for-each>
					</xsl:if>	
				</xsl:for-each>
			  </tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- 七 查询记录 -->
	<xsl:template match="POQ">
		<xsl:if test="PH01 != ''">
			<table class="g-tab-bor f-tab-nomargin">
			  <tbody>
				<tr>
				  <th class="g-w-5">编号</th>
				  <th class="g-w-5">查询日期</th>
				  <th class="g-w-5">查询机构类型</th>
				  <th class="g-w-5">查询机构</th>
				  <th class="g-w-5">查询原因</th>
				</tr>
				<xsl:for-each select="PH01">
					<tr>
					  <td><xsl:value-of select="position()"/></td>
					  <td><xsl:value-of select="PH010R01"/></td>
					  <td><span name="1021"><xsl:value-of select="PH010D01"/></span></td>
					  <td><xsl:value-of select="PH010Q02"/></td>
					  <td><span name="1054"><xsl:value-of select="PH010Q03"/></span></td>
					</tr>
				</xsl:for-each>
			  </tbody>
			</table>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>