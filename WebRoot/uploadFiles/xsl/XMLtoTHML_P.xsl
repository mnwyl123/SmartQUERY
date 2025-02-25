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
	<xsl:output method="html" version="1.0" encoding="gb2312"/>
	<xsl:template match="/Document">
		<html oncontextmenu="return false" onselectstart="return false">
			<head>
				<title>个人信用报告</title>
				<style type="text/css">
					<!--
					屏蔽打印按钮
					@media print{
						body{display:none}
					}
					-->
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
			</head>
			<body>
				<!-- 报文头信息 -->
				<xsl:apply-templates select="PRH/PA01"/>
				<!-- 一 个人基本信息 -->
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="2" align="center">
							<font style="font-size: 16.0pt;font-weight:bold;">一 个人基本信息</font>
							<br/>
							<br/>
						</td>
					</tr>
				</table>
				<!-- （一）身份信息 -->
				<xsl:apply-templates select="PIM/PB01"/>
				<!-- （二）婚姻信息 -->
				<xsl:apply-templates select="PMM/PB02"/>
				<!-- （三）居住信息 -->
				<xsl:apply-templates select="PRM"/>
				<!-- （四）职业信息 -->
				<xsl:apply-templates select="POM"/>
				<!-- 二 信息概要 -->
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="2" align="center">
							<font style="font-size: 16.0pt;font-weight:bold;">二 信息概要</font>
							<br/>
							<br/>
						</td>
					</tr>
				</table>
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
				<!-- 三 信贷交易信息明细 -->
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="2" align="center">
							<font style="font-size: 16.0pt;font-weight:bold;">三 信贷交易信息明细</font>
							<br/>
							<br/>
						</td>
					</tr>
				</table>
				<!-- （一）被追偿信息（二）非循环贷账户（三）循环额度下分账户（四）循环贷账户（五）贷记卡账户（六）准贷记卡账户  -->
				<xsl:apply-templates select="PDA"/>
				<!-- （七）授信协议信息 -->
				<xsl:apply-templates select="PCA"/>
				<!-- （八）相关还款责任信息 -->
				<xsl:apply-templates select="PCR"/>
				<!-- 四 非信贷交易信息明细 -->
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="2" align="center">
							<font style="font-size: 16.0pt;font-weight:bold;">四 非信贷交易信息明细</font>
							<br/>
							<br/>
						</td>
					</tr>
				</table>
				<xsl:apply-templates select="PND"/>
				<!-- 五 公共信息明细 -->
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="2" align="center">
							<font style="font-size: 16.0pt;font-weight:bold;">五 公共信息明细</font>
							<br/>
							<br/>
						</td>
					</tr>
				</table>
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
				<!-- 六 本人声明 -->
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="2" align="center">
							<font style="font-size: 16.0pt;font-weight:bold;">六 本人声明</font>
							<br/>
							<br/>
						</td>
					</tr>
				</table>
				<xsl:apply-templates select="POS"/>
				<!-- 七 查询记录 -->
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="2" align="center">
							<font style="font-size: 16.0pt;font-weight:bold;">七 查询记录</font>
							<br/>
							<br/>
						</td>
					</tr>
				</table>
				<xsl:apply-templates select="POQ"/>
				<!-- 报告说明 -->
				<xsl:apply-templates select="PRH"/>
				<script>
					watermark({ watermark_txt: "张三提供" })//传入动态水印内容
						function watermark(settings) {
						//默认设置
						var defaultSettings={
							watermark_txt:"text",
							watermark_x:300,//水印起始位置x轴坐标
							watermark_y:100,//水印起始位置Y轴坐标
							watermark_rows:10,//水印行数
							watermark_cols:3,//水印列数
							watermark_x_space:100,//水印x轴间隔
							watermark_y_space:50,//水印y轴间隔
							watermark_color:'red',//水印字体颜色
							watermark_alpha:0.3,//水印透明度
							watermark_fontsize:'18px',//水印字体大小
							watermark_font:'微软雅黑',//水印字体
							watermark_width:120,//水印宽度
							watermark_height:80,//水印长度
							watermark_angle:15//水印倾斜度数
						};
						//采用配置项替换默认值，作用类似jquery.extend
						if(arguments.length===1&amp;&amp;typeof arguments[0] ==="object" )
						{
							var src=arguments[0]||{};
							for(key in src)
							{
								if(src[key]&amp;&amp;defaultSettings[key]&amp;&amp;src[key]===defaultSettings[key])
									continue;
								else if(src[key])
									defaultSettings[key]=src[key];
							}
						}
					 
						var oTemp = document.createDocumentFragment();
					 
						//获取页面最大宽度
						var page_width = Math.max(document.body.scrollWidth,document.body.clientWidth);
						//获取页面最大长度
						var page_height = Math.max(document.body.scrollHeight,document.body.clientHeight);
					 
						//如果将水印列数设置为0，或水印列数设置过大，超过页面最大宽度，则重新计算水印列数和水印x轴间隔
						if (defaultSettings.watermark_cols == 0 ||
					   　　　　(parseInt(defaultSettings.watermark_x 
					　　　　+ defaultSettings.watermark_width *defaultSettings.watermark_cols 
					　　　　+ defaultSettings.watermark_x_space * (defaultSettings.watermark_cols - 1)) 
					　　　　> page_width)) {
							defaultSettings.watermark_cols = 
					　　　　　　parseInt((page_width
					　　　　　　　　　　-defaultSettings.watermark_x
					　　　　　　　　　　+defaultSettings.watermark_x_space) 
					　　　　　　　　　　/ (defaultSettings.watermark_width 
					　　　　　　　　　　+ defaultSettings.watermark_x_space));
							defaultSettings.watermark_x_space = 
					　　　　　　parseInt((page_width 
					　　　　　　　　　　- defaultSettings.watermark_x 
					　　　　　　　　　　- defaultSettings.watermark_width 
					　　　　　　　　　　* defaultSettings.watermark_cols) 
					　　　　　　　　　　/ (defaultSettings.watermark_cols - 1));
						}
						//如果将水印行数设置为0，或水印行数设置过大，超过页面最大长度，则重新计算水印行数和水印y轴间隔
						if (defaultSettings.watermark_rows == 0 ||
					   　　　　(parseInt(defaultSettings.watermark_y 
					　　　　+ defaultSettings.watermark_height * defaultSettings.watermark_rows 
					　　　　+ defaultSettings.watermark_y_space * (defaultSettings.watermark_rows - 1)) 
					　　　　> page_height)) {
							defaultSettings.watermark_rows = 
					　　　　　　parseInt((defaultSettings.watermark_y_space 
					　　　　　　　　　　　+ page_height - defaultSettings.watermark_y) 
					　　　　　　　　　　　/ (defaultSettings.watermark_height + defaultSettings.watermark_y_space));
							defaultSettings.watermark_y_space = 
					　　　　　　parseInt((page_height 
					　　　　　　　　　　- defaultSettings.watermark_y 
					　　　　　　　　　　- defaultSettings.watermark_height 
					　　　　　　　　　　* defaultSettings.watermark_rows) 
					　　　　　　　　　/ (defaultSettings.watermark_rows - 1));
						}
						var x;
						var y;
						for(var i = 0; i &lt; defaultSettings.watermark_rows; i++) {
							y = defaultSettings.watermark_y + (defaultSettings.watermark_y_space + defaultSettings.watermark_height) * i;
						for (var j = 0; j &lt; defaultSettings.watermark_cols; j++) {
								x = defaultSettings.watermark_x + (defaultSettings.watermark_width + defaultSettings.watermark_x_space) * j;
					 
								var mask_div = document.createElement('div');
								mask_div.id = 'mask_div' + i + j;
								mask_div.appendChild(document.createTextNode(defaultSettings.watermark_txt));
								//设置水印div倾斜显示
								mask_div.style.webkitTransform = "rotate(-" + defaultSettings.watermark_angle + "deg)";
								mask_div.style.MozTransform = "rotate(-" + defaultSettings.watermark_angle + "deg)";
								mask_div.style.msTransform = "rotate(-" + defaultSettings.watermark_angle + "deg)";
								mask_div.style.OTransform = "rotate(-" + defaultSettings.watermark_angle + "deg)";
								mask_div.style.transform = "rotate(-" + defaultSettings.watermark_angle + "deg)";
								mask_div.style.visibility = "";
								mask_div.style.position = "absolute";
								mask_div.style.left = x + 'px';
								mask_div.style.top = y + 'px';
								mask_div.style.overflow = "hidden";
								mask_div.style.zIndex = "9999";
								//mask_div.style.border="solid #eee 1px";
								mask_div.style.opacity = defaultSettings.watermark_alpha;
								mask_div.style.fontSize = defaultSettings.watermark_fontsize;
								mask_div.style.fontFamily = defaultSettings.watermark_font;
								mask_div.style.color = defaultSettings.watermark_color;
								mask_div.style.textAlign = "center";
								mask_div.style.width = defaultSettings.watermark_width + 'px';
								mask_div.style.height = defaultSettings.watermark_height + 'px';
								mask_div.style.display = "block";
								oTemp.appendChild(mask_div);
							};
						};
						document.body.appendChild(oTemp);
					}
				</script>
				<script src="../../js/common/jquery-1.10.2.js"></script><SCRIPT>function printReport(){ javascript:document.execCommand('print');$.ajax({async:false,cache:false,data:{"ID":'a8b7037f48cf4924a2a62b9e048f7d3ea6d2b0c985a540279085e38db3f05163'},url:'../../../PersonReportInquiry/isPrint.do',type:"post" });}</SCRIPT><script>document.oncontextmenu = function(){return false;}</script>
				<form method="POST" action="--WEBBOT-SELF--"> 
				   <p align="center"> 
					<input onMouseOver="msover();" style="border:1px solid #cc9966; FONT-WEIGHT: normal; FONT-SIZE: 10pt; BACKGROUND: #fff6dc; COLOR: #000000; LINE-HEIGHT: normal; FONT-STYLE: normal; HEIGHT: 30; FONT-VARIANT: normal; width:58" onMouseOut="msout();" type="button" name="doPrint" value="打  印" class="button2" onclick="printReport()"/>&#160;&#160;
					<input onMouseOver="msover();" style="border:1px solid #cc9966; FONT-WEIGHT: normal; FONT-SIZE: 10pt; BACKGROUND: #fff6dc; COLOR: #000000; LINE-HEIGHT: normal; FONT-STYLE: normal; HEIGHT: 30; FONT-VARIANT: normal; width:58" onMouseOut="msout();" type="button" name="goBack" value="关  闭" class="button1" onclick="window.location.href=document.referrer;"/> </p> 
				</form>
			</body>
		</html>
	</xsl:template>
<!-- 报告说明 -->
	<xsl:template match="PRH">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="2">
			<tr>
				<td height="4" colspan="4">
					<div align="center" class="style2">
						<font style="font-size: 18.0pt;font-weight:bold">报告说明</font>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="4" height="30">&#160;</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					1.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">本报告由中国人民银行征信中心出具，依据截至报告时点的个人征信系统记录的信息生成。除查询记录外，其他信息均由相关机构提供，征信中心不保证其真实性和准确性，但承诺在信息汇总、加工、整合的全过程中保持客观、中立的地位。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					2.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">本报告中的“数字解读”仅供使用本信用报告的银行等授信机构参考，授信机构应自行承担使用“数字解读”的相关法律责任。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					3.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">“数字解读”将信用报告内容解读为一个数值，是对信用主体未来信贷违约可能性的预测，其取值范围为0到1000，分值越高，违约可能性越低；“相对位置”是信用主体的数字解读值在全部人群中的百分比排序位置，比如“>50%”代表该数字解读值高于50%的信用主体；“说明”中的“影响因素”是影响信用主体获得更高数字解读值的原因，根据当前信用报告的实际情况给出，最多有两条。“数字解读”显示为“--”的，仅代表无法根据当前信用报告内容给出数字解读值，并无其他含义。无法给出数字解读值的具体原因见“说明”。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					4.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">本报告的信贷交易信息提示中，“业务类型”为“其他”的汇总信息不包含“资产处置”和“垫款”业务。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					5.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">本报告中如果没有“信贷交易违约信息概要”信息，说明信用主体最近5年内没有连续逾期。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					6.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">对于存在授信限额的协议信息，信息主体的可用额度需结合“授信协议信息”中的授信额度、授信限额信息和余额进行估算。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					7.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">本报告中的信贷交易授信及负债信息概要展示的信息是指未结清/未销户的授信及负债信息。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					8.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">本报告的借贷交易明细信息中，循环贷账户的到期日期是指账户授信额度的到期日期。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					9.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">本报告的借贷交易明细信息中，借贷账户展示最近5年的还款情况，包括当前还款状态和当前逾期总额。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					10.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">对于通过自助渠道办理的“小额、高频”业务，金融机构将合并报送相关账户，展示在本报告的借贷交易明细信息中；此时账户的还款方式为“不区分还款方式”，该账户的还款频率统一约定为“月”，“还款期数”按月计算，其还款信息按月进行观测和更新。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					11.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">本报告中的逾期准贷记卡账户是指该账户60天以上的透支行为。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					12.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">本报告中的还款期数为“--”是指该账户是非分期还款。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					13.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">本报告不展示5年前已经结束的违约行为，以及5年前的欠税记录、强制执行记录、民事判决记录、行政处罚记录、电信欠费记录。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					14.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">机构说明是数据提供机构对具体业务添加的特别说明信息。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					15.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">本人声明是信息主体对信用报告中的信息所附注的简要说明，信用主体对本人声明的真实性负责。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					16.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">异议标注是征信中心添加的，用于说明信用主体对信用报告中的哪些信息有异议。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					17.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">本报告内容涉及个人隐私，查询者应依法使用、妥善保管。因使用不当造成个人信息泄露的，征信中心将不承担相关责任。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					18.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">本报告中所有金额（除“有相关还款责任的企业借款”中的金额外）均为人民币金额，参照查询日前一天的汇率。</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					19.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">本报告整合了数据提供机构以信息主体不同证件报送的信息。</font>
				</td>
			</tr>
		</table>
	</xsl:template>
<!-- 报文头信息 -->
	<xsl:template match="PRH/PA01">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td colspan="2" align="center">
					<font style="font-size: 32.0pt;font-weight:bold;">个人信用报告</font>
					<br/>
					<br/>
					<font style="font-size: 16.0pt;font-weight:bold;">(授信机构版)</font>
					<br/>
					<br/>
				</td>
			</tr>
		</table>
		<br/>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td width="50%" height="25px" align="left" colspan="3">
					<font style="font-size: 12.0pt;">&#160;报告编号： &#160;<xsl:value-of select="PA01A/PA01AI01"/>
					</font>
				</td>
				<td width="50%" height="25px" align="right" colspan="2">
					<font style="font-size: 12.0pt">报告时间： &#160;<xsl:value-of select="PA01A/PA01AR01"/>&#160;</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">被查询者姓名</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">被查询者证件类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">被查询者证件号码</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">查询机构</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">查询原因</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PA01B/PA01BQ01"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<span name="3005"><xsl:value-of select="PA01B/PA01BD01"/></span>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PA01B/PA01BI01"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PA01B/PA01BI02"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<span name="1054"><xsl:value-of select="PA01B/PA01BD02"/></span>
					</font>
				</td>
			</tr>
		</table>
		<br/>
		<xsl:if test="PA01C != ''">
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;font-weight:bold;">
						其他证件信息（证件个数：<xsl:value-of select="PA01C/PA01CS01"/>）
						</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">证件类型</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">证件号码</font>
					</td>
				</tr>
				<xsl:for-each select="PA01C/PA01CH">
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<span name="3005"><xsl:value-of select="PA01CD01"/></span>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PA01CI01"/>
							</font>
						</td>
					</tr>
				</xsl:for-each>
			</table>
			<br/>
		</xsl:if>
		<xsl:if test="PA01D/PA01DQ01 = '1'">
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;font-weight:bold;">防欺诈警示</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">防欺诈警示标志</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">防欺诈警示联系电话</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">防欺诈警示生效日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">防欺诈警示截止日期</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="3006"><xsl:value-of select="PA01D/PA01DQ01"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PA01D/PA01DQ02"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PA01D/PA01DR01"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PA01D/PA01DR02"/>
						</font>
					</td>
				</tr>
			</table>
			<br/>
		</xsl:if>
		<xsl:if test="PA01E/PA01ES01 != 0">
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;font-weight:bold;">异议信息提示</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<!--<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">信息主体对信用报告内容提出了 &#160;<xsl:value-of select="PA01E/PA01ES01"/> 笔异议且正在处理中，请浏览时注意阅读相关内容。</font>
					</td>
				</tr>-->
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">异议标注数目</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PA01E/PA01ES01"/>
						</font>
					</td>
				</tr>
			</table>
			<br/>
		</xsl:if>
	</xsl:template>
<!-- 一 个人基本信息 -->
	<!-- （一）身份信息 -->
	<xsl:template match="PIM/PB01">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">（一）身份信息</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">性别</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">出生日期</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">婚姻状况</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">学历</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">学位</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">就业状况</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">国籍</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">电子邮箱</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<span name="1002"><xsl:value-of select="PB01A/PB01AD01"/></span>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PB01A/PB01AR01"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<span name="1008"><xsl:value-of select="../../PMM/PB02/PB020D01"/></span>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<span name="1005"><xsl:value-of select="PB01A/PB01AD02"/></span>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<span name="1006"><xsl:value-of select="PB01A/PB01AD03"/></span>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<span name="1007"><xsl:value-of select="PB01A/PB01AD04"/></span>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<span name="3001"><xsl:value-of select="PB01A/PB01AD05"/></span>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PB01A/PB01AQ01"/>
					</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle" colspan="5">
					<font style="font-size: 12.0pt;font-weight:bold;">通讯地址</font>
				</td>
				<td height="25px" align="center" class="tdStyle" colspan="3">
					<font style="font-size: 12.0pt;font-weight:bold;">户籍地址</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" colspan="5">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PB01A/PB01AQ02"/>
					</font>
				</td>
				<td height="25px" align="center" colspan="3">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PB01A/PB01AQ03"/>
					</font>
				</td>
			</tr>
			<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle" colspan="8">
						<font style="font-size: 12.0pt;font-weight:bold;">
						手机号码个数：<xsl:value-of select="PB01B/PB01BS01"/>
						</font>
					</td>
				</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle" colspan="4">
					<font style="font-size: 12.0pt;font-weight:bold;">手机号码</font>
				</td>
				<td height="25px" align="center" class="tdStyle" colspan="3">
					<font style="font-size: 12.0pt;font-weight:bold;">信息更新日期</font>
				</td>
			</tr>
			<xsl:for-each select="PB01B/PB01BH">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							<xsl:number value="position()"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="4">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PB01BQ01"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="3">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PB01BR01"/>
						</font>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
	</xsl:template>
	<!-- （二）婚姻信息 -->
	<xsl:template match="PMM/PB02">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">（二）配偶信息</font>
				</td>
			</tr>
		</table>
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
					<font style="font-size: 12.0pt;font-weight:bold;">工作单位</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">联系电话</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PB020Q01"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<span name="3005"><xsl:value-of select="PB020D02"/></span>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PB020I01"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PB020Q02"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PB020Q03"/>
					</font>
				</td>
			</tr>
		</table>
		<br/>
	</xsl:template>
	<!-- （三）居住信息 -->
	<xsl:template match="PRM">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">（三）居住信息</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">居住地址</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">住宅电话</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">居住状况</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息更新日期</font>
				</td>
			</tr>
			<xsl:for-each select="PB03">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							<xsl:number value="position()"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PB030Q01"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PB030Q02"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1009"><xsl:value-of select="PB030D01"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PB030R01"/>
						</font>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
	</xsl:template>
	<!-- （四）职业信息 -->
	<xsl:template match="POM">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">（四）职业信息</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle" colspan="3">
					<font style="font-size: 12.0pt;font-weight:bold;">
					就业状况
					</font>
				</td>
				<td height="25px" align="center" class="tdStyle" colspan="4">
					<font style="font-size: 12.0pt;font-weight:bold;">
					&#160;<span name="1007"><xsl:value-of select="PB04/PB040D01"/></span>
					</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">工作单位</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">单位性质</font>
				</td>
				<td height="25px" align="center" class="tdStyle" colspan="3">
					<font style="font-size: 12.0pt;font-weight:bold;">单位地址</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">单位电话</font>
				</td>
			</tr>
			<xsl:for-each select="PB04">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							<xsl:number value="position()"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PB040Q01"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1010"><xsl:value-of select="PB040D02"/></span>
						</font>
					</td>
					<td height="25px" align="center" colspan="3">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PB040Q02"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PB040Q03"/>
						</font>
					</td>
				</tr>
			</xsl:for-each>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">编号</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">职业</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">行业</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">职务</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">职称</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">进入本单位年份</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">信息更新日期</font>
				</td>
			</tr>
			<xsl:for-each select="PB04">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							<xsl:number value="position()"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1012"><xsl:value-of select="PB040D04"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1011"><xsl:value-of select="PB040D03"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1013"><xsl:value-of select="PB040D05"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1014"><xsl:value-of select="PB040D06"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PB040R01"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PB040R02"/>
						</font>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
	</xsl:template>
<!-- 二 信息概要 -->
	<!-- （一）个人信用报告“数字解读” -->
	<xsl:template match="PSM/PC01">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">（一）个人信用报告“数字解读”</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">数字解读</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">相对位置</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">分数说明条数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">说明</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC010Q01"/>
					</font>
				</td>
				<td height="25px" align="center" rowspan="2">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC010Q02"/>
					</font>
				</td>
				<td height="25px" align="center" rowspan="2">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC010S01"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<span name="1015"><xsl:value-of select="PC010D01"/></span>
					</font>
				</td>
			</tr>
			<xsl:if test="PC010S01 = 2">
				<xsl:for-each select="PC010D01">
					<xsl:if test="position()=2">
						<tr style="line-height:20px">
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="text()"/>
								</font>
							</td>
						</tr>
					</xsl:if>
				</xsl:for-each>
			</xsl:if>
		</table>
		<br/>
	</xsl:template>
	<!-- （二）信贷交易信息提示 （三）信贷交易违约信息概要 （四）信贷交易授信及负债信息概要 -->
	<xsl:template match="PCO/PC02">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">（二）信贷交易信息提示</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle" colspan="2">
					<font style="font-size: 12.0pt;font-weight:bold;">业务类型数量</font>
				</td>
				<td height="25px" align="center" class="tdStyle" colspan="2">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数合计</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" colspan="2">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02A/PC02AS02"/>
					</font>
				</td>
				<td height="25px" align="center" colspan="2">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02A/PC02AS01"/>
					</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务大类</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">首笔业务发放月份</font>
				</td>
			</tr>
			<xsl:for-each select="PC02A/PC02AH">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1003"><xsl:value-of select="PC02AD01"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1004"><xsl:value-of select="PC02AD02"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PC02AS03"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PC02AR01"/>
						</font>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">（三）信贷交易违约信息概要</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle" colspan="3">
					<font style="font-size: 12.0pt;font-weight:bold;">被追偿信息汇总</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务类型数量</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数合计</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额合计</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02B/PC02BS02"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02B/PC02BS01"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02B/PC02BJ01"/>
					</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">业务类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
			</tr>
			<xsl:for-each select="PC02B/PC02BH">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1016"><xsl:value-of select="PC02BD01"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PC02BS03"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PC02BJ02"/>
						</font>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle" colspan="2">
					<font style="font-size: 12.0pt;font-weight:bold;">呆账信息汇总</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02C/PC02CS01"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02C/PC02CJ01"/>
					</font>
				</td>
			</tr>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle" colspan="5">
					<font style="font-size: 12.0pt;font-weight:bold;">
					逾期（透支）信息汇总（账户信息数量：<xsl:value-of select="PC02D/PC02DS01"/>）</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">月份数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">单月最高逾期/透支总额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最长逾期/透支月数</font>
				</td>
			</tr>
			<xsl:for-each select="PC02D/PC02DH">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1017"><xsl:value-of select="PC02DD01"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PC02DS02"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PC02DS03"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PC02DJ01"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PC02DS04"/>
						</font>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">（四）信贷交易授信及负债信息概要</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle" colspan="5">
					<font style="font-size: 12.0pt;font-weight:bold;">非循环贷账户信息汇总</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">管理机构数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">授信总额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近 6 个月平均应还款</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02E/PC02ES01"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02E/PC02ES02"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02E/PC02EJ01"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02E/PC02EJ02"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02E/PC02EJ03"/>
					</font>
				</td>
			</tr>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle" colspan="5">
					<font style="font-size: 12.0pt;font-weight:bold;">循环额度下分账户信息汇总</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">管理机构数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">授信总额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近 6 个月平均应还款</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02F/PC02FS01"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02F/PC02FS02"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02F/PC02FJ01"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02F/PC02FJ02"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02F/PC02FJ03"/>
					</font>
				</td>
			</tr>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle" colspan="5">
					<font style="font-size: 12.0pt;font-weight:bold;">循环贷账户信息汇总</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">管理机构数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">授信总额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近 6 个月平均应还款</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02G/PC02GS01"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02G/PC02GS02"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02G/PC02GJ01"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02G/PC02GJ02"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02G/PC02GJ03"/>
					</font>
				</td>
			</tr>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle" colspan="7">
					<font style="font-size: 12.0pt;font-weight:bold;">贷记卡账户信息汇总</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">发卡机构数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">授信总额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">单家机构最高授信额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">单家机构最低授信额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">已用额度</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近 6 个月平均使用额度</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02H/PC02HS01"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02H/PC02HS02"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02H/PC02HJ01"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02H/PC02HJ02"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02H/PC02HJ03"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02H/PC02HJ04"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02H/PC02HJ05"/>
					</font>
				</td>
			</tr>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle" colspan="7">
					<font style="font-size: 12.0pt;font-weight:bold;">准贷记卡账户信息汇总</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">发卡机构数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">授信总额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">单家机构最高授信额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">单家机构最低授信额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">透支余额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">最近 6 个月平均透支余额</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02I/PC02IS01"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02I/PC02IS02"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02I/PC02IJ01"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02I/PC02IJ02"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02I/PC02IJ03"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02I/PC02IJ04"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC02I/PC02IJ05"/>
					</font>
				</td>
			</tr>
		</table>
		<br/>
		<xsl:if test="PC02K != ''">
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle" colspan="6">
					<font style="font-size: 12.0pt;font-weight:bold;">
					相关还款责任信息汇总（相关还款责任个数：<xsl:value-of select="PC02K/PC02KS01"/>）
					</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">借款人身份类别</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">还款责任类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">还款责任金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
			</tr>
			<xsl:for-each select="PC02K/PC02KH">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="3004"><xsl:value-of select="PC02KD01"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1019"><xsl:value-of select="PC02KD02"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PC02KS02"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PC02KJ01"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PC02KJ02"/>
						</font>
					</td>
				</tr>
			</xsl:for-each>
			<!--<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle" colspan="6">
					<font style="font-size: 12.0pt;font-weight:bold;">为个人</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle" colspan="3">
					<font style="font-size: 12.0pt;font-weight:bold;">担保责任</font>
				</td>
				<td height="25px" align="center" class="tdStyle" colspan="3">
					<font style="font-size: 12.0pt;font-weight:bold;">其他相关还款责任</font>
				</td>
			</tr>
			<tr style="line-height:20px">
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
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">还款责任金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<xsl:for-each select="PC02K/PC02KH">
					<xsl:if test="PC02KD01=1 and PC02KD02=1">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PC02KS02"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PC02KJ01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PC02KJ02"/>
							</font>
						</td>
					</xsl:if>
					<xsl:if test="PC02KD01=1 and PC02KD02=9">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PC02KS02"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PC02KJ01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PC02KJ02"/>
							</font>
						</td>
					</xsl:if>
				</xsl:for-each>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle" colspan="6">
					<font style="font-size: 12.0pt;font-weight:bold;">为企业</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle" colspan="3">
					<font style="font-size: 12.0pt;font-weight:bold;">担保责任</font>
				</td>
				<td height="25px" align="center" class="tdStyle" colspan="3">
					<font style="font-size: 12.0pt;font-weight:bold;">其他相关还款责任</font>
				</td>
			</tr>
			<tr style="line-height:20px">
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
					<font style="font-size: 12.0pt;font-weight:bold;">账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">还款责任金额</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<xsl:for-each select="PC02K/PC02KH">
					<xsl:if test="PC02KD01=2 and PC02KD02=1">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PC02KS02"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PC02KJ01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PC02KJ02"/>
							</font>
						</td>
					</xsl:if>
					<xsl:if test="PC02KD01=2 and PC02KD02=9">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PC02KS02"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PC02KJ01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PC02KJ02"/>
							</font>
						</td>
					</xsl:if>
				</xsl:for-each>
			</tr>-->
		</table>
		<br/>
		</xsl:if>
	</xsl:template>
	<!-- （五）非信贷交易信息概要 -->
	<xsl:template match="PNO/PC03">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">（五）非信贷交易信息概要</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle" colspan="3">
					<font style="font-size: 12.0pt;font-weight:bold;">
					后付费业务欠费信息汇总（后付费业务类型数量：<xsl:value-of select="PC030S01"/>）
					</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">后付费业务类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">欠费账户数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">欠费金额</font>
				</td>
			</tr>
			<xsl:for-each select="PC030H">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1055"><xsl:value-of select="PC030D01"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PC030S02"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PC030J01"/>
						</font>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
	</xsl:template>
	<!-- （六）公共信息概要 -->
	<xsl:template match="PPO/PC04">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">（六）公共信息概要</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle" colspan="3">
					<font style="font-size: 12.0pt;font-weight:bold;">
					公共信息汇总（公共信息类型数量：<xsl:value-of select="PC040S01"/>）
					</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">公共信息类型</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">记录数</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">涉及金额</font>
				</td>
			</tr>
			<xsl:for-each select="PC040H">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1020"><xsl:value-of select="PC040D01"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PC040S02"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PC040J01"/>
						</font>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
	</xsl:template>
	<!-- （七）查询记录概要 -->
	<xsl:template match="PQO/PC05">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">（七）查询记录概要</font>
				</td>
			</tr>
		</table>
		<xsl:if test="PC05A != ''">
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle" colspan="4">
						<font style="font-size: 12.0pt;font-weight:bold;">上一次查询记录</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">上一次查询日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">上一次查询机构类型</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">上一次查询机构代码</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">上一次查询原因</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PC05A/PC05AR01"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1021"><xsl:value-of select="PC05A/PC05AD01"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PC05A/PC05AI01"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1054"><xsl:value-of select="PC05A/PC05AQ01"/></span>
						</font>
					</td>
				</tr>
			</table>
			<br/>
		</xsl:if>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle" colspan="2">
					<font style="font-size: 12.0pt;font-weight:bold;">最近 1 个月内的查询机构数</font>
				</td>
				<td height="25px" align="center" class="tdStyle" colspan="3">
					<font style="font-size: 12.0pt;font-weight:bold;">最近 1 个月内的查询次数</font>
				</td>
				<td height="25px" align="center" class="tdStyle" colspan="3">
					<font style="font-size: 12.0pt;font-weight:bold;">最近 2 年内的查询次数</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">
						贷款审批
					</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">
						信用卡审批
					</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">
						贷款审批
					</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">
						信用卡审批
					</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">
						本人查询
					</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">
						贷后管理
					</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">
						担保资格审查
					</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">
						特约商户实名审查
					</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC05B/PC05BS01"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC05B/PC05BS02"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC05B/PC05BS03"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC05B/PC05BS04"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC05B/PC05BS05"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC05B/PC05BS06"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC05B/PC05BS07"/>
					</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">
						&#160;<xsl:value-of select="PC05B/PC05BS08"/>
					</font>
				</td>
			</tr>
		</table>
		<br/>
	</xsl:template>
<!-- 三 信贷交易信息明细 -->
	<!-- （一）被追偿信息C1（二）非循环贷账户D1（三）循环额度下分账户R4（四）循环贷账户R1（五）贷记卡账户R2（六）准贷记卡账户R3  -->
	<xsl:template match="PDA">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">（一）被追偿信息</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="PD01[PD01A/PD01AD01 = 'C1']">
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="left">
						<font style="font-size: 12.0pt;font-weight:bold;">账户<xsl:number value="position()"/>
						</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;font-weight:bold;">基本信息</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">账户编号</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">账户类型</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构类型</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构代码</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">账户标识</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">授信协议编号</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">业务种类</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">开立日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">币种</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">借款金额</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AI01"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;催收账户
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1021"><xsl:value-of select="PD01A/PD01AD02"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AI02"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AI03"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AI04"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1023"><xsl:value-of select="PD01A/PD01AD03"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AR01"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="3003"><xsl:value-of select="PD01A/PD01AD04"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AJ01"/>
						</font>
					</td>
				</tr>
				<tr>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">账户授信额度</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">共享授信额度</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">到期日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">还款方式</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">还款频率</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">还款期数</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">担保方式</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">贷款发放形式</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">共同借款标志</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">债权转移时的还款状态</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AJ02"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AJ03"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AR02"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1024"><xsl:value-of select="PD01A/PD01AD05"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1025"><xsl:value-of select="PD01A/PD01AD06"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AS01"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1026"><xsl:value-of select="PD01A/PD01AD07"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1027"><xsl:value-of select="PD01A/PD01AD08"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1028"><xsl:value-of select="PD01A/PD01AD09"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1029"><xsl:value-of select="PD01A/PD01AD10"/></span>
						</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;font-weight:bold;">最新表现信息</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">账户状态</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">关闭日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">转出月份</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">最近一次还款日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">最近一次还款金额</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">五级分类</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">还款状态</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="4">
						<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1034"><xsl:value-of select="PD01B/PD01BD01"/></span>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BR01"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BR04"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BJ01"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BR02"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BJ02"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1035"><xsl:value-of select="PD01B/PD01BD03"/></span>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BD04"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="4">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BR03"/>
						</font>
					</td>
				</tr>
			</table>
			<xsl:if test="PD01C/PD01CR01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;font-weight:bold;">最近一次月度表现</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">月份</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">账户状态</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">已用额度</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">未出单的大额专项分期余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">五级分类</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">剩余还款期数</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">结算/应还款日</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">本月应还款</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">本月实还款</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最近一次还款日期</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">当前逾期期数</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CR01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<span name="1034"><xsl:value-of select="PD01C/PD01CD01"/></span>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ02"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ03"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<span name="1035"><xsl:value-of select="PD01C/PD01CD02"/></span>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CS01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CR02"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ04"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ05"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CR03"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CS02"/>
							</font>
						</td>
					</tr>
					<tr>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">当前逾期总额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期 31—60 天未还本金</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期 61－90 天未还本金</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期 91－180 天未还本金</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期 180 天以上未还本金</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">透支 180 天以上未付余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最近 6 个月平均使用额度</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最近 6 个月平均透支余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最大使用额度</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最大透支余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle" colspan="2">
							<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ06"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ07"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ08"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ09"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ10"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ11"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ12"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ13"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ14"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ15"/>
							</font>
						</td>
						<td height="25px" align="center" colspan="2">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CR04"/>
							</font>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="PD01D/PD01DR01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;font-weight:bold;">最近 24 个月还款状态</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">起始年月</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">截止年月</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01D/PD01DR01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01D/PD01DR02"/>
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">月份</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">还款状态</font>
						</td>
					</tr>
					
					<xsl:for-each select="PD01D/PD01DH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01DR03"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01DD01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01E/PD01ER01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;font-weight:bold;">最近 5 年内的历史表现</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">起始年月</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">截止年月</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">月数</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01E/PD01ER01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01E/PD01ER02"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01E/PD01ES01"/>
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">月份</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">还款状态</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期（透支） 总额</font>
						</td>
					</tr>
					<xsl:for-each select="PD01E/PD01EH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01ER03"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01ED01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01EJ01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01F/PD01FS01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							特殊交易信息（特殊交易个数：<xsl:value-of select="PD01F/PD01FS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊交易类型</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊交易发生日期</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">到期日期变更月数</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊交易发生金额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊交易明细记录</font>
						</td>
					</tr>
					<xsl:for-each select="PD01F/PD01FH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1040"><xsl:value-of select="PD01FD01"/></span>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01FR01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01FS02"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01FJ01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01FQ01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01G/PD01GS01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							特殊事件说明（特殊事件说明个数：<xsl:value-of select="PD01G/PD01GS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊事件发生月份</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊事件类型</font>
						</td>
					</tr>
					<xsl:for-each select="PD01G/PD01GH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01GR01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1056"><xsl:value-of select="PD01GD01"/></span>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01H/PD01HS01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							大额专项分期（大额专项分期笔数：<xsl:value-of select="PD01H/PD01HS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">大额专项分期额度</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">分期额度生效日期</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">分期额度到期日期</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">已用分期金额</font>
						</td>
					</tr>
					<xsl:for-each select="PD01H/PD01HH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01HJ01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01HR01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01HR02"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01HJ02"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01Z/PD01ZS01 != '' and PD01Z/PD01ZS01 !=0">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							标注及声明信息（标注及声明个数：<xsl:value-of select="PD01Z/PD01ZS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注及声明类型</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注或声明内容</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">添加日期</font>
						</td>
					</tr>
					<xsl:for-each select="PD01Z/PD01ZH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1041"><xsl:value-of select="PD01ZD01"/></span>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01ZQ01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01ZR01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
		</xsl:for-each>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">（二）非循环贷账户</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="PD01[PD01A/PD01AD01 = 'D1']">
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="left">
						<font style="font-size: 12.0pt;font-weight:bold;">账户<xsl:number value="position()"/>
						</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;font-weight:bold;">基本信息</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">账户编号</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">账户类型</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构类型</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构代码</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">账户标识</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">授信协议编号</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">业务种类</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">开立日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">币种</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">借款金额</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AI01"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;催收账户
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1021"><xsl:value-of select="PD01A/PD01AD02"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AI02"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AI03"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AI04"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1023"><xsl:value-of select="PD01A/PD01AD03"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AR01"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="3003"><xsl:value-of select="PD01A/PD01AD04"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AJ01"/>
						</font>
					</td>
				</tr>
				<tr>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">账户授信额度</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">共享授信额度</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">到期日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">还款方式</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">还款频率</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">还款期数</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">担保方式</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">贷款发放形式</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">共同借款标志</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">债权转移时的还款状态</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AJ02"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AJ03"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AR02"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1024"><xsl:value-of select="PD01A/PD01AD05"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1025"><xsl:value-of select="PD01A/PD01AD06"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AS01"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1026"><xsl:value-of select="PD01A/PD01AD07"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1027"><xsl:value-of select="PD01A/PD01AD08"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1028"><xsl:value-of select="PD01A/PD01AD09"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1029"><xsl:value-of select="PD01A/PD01AD10"/></span>
						</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;font-weight:bold;">最新表现信息</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">账户状态</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">关闭日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">转出月份</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">最近一次还款日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">最近一次还款金额</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">五级分类</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">还款状态</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="4">
						<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1030"><xsl:value-of select="PD01B/PD01BD01"/></span>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BR01"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BR04"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BJ01"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BR02"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BJ02"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1035"><xsl:value-of select="PD01B/PD01BD03"/></span>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1036"><xsl:value-of select="PD01B/PD01BD04"/></span>
						</font>
					</td>
					<td height="25px" align="center" colspan="4">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BR03"/>
						</font>
					</td>
				</tr>
			</table>
			<xsl:if test="PD01C/PD01CR01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;font-weight:bold;">最近一次月度表现</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">月份</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">账户状态</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">已用额度</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">未出单的大额专项分期余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">五级分类</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">剩余还款期数</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">结算/应还款日</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">本月应还款</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">本月实还款</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最近一次还款日期</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">当前逾期期数</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CR01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<span name="1030"><xsl:value-of select="PD01C/PD01CD01"/></span>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ02"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ03"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<span name="1035"><xsl:value-of select="PD01C/PD01CD02"/></span>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CS01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CR02"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ04"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ05"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CR03"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CS02"/>
							</font>
						</td>
					</tr>
					<tr>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">当前逾期总额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期 31—60 天未还本金</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期 61－90 天未还本金</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期 91－180 天未还本金</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期 180 天以上未还本金</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">透支 180 天以上未付余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最近 6 个月平均使用额度</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最近 6 个月平均透支余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最大使用额度</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最大透支余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle" colspan="2">
							<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ06"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ07"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ08"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ09"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ10"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ11"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ12"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ13"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ14"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ15"/>
							</font>
						</td>
						<td height="25px" align="center" colspan="2">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CR04"/>
							</font>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="PD01D/PD01DR01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;font-weight:bold;">最近 24 个月还款状态</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">起始年月</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">截止年月</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01D/PD01DR01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01D/PD01DR02"/>
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">月份</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">还款状态</font>
						</td>
					</tr>
					
					<xsl:for-each select="PD01D/PD01DH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01DR03"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1036"><xsl:value-of select="PD01DD01"/></span>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01E/PD01ER01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;font-weight:bold;">最近 5 年内的历史表现</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">起始年月</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">截止年月</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">月数</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01E/PD01ER01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01E/PD01ER02"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01E/PD01ES01"/>
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">月份</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">还款状态</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期（透支） 总额</font>
						</td>
					</tr>
					<xsl:for-each select="PD01E/PD01EH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01ER03"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1036"><xsl:value-of select="PD01ED01"/></span>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01EJ01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01F/PD01FS01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							特殊交易信息（特殊交易个数：<xsl:value-of select="PD01F/PD01FS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊交易类型</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊交易发生日期</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">到期日期变更月数</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊交易发生金额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊交易明细记录</font>
						</td>
					</tr>
					<xsl:for-each select="PD01F/PD01FH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1040"><xsl:value-of select="PD01FD01"/></span>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01FR01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01FS02"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01FJ01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01FQ01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01G/PD01GS01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							特殊事件说明（特殊事件说明个数：<xsl:value-of select="PD01G/PD01GS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊事件发生月份</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊事件类型</font>
						</td>
					</tr>
					<xsl:for-each select="PD01G/PD01GH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01GR01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1056"><xsl:value-of select="PD01GD01"/></span>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01H/PD01HS01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							大额专项分期（大额专项分期笔数：<xsl:value-of select="PD01H/PD01HS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">大额专项分期额度</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">分期额度生效日期</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">分期额度到期日期</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">已用分期金额</font>
						</td>
					</tr>
					<xsl:for-each select="PD01H/PD01HH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01HJ01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01HR01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01HR02"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01HJ02"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01Z/PD01ZS01 != '' and PD01Z/PD01ZS01 !=0">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							标注及声明信息（标注及声明个数：<xsl:value-of select="PD01Z/PD01ZS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注及声明类型</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注或声明内容</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">添加日期</font>
						</td>
					</tr>
					<xsl:for-each select="PD01Z/PD01ZH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1041"><xsl:value-of select="PD01ZD01"/></span>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01ZQ01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01ZR01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
		</xsl:for-each>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">（三）循环额度下分账户</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="PD01[PD01A/PD01AD01 = 'R4']">
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="left">
						<font style="font-size: 12.0pt;font-weight:bold;">账户<xsl:number value="position()"/>
						</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;font-weight:bold;">基本信息</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">账户编号</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">账户类型</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构类型</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构代码</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">账户标识</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">授信协议编号</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">业务种类</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">开立日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">币种</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">借款金额</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AI01"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;催收账户
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1021"><xsl:value-of select="PD01A/PD01AD02"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AI02"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AI03"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AI04"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1023"><xsl:value-of select="PD01A/PD01AD03"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AR01"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="3003"><xsl:value-of select="PD01A/PD01AD04"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AJ01"/>
						</font>
					</td>
				</tr>
				<tr>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">账户授信额度</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">共享授信额度</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">到期日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">还款方式</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">还款频率</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">还款期数</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">担保方式</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">贷款发放形式</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">共同借款标志</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">债权转移时的还款状态</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AJ02"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AJ03"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AR02"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1024"><xsl:value-of select="PD01A/PD01AD05"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1025"><xsl:value-of select="PD01A/PD01AD06"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AS01"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1026"><xsl:value-of select="PD01A/PD01AD07"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1027"><xsl:value-of select="PD01A/PD01AD08"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1028"><xsl:value-of select="PD01A/PD01AD09"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1029"><xsl:value-of select="PD01A/PD01AD10"/></span>
						</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;font-weight:bold;">最新表现信息</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">账户状态</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">关闭日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">转出月份</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">最近一次还款日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">最近一次还款金额</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">五级分类</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">还款状态</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="4">
						<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1033"><xsl:value-of select="PD01B/PD01BD01"/></span>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BR01"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BR04"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BJ01"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BR02"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BJ02"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1035"><xsl:value-of select="PD01B/PD01BD03"/></span>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1036"><xsl:value-of select="PD01B/PD01BD04"/></span>
						</font>
					</td>
					<td height="25px" align="center" colspan="4">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BR03"/>
						</font>
					</td>
				</tr>
			</table>
			<xsl:if test="PD01C/PD01CR01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;font-weight:bold;">最近一次月度表现</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">月份</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">账户状态</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">已用额度</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">未出单的大额专项分期余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">五级分类</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">剩余还款期数</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">结算/应还款日</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">本月应还款</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">本月实还款</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最近一次还款日期</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">当前逾期期数</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CR01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<span name="1033"><xsl:value-of select="PD01C/PD01CD01"/></span>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ02"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ03"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<span name="1035"><xsl:value-of select="PD01C/PD01CD02"/></span>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CS01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CR02"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ04"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ05"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CR03"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CS02"/>
							</font>
						</td>
					</tr>
					<tr>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">当前逾期总额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期 31—60 天未还本金</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期 61－90 天未还本金</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期 91－180 天未还本金</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期 180 天以上未还本金</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">透支 180 天以上未付余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最近 6 个月平均使用额度</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最近 6 个月平均透支余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最大使用额度</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最大透支余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle" colspan="2">
							<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ06"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ07"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ08"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ09"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ10"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ11"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ12"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ13"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ14"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ15"/>
							</font>
						</td>
						<td height="25px" align="center" colspan="2">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CR04"/>
							</font>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="PD01D/PD01DR01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;font-weight:bold;">最近 24 个月还款状态</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">起始年月</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">截止年月</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01D/PD01DR01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01D/PD01DR02"/>
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">月份</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">还款状态</font>
						</td>
					</tr>
					
					<xsl:for-each select="PD01D/PD01DH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01DR03"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1036"><xsl:value-of select="PD01DD01"/></span>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01E/PD01ER01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;font-weight:bold;">最近 5 年内的历史表现</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">起始年月</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">截止年月</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">月数</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01E/PD01ER01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01E/PD01ER02"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01E/PD01ES01"/>
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">月份</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">还款状态</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期（透支） 总额</font>
						</td>
					</tr>
					<xsl:for-each select="PD01E/PD01EH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01ER03"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1036"><xsl:value-of select="PD01ED01"/></span>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01EJ01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01F/PD01FS01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							特殊交易信息（特殊交易个数：<xsl:value-of select="PD01F/PD01FS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊交易类型</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊交易发生日期</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">到期日期变更月数</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊交易发生金额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊交易明细记录</font>
						</td>
					</tr>
					<xsl:for-each select="PD01F/PD01FH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1040"><xsl:value-of select="PD01FD01"/></span>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01FR01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01FS02"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01FJ01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01FQ01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01G/PD01GS01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							特殊事件说明（特殊事件说明个数：<xsl:value-of select="PD01G/PD01GS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊事件发生月份</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊事件类型</font>
						</td>
					</tr>
					<xsl:for-each select="PD01G/PD01GH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01GR01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1056"><xsl:value-of select="PD01GD01"/></span>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01H/PD01HS01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							大额专项分期（大额专项分期笔数：<xsl:value-of select="PD01H/PD01HS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">大额专项分期额度</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">分期额度生效日期</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">分期额度到期日期</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">已用分期金额</font>
						</td>
					</tr>
					<xsl:for-each select="PD01H/PD01HH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01HJ01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01HR01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01HR02"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01HJ02"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01Z/PD01ZS01 != '' and PD01Z/PD01ZS01 !=0">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							标注及声明信息（标注及声明个数：<xsl:value-of select="PD01Z/PD01ZS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注及声明类型</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注或声明内容</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">添加日期</font>
						</td>
					</tr>
					<xsl:for-each select="PD01Z/PD01ZH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1041"><xsl:value-of select="PD01ZD01"/></span>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01ZQ01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01ZR01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
		</xsl:for-each>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">（四）循环贷账户</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="PD01[PD01A/PD01AD01 = 'R1']">
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="left">
						<font style="font-size: 12.0pt;font-weight:bold;">账户<xsl:number value="position()"/>
						</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;font-weight:bold;">基本信息</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">账户编号</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">账户类型</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构类型</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构代码</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">账户标识</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">授信协议编号</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">业务种类</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">开立日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">币种</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">借款金额</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AI01"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;催收账户
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1021"><xsl:value-of select="PD01A/PD01AD02"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AI02"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AI03"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AI04"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1023"><xsl:value-of select="PD01A/PD01AD03"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AR01"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="3003"><xsl:value-of select="PD01A/PD01AD04"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AJ01"/>
						</font>
					</td>
				</tr>
				<tr>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">账户授信额度</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">共享授信额度</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">到期日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">还款方式</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">还款频率</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">还款期数</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">担保方式</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">贷款发放形式</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">共同借款标志</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">债权转移时的还款状态</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AJ02"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AJ03"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AR02"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1024"><xsl:value-of select="PD01A/PD01AD05"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1025"><xsl:value-of select="PD01A/PD01AD06"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AS01"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1026"><xsl:value-of select="PD01A/PD01AD07"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1027"><xsl:value-of select="PD01A/PD01AD08"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1028"><xsl:value-of select="PD01A/PD01AD09"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1029"><xsl:value-of select="PD01A/PD01AD10"/></span>
						</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;font-weight:bold;">最新表现信息</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">账户状态</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">关闭日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">转出月份</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">最近一次还款日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">最近一次还款金额</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">五级分类</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">还款状态</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="4">
						<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1031"><xsl:value-of select="PD01B/PD01BD01"/></span>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BR01"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BR04"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BJ01"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BR02"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BJ02"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1035"><xsl:value-of select="PD01B/PD01BD03"/></span>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1037"><xsl:value-of select="PD01B/PD01BD04"/></span>
						</font>
					</td>
					<td height="25px" align="center" colspan="4">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BR03"/>
						</font>
					</td>
				</tr>
			</table>
			<xsl:if test="PD01C/PD01CR01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;font-weight:bold;">最近一次月度表现</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">月份</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">账户状态</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">已用额度</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">未出单的大额专项分期余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">五级分类</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">剩余还款期数</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">结算/应还款日</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">本月应还款</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">本月实还款</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最近一次还款日期</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">当前逾期期数</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CR01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<span name="1031"><xsl:value-of select="PD01C/PD01CD01"/></span>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ02"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ03"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<span name="1035"><xsl:value-of select="PD01C/PD01CD02"/></span>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CS01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CR02"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ04"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ05"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CR03"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CS02"/>
							</font>
						</td>
					</tr>
					<tr>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">当前逾期总额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期 31—60 天未还本金</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期 61－90 天未还本金</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期 91－180 天未还本金</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期 180 天以上未还本金</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">透支 180 天以上未付余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最近 6 个月平均使用额度</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最近 6 个月平均透支余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最大使用额度</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最大透支余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle" colspan="2">
							<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ06"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ07"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ08"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ09"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ10"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ11"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ12"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ13"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ14"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ15"/>
							</font>
						</td>
						<td height="25px" align="center" colspan="2">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CR04"/>
							</font>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="PD01D/PD01DR01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;font-weight:bold;">最近 24 个月还款状态</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">起始年月</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">截止年月</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01D/PD01DR01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01D/PD01DR02"/>
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">月份</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">还款状态</font>
						</td>
					</tr>
					
					<xsl:for-each select="PD01D/PD01DH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01DR03"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1037"><xsl:value-of select="PD01DD01"/></span>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01E/PD01ER01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;font-weight:bold;">最近 5 年内的历史表现</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">起始年月</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">截止年月</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">月数</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01E/PD01ER01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01E/PD01ER02"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01E/PD01ES01"/>
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">月份</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">还款状态</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期（透支） 总额</font>
						</td>
					</tr>
					<xsl:for-each select="PD01E/PD01EH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01ER03"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1037"><xsl:value-of select="PD01ED01"/></span>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01EJ01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01F/PD01FS01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							特殊交易信息（特殊交易个数：<xsl:value-of select="PD01F/PD01FS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊交易类型</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊交易发生日期</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">到期日期变更月数</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊交易发生金额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊交易明细记录</font>
						</td>
					</tr>
					<xsl:for-each select="PD01F/PD01FH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1040"><xsl:value-of select="PD01FD01"/></span>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01FR01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01FS02"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01FJ01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01FQ01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01G/PD01GS01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							特殊事件说明（特殊事件说明个数：<xsl:value-of select="PD01G/PD01GS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊事件发生月份</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊事件类型</font>
						</td>
					</tr>
					<xsl:for-each select="PD01G/PD01GH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01GR01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1056"><xsl:value-of select="PD01GD01"/></span>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01H/PD01HS01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							大额专项分期（大额专项分期笔数：<xsl:value-of select="PD01H/PD01HS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">大额专项分期额度</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">分期额度生效日期</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">分期额度到期日期</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">已用分期金额</font>
						</td>
					</tr>
					<xsl:for-each select="PD01H/PD01HH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01HJ01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01HR01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01HR02"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01HJ02"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01Z/PD01ZS01 != '' and PD01Z/PD01ZS01 !=0">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							标注及声明信息（标注及声明个数：<xsl:value-of select="PD01Z/PD01ZS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注及声明类型</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注或声明内容</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">添加日期</font>
						</td>
					</tr>
					<xsl:for-each select="PD01Z/PD01ZH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1041"><xsl:value-of select="PD01ZD01"/></span>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01ZQ01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01ZR01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
		</xsl:for-each>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">（五）贷记卡账户</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="PD01[PD01A/PD01AD01 = 'R2']">
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="left">
						<font style="font-size: 12.0pt;font-weight:bold;">账户<xsl:number value="position()"/>
						</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;font-weight:bold;">基本信息</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">账户编号</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">账户类型</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构类型</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构代码</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">账户标识</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">授信协议编号</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">业务种类</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">开立日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">币种</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">借款金额</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AI01"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;催收账户
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1021"><xsl:value-of select="PD01A/PD01AD02"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AI02"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AI03"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AI04"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1023"><xsl:value-of select="PD01A/PD01AD03"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AR01"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="3003"><xsl:value-of select="PD01A/PD01AD04"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AJ01"/>
						</font>
					</td>
				</tr>
				<tr>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">账户授信额度</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">共享授信额度</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">到期日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">还款方式</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">还款频率</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">还款期数</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">担保方式</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">贷款发放形式</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">共同借款标志</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">债权转移时的还款状态</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AJ02"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AJ03"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AR02"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1024"><xsl:value-of select="PD01A/PD01AD05"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1025"><xsl:value-of select="PD01A/PD01AD06"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AS01"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1026"><xsl:value-of select="PD01A/PD01AD07"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1027"><xsl:value-of select="PD01A/PD01AD08"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1028"><xsl:value-of select="PD01A/PD01AD09"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1029"><xsl:value-of select="PD01A/PD01AD10"/></span>
						</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;font-weight:bold;">最新表现信息</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">账户状态</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">关闭日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">转出月份</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">最近一次还款日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">最近一次还款金额</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">五级分类</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">还款状态</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="4">
						<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1032"><xsl:value-of select="PD01B/PD01BD01"/></span>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BR01"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BR04"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BJ01"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BR02"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BJ02"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1035"><xsl:value-of select="PD01B/PD01BD03"/></span>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1038"><xsl:value-of select="PD01B/PD01BD04"/></span>
						</font>
					</td>
					<td height="25px" align="center" colspan="4">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BR03"/>
						</font>
					</td>
				</tr>
			</table>
			<xsl:if test="PD01C/PD01CR01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;font-weight:bold;">最近一次月度表现</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">月份</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">账户状态</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">已用额度</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">未出单的大额专项分期余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">五级分类</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">剩余还款期数</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">结算/应还款日</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">本月应还款</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">本月实还款</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最近一次还款日期</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">当前逾期期数</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CR01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<span name="1032"><xsl:value-of select="PD01C/PD01CD01"/></span>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ02"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ03"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<span name="1035"><xsl:value-of select="PD01C/PD01CD02"/></span>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CS01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CR02"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ04"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ05"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CR03"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CS02"/>
							</font>
						</td>
					</tr>
					<tr>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">当前逾期总额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期 31—60 天未还本金</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期 61－90 天未还本金</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期 91－180 天未还本金</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期 180 天以上未还本金</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">透支 180 天以上未付余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最近 6 个月平均使用额度</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最近 6 个月平均透支余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最大使用额度</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最大透支余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle" colspan="2">
							<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ06"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ07"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ08"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ09"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ10"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ11"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ12"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ13"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ14"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ15"/>
							</font>
						</td>
						<td height="25px" align="center" colspan="2">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CR04"/>
							</font>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="PD01D/PD01DR01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;font-weight:bold;">最近 24 个月还款状态</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">起始年月</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">截止年月</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01D/PD01DR01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01D/PD01DR02"/>
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">月份</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">还款状态</font>
						</td>
					</tr>
					
					<xsl:for-each select="PD01D/PD01DH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01DR03"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1038"><xsl:value-of select="PD01DD01"/></span>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01E/PD01ER01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;font-weight:bold;">最近 5 年内的历史表现</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">起始年月</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">截止年月</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">月数</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01E/PD01ER01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01E/PD01ER02"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01E/PD01ES01"/>
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">月份</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">还款状态</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期（透支） 总额</font>
						</td>
					</tr>
					<xsl:for-each select="PD01E/PD01EH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01ER03"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1038"><xsl:value-of select="PD01ED01"/></span>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01EJ01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01F/PD01FS01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							特殊交易信息（特殊交易个数：<xsl:value-of select="PD01F/PD01FS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊交易类型</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊交易发生日期</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">到期日期变更月数</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊交易发生金额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊交易明细记录</font>
						</td>
					</tr>
					<xsl:for-each select="PD01F/PD01FH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1040"><xsl:value-of select="PD01FD01"/></span>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01FR01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01FS02"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01FJ01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01FQ01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01G/PD01GS01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							特殊事件说明（特殊事件说明个数：<xsl:value-of select="PD01G/PD01GS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊事件发生月份</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊事件类型</font>
						</td>
					</tr>
					<xsl:for-each select="PD01G/PD01GH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01GR01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1056"><xsl:value-of select="PD01GD01"/></span>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01H/PD01HS01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							大额专项分期（大额专项分期笔数：<xsl:value-of select="PD01H/PD01HS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">大额专项分期额度</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">分期额度生效日期</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">分期额度到期日期</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">已用分期金额</font>
						</td>
					</tr>
					<xsl:for-each select="PD01H/PD01HH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01HJ01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01HR01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01HR02"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01HJ02"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01Z/PD01ZS01 != '' and PD01Z/PD01ZS01 !=0">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							标注及声明信息（标注及声明个数：<xsl:value-of select="PD01Z/PD01ZS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注及声明类型</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注或声明内容</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">添加日期</font>
						</td>
					</tr>
					<xsl:for-each select="PD01Z/PD01ZH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1041"><xsl:value-of select="PD01ZD01"/></span>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01ZQ01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01ZR01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
		</xsl:for-each>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">（六）准贷记卡账户</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="PD01[PD01A/PD01AD01 = 'R3']">
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="left">
						<font style="font-size: 12.0pt;font-weight:bold;">账户<xsl:number value="position()"/>
						</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;font-weight:bold;">基本信息</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">账户编号</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">账户类型</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构类型</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构代码</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">账户标识</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">授信协议编号</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">业务种类</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">开立日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">币种</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">借款金额</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AI01"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;催收账户
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1021"><xsl:value-of select="PD01A/PD01AD02"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AI02"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AI03"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AI04"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1023"><xsl:value-of select="PD01A/PD01AD03"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AR01"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="3003"><xsl:value-of select="PD01A/PD01AD04"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AJ01"/>
						</font>
					</td>
				</tr>
				<tr>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">账户授信额度</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">共享授信额度</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">到期日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">还款方式</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">还款频率</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">还款期数</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">担保方式</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">贷款发放形式</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">共同借款标志</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">债权转移时的还款状态</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AJ02"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AJ03"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AR02"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1024"><xsl:value-of select="PD01A/PD01AD05"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1025"><xsl:value-of select="PD01A/PD01AD06"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01A/PD01AS01"/>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1026"><xsl:value-of select="PD01A/PD01AD07"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1027"><xsl:value-of select="PD01A/PD01AD08"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1028"><xsl:value-of select="PD01A/PD01AD09"/></span>
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1029"><xsl:value-of select="PD01A/PD01AD10"/></span>
						</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;font-weight:bold;">最新表现信息</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">账户状态</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">关闭日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">转出月份</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">最近一次还款日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">最近一次还款金额</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">五级分类</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">还款状态</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="4">
						<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1032"><xsl:value-of select="PD01B/PD01BD01"/></span>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BR01"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BR04"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BJ01"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BR02"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BJ02"/>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1035"><xsl:value-of select="PD01B/PD01BD03"/></span>
						</font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">
							&#160;<span name="1039"><xsl:value-of select="PD01B/PD01BD04"/></span>
						</font>
					</td>
					<td height="25px" align="center" colspan="4">
						<font style="font-size: 12.0pt;">
							&#160;<xsl:value-of select="PD01B/PD01BR03"/>
						</font>
					</td>
				</tr>
			</table>
			<xsl:if test="PD01C/PD01CR01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;font-weight:bold;">最近一次月度表现</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">月份</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">账户状态</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">已用额度</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">未出单的大额专项分期余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">五级分类</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">剩余还款期数</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">结算/应还款日</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">本月应还款</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">本月实还款</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最近一次还款日期</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">当前逾期期数</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CR01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<span name="1032"><xsl:value-of select="PD01C/PD01CD01"/></span>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ02"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ03"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<span name="1035"><xsl:value-of select="PD01C/PD01CD02"/></span>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CS01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CR02"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ04"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ05"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CR03"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CS02"/>
							</font>
						</td>
					</tr>
					<tr>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">当前逾期总额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期 31—60 天未还本金</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期 61－90 天未还本金</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期 91－180 天未还本金</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期 180 天以上未还本金</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">透支 180 天以上未付余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最近 6 个月平均使用额度</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最近 6 个月平均透支余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最大使用额度</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">最大透支余额</font>
						</td>
						<td height="25px" align="center" class="tdStyle" colspan="2">
							<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ06"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ07"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ08"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ09"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ10"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ11"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ12"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ13"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ14"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CJ15"/>
							</font>
						</td>
						<td height="25px" align="center" colspan="2">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01C/PD01CR04"/>
							</font>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="PD01D/PD01DR01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;font-weight:bold;">最近 24 个月还款状态</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">起始年月</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">截止年月</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01D/PD01DR01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01D/PD01DR02"/>
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">月份</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">还款状态</font>
						</td>
					</tr>
					
					<xsl:for-each select="PD01D/PD01DH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01DR03"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1039"><xsl:value-of select="PD01DD01"/></span>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01E/PD01ER01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;font-weight:bold;">最近 5 年内的历史表现</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">起始年月</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">截止年月</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">月数</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01E/PD01ER01"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01E/PD01ER02"/>
							</font>
						</td>
						<td height="25px" align="center">
							<font style="font-size: 12.0pt;">
								&#160;<xsl:value-of select="PD01E/PD01ES01"/>
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">月份</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">还款状态</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">逾期（透支） 总额</font>
						</td>
					</tr>
					<xsl:for-each select="PD01E/PD01EH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01ER03"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1039"><xsl:value-of select="PD01ED01"/></span>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01EJ01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01F/PD01FS01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							特殊交易信息（特殊交易个数：<xsl:value-of select="PD01F/PD01FS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊交易类型</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊交易发生日期</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">到期日期变更月数</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊交易发生金额</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊交易明细记录</font>
						</td>
					</tr>
					<xsl:for-each select="PD01F/PD01FH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1040"><xsl:value-of select="PD01FD01"/></span>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01FR01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01FS02"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01FJ01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01FQ01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01G/PD01GS01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							特殊事件说明（特殊事件说明个数：<xsl:value-of select="PD01G/PD01GS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊事件发生月份</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">特殊事件类型</font>
						</td>
					</tr>
					<xsl:for-each select="PD01G/PD01GH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01GR01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1056"><xsl:value-of select="PD01GD01"/></span>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01H/PD01HS01 != ''">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							大额专项分期（大额专项分期笔数：<xsl:value-of select="PD01H/PD01HS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">大额专项分期额度</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">分期额度生效日期</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">分期额度到期日期</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">已用分期金额</font>
						</td>
					</tr>
					<xsl:for-each select="PD01H/PD01HH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01HJ01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01HR01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01HR02"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01HJ02"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
			<xsl:if test="PD01Z/PD01ZS01 != '' and PD01Z/PD01ZS01 !=0">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							标注及声明信息（标注及声明个数：<xsl:value-of select="PD01Z/PD01ZS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注及声明类型</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注或声明内容</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">添加日期</font>
						</td>
					</tr>
					<xsl:for-each select="PD01Z/PD01ZH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1041"><xsl:value-of select="PD01ZD01"/></span>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01ZQ01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD01ZR01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="emptd">
		<xsl:param name="cnt" select="1"/>
		<xsl:if test="$cnt != 1">
			<td height="25px" align="center">
				<font style="font-size: 12.0pt;">&#160;</font>
			</td>
			<xsl:call-template name="emptd">
				<xsl:with-param name="cnt" select="$cnt - 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="splittd">
		<xsl:param name="mths" select="1"/>
		<xsl:param name="datas"/>
		<xsl:if test="$mths != 0 and substring($datas,25-$mths,1) != ''">
			<td height="25px" align="center">
				<font style="font-size: 12.0pt;"><xsl:value-of select="substring($datas,25-$mths,1)"/></font>
			</td>
			<xsl:call-template name="splittd">
				<xsl:with-param name="mths" select="$mths - 1"/>
				<xsl:with-param name="datas" select="$datas"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- （七）授信协议信息 -->
	<xsl:template match="PCA">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">（七）授信协议信息</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="PD02">
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="left">
						<font style="font-size: 12.0pt;font-weight:bold;">授信协议<xsl:number value="position()"/></font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">授信协议编号</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构类型</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">授信协议标识</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">授信额度用途</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">授信额度</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">币种</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PD02A/PD02AI01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="1021"><xsl:value-of select="PD02A/PD02AD01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PD02A/PD02AI02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PD02A/PD02AI03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="1042"><xsl:value-of select="PD02A/PD02AD02"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PD02A/PD02AJ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="3003"><xsl:value-of select="PD02A/PD02AD03"/></span></font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">生效日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">到期日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">授信协议状态</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">已用额度</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">授信限额</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">授信限额编号</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PD02A/PD02AR01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PD02A/PD02AR02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="1057"><xsl:value-of select="PD02A/PD02AD04"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PD02A/PD02AJ04"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PD02A/PD02AJ03"/></font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PD02A/PD02AI04"/></font>
					</td>
				</tr>
			</table>
			<xsl:if test="PD02Z/PD02ZS01 != '' and PD02Z/PD02ZS01 !=0">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							标注及声明信息（标注及声明个数：<xsl:value-of select="PD02Z/PD02ZS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注及声明类型</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注或声明内容</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">添加日期</font>
						</td>
					</tr>
					<xsl:for-each select="PD02Z/PD02ZH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1041"><xsl:value-of select="PD02ZD01"/></span>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD02ZQ01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD02ZR01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>		
			<br/>
		</xsl:for-each>
	</xsl:template>
	<!-- （八）相关还款责任信息 -->
	<xsl:template match="PCR">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">（八）相关还款责任信息</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">有相关还款责任的个人借款</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="PD03[PD03A/PD03AD08 = '1']">
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="left">
						<font style="font-size: 12.0pt;font-weight:bold;">账户<xsl:number value="position()"/></font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">主借款人身份类别</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构类型</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">业务种类</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">开立日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">到期日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">相关还款责任人类型</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">保证合同编号</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">相关还款责任金额</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">币种</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">五级分类</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">账户类型</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">还款状态</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">逾期月数</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="3004"><xsl:value-of select="PD03A/PD03AD08"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="1021"><xsl:value-of select="PD03A/PD03AD01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PD03A/PD03AQ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;"><span name="1023"><xsl:value-of select="PD03A/PD03AD02"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PD03A/PD03AR01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PD03A/PD03AR02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="1044"><xsl:value-of select="PD03A/PD03AD03"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PD03A/PD03AQ02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PD03A/PD03AJ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="3003"><xsl:value-of select="PD03A/PD03AD04"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PD03A/PD03AJ02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="1035"><xsl:value-of select="PD03A/PD03AD05"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="1022"><xsl:value-of select="PD03A/PD03AD06"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;
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
						</font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PD03A/PD03AS01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PD03A/PD03AR03"/></font>
					</td>
				</tr>
			</table>
			<xsl:if test="PD03Z/PD03ZS01 != '' and PD03Z/PD03ZS01 !=0">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							标注及声明信息（标注及声明个数：<xsl:value-of select="PD03Z/PD03ZS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注及声明类型</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注或声明内容</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">添加日期</font>
						</td>
					</tr>
					<xsl:for-each select="PD03Z/PD03ZH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1041"><xsl:value-of select="PD03ZD01"/></span>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD03ZQ01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD03ZR01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>			
			<br/>
		</xsl:for-each>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">有相关还款责任的企业借款</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="PD03[PD03A/PD03AD08 = '2']">
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="left">
						<font style="font-size: 12.0pt;font-weight:bold;">账户<xsl:number value="position()"/></font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">主借款人身份类别</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构类型</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">业务管理机构</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">业务种类</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">开立日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">到期日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">相关还款责任人类型</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">保证合同编号</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">相关还款责任金额</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">币种</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">余额</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">五级分类</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">账户类型</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">还款状态</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">逾期月数</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">信息报告日期</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="3004"><xsl:value-of select="PD03A/PD03AD08"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="1021"><xsl:value-of select="PD03A/PD03AD01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PD03A/PD03AQ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="1043"><xsl:value-of select="PD03A/PD03AD02"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PD03A/PD03AR01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PD03A/PD03AR02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="1044"><xsl:value-of select="PD03A/PD03AD03"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PD03A/PD03AQ02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PD03A/PD03AJ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="3003"><xsl:value-of select="PD03A/PD03AD04"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PD03A/PD03AJ02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="1035"><xsl:value-of select="PD03A/PD03AD05"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="1022"><xsl:value-of select="PD03A/PD03AD06"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PD03A/PD03AD07"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PD03A/PD03AS01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PD03A/PD03AR03"/></font>
					</td>
				</tr>
			</table>
			<xsl:if test="PD03Z/PD03ZS01 != '' and PD03Z/PD03ZS01 !=0">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							标注及声明信息（标注及声明个数：<xsl:value-of select="PD03Z/PD03ZS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注及声明类型</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注或声明内容</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">添加日期</font>
						</td>
					</tr>
					<xsl:for-each select="PD03Z/PD03ZH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1041"><xsl:value-of select="PD03ZD01"/></span>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD03ZQ01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PD03ZR01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>			
			<br/>
		</xsl:for-each>
	</xsl:template>
	
<!-- 四 非信贷交易信息明细 -->
	<xsl:template match="PND">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">后付费记录</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="PE01">
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="left">
						<font style="font-size: 12.0pt;font-weight:bold;">账户<xsl:number value="position()"/></font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">后付费账户类型</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">机构名称</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">业务类型</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">业务开通日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">当前缴费状态</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">当前欠费金额</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">记账年月</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">最近 24 个月缴费记录</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="1059"><xsl:value-of select="PE01A/PE01AD01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PE01A/PE01AQ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="1045"><xsl:value-of select="PE01A/PE01AD02"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PE01A/PE01AR01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="1046"><xsl:value-of select="PE01A/PE01AD03"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PE01A/PE01AJ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PE01A/PE01AR02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PE01A/PE01AQ02"/></font>
					</td>
					
				</tr>
			</table>
			<xsl:if test="PE01Z/PE01ZS01 != '' and PE01Z/PE01ZS01 != 0">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							标注及声明信息（标注及声明个数：<xsl:value-of select="PE01Z/PE01ZS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注及声明类型</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注或声明内容</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">添加日期</font>
						</td>
					</tr>
					<xsl:for-each select="PE01Z/PE01ZH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1041"><xsl:value-of select="PE01ZD01"/></span>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PE01ZQ01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PE01ZR01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>	
			<br/>
		</xsl:for-each>
	</xsl:template>
<!-- 五 公共信息明细 -->
	<!-- （一）欠税记录 -->
	<xsl:template match="POT">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">（一） 欠税记录</font>
				</td>
			</tr>
		</table>
		<xsl:if test="PF01 != ''">
			<xsl:for-each select="PF01">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">编号</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">主管税务机关</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">欠税总额</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">欠税统计日期</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;"><xsl:value-of select="position()"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF01A/PF01AQ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF01A/PF01AJ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF01A/PF01AR01"/></font>
					</td>
				</tr>
				</table>
				<xsl:if test="PF01Z/PF01ZS01 != '' and PF01Z/PF01ZS01 != 0">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							标注及声明信息（标注及声明个数：<xsl:value-of select="PF01Z/PF01ZS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注及声明类型</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注或声明内容</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">添加日期</font>
						</td>
					</tr>
					<xsl:for-each select="PF01Z/PF01ZH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1041"><xsl:value-of select="PF01ZD01"/></span>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PF01ZQ01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PF01ZR01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>	
			</xsl:for-each>
			<br/>
		</xsl:if>
	</xsl:template>
	<!-- （二）民事判决记录 -->
	<xsl:template match="PCJ">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">（二）民事判决记录</font>
				</td>
			</tr>
		</table>
		<xsl:if test="PF02 != ''">
			<xsl:for-each select="PF02">
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">立案法院</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">案由</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">立案日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">结案方式</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">判决/调解结果</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">判决/调解生效日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">诉讼标的</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">诉讼标的金额</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF02A/PF02AQ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF02A/PF02AQ02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF02A/PF02AR01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="1047"><xsl:value-of select="PF02A/PF02AD01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF02A/PF02AQ03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF02A/PF02AR02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF02A/PF02AQ04"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF02A/PF02AJ01"/></font>
					</td>
				</tr>
				<xsl:if test="PF02Z/PF02ZS01 != '' and PF02Z/PF02ZS01 !=0">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							标注及声明信息（标注及声明个数：<xsl:value-of select="PF02Z/PF02ZS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注及声明类型</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注或声明内容</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">添加日期</font>
						</td>
					</tr>
					<xsl:for-each select="PF02Z/PF02ZH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1041"><xsl:value-of select="PF02ZD01"/></span>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PF02ZQ01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PF02ZR01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>	
			</table>
			</xsl:for-each>
			<br/>
		</xsl:if>
	</xsl:template>
	<!-- （三）强制执行记录 -->
	<xsl:template match="PCE">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">（三）强制执行记录</font>
				</td>
			</tr>
		</table>
		<xsl:if test="PF03 != ''">
			<xsl:for-each select="PF03">
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">执行法院</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">执行案由</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">立案日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">结案方式</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF03A/PF03AQ01"/></font>
					</td>
					<td height="25px" align="center" colspan="2">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF03A/PF03AQ02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF03A/PF03AR01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="1048"><xsl:value-of select="PF03A/PF03AD01"/></span></font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">案件状态</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">结案日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">申请执行标的</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">申请执行标的价值</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">已执行标的</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">已执行标的金额</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF03A/PF03AQ03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF03A/PF03AR02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF03A/PF03AQ04"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF03A/PF03AJ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF03A/PF03AQ05"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF03A/PF03AJ02"/></font>
					</td>
				</tr>
				<xsl:if test="PF03Z/PF03ZS01 != '' and PF03Z/PF03ZS01 !=0">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							标注及声明信息（标注及声明个数：<xsl:value-of select="PF03Z/PF03ZS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注及声明类型</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注或声明内容</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">添加日期</font>
						</td>
					</tr>
					<xsl:for-each select="PF03Z/PF03ZH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1041"><xsl:value-of select="PF03ZD01"/></span>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PF03ZQ01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PF03ZR01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>	
			</table>
			</xsl:for-each>
			<br/>
		</xsl:if>
	</xsl:template>
	<!-- （四）行政处罚记录 -->
	<xsl:template match="PAP">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">（四）行政处罚记录</font>
				</td>
			</tr>
		</table>
		<xsl:if test="PF04 != ''">
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">编号</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">处罚机构</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">处罚内容</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">处罚金额</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">处罚生效日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">处罚截止日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">行政复议结果</font>
					</td>
				</tr>
				<xsl:for-each select="PF04">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;"><xsl:value-of select="position()"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF04A/PF04AQ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF04A/PF04AQ02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF04A/PF04AJ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF04A/PF04AR01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF04A/PF04AR02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF04A/PF04AQ03"/></font>
					</td>
				</tr>
				<xsl:if test="PF04Z/PF04ZS01 != '' and PF04Z/PF04ZS01 !=0">
					<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
						<tr style="line-height:20px">
							<td height="25px" align="center" colspan="5">
								<font style="font-size: 12.0pt;font-weight:bold;">
								标注及声明信息（标注及声明个数：<xsl:value-of select="PF04Z/PF04ZS01"/>）
								</font>
							</td>
						</tr>
						<tr style="line-height:20px">
							<td height="25px" align="center" class="tdStyle">
								<font style="font-size: 12.0pt;font-weight:bold;">标注及声明类型</font>
							</td>
							<td height="25px" align="center" class="tdStyle">
								<font style="font-size: 12.0pt;font-weight:bold;">标注或声明内容</font>
							</td>
							<td height="25px" align="center" class="tdStyle">
								<font style="font-size: 12.0pt;font-weight:bold;">添加日期</font>
							</td>
						</tr>
						<xsl:for-each select="PF04Z/PF04ZH">
							<tr>
								<td height="25px" align="center">
									<font style="font-size: 12.0pt;">
										&#160;<span name="1041"><xsl:value-of select="PF04ZD01"/></span>
									</font>
								</td>
								<td height="25px" align="center">
									<font style="font-size: 12.0pt;">
										&#160;<xsl:value-of select="PF04ZQ01"/>
									</font>
								</td>
								<td height="25px" align="center">
									<font style="font-size: 12.0pt;">
										&#160;<xsl:value-of select="PF04ZR01"/>
									</font>
								</td>
							</tr>
						</xsl:for-each>
					</table>
				</xsl:if>	
			</xsl:for-each>
			</table>
			<br/>
		</xsl:if>
	</xsl:template>
	<!-- （五）住房公积金参缴记录 -->
	<xsl:template match="PHF">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">（五）住房公积金参缴记录</font>
				</td>
			</tr>
		</table>
		<xsl:if test="PF05 != ''">
			<xsl:for-each select="PF05">
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">参缴地</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">参缴日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">缴费状态</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">初缴月份</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">缴至月份</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">单位缴存比例</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">个人缴存比例</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">月缴存额</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">缴费单位</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">信息更新日期</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="3002"><xsl:value-of select="PF05A/PF05AQ01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF05A/PF05AR01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="1049"><xsl:value-of select="PF05A/PF05AD01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF05A/PF05AR02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF05A/PF05AR03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF05A/PF05AQ02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF05A/PF05AQ03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF05A/PF05AJ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF05A/PF05AQ04"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF05A/PF05AR04"/></font>
					</td>
				</tr>
			</table>
			<xsl:if test="PF05Z/PF05ZS01 != '' and PF05Z/PF05ZS01 !=0">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							标注及声明信息（标注及声明个数：<xsl:value-of select="PF05Z/PF05ZS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注及声明类型</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注或声明内容</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">添加日期</font>
						</td>
					</tr>
					<xsl:for-each select="PF05Z/PF05ZH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1041"><xsl:value-of select="PF05ZD01"/></span>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PF05ZQ01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PF05ZR01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>	
			</xsl:for-each>
			<br/>
		</xsl:if>
	</xsl:template>
	<!-- （六）低保救助记录 -->
	<xsl:template match="PBS">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">（六）低保救助记录</font>
				</td>
			</tr>
		</table>
		<xsl:if test="PF06 != ''">
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">编号</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">人员类别</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">所在地</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">工作单位</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">家庭月收入</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">申请日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">批准日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">信息更新日期</font>
					</td>
				</tr>
			<xsl:for-each select="PF06">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;"><xsl:value-of select="position()"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="1050"><xsl:value-of select="PF06A/PF06AD01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="3002"><xsl:value-of select="PF06A/PF06AQ01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF06A/PF06AQ02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF06A/PF06AQ03"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF06A/PF06AR01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF06A/PF06AR02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF06A/PF06AR03"/></font>
					</td>
				</tr>
				<xsl:if test="PF06Z/PF06ZS01 != '' and PF06Z/PF06ZS01 !=0">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							标注及声明信息（标注及声明个数：<xsl:value-of select="PF06Z/PF06ZS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注及声明类型</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注或声明内容</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">添加日期</font>
						</td>
					</tr>
					<xsl:for-each select="PF06Z/PF06ZH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1041"><xsl:value-of select="PF06ZD01"/></span>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PF06ZQ01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PF06ZR01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>	
			</xsl:for-each>
			</table>
			<br/>
		</xsl:if>
	</xsl:template>
	<!-- （七）执业资格记录 -->
	<xsl:template match="PPQ">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">（七）执业资格记录</font>
				</td>
			</tr>
		</table>
		<xsl:if test="PF07 != ''">
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">编号</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">执业资格名称</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">颁发机构</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">等级</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">机构所在地</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">获得日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">到期日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">吊销日期</font>
					</td>
				</tr>
			<xsl:for-each select="PF07">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;"><xsl:value-of select="position()"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF07A/PF07AQ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF07A/PF07AQ02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="1051"><xsl:value-of select="PF07A/PF07AD01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="3002"><xsl:value-of select="PF07A/PF07AD02"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF07A/PF07AR01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF07A/PF07AR02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF07A/PF07AR03"/></font>
					</td>
				</tr>
				<xsl:if test="PF07Z/PF07ZS01 != '' and PF07Z/PF07ZS01 !=0">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							标注及声明信息（标注及声明个数：<xsl:value-of select="PF07Z/PF07ZS01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注及声明类型</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注或声明内容</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">添加日期</font>
						</td>
					</tr>
					<xsl:for-each select="PF07Z/PF07ZH">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1041"><xsl:value-of select="PF07ZD01"/></span>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PF07ZQ01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PF07ZR01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>	
			</xsl:for-each>
			</table>
			<br/>
		</xsl:if>
	</xsl:template>
	<!-- （八）行政奖励记录 -->
	<xsl:template match="PAH">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">（八）行政奖励记录</font>
				</td>
			</tr>
		</table>
		<xsl:if test="PF08 != ''">
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">编号</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">奖励机构</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">奖励内容</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">生效日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">截止日期</font>
					</td>
				</tr>
			<xsl:for-each select="PF08">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;"><xsl:value-of select="position()"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF08A/PF08AQ01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF08A/PF08AQ02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF08A/PF08AR01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PF08A/PF08AR02"/></font>
					</td>
				</tr>
				<xsl:if test="PF08Z/PF08ZS01 != '' and PF08Z/PF08ZS01 !=0">
					<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
						<tr style="line-height:20px">
							<td height="25px" align="center" colspan="5">
								<font style="font-size: 12.0pt;font-weight:bold;">
								标注及声明信息（标注及声明个数：<xsl:value-of select="PF08Z/PF08ZS01"/>）
								</font>
							</td>
						</tr>
						<tr style="line-height:20px">
							<td height="25px" align="center" class="tdStyle">
								<font style="font-size: 12.0pt;font-weight:bold;">标注及声明类型</font>
							</td>
							<td height="25px" align="center" class="tdStyle">
								<font style="font-size: 12.0pt;font-weight:bold;">标注或声明内容</font>
							</td>
							<td height="25px" align="center" class="tdStyle">
								<font style="font-size: 12.0pt;font-weight:bold;">添加日期</font>
							</td>
						</tr>
						<xsl:for-each select="PF08Z/PF08ZH">
							<tr>
								<td height="25px" align="center">
									<font style="font-size: 12.0pt;">
										&#160;<span name="1041"><xsl:value-of select="PF08ZD01"/></span>
									</font>
								</td>
								<td height="25px" align="center">
									<font style="font-size: 12.0pt;">
										&#160;<xsl:value-of select="PF08ZQ01"/>
									</font>
								</td>
								<td height="25px" align="center">
									<font style="font-size: 12.0pt;">
										&#160;<xsl:value-of select="PF08ZR01"/>
									</font>
								</td>
							</tr>
						</xsl:for-each>
					</table>
				</xsl:if>	
			</xsl:for-each>
			</table>
			<br/>
		</xsl:if>
	</xsl:template>
	<!-- 六 本人声明 七 异议标注 -->
	<xsl:template match="POS">
		<xsl:for-each select="PG01">
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px;" >
					<td height="25px" align="center" class="tdStyle" >
						<font style="font-size: 12.0pt;font-weight:bold;">编号</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">对象类型</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">对象标识</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">标注及声明类型个数</font>
					</td>
				</tr>
				<tr style="line-height:20px;" >
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="position()"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="1052"><xsl:value-of select="PG010D01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="1053"><xsl:value-of select="PG010D02"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PG010S01"/></font>
					</td>
				</tr>
			</table>
			<xsl:if test="PG01/PG010S01 != '' and PG01/PG010S01 !=0">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" colspan="5">
							<font style="font-size: 12.0pt;font-weight:bold;">
							标注及声明信息（标注及声明个数：<xsl:value-of select="PG01/PG010S01"/>）
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注及声明类型</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">标注或声明内容</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">添加日期</font>
						</td>
					</tr>
					<xsl:for-each select="PG01/PG010H">
						<tr>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<span name="1041"><xsl:value-of select="PG010D03"/></span>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PG010Q01"/>
								</font>
							</td>
							<td height="25px" align="center">
								<font style="font-size: 12.0pt;">
									&#160;<xsl:value-of select="PG010R01"/>
								</font>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</xsl:if>	
		</xsl:for-each>
		<br/>
	</xsl:template>
	<!-- 七 查询记录 -->
	<xsl:template match="POQ">
		<xsl:if test="count(child::*) != 0">
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">编号</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">查询日期</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">查询机构类型</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">查询机构</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">查询原因</font>
					</td>
				</tr>
			<xsl:for-each select="PH01">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;"><xsl:value-of select="position()"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PH010R01"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="1021"><xsl:value-of select="PH010D01"/></span></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="PH010Q02"/></font>
					</td>
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">&#160;<span name="1054"><xsl:value-of select="PH010Q03"/></span></font>
					</td>
				</tr>
			</xsl:for-each>
			</table>
			<br/>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
