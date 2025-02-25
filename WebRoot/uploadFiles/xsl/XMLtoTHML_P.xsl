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
	<xsl:output method="html" version="1.0" encoding="gb2312"/>
	<xsl:template match="/Document">
		<html oncontextmenu="return false" onselectstart="return false">
			<head>
				<title>�������ñ���</title>
				<style type="text/css">
					<!--
					���δ�ӡ��ť
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
				<!-- ����ͷ��Ϣ -->
				<xsl:apply-templates select="PRH/PA01"/>
				<!-- һ ���˻�����Ϣ -->
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="2" align="center">
							<font style="font-size: 16.0pt;font-weight:bold;">һ ���˻�����Ϣ</font>
							<br/>
							<br/>
						</td>
					</tr>
				</table>
				<!-- ��һ�������Ϣ -->
				<xsl:apply-templates select="PIM/PB01"/>
				<!-- ������������Ϣ -->
				<xsl:apply-templates select="PMM/PB02"/>
				<!-- ��������ס��Ϣ -->
				<xsl:apply-templates select="PRM"/>
				<!-- ���ģ�ְҵ��Ϣ -->
				<xsl:apply-templates select="POM"/>
				<!-- �� ��Ϣ��Ҫ -->
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="2" align="center">
							<font style="font-size: 16.0pt;font-weight:bold;">�� ��Ϣ��Ҫ</font>
							<br/>
							<br/>
						</td>
					</tr>
				</table>
				<!-- ��һ���������ñ��桰���ֽ���� -->
				<xsl:apply-templates select="PSM/PC01"/>
				<!-- �������Ŵ�������Ϣ��ʾ �������Ŵ�����ΥԼ��Ϣ��Ҫ ���ģ��Ŵ��������ż���ծ��Ϣ��Ҫ -->
				<xsl:apply-templates select="PCO/PC02"/>
				<!-- ���壩���Ŵ�������Ϣ��Ҫ -->
				<xsl:apply-templates select="PNO/PC03"/>
				<!-- ������������Ϣ��Ҫ -->
				<xsl:apply-templates select="PPO/PC04"/>
				<!-- ���ߣ���ѯ��¼��Ҫ -->
				<xsl:apply-templates select="PQO/PC05"/>
				<!-- �� �Ŵ�������Ϣ��ϸ -->
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="2" align="center">
							<font style="font-size: 16.0pt;font-weight:bold;">�� �Ŵ�������Ϣ��ϸ</font>
							<br/>
							<br/>
						</td>
					</tr>
				</table>
				<!-- ��һ����׷����Ϣ��������ѭ�����˻�������ѭ������·��˻����ģ�ѭ�����˻����壩���ǿ��˻�������׼���ǿ��˻�  -->
				<xsl:apply-templates select="PDA"/>
				<!-- ���ߣ�����Э����Ϣ -->
				<xsl:apply-templates select="PCA"/>
				<!-- ���ˣ���ػ���������Ϣ -->
				<xsl:apply-templates select="PCR"/>
				<!-- �� ���Ŵ�������Ϣ��ϸ -->
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="2" align="center">
							<font style="font-size: 16.0pt;font-weight:bold;">�� ���Ŵ�������Ϣ��ϸ</font>
							<br/>
							<br/>
						</td>
					</tr>
				</table>
				<xsl:apply-templates select="PND"/>
				<!-- �� ������Ϣ��ϸ -->
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="2" align="center">
							<font style="font-size: 16.0pt;font-weight:bold;">�� ������Ϣ��ϸ</font>
							<br/>
							<br/>
						</td>
					</tr>
				</table>
				<!-- ��һ��Ƿ˰��¼ -->
				<xsl:apply-templates select="POT"/>
				<!-- �����������о���¼ -->
				<xsl:apply-templates select="PCJ"/>
				<!-- ������ǿ��ִ�м�¼ -->
				<xsl:apply-templates select="PCE"/>
				<!-- ���ģ�����������¼ -->
				<xsl:apply-templates select="PAP"/>
				<!-- ���壩ס��������νɼ�¼ -->
				<xsl:apply-templates select="PHF"/>
				<!-- �������ͱ�������¼ -->
				<xsl:apply-templates select="PBS"/>
				<!-- ���ߣ�ִҵ�ʸ��¼ -->
				<xsl:apply-templates select="PPQ"/>
				<!-- ���ˣ�����������¼ -->
				<xsl:apply-templates select="PAH"/>
				<!-- �� �������� -->
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="2" align="center">
							<font style="font-size: 16.0pt;font-weight:bold;">�� ��������</font>
							<br/>
							<br/>
						</td>
					</tr>
				</table>
				<xsl:apply-templates select="POS"/>
				<!-- �� ��ѯ��¼ -->
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="2" align="center">
							<font style="font-size: 16.0pt;font-weight:bold;">�� ��ѯ��¼</font>
							<br/>
							<br/>
						</td>
					</tr>
				</table>
				<xsl:apply-templates select="POQ"/>
				<!-- ����˵�� -->
				<xsl:apply-templates select="PRH"/>
				<script>
					watermark({ watermark_txt: "�����ṩ" })//���붯̬ˮӡ����
						function watermark(settings) {
						//Ĭ������
						var defaultSettings={
							watermark_txt:"text",
							watermark_x:300,//ˮӡ��ʼλ��x������
							watermark_y:100,//ˮӡ��ʼλ��Y������
							watermark_rows:10,//ˮӡ����
							watermark_cols:3,//ˮӡ����
							watermark_x_space:100,//ˮӡx����
							watermark_y_space:50,//ˮӡy����
							watermark_color:'red',//ˮӡ������ɫ
							watermark_alpha:0.3,//ˮӡ͸����
							watermark_fontsize:'18px',//ˮӡ�����С
							watermark_font:'΢���ź�',//ˮӡ����
							watermark_width:120,//ˮӡ���
							watermark_height:80,//ˮӡ����
							watermark_angle:15//ˮӡ��б����
						};
						//�����������滻Ĭ��ֵ����������jquery.extend
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
					 
						//��ȡҳ�������
						var page_width = Math.max(document.body.scrollWidth,document.body.clientWidth);
						//��ȡҳ����󳤶�
						var page_height = Math.max(document.body.scrollHeight,document.body.clientHeight);
					 
						//�����ˮӡ��������Ϊ0����ˮӡ�������ù��󣬳���ҳ������ȣ������¼���ˮӡ������ˮӡx����
						if (defaultSettings.watermark_cols == 0 ||
					   ��������(parseInt(defaultSettings.watermark_x 
					��������+ defaultSettings.watermark_width *defaultSettings.watermark_cols 
					��������+ defaultSettings.watermark_x_space * (defaultSettings.watermark_cols - 1)) 
					��������> page_width)) {
							defaultSettings.watermark_cols = 
					������������parseInt((page_width
					��������������������-defaultSettings.watermark_x
					��������������������+defaultSettings.watermark_x_space) 
					��������������������/ (defaultSettings.watermark_width 
					��������������������+ defaultSettings.watermark_x_space));
							defaultSettings.watermark_x_space = 
					������������parseInt((page_width 
					��������������������- defaultSettings.watermark_x 
					��������������������- defaultSettings.watermark_width 
					��������������������* defaultSettings.watermark_cols) 
					��������������������/ (defaultSettings.watermark_cols - 1));
						}
						//�����ˮӡ��������Ϊ0����ˮӡ�������ù��󣬳���ҳ����󳤶ȣ������¼���ˮӡ������ˮӡy����
						if (defaultSettings.watermark_rows == 0 ||
					   ��������(parseInt(defaultSettings.watermark_y 
					��������+ defaultSettings.watermark_height * defaultSettings.watermark_rows 
					��������+ defaultSettings.watermark_y_space * (defaultSettings.watermark_rows - 1)) 
					��������> page_height)) {
							defaultSettings.watermark_rows = 
					������������parseInt((defaultSettings.watermark_y_space 
					����������������������+ page_height - defaultSettings.watermark_y) 
					����������������������/ (defaultSettings.watermark_height + defaultSettings.watermark_y_space));
							defaultSettings.watermark_y_space = 
					������������parseInt((page_height 
					��������������������- defaultSettings.watermark_y 
					��������������������- defaultSettings.watermark_height 
					��������������������* defaultSettings.watermark_rows) 
					������������������/ (defaultSettings.watermark_rows - 1));
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
								//����ˮӡdiv��б��ʾ
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
					<input onMouseOver="msover();" style="border:1px solid #cc9966; FONT-WEIGHT: normal; FONT-SIZE: 10pt; BACKGROUND: #fff6dc; COLOR: #000000; LINE-HEIGHT: normal; FONT-STYLE: normal; HEIGHT: 30; FONT-VARIANT: normal; width:58" onMouseOut="msout();" type="button" name="doPrint" value="��  ӡ" class="button2" onclick="printReport()"/>&#160;&#160;
					<input onMouseOver="msover();" style="border:1px solid #cc9966; FONT-WEIGHT: normal; FONT-SIZE: 10pt; BACKGROUND: #fff6dc; COLOR: #000000; LINE-HEIGHT: normal; FONT-STYLE: normal; HEIGHT: 30; FONT-VARIANT: normal; width:58" onMouseOut="msout();" type="button" name="goBack" value="��  ��" class="button1" onclick="window.location.href=document.referrer;"/> </p> 
				</form>
			</body>
		</html>
	</xsl:template>
<!-- ����˵�� -->
	<xsl:template match="PRH">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="2">
			<tr>
				<td height="4" colspan="4">
					<div align="center" class="style2">
						<font style="font-size: 18.0pt;font-weight:bold">����˵��</font>
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
					<font style="font-size: 12.0pt">���������й����������������ĳ��ߣ����ݽ�������ʱ��ĸ�������ϵͳ��¼����Ϣ���ɡ�����ѯ��¼�⣬������Ϣ������ػ����ṩ���������Ĳ���֤����ʵ�Ժ�׼ȷ�ԣ�����ŵ����Ϣ���ܡ��ӹ������ϵ�ȫ�����б��ֿ͹ۡ������ĵ�λ��</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					2.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">�������еġ����ֽ��������ʹ�ñ����ñ�������е����Ż����ο������Ż���Ӧ���ге�ʹ�á����ֽ��������ط������Ρ�</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					3.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">�����ֽ���������ñ������ݽ��Ϊһ����ֵ���Ƕ���������δ���Ŵ�ΥԼ�����Ե�Ԥ�⣬��ȡֵ��ΧΪ0��1000����ֵԽ�ߣ�ΥԼ������Խ�ͣ������λ�á���������������ֽ��ֵ��ȫ����Ⱥ�еİٷֱ�����λ�ã����硰>50%����������ֽ��ֵ����50%���������壻��˵�����еġ�Ӱ�����ء���Ӱ�����������ø������ֽ��ֵ��ԭ�򣬸��ݵ�ǰ���ñ����ʵ���������������������������ֽ������ʾΪ��--���ģ��������޷����ݵ�ǰ���ñ������ݸ������ֽ��ֵ�������������塣�޷��������ֽ��ֵ�ľ���ԭ�����˵������</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					4.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">��������Ŵ�������Ϣ��ʾ�У���ҵ�����͡�Ϊ���������Ļ�����Ϣ���������ʲ����á��͡���ҵ��</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					5.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">�����������û�С��Ŵ�����ΥԼ��Ϣ��Ҫ����Ϣ��˵�������������5����û���������ڡ�</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					6.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">���ڴ��������޶��Э����Ϣ����Ϣ����Ŀ��ö�����ϡ�����Э����Ϣ���е����Ŷ�ȡ������޶���Ϣ�������й��㡣</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					7.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">�������е��Ŵ��������ż���ծ��Ϣ��Ҫչʾ����Ϣ��ָδ����/δ���������ż���ծ��Ϣ��</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					8.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">������Ľ��������ϸ��Ϣ�У�ѭ�����˻��ĵ���������ָ�˻����Ŷ�ȵĵ������ڡ�</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					9.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">������Ľ��������ϸ��Ϣ�У�����˻�չʾ���5��Ļ��������������ǰ����״̬�͵�ǰ�����ܶ</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					10.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">����ͨ��������������ġ�С���Ƶ��ҵ�񣬽��ڻ������ϲ���������˻���չʾ�ڱ�����Ľ��������ϸ��Ϣ�У���ʱ�˻��Ļ��ʽΪ�������ֻ��ʽ�������˻��Ļ���Ƶ��ͳһԼ��Ϊ���¡������������������¼��㣬�仹����Ϣ���½��й۲�͸��¡�</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					11.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">�������е�����׼���ǿ��˻���ָ���˻�60�����ϵ�͸֧��Ϊ��</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					12.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">�������еĻ�������Ϊ��--����ָ���˻��ǷǷ��ڻ��</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					13.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">�����治չʾ5��ǰ�Ѿ�������ΥԼ��Ϊ���Լ�5��ǰ��Ƿ˰��¼��ǿ��ִ�м�¼�������о���¼������������¼������Ƿ�Ѽ�¼��</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					14.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">����˵���������ṩ�����Ծ���ҵ����ӵ��ر�˵����Ϣ��</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					15.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">������������Ϣ��������ñ����е���Ϣ����ע�ļ�Ҫ˵������������Ա�����������ʵ�Ը���</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					16.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">�����ע������������ӵģ�����˵��������������ñ����е���Щ��Ϣ�����顣</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					17.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">�����������漰������˽����ѯ��Ӧ����ʹ�á����Ʊ��ܡ���ʹ�ò�����ɸ�����Ϣй¶�ģ��������Ľ����е�������Ρ�</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					18.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">�����������н���������ػ������ε���ҵ���еĽ���⣩��Ϊ����ҽ����ղ�ѯ��ǰһ��Ļ��ʡ�</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					19.
				</td>
				<td colspan="3" valign="top" height="30px">
					<font style="font-size: 12.0pt">�����������������ṩ��������Ϣ���岻֤ͬ�����͵���Ϣ��</font>
				</td>
			</tr>
		</table>
	</xsl:template>
<!-- ����ͷ��Ϣ -->
	<xsl:template match="PRH/PA01">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td colspan="2" align="center">
					<font style="font-size: 32.0pt;font-weight:bold;">�������ñ���</font>
					<br/>
					<br/>
					<font style="font-size: 16.0pt;font-weight:bold;">(���Ż�����)</font>
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
					<font style="font-size: 12.0pt;">&#160;�����ţ� &#160;<xsl:value-of select="PA01A/PA01AI01"/>
					</font>
				</td>
				<td width="50%" height="25px" align="right" colspan="2">
					<font style="font-size: 12.0pt">����ʱ�䣺 &#160;<xsl:value-of select="PA01A/PA01AR01"/>&#160;</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����ѯ������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����ѯ��֤������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����ѯ��֤������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ѯ����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ѯԭ��</font>
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
						����֤����Ϣ��֤��������<xsl:value-of select="PA01C/PA01CS01"/>��
						</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">֤������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">֤������</font>
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
						<font style="font-size: 12.0pt;font-weight:bold;">����թ��ʾ</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����թ��ʾ��־</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����թ��ʾ��ϵ�绰</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����թ��ʾ��Ч����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����թ��ʾ��ֹ����</font>
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
						<font style="font-size: 12.0pt;font-weight:bold;">������Ϣ��ʾ</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<!--<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;">��Ϣ��������ñ������������ &#160;<xsl:value-of select="PA01E/PA01ES01"/> �����������ڴ����У������ʱע���Ķ�������ݡ�</font>
					</td>
				</tr>-->
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�����ע��Ŀ</font>
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
<!-- һ ���˻�����Ϣ -->
	<!-- ��һ�������Ϣ -->
	<xsl:template match="PIM/PB01">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">��һ�������Ϣ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�Ա�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����״��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ѧ��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ѧλ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ҵ״��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">ͨѶ��ַ</font>
				</td>
				<td height="25px" align="center" class="tdStyle" colspan="3">
					<font style="font-size: 12.0pt;font-weight:bold;">������ַ</font>
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
						�ֻ����������<xsl:value-of select="PB01B/PB01BS01"/>
						</font>
					</td>
				</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle" colspan="4">
					<font style="font-size: 12.0pt;font-weight:bold;">�ֻ�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle" colspan="3">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
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
	<!-- ������������Ϣ -->
	<xsl:template match="PMM/PB02">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">��������ż��Ϣ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">֤������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">֤������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������λ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ϵ�绰</font>
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
	<!-- ��������ס��Ϣ -->
	<xsl:template match="PRM">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">��������ס��Ϣ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ס��ַ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">סլ�绰</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ס״��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
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
	<!-- ���ģ�ְҵ��Ϣ -->
	<xsl:template match="POM">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">���ģ�ְҵ��Ϣ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle" colspan="3">
					<font style="font-size: 12.0pt;font-weight:bold;">
					��ҵ״��
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
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������λ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��λ����</font>
				</td>
				<td height="25px" align="center" class="tdStyle" colspan="3">
					<font style="font-size: 12.0pt;font-weight:bold;">��λ��ַ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��λ�绰</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ְҵ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ҵ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ְ��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ְ��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���뱾��λ���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
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
<!-- �� ��Ϣ��Ҫ -->
	<!-- ��һ���������ñ��桰���ֽ���� -->
	<xsl:template match="PSM/PC01">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">��һ���������ñ��桰���ֽ����</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ֽ��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���λ��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����˵������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">˵��</font>
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
	<!-- �������Ŵ�������Ϣ��ʾ �������Ŵ�����ΥԼ��Ϣ��Ҫ ���ģ��Ŵ��������ż���ծ��Ϣ��Ҫ -->
	<xsl:template match="PCO/PC02">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">�������Ŵ�������Ϣ��ʾ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle" colspan="2">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ����������</font>
				</td>
				<td height="25px" align="center" class="tdStyle" colspan="2">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻����ϼ�</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ױ�ҵ�񷢷��·�</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">�������Ŵ�����ΥԼ��Ϣ��Ҫ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle" colspan="3">
					<font style="font-size: 12.0pt;font-weight:bold;">��׷����Ϣ����</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ����������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻����ϼ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ϼ�</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">������Ϣ����</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
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
					���ڣ�͸֧����Ϣ���ܣ��˻���Ϣ������<xsl:value-of select="PC02D/PC02DS01"/>��</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�·���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����������/͸֧�ܶ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����/͸֧����</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">���ģ��Ŵ��������ż���ծ��Ϣ��Ҫ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle" colspan="5">
					<font style="font-size: 12.0pt;font-weight:bold;">��ѭ�����˻���Ϣ����</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����ܶ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��� 6 ����ƽ��Ӧ����</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">ѭ������·��˻���Ϣ����</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����ܶ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��� 6 ����ƽ��Ӧ����</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">ѭ�����˻���Ϣ����</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����ܶ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��� 6 ����ƽ��Ӧ����</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">���ǿ��˻���Ϣ����</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����ܶ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ���������Ŷ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ���������Ŷ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ö��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��� 6 ����ƽ��ʹ�ö��</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">׼���ǿ��˻���Ϣ����</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����ܶ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ���������Ŷ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ���������Ŷ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">͸֧���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��� 6 ����ƽ��͸֧���</font>
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
					��ػ���������Ϣ���ܣ���ػ������θ�����<xsl:value-of select="PC02K/PC02KS01"/>��
					</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������ν��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">Ϊ����</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle" colspan="3">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle" colspan="3">
					<font style="font-size: 12.0pt;font-weight:bold;">������ػ�������</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������ν��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">Ϊ��ҵ</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle" colspan="3">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle" colspan="3">
					<font style="font-size: 12.0pt;font-weight:bold;">������ػ�������</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������ν��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
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
	<!-- ���壩���Ŵ�������Ϣ��Ҫ -->
	<xsl:template match="PNO/PC03">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">���壩���Ŵ�������Ϣ��Ҫ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle" colspan="3">
					<font style="font-size: 12.0pt;font-weight:bold;">
					�󸶷�ҵ��Ƿ����Ϣ���ܣ��󸶷�ҵ������������<xsl:value-of select="PC030S01"/>��
					</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�󸶷�ҵ������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">Ƿ���˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">Ƿ�ѽ��</font>
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
	<!-- ������������Ϣ��Ҫ -->
	<xsl:template match="PPO/PC04">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">������������Ϣ��Ҫ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle" colspan="3">
					<font style="font-size: 12.0pt;font-weight:bold;">
					������Ϣ���ܣ�������Ϣ����������<xsl:value-of select="PC040S01"/>��
					</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������Ϣ����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��¼��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�漰���</font>
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
	<!-- ���ߣ���ѯ��¼��Ҫ -->
	<xsl:template match="PQO/PC05">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">���ߣ���ѯ��¼��Ҫ</font>
				</td>
			</tr>
		</table>
		<xsl:if test="PC05A != ''">
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle" colspan="4">
						<font style="font-size: 12.0pt;font-weight:bold;">��һ�β�ѯ��¼</font>
					</td>
				</tr>
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��һ�β�ѯ����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��һ�β�ѯ��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��һ�β�ѯ��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��һ�β�ѯԭ��</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">��� 1 �����ڵĲ�ѯ������</font>
				</td>
				<td height="25px" align="center" class="tdStyle" colspan="3">
					<font style="font-size: 12.0pt;font-weight:bold;">��� 1 �����ڵĲ�ѯ����</font>
				</td>
				<td height="25px" align="center" class="tdStyle" colspan="3">
					<font style="font-size: 12.0pt;font-weight:bold;">��� 2 ���ڵĲ�ѯ����</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">
						��������
					</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">
						���ÿ�����
					</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">
						��������
					</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">
						���ÿ�����
					</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">
						���˲�ѯ
					</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">
						�������
					</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">
						�����ʸ����
					</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">
						��Լ�̻�ʵ�����
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
<!-- �� �Ŵ�������Ϣ��ϸ -->
	<!-- ��һ����׷����ϢC1��������ѭ�����˻�D1������ѭ������·��˻�R4���ģ�ѭ�����˻�R1���壩���ǿ��˻�R2������׼���ǿ��˻�R3  -->
	<xsl:template match="PDA">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">��һ����׷����Ϣ</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="PD01[PD01A/PD01AD01 = 'C1']">
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="left">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻�<xsl:number value="position()"/>
						</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;font-weight:bold;">������Ϣ</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻�����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻���ʶ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����Э����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ҵ������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�����</font>
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
							&#160;�����˻�
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
						<font style="font-size: 12.0pt;font-weight:bold;">�˻����Ŷ��</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�������Ŷ��</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">���ʽ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����Ƶ��</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">������ʽ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�������ʽ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��ͬ����־</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ծȨת��ʱ�Ļ���״̬</font>
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
						<font style="font-size: 12.0pt;font-weight:bold;">���±�����Ϣ</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻�״̬</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">�ر�����</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">ת���·�</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">���</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">���һ�λ�������</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">���һ�λ�����</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">�弶����</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">����״̬</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="4">
						<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">���һ���¶ȱ���</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�·�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�˻�״̬</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ö��</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">δ�����Ĵ��ר��������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�弶����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">ʣ�໹������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����/Ӧ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����Ӧ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����ʵ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���һ�λ�������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ǰ��������</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">��ǰ�����ܶ�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���� 31��60 ��δ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���� 61��90 ��δ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���� 91��180 ��δ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���� 180 ������δ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">͸֧ 180 ������δ�����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��� 6 ����ƽ��ʹ�ö��</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��� 6 ����ƽ��͸֧���</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ʹ�ö��</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���͸֧���</font>
						</td>
						<td height="25px" align="center" class="tdStyle" colspan="2">
							<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">��� 24 ���»���״̬</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ʼ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ֹ����</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">�·�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����״̬</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">��� 5 ���ڵ���ʷ����</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ʼ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ֹ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">�·�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����״̬</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ڣ�͸֧�� �ܶ�</font>
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
							���⽻����Ϣ�����⽻�׸�����<xsl:value-of select="PD01F/PD01FS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���⽻������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���⽻�׷�������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�������ڱ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���⽻�׷������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���⽻����ϸ��¼</font>
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
							�����¼�˵���������¼�˵��������<xsl:value-of select="PD01G/PD01GS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�����¼������·�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�����¼�����</font>
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
							���ר����ڣ����ר����ڱ�����<xsl:value-of select="PD01H/PD01HS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ר����ڶ��</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ڶ����Ч����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ڶ�ȵ�������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���÷��ڽ��</font>
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
							��ע��������Ϣ����ע������������<xsl:value-of select="PD01Z/PD01ZS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">��������ѭ�����˻�</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="PD01[PD01A/PD01AD01 = 'D1']">
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="left">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻�<xsl:number value="position()"/>
						</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;font-weight:bold;">������Ϣ</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻�����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻���ʶ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����Э����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ҵ������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�����</font>
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
							&#160;�����˻�
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
						<font style="font-size: 12.0pt;font-weight:bold;">�˻����Ŷ��</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�������Ŷ��</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">���ʽ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����Ƶ��</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">������ʽ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�������ʽ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��ͬ����־</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ծȨת��ʱ�Ļ���״̬</font>
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
						<font style="font-size: 12.0pt;font-weight:bold;">���±�����Ϣ</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻�״̬</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">�ر�����</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">ת���·�</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">���</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">���һ�λ�������</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">���һ�λ�����</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">�弶����</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">����״̬</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="4">
						<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">���һ���¶ȱ���</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�·�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�˻�״̬</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ö��</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">δ�����Ĵ��ר��������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�弶����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">ʣ�໹������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����/Ӧ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����Ӧ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����ʵ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���һ�λ�������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ǰ��������</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">��ǰ�����ܶ�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���� 31��60 ��δ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���� 61��90 ��δ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���� 91��180 ��δ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���� 180 ������δ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">͸֧ 180 ������δ�����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��� 6 ����ƽ��ʹ�ö��</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��� 6 ����ƽ��͸֧���</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ʹ�ö��</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���͸֧���</font>
						</td>
						<td height="25px" align="center" class="tdStyle" colspan="2">
							<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">��� 24 ���»���״̬</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ʼ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ֹ����</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">�·�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����״̬</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">��� 5 ���ڵ���ʷ����</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ʼ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ֹ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">�·�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����״̬</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ڣ�͸֧�� �ܶ�</font>
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
							���⽻����Ϣ�����⽻�׸�����<xsl:value-of select="PD01F/PD01FS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���⽻������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���⽻�׷�������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�������ڱ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���⽻�׷������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���⽻����ϸ��¼</font>
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
							�����¼�˵���������¼�˵��������<xsl:value-of select="PD01G/PD01GS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�����¼������·�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�����¼�����</font>
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
							���ר����ڣ����ר����ڱ�����<xsl:value-of select="PD01H/PD01HS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ר����ڶ��</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ڶ����Ч����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ڶ�ȵ�������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���÷��ڽ��</font>
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
							��ע��������Ϣ����ע������������<xsl:value-of select="PD01Z/PD01ZS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">������ѭ������·��˻�</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="PD01[PD01A/PD01AD01 = 'R4']">
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="left">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻�<xsl:number value="position()"/>
						</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;font-weight:bold;">������Ϣ</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻�����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻���ʶ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����Э����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ҵ������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�����</font>
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
							&#160;�����˻�
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
						<font style="font-size: 12.0pt;font-weight:bold;">�˻����Ŷ��</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�������Ŷ��</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">���ʽ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����Ƶ��</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">������ʽ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�������ʽ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��ͬ����־</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ծȨת��ʱ�Ļ���״̬</font>
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
						<font style="font-size: 12.0pt;font-weight:bold;">���±�����Ϣ</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻�״̬</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">�ر�����</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">ת���·�</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">���</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">���һ�λ�������</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">���һ�λ�����</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">�弶����</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">����״̬</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="4">
						<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">���һ���¶ȱ���</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�·�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�˻�״̬</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ö��</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">δ�����Ĵ��ר��������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�弶����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">ʣ�໹������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����/Ӧ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����Ӧ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����ʵ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���һ�λ�������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ǰ��������</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">��ǰ�����ܶ�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���� 31��60 ��δ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���� 61��90 ��δ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���� 91��180 ��δ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���� 180 ������δ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">͸֧ 180 ������δ�����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��� 6 ����ƽ��ʹ�ö��</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��� 6 ����ƽ��͸֧���</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ʹ�ö��</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���͸֧���</font>
						</td>
						<td height="25px" align="center" class="tdStyle" colspan="2">
							<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">��� 24 ���»���״̬</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ʼ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ֹ����</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">�·�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����״̬</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">��� 5 ���ڵ���ʷ����</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ʼ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ֹ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">�·�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����״̬</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ڣ�͸֧�� �ܶ�</font>
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
							���⽻����Ϣ�����⽻�׸�����<xsl:value-of select="PD01F/PD01FS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���⽻������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���⽻�׷�������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�������ڱ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���⽻�׷������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���⽻����ϸ��¼</font>
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
							�����¼�˵���������¼�˵��������<xsl:value-of select="PD01G/PD01GS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�����¼������·�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�����¼�����</font>
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
							���ר����ڣ����ר����ڱ�����<xsl:value-of select="PD01H/PD01HS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ר����ڶ��</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ڶ����Ч����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ڶ�ȵ�������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���÷��ڽ��</font>
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
							��ע��������Ϣ����ע������������<xsl:value-of select="PD01Z/PD01ZS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">���ģ�ѭ�����˻�</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="PD01[PD01A/PD01AD01 = 'R1']">
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="left">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻�<xsl:number value="position()"/>
						</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;font-weight:bold;">������Ϣ</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻�����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻���ʶ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����Э����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ҵ������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�����</font>
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
							&#160;�����˻�
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
						<font style="font-size: 12.0pt;font-weight:bold;">�˻����Ŷ��</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�������Ŷ��</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">���ʽ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����Ƶ��</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">������ʽ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�������ʽ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��ͬ����־</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ծȨת��ʱ�Ļ���״̬</font>
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
						<font style="font-size: 12.0pt;font-weight:bold;">���±�����Ϣ</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻�״̬</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">�ر�����</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">ת���·�</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">���</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">���һ�λ�������</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">���һ�λ�����</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">�弶����</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">����״̬</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="4">
						<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">���һ���¶ȱ���</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�·�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�˻�״̬</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ö��</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">δ�����Ĵ��ר��������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�弶����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">ʣ�໹������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����/Ӧ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����Ӧ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����ʵ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���һ�λ�������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ǰ��������</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">��ǰ�����ܶ�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���� 31��60 ��δ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���� 61��90 ��δ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���� 91��180 ��δ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���� 180 ������δ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">͸֧ 180 ������δ�����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��� 6 ����ƽ��ʹ�ö��</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��� 6 ����ƽ��͸֧���</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ʹ�ö��</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���͸֧���</font>
						</td>
						<td height="25px" align="center" class="tdStyle" colspan="2">
							<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">��� 24 ���»���״̬</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ʼ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ֹ����</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">�·�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����״̬</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">��� 5 ���ڵ���ʷ����</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ʼ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ֹ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">�·�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����״̬</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ڣ�͸֧�� �ܶ�</font>
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
							���⽻����Ϣ�����⽻�׸�����<xsl:value-of select="PD01F/PD01FS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���⽻������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���⽻�׷�������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�������ڱ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���⽻�׷������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���⽻����ϸ��¼</font>
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
							�����¼�˵���������¼�˵��������<xsl:value-of select="PD01G/PD01GS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�����¼������·�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�����¼�����</font>
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
							���ר����ڣ����ר����ڱ�����<xsl:value-of select="PD01H/PD01HS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ר����ڶ��</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ڶ����Ч����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ڶ�ȵ�������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���÷��ڽ��</font>
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
							��ע��������Ϣ����ע������������<xsl:value-of select="PD01Z/PD01ZS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">���壩���ǿ��˻�</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="PD01[PD01A/PD01AD01 = 'R2']">
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="left">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻�<xsl:number value="position()"/>
						</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;font-weight:bold;">������Ϣ</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻�����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻���ʶ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����Э����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ҵ������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�����</font>
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
							&#160;�����˻�
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
						<font style="font-size: 12.0pt;font-weight:bold;">�˻����Ŷ��</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�������Ŷ��</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">���ʽ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����Ƶ��</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">������ʽ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�������ʽ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��ͬ����־</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ծȨת��ʱ�Ļ���״̬</font>
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
						<font style="font-size: 12.0pt;font-weight:bold;">���±�����Ϣ</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻�״̬</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">�ر�����</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">ת���·�</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">���</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">���һ�λ�������</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">���һ�λ�����</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">�弶����</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">����״̬</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="4">
						<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">���һ���¶ȱ���</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�·�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�˻�״̬</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ö��</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">δ�����Ĵ��ר��������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�弶����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">ʣ�໹������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����/Ӧ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����Ӧ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����ʵ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���һ�λ�������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ǰ��������</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">��ǰ�����ܶ�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���� 31��60 ��δ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���� 61��90 ��δ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���� 91��180 ��δ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���� 180 ������δ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">͸֧ 180 ������δ�����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��� 6 ����ƽ��ʹ�ö��</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��� 6 ����ƽ��͸֧���</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ʹ�ö��</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���͸֧���</font>
						</td>
						<td height="25px" align="center" class="tdStyle" colspan="2">
							<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">��� 24 ���»���״̬</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ʼ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ֹ����</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">�·�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����״̬</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">��� 5 ���ڵ���ʷ����</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ʼ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ֹ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">�·�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����״̬</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ڣ�͸֧�� �ܶ�</font>
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
							���⽻����Ϣ�����⽻�׸�����<xsl:value-of select="PD01F/PD01FS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���⽻������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���⽻�׷�������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�������ڱ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���⽻�׷������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���⽻����ϸ��¼</font>
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
							�����¼�˵���������¼�˵��������<xsl:value-of select="PD01G/PD01GS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�����¼������·�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�����¼�����</font>
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
							���ר����ڣ����ר����ڱ�����<xsl:value-of select="PD01H/PD01HS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ר����ڶ��</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ڶ����Ч����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ڶ�ȵ�������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���÷��ڽ��</font>
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
							��ע��������Ϣ����ע������������<xsl:value-of select="PD01Z/PD01ZS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">������׼���ǿ��˻�</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="PD01[PD01A/PD01AD01 = 'R3']">
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="left">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻�<xsl:number value="position()"/>
						</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center">
						<font style="font-size: 12.0pt;font-weight:bold;">������Ϣ</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻�����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻���ʶ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����Э����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ҵ������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�����</font>
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
							&#160;�����˻�
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
						<font style="font-size: 12.0pt;font-weight:bold;">�˻����Ŷ��</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�������Ŷ��</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">���ʽ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����Ƶ��</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">������ʽ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�������ʽ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��ͬ����־</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ծȨת��ʱ�Ļ���״̬</font>
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
						<font style="font-size: 12.0pt;font-weight:bold;">���±�����Ϣ</font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻�״̬</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">�ر�����</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">ת���·�</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">���</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">���һ�λ�������</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">���һ�λ�����</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">�弶����</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">����״̬</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="4">
						<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">���һ���¶ȱ���</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�·�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�˻�״̬</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ö��</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">δ�����Ĵ��ר��������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�弶����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">ʣ�໹������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����/Ӧ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����Ӧ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����ʵ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���һ�λ�������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ǰ��������</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">��ǰ�����ܶ�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���� 31��60 ��δ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���� 61��90 ��δ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���� 91��180 ��δ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���� 180 ������δ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">͸֧ 180 ������δ�����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��� 6 ����ƽ��ʹ�ö��</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��� 6 ����ƽ��͸֧���</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ʹ�ö��</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���͸֧���</font>
						</td>
						<td height="25px" align="center" class="tdStyle" colspan="2">
							<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">��� 24 ���»���״̬</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ʼ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ֹ����</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">�·�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����״̬</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">��� 5 ���ڵ���ʷ����</font>
						</td>
					</tr>
				</table>
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ʼ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ֹ����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����</font>
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
							<font style="font-size: 12.0pt;font-weight:bold;">�·�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">����״̬</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ڣ�͸֧�� �ܶ�</font>
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
							���⽻����Ϣ�����⽻�׸�����<xsl:value-of select="PD01F/PD01FS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���⽻������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���⽻�׷�������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�������ڱ������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���⽻�׷������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���⽻����ϸ��¼</font>
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
							�����¼�˵���������¼�˵��������<xsl:value-of select="PD01G/PD01GS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�����¼������·�</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�����¼�����</font>
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
							���ר����ڣ����ר����ڱ�����<xsl:value-of select="PD01H/PD01HS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ר����ڶ��</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ڶ����Ч����</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���ڶ�ȵ�������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">���÷��ڽ��</font>
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
							��ע��������Ϣ����ע������������<xsl:value-of select="PD01Z/PD01ZS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
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
	<!-- ���ߣ�����Э����Ϣ -->
	<xsl:template match="PCA">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">���ߣ�����Э����Ϣ</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="PD02">
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="left">
						<font style="font-size: 12.0pt;font-weight:bold;">����Э��<xsl:number value="position()"/></font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����Э����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ҵ��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����Э���ʶ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">���Ŷ����;</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">���Ŷ��</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����</font>
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
						<font style="font-size: 12.0pt;font-weight:bold;">��Ч����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����Э��״̬</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">���ö��</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�����޶�</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">�����޶���</font>
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
							��ע��������Ϣ����ע������������<xsl:value-of select="PD02Z/PD02ZS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
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
	<!-- ���ˣ���ػ���������Ϣ -->
	<xsl:template match="PCR">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">���ˣ���ػ���������Ϣ</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">����ػ������εĸ��˽��</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="PD03[PD03A/PD03AD08 = '1']">
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="left">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻�<xsl:number value="position()"/></font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�������������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ҵ��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ҵ������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��ػ�������������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��֤��ͬ���</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��ػ������ν��</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">���</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�弶����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻�����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����״̬</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
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
							��ע��������Ϣ����ע������������<xsl:value-of select="PD03Z/PD03ZS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">����ػ������ε���ҵ���</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="PD03[PD03A/PD03AD08 = '2']">
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="left">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻�<xsl:number value="position()"/></font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�������������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ҵ��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ҵ������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��ػ�������������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��֤��ͬ���</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��ػ������ν��</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">���</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�弶����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻�����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����״̬</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
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
							��ע��������Ϣ����ע������������<xsl:value-of select="PD03Z/PD03ZS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
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
	
<!-- �� ���Ŵ�������Ϣ��ϸ -->
	<xsl:template match="PND">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">�󸶷Ѽ�¼</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="PE01">
			<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="left">
						<font style="font-size: 12.0pt;font-weight:bold;">�˻�<xsl:number value="position()"/></font>
					</td>
				</tr>
			</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�󸶷��˻�����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ҵ������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ҵ��ͨ����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��ǰ�ɷ�״̬</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��ǰǷ�ѽ��</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��� 24 ���½ɷѼ�¼</font>
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
							��ע��������Ϣ����ע������������<xsl:value-of select="PE01Z/PE01ZS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
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
<!-- �� ������Ϣ��ϸ -->
	<!-- ��һ��Ƿ˰��¼ -->
	<xsl:template match="POT">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">��һ�� Ƿ˰��¼</font>
				</td>
			</tr>
		</table>
		<xsl:if test="PF01 != ''">
			<xsl:for-each select="PF01">
				<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">���</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����˰�����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">Ƿ˰�ܶ�</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">Ƿ˰ͳ������</font>
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
							��ע��������Ϣ����ע������������<xsl:value-of select="PF01Z/PF01ZS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
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
	<!-- �����������о���¼ -->
	<xsl:template match="PCJ">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">�����������о���¼</font>
				</td>
			</tr>
		</table>
		<xsl:if test="PF02 != ''">
			<xsl:for-each select="PF02">
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">������Ժ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�᰸��ʽ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�о�/������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�о�/������Ч����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">���ϱ��</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">���ϱ�Ľ��</font>
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
							��ע��������Ϣ����ע������������<xsl:value-of select="PF02Z/PF02ZS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
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
	<!-- ������ǿ��ִ�м�¼ -->
	<xsl:template match="PCE">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">������ǿ��ִ�м�¼</font>
				</td>
			</tr>
		</table>
		<xsl:if test="PF03 != ''">
			<xsl:for-each select="PF03">
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">ִ�з�Ժ</font>
					</td>
					<td height="25px" align="center" class="tdStyle" colspan="2">
						<font style="font-size: 12.0pt;font-weight:bold;">ִ�а���</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�᰸��ʽ</font>
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
						<font style="font-size: 12.0pt;font-weight:bold;">����״̬</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�᰸����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����ִ�б��</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����ִ�б�ļ�ֵ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��ִ�б��</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��ִ�б�Ľ��</font>
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
							��ע��������Ϣ����ע������������<xsl:value-of select="PF03Z/PF03ZS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
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
	<!-- ���ģ�����������¼ -->
	<xsl:template match="PAP">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">���ģ�����������¼</font>
				</td>
			</tr>
		</table>
		<xsl:if test="PF04 != ''">
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">���</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">������Ч����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">������ֹ����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">����������</font>
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
								��ע��������Ϣ����ע������������<xsl:value-of select="PF04Z/PF04ZS01"/>��
								</font>
							</td>
						</tr>
						<tr style="line-height:20px">
							<td height="25px" align="center" class="tdStyle">
								<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
							</td>
							<td height="25px" align="center" class="tdStyle">
								<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
							</td>
							<td height="25px" align="center" class="tdStyle">
								<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
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
	<!-- ���壩ס��������νɼ�¼ -->
	<xsl:template match="PHF">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">���壩ס��������νɼ�¼</font>
				</td>
			</tr>
		</table>
		<xsl:if test="PF05 != ''">
			<xsl:for-each select="PF05">
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�νɵ�</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�ν�����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�ɷ�״̬</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�����·�</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�����·�</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��λ�ɴ����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">���˽ɴ����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�½ɴ��</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�ɷѵ�λ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
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
							��ע��������Ϣ����ע������������<xsl:value-of select="PF05Z/PF05ZS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
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
	<!-- �������ͱ�������¼ -->
	<xsl:template match="PBS">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">�������ͱ�������¼</font>
				</td>
			</tr>
		</table>
		<xsl:if test="PF06 != ''">
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">���</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��Ա���</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">���ڵ�</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">������λ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��ͥ������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��׼����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
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
							��ע��������Ϣ����ע������������<xsl:value-of select="PF06Z/PF06ZS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
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
	<!-- ���ߣ�ִҵ�ʸ��¼ -->
	<xsl:template match="PPQ">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">���ߣ�ִҵ�ʸ��¼</font>
				</td>
			</tr>
		</table>
		<xsl:if test="PF07 != ''">
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">���</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">ִҵ�ʸ�����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�䷢����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�ȼ�</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�������ڵ�</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
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
							��ע��������Ϣ����ע������������<xsl:value-of select="PF07Z/PF07ZS01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
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
	<!-- ���ˣ�����������¼ -->
	<xsl:template match="PAH">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;font-weight:bold;">���ˣ�����������¼</font>
				</td>
			</tr>
		</table>
		<xsl:if test="PF08 != ''">
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">���</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��Ч����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��ֹ����</font>
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
								��ע��������Ϣ����ע������������<xsl:value-of select="PF08Z/PF08ZS01"/>��
								</font>
							</td>
						</tr>
						<tr style="line-height:20px">
							<td height="25px" align="center" class="tdStyle">
								<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
							</td>
							<td height="25px" align="center" class="tdStyle">
								<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
							</td>
							<td height="25px" align="center" class="tdStyle">
								<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
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
	<!-- �� �������� �� �����ע -->
	<xsl:template match="POS">
		<xsl:for-each select="PG01">
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px;" >
					<td height="25px" align="center" class="tdStyle" >
						<font style="font-size: 12.0pt;font-weight:bold;">���</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">�����ʶ</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��ע���������͸���</font>
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
							��ע��������Ϣ����ע������������<xsl:value-of select="PG01/PG010S01"/>��
							</font>
						</td>
					</tr>
					<tr style="line-height:20px">
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">��ע����������</font>
						</td>
						<td height="25px" align="center" class="tdStyle">
							<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
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
	<!-- �� ��ѯ��¼ -->
	<xsl:template match="POQ">
		<xsl:if test="count(child::*) != 0">
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
				<tr style="line-height:20px">
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">���</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��ѯ����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��ѯ��������</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��ѯ����</font>
					</td>
					<td height="25px" align="center" class="tdStyle">
						<font style="font-size: 12.0pt;font-weight:bold;">��ѯԭ��</font>
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
