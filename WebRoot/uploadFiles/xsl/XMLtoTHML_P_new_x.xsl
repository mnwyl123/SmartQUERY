<?xml version="1.0" encoding="gb2312"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:user="com.dcits.cq.util.XslUtil" extension-element-prefixes="user">
	<xsl:output method="html" version="1.0" encoding="gb2312"/>
	<xsl:template match="/Document">
		<html>
			<head><title>�������ñ���</title>
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
					<!--logo����ʾ��Ϣ-->
					<div class="m-hd">
						<div class="u-logo">
						<img src="../../../static/reportStyle/logo.gif" />
					</div>
					</div>
						<div class="m-rephead">
						<!-- ����ͷ��Ϣ -->
						<xsl:apply-templates select="PRH/PA01"/>
					</div>
					  <!-- ����һ���������         -->
					  <!--���˻�����Ϣ-->
					<div class="m-repbody">
						<div class="t1">һ ���˻�����Ϣ</div>
						<!-- ��һ�������Ϣ -->
						<xsl:apply-templates select="PIM/PB01"/>
						<!-- ������������Ϣ -->
						<xsl:apply-templates select="PMM/PB02"/>
						<!-- ��������ס��Ϣ -->
						<xsl:apply-templates select="PRM"/>
						<!-- ���ģ�ְҵ��Ϣ -->
						<xsl:apply-templates select="POM"/>
					</div>
						<!-- �� ��Ϣ��Ҫ -->
					<div class="m-repbody m-infobox">
						<div class="t1">�� ��Ϣ��Ҫ</div>
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
					</div>
					<div class="m-repbody">
						<!-- �� �Ŵ�������Ϣ��ϸ -->
						<div class="t1">�� �Ŵ�������Ϣ��ϸ</div>
						<!-- ��һ����׷����Ϣ��������ѭ�����˻�������ѭ������·��˻����ģ�ѭ�����˻����壩���ǿ��˻�������׼���ǿ��˻�  -->
						<xsl:apply-templates select="PDA"/>
						<!-- ���ߣ�����Э����Ϣ -->
						<xsl:apply-templates select="PCA"/>
						<!-- ���ˣ���ػ���������Ϣ -->
						<xsl:apply-templates select="PCR"/>
					</div>
					<div class="m-repbody">
						<!-- �� ���Ŵ�������Ϣ��ϸ -->
						<div class="t1">�� ���Ŵ�������Ϣ��ϸ</div>
						<xsl:apply-templates select="PND"/>
					</div>
					<div class="m-repbody">
						<!-- �� ������Ϣ��ϸ -->
						<div class="t1">�� ������Ϣ��ϸ</div>
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
					</div>
					<div class="m-repbody">
						<!-- �� �������� -->
						<div class="t1">�� ��������</div>
						<xsl:apply-templates select="POS"/>
					</div>
					<div class="m-repbody">
						<!-- �� ��ѯ��¼ -->
						<div class="t1">�� ��ѯ��¼</div>
						<xsl:apply-templates select="POQ"/>
						<!-- ����˵�� -->
						<xsl:apply-templates select="PRH"/>
					</div>
				</div>
				<script src="../../js/common/jquery-1.10.2.js"></script><SCRIPT>function printReport(){ javascript:document.execCommand('print');$.ajax({async:false,cache:false,data:{"ID":'a8b7037f48cf4924a2a62b9e048f7d3ea6d2b0c985a540279085e38db3f05163'},url:'../../../PersonReportInquiry/isPrint.do',type:"post" });}</SCRIPT><script>document.oncontextmenu = function(){return false;}</script>
				<form method="POST" action="--WEBBOT-SELF--"> 
				   <p align="center"> 
					<input onMouseOver="msover();" style="border:1px solid #cc9966; FONT-WEIGHT: normal; FONT-SIZE: 10pt; BACKGROUND: #fff6dc; COLOR: #000000; LINE-HEIGHT: normal; FONT-STYLE: normal; HEIGHT: 30; FONT-VARIANT: normal; width:58" onMouseOut="msout();" type="button" name="doPrint" value="��  ӡ" class="button2" onclick="printReport()"/>&#160;&#160;
					<input onMouseOver="msover();" style="border:1px solid #cc9966; FONT-WEIGHT: normal; FONT-SIZE: 10pt; BACKGROUND: #fff6dc; COLOR: #000000; LINE-HEIGHT: normal; FONT-STYLE: normal; HEIGHT: 30; FONT-VARIANT: normal; width:58" onMouseOut="msout();" type="button" name="goBack" value="��  ��" class="button1" onclick="window.location.href=document.referrer;"/> </p> 
				</form>
			</body>
			<script src="../../../static/reportStyle/shuiyin.js"></script>
			<script type="text/javascript">
				var now = getNow();
				watermark({"watermark_txt":"�����ṩ"+now});
			</script>
		</html>
	</xsl:template>
<!-- ����˵�� -->
	<xsl:template match="PRH">
		<div class="m-repbody">
		<div class="t1">����˵��</div>
		<ul class="u-msg-list">		
			<li>1. ���������й����������������ĳ��ߣ����ݽ�������ʱ��ĸ�������ϵͳ��¼����Ϣ���ɡ�����ѯ��¼�⣬������Ϣ������ػ����ṩ���������Ĳ���֤����ʵ�Ժ�׼ȷ�ԣ�����ŵ����Ϣ���ܡ��ӹ������ϵ�ȫ�����б��ֿ͹ۡ������ĵ�λ��</li>
			<li>2. �������еġ����ֽ��������ʹ�ñ����ñ�������е����Ż����ο������Ż���Ӧ���ге�ʹ�á����ֽ��������ط������Ρ�</li>
			<li>3.���ֽ���������ñ������ݽ��Ϊһ����ֵ���Ƕ���������δ���Ŵ�ΥԼ�����Ե�Ԥ�⣬��ȡֵ��ΧΪ0��1000����ֵԽ�ߣ�ΥԼ������Խ�ͣ������λ�á���������������ֽ��ֵ��ȫ����Ⱥ�еİٷֱ�����λ�ã����硰>50%����������ֽ��ֵ����50%���������壻��˵�����еġ�Ӱ�����ء���Ӱ�����������ø������ֽ��ֵ��ԭ�򣬸��ݵ�ǰ���ñ����ʵ���������������������������ֽ������ʾΪ��--���ģ��������޷����ݵ�ǰ���ñ������ݸ������ֽ��ֵ�������������塣�޷��������ֽ��ֵ�ľ���ԭ�����˵������</li>
			<li>4.��������Ŵ�������Ϣ��ʾ�У���ҵ�����͡�Ϊ���������Ļ�����Ϣ���������ʲ����á��͡���ҵ��</li>
			<li>5.�����������û�С��Ŵ�����ΥԼ��Ϣ��Ҫ����Ϣ��˵�������������5����û���������ڡ�</li>
			<li>6.���ڴ��������޶��Э����Ϣ����Ϣ����Ŀ��ö�����ϡ�����Э����Ϣ���е����Ŷ�ȡ������޶���Ϣ�������й��㡣</li>
			<li>7.�������е��Ŵ��������ż���ծ��Ϣ��Ҫչʾ����Ϣ��ָδ����/δ���������ż���ծ��Ϣ��</li>
			<li>8.������Ľ��������ϸ��Ϣ�У�ѭ�����˻��ĵ���������ָ�˻����Ŷ�ȵĵ������ڡ�</li>
			<li>9.������Ľ��������ϸ��Ϣ�У�����˻�չʾ���5��Ļ��������������ǰ����״̬�͵�ǰ�����ܶ</li>
			<li>10.����ͨ��������������ġ�С���Ƶ��ҵ�񣬽��ڻ������ϲ���������˻���չʾ�ڱ�����Ľ��������ϸ��Ϣ�У���ʱ�˻��Ļ��ʽΪ�������ֻ��ʽ�������˻��Ļ���Ƶ��ͳһԼ��Ϊ���¡������������������¼��㣬�仹����Ϣ���½��й۲�͸��¡�</li>
			<li>11.�������е�����׼���ǿ��˻���ָ���˻�60�����ϵ�͸֧��Ϊ��</li>
			<li>12.�������еĻ�������Ϊ��--����ָ���˻��ǷǷ��ڻ��</li>
			<li>13.�����治չʾ5��ǰ�Ѿ�������ΥԼ��Ϊ���Լ�5��ǰ��Ƿ˰��¼��ǿ��ִ�м�¼�������о���¼������������¼������Ƿ�Ѽ�¼��</li>
			<li>14.����˵���������ṩ�����Ծ���ҵ����ӵ��ر�˵����Ϣ��</li>
			<li>15.������������Ϣ��������ñ����е���Ϣ����ע�ļ�Ҫ˵������������Ա�����������ʵ�Ը���</li>
			<li>16.�����ע������������ӵģ�����˵��������������ñ����е���Щ��Ϣ�����顣</li>
			<li>17.�����������漰������˽����ѯ��Ӧ����ʹ�á����Ʊ��ܡ���ʹ�ò�����ɸ�����Ϣй¶�ģ��������Ľ����е�������Ρ�</li>
			<li>18.�����������н���������ػ������ε���ҵ���еĽ���⣩��Ϊ����ҽ����ղ�ѯ��ǰһ��Ļ��ʡ�</li>
			<li>19.�����������������ṩ��������Ϣ���岻֤ͬ�����͵���Ϣ��</li>
		</ul></div>
	</xsl:template>
<!-- ����ͷ��Ϣ -->
	<xsl:template match="PRH/PA01">
		<div class="m-reptitle">
          <h1 class="u-repname">�������ñ���</h1>
          <h3 class="u-repver">�������棩</h3>
        </div>
		<table class="g-tab-bor">
          <tbody>
            <tr>
              <td style="TEXT-ALIGN: left; WIDTH: 60%" colspan="3">�����ţ�<xsl:value-of select="PA01A/PA01AI01"/></td>
              <td style="TEXT-ALIGN: right; WIDTH: 40%" colspan="2">����ʱ�䣺<xsl:value-of select="PA01A/PA01AR01"/></td>
            </tr>
            <tr>
              <th style="WIDTH: 20%">����ѯ������</th>
              <th style="WIDTH: 20%">����ѯ��֤������</th>
              <th style="WIDTH: 20%">����ѯ��֤������</th>
              <th style="WIDTH: 20%">��ѯ����</th>
              <th style="WIDTH: 20%">��ѯԭ��</th>
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
			<div class="t2 f-mgtop">����֤����Ϣ��֤��������<xsl:value-of select="PA01C/PA01CS01"/>��</div>
			<table class="g-tab-bor">
			  <tbody>
				<tr>
				  <th style="WIDTH: 50%">֤������</th>
				  <th style="WIDTH: 50%">֤������</th>
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
			<div class="t2 f-mgtop">����թ��ʾ</div>
			<table class="g-tab-bor">
			  <tbody>
				<tr>
				  <th style="WIDTH: 25%">����թ��ʾ��־</th>
				  <th style="WIDTH: 25%">����թ��ʾ��ϵ�绰</th>
				  <th style="WIDTH: 25%">����թ��ʾ��Ч����</th>
				  <th style="WIDTH: 25%">����թ��ʾ��ֹ����</th>
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
			<div class="t2 f-mgtop">������Ϣ��ʾ</div>
			<table class="g-tab-bor">
			  <tbody>
				<tr>
				  <th class="t2-2">�����ע��Ŀ</th>
				</tr>
				<tr>
				  <td><xsl:value-of select="PA01E/PA01ES01"/></td>
				</tr>
			  </tbody>
			</table>
		</xsl:if>
	</xsl:template>
<!-- һ ���˻�����Ϣ -->
	<!-- ��һ�������Ϣ -->
	<xsl:template match="PIM/PB01">
		<div class="t2 f-mgtop">��һ�������Ϣ</div>
		<table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-8">�Ա�</th>
              <th class="g-w-8">��������</th>
              <th class="g-w-8">����״��</th>
              <th class="g-w-8">ѧ��</th>
              <th class="g-w-8">ѧλ</th>
              <th class="g-w-8">��ҵ״��</th>
              <th class="g-w-8">����</th>
              <th class="g-w-8">��������</th>
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
          <!--�����ϱ߿�-->
          <tbody>
            <tr>
              <th class="g-w-2">ͨѶ��ַ</th>
              <th class="g-w-2">������ַ</th>
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
              <th style="WIDTH: 6%">���</th>
              <th style="WIDTH: 47%">�ֻ�����</th>
              <th style="WIDTH: 47%">��Ϣ��������</th>
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
	<!-- ������������Ϣ -->
	<xsl:template match="PMM/PB02">
		<div class="t2 f-mgtop">��������ż��Ϣ</div>
		 <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-5">����</th>
              <th class="g-w-5">֤������</th>
              <th class="g-w-5">֤������</th>
              <th class="g-w-5">������λ</th>
              <th class="g-w-5">��ϵ�绰</th>
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
	<!-- ��������ס��Ϣ -->
	<xsl:template match="PRM">
		<div class="t2 f-mgtop">��������ס��Ϣ</div>
		 <table class="g-tab-bor f-tab-nomargin">
		 <tbody>
            <tr>
              <th style="WIDTH: 6%">���</th>
              <th style="WIDTH: 46%">��ס��ַ</th>
              <th style="WIDTH: 16%">סլ�绰</th>
              <th style="WIDTH: 16%">��ס״��</th>
              <th style="WIDTH: 16%">��Ϣ��������</th>
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
	<!-- ���ģ�ְҵ��Ϣ -->
	<xsl:template match="POM">
		<div class="t2 f-mgtop">���ģ�ְҵ��Ϣ</div>
		<table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th style="WIDTH: 6%">���</th>
              <th style="WIDTH: 15%">��ҵ״��</th>
              <th style="WIDTH: 18%">������λ</th>
              <th style="WIDTH: 12%">��λ����</th>
              <th style="WIDTH: 33%">��λ��ַ</th>
              <th style="WIDTH: 16%">��λ�绰</th>
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
          <!--�����ϱ߿�-->
          <tbody>
            <tr>
              <th style="WIDTH: 6%">���</th>
              <th style="WIDTH: 18%">ְҵ</th>
              <th style="WIDTH: 28%">��ҵ</th>
              <th style="WIDTH: 10%">ְ��</th>
              <th style="WIDTH: 6%">ְ��</th>
              <th style="WIDTH: 15%">���뱾��λ���</th>
              <th style="WIDTH: 15%">��Ϣ��������</th>
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
<!-- �� ��Ϣ��Ҫ -->
	<!-- ��һ���������ñ��桰���ֽ���� -->
	<xsl:template match="PSM/PC01">
		<div class="t2 f-mgtop">���ֽ��</div>
		<table class="g-subtab-bor">
          <!--�����ϱ߿�-->
          <tbody>
            <tr>
              <th class="g-w-4">���ֽ��</th>
              <th class="g-w-4">���λ��</th>
              <th class="g-w-4">����˵������</th>
              <th class="g-w-4">˵��</th>
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
	<!-- �������Ŵ�������Ϣ��ʾ �������Ŵ�����ΥԼ��Ϣ��Ҫ ���ģ��Ŵ��������ż���ծ��Ϣ��Ҫ -->
	<xsl:template match="PCO/PC02">
		<div class="t2 f-mgtop">�������Ŵ�������Ϣ��ʾ</div>
		<table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-4">ҵ������</th>
              <th class="g-w-4">ҵ������</th>
              <th class="g-w-4">�˻���</th>
              <th class="g-w-4">�ױ�ҵ�񷢷��·�</th>
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
              <th colspan="2">�ϼ�</th>
              <td><xsl:value-of select="PC02A/PC02AS01"/></td>
              <td>-</td>
            </tr>
          </tbody>
        </table>
		<div class="t2 f-mgtop">�������Ŵ�����ΥԼ��Ϣ��Ҫ</div>
		<table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="t2-2" colspan="3">��׷����Ϣ����</th>
            </tr>
            <tr>
              <th class="g-w-3">�˻�����</th>
              <th class="g-w-3">ҵ������</th>
              <th class="g-w-3">���</th>
            </tr>
			<xsl:for-each select="PC02B/PC02BH">
				<tr>
					<td><span name="1016"><xsl:value-of select="PC02BD01"/></span></td>
					<td><xsl:value-of select="PC02BS03"/></td>
					<td><xsl:value-of select="PC02BJ02"/></td>
				</tr>
			</xsl:for-each>
            <tr>
              <th>�ϼ�</th>
              <td><xsl:value-of select="PC02B/PC02BS02"/></td>
              <td><xsl:value-of select="PC02B/PC02BJ01"/></td>
            </tr>
          </tbody>
        </table>
		<table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="t2-2" colspan="3">������Ϣ����</th>
            </tr>
            <tr>
              <th class="g-w-2">�˻���</th>
              <th class="g-w-2">���</th>
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
				  <th class="t2-2" colspan="5">���ڣ�͸֧����Ϣ����</th>
				</tr>
				<tr>
				  <th class="g-w-5">�˻�����</th>
				  <th class="g-w-5">�˻���</th>
				  <th class="g-w-5">�·���</th>
				  <th class="g-w-5">�����������/͸֧�ܶ�</th>
				  <th class="g-w-5">�����/͸֧����</th>
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
		<div class="t2 f-mgtop">���ģ��Ŵ��������ż���ծ��Ϣ��Ҫ</div>
		<table class="g-tab-bor f-tab-nomargin">
			<tbody>
				<tr>
				  <th class="t2-2" colspan="5">��ѭ�����˻���Ϣ����</th>
				</tr>
				<tr>
				  <th class="g-w-5">���������</th>
				  <th class="g-w-5">�˻���</th>
				  <th class="g-w-5">�����ܶ�</th>
				  <th class="g-w-5">���</th>
				  <th class="g-w-5">���6����ƽ��Ӧ����</th>
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
				  <th class="t2-2" colspan="5">ѭ������·��˻�������Ϣ</th>
				</tr>
				<tr>
				  <th class="g-w-5">���������</th>
				  <th class="g-w-5">�˻���</th>
				  <th class="g-w-5">�����ܶ�</th>
				  <th class="g-w-5">���</th>
				  <th class="g-w-5">���6����ƽ��Ӧ����</th>
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
				  <th class="t2-2" colspan="5">ѭ�����˻�������Ϣ</th>
				</tr>
				<tr>
				  <th class="g-w-5">���������</th>
				  <th class="g-w-5">�˻���</th>
				  <th class="g-w-5">�����ܶ�</th>
				  <th class="g-w-5">���</th>
				  <th class="g-w-5">���6����ƽ��Ӧ����</th>
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
				  <th class="t2-2" colspan="7">���ǿ��˻���Ϣ����</th>
				</tr>
				<tr>
				  <th class="g-w-7">����������</th>
				  <th class="g-w-7">�˻���</th>
				  <th class="g-w-7">�����ܶ�</th>
				  <th class="g-w-7">���һ���
				  <br />������Ŷ�</th>
				  <th class="g-w-7">���һ���
				  <br />������Ŷ�</th>
				  <th class="g-w-7">���ö��</th>
				  <th class="g-w-7">���6����
				  <br />ƽ��ʹ�ö��</th>
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
				  <th class="t2-2" colspan="7">׼���ǿ��˻���Ϣ����</th>
				</tr>
				<tr>
				  <th class="g-w-7">����������</th>
				  <th class="g-w-7">�˻���</th>
				  <th class="g-w-7">�����ܶ�</th>
				  <th class="g-w-7">���һ���
				  <br />������Ŷ�</th>
				  <th class="g-w-7">���һ���
				  <br />������Ŷ�</th>
				  <th class="g-w-7">͸֧���</th>
				  <th class="g-w-7">���6����
				  <br />ƽ��ʹ�ö��</th>
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
					  <th class="t2-2" colspan="5">��ػ���������Ϣ����</th>
					</tr>
					<tr>
					  <th class="g-w-5">�����������</th>
					  <th class="g-w-5">������������</th>
					  <th class="g-w-5">�˻���</th>
					  <th class="g-w-5">�������ν��</th>
					  <th class="g-w-5">���</th>
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
	<!-- ���壩���Ŵ�������Ϣ��Ҫ -->
	<xsl:template match="PNO/PC03">
		<div class="t2 f-mgtop">���壩���Ŵ�������Ϣ��Ҫ</div>
		<table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="t2-2" colspan="7">�󸶷�ҵ��Ƿ����Ϣ����</th>
            </tr>
            <tr>
              <th class="g-w-3">�󸶷�ҵ������</th>
              <th class="g-w-3">Ƿ���˻���</th>
              <th class="g-w-3">Ƿ�ѽ��</th>
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
	<!-- ������������Ϣ��Ҫ -->
	<xsl:template match="PPO/PC04">
		<div class="t2 f-mgtop">������������Ϣ��Ҫ</div>
		<table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-3">������Ϣ����</th>
              <th class="g-w-3">��¼��</th>
              <th class="g-w-3">�漰���</th>
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
	<!-- ���ߣ���ѯ��¼��Ҫ -->
	<xsl:template match="PQO/PC05">
		<div class="t2 f-mgtop">���ߣ���ѯ��¼��Ҫ</div>
		<xsl:if test="PC05A != ''">
			 <table class="g-tab-bor f-tab-nomargin">
			  <tbody>
				<tr>
				  <th colspan="4">��һ�β�ѯ��¼</th>
				</tr>
				<tr>
				  <th class="g-w-4">��һ�β�ѯ����</th>
				  <th class="g-w-4">��һ�β�ѯ��������</th>
				  <th class="g-w-4">��һ�β�ѯ��������</th>
				  <th class="g-w-4">��һ�β�ѯԭ��</th>
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
              <th class="g-w-3" colspan="2">���1�����ڵĲ�ѯ������</th>
              <th class="g-w-3" colspan="3">���1�����ڵĲ�ѯ����</th>
              <th class="g-w-3" colspan="3">���2���ڵĲ�ѯ����</th>
            </tr>
            <tr>
              <td class="g-w-8">��������</td>
              <td class="g-w-8">���ÿ�����</td>
              <td class="g-w-8">��������</td>
              <td class="g-w-8">���ÿ�
              <br />����</td>
              <td class="g-w-8">���˲�ѯ</td>
              <td class="g-w-8">�������</td>
              <td class="g-w-8">�����ʸ�
              <br />���</td>
              <td class="g-w-8">��Լ�̻�
              <br />ʵ�����</td>
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
<!-- �� �Ŵ�������Ϣ��ϸ -->
	<!-- ��һ����׷����ϢC1��������ѭ�����˻�D1������ѭ������·��˻�R4���ģ�ѭ�����˻�R1���壩���ǿ��˻�R2������׼���ǿ��˻�R3  -->
	<xsl:template match="PDA">
		<div class="t2 f-mgtop">��һ�������˻�</div>
		<xsl:for-each select="PD01[PD01A/PD01AD01 = 'C1']">
		<div class="tnt f-tleft f-mgtop">�˻�<xsl:number value="position()"/></div> 
			<table class="g-tab-bor f-tab-nomargin">
			  <tbody>
				<tr>
				  <th colspan="10">������Ϣ</th>
				</tr>
				<tr>
				  <th class="g-w-10">�˻����</th>
				  <th class="g-w-10">ҵ������������</th>
				  <th class="g-w-10">ҵ������������</th>
				  <th class="g-w-10">�˻���ʶ</th>
				  <th class="g-w-10">����Э����</th>
				  <th class="g-w-10">ҵ������</th>
				  <th class="g-w-10">��������</th>
				  <th class="g-w-10">����</th>
				  <th class="g-w-10">�����</th>
				  <th class="g-w-10">�˻����Ŷ��</th>
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
				  <th>�������Ŷ��</th>
				  <th>��������</th>
				  <th>���ʽ</th>
				  <th>����Ƶ��</th>
				  <th>��������</th>
				  <th>������ʽ</th>
				  <th>�������ʽ</th>
				  <th>��ͬ����־</th>
				  <th colspan="2">ծȨת��ʱ�Ļ���״̬</th>
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
				  <th colspan="9">���±�����Ϣ</th>
				</tr>
				<tr>
				  <th class="g-w-9">�˻�״̬</th>
				  <th class="g-w-9">�ر�����</th>
				  <th class="g-w-9">ת���·�</th>
				  <th class="g-w-9">���</th>
				  <th class="g-w-9">���һ�λ�������</th>
				  <th class="g-w-9">���һ�λ�����</th>
				  <th class="g-w-9">�弶����</th>
				  <th class="g-w-9">����״̬</th>
				  <th class="g-w-9">��Ϣ��������</th>
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
					  <th colspan="12">���һ���¶ȱ���</th>
					</tr>
					<tr>
					  <th class="g-w-12">�·�</th>
					  <th class="g-w-12">�˻�״̬</th>
					  <th class="g-w-12">���</th>
					  <th class="g-w-12">���ö��</th>
					  <th class="g-w-12">δ�����Ĵ��ר��������</th>
					  <th class="g-w-12">�弶����</th>
					  <th class="g-w-12">ʣ�໹������</th>
					  <th class="g-w-12">����/Ӧ������</th>
					  <th class="g-w-12">����Ӧ����</th>
					  <th class="g-w-12">����ʵ����</th>
					  <th class="g-w-12">���һ�λ�������</th>
					  <th class="g-w-12">��ǰ��������</th>
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
					  <th>��ǰ�����ܶ�</th>
					  <th>���� 31��60 ��δ������</th>
					  <th>���� 61��90 ��δ������</th>
					  <th>���� 91��180 ��δ������</th>
					  <th>���� 180 ������δ������</th>
					  <th>͸֧ 180 ������δ�����</th>
					  <th>��� 6 ����ƽ��ʹ�ö��</th>
					  <th>��� 6 ����ƽ��͸֧���</th>
					  <th>���ʹ�ö��</th>
					  <th>���͸֧���</th>
					  <th colspan="2">��Ϣ��������</th>
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
						  <th colspan="13">��� 24 ���»���״̬</th>
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
						<xsl:variable name="v1" select ="substring(PD01D/PD01DR02,1,4)"/> <!--��ֹ����-->
						<xsl:variable name="v2" select ="substring(PD01D/PD01DR01,1,4)"/> <!--��ʼ����-->
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
						  <th colspan="13">��� 5 ���ڵ���ʷ����</th>
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
						<xsl:variable name="v1" select ="substring(PD01E/PD01ER02,1,4)"/> <!--��ֹ����-->
						<xsl:variable name="v2" select ="substring(PD01E/PD01ER01,1,4)"/> <!--��ʼ����-->
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
						  <th colspan="8">���⽻����Ϣ</th>
						</tr>
						<tr>
							<th class="g-w-5">���⽻������</th>
							<th class="g-w-5">���⽻�׷�������</th>
							<th class="g-w-5">�������ڱ������</th>
							<th class="g-w-5">���⽻�׷������</th>
							<th class="g-w-5">���⽻����ϸ��¼</th>
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
						  <th colspan="2">�����¼�˵��</th>
						</tr>
						<tr>
							<th class="g-w-2">�����¼������·�</th>
							<th class="g-w-2">�����¼�����</th>
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
						  <th colspan="4">���ר�����</th>
						</tr>
						<tr>
							<th class="g-w-4">���ר����ڶ��</th>
							<th class="g-w-4">���ڶ����Ч����</th>
							<th class="g-w-4">���ڶ�ȵ�������</th>
							<th class="g-w-4">���÷��ڽ��</th>
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
						  <th colspan="3">��ע��������Ϣ</th>
						</tr>
						<tr>
							<th class="g-w-3">��ע����������</th>
							<th class="g-w-3">��ע����������</th>
							<th class="g-w-3">�������</th>
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
		<div class="t2 f-mgtop">��������ѭ�����˻�</div>
		<xsl:for-each select="PD01[PD01A/PD01AD01 = 'D1']">
			<div class="tnt f-tleft f-mgtop">�˻�<xsl:number value="position()"/></div> 
			<table class="g-tab-bor f-tab-nomargin">
			  <tbody>
				<tr>
				  <th colspan="10">������Ϣ</th>
				</tr>
				<tr>
				  <th class="g-w-10">�˻����</th>
				  <th class="g-w-10">ҵ������������</th>
				  <th class="g-w-10">ҵ������������</th>
				  <th class="g-w-10">�˻���ʶ</th>
				  <th class="g-w-10">����Э����</th>
				  <th class="g-w-10">ҵ������</th>
				  <th class="g-w-10">��������</th>
				  <th class="g-w-10">����</th>
				  <th class="g-w-10">�����</th>
				  <th class="g-w-10">�˻����Ŷ��</th>
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
				  <th>�������Ŷ��</th>
				  <th>��������</th>
				  <th>���ʽ</th>
				  <th>����Ƶ��</th>
				  <th>��������</th>
				  <th>������ʽ</th>
				  <th>�������ʽ</th>
				  <th>��ͬ����־</th>
				  <th colspan="2">ծȨת��ʱ�Ļ���״̬</th>
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
				  <th colspan="9">���±�����Ϣ</th>
				</tr>
				<tr>
				  <th class="g-w-9">�˻�״̬</th>
				  <th class="g-w-9">�ر�����</th>
				  <th class="g-w-9">ת���·�</th>
				  <th class="g-w-9">���</th>
				  <th class="g-w-9">���һ�λ�������</th>
				  <th class="g-w-9">���һ�λ�����</th>
				  <th class="g-w-9">�弶����</th>
				  <th class="g-w-9">����״̬</th>
				  <th class="g-w-9">��Ϣ��������</th>
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
					  <th colspan="12">���һ���¶ȱ���</th>
					</tr>
					<tr>
					  <th class="g-w-12">�·�</th>
					  <th class="g-w-12">�˻�״̬</th>
					  <th class="g-w-12">���</th>
					  <th class="g-w-12">���ö��</th>
					  <th class="g-w-12">δ�����Ĵ��ר��������</th>
					  <th class="g-w-12">�弶����</th>
					  <th class="g-w-12">ʣ�໹������</th>
					  <th class="g-w-12">����/Ӧ������</th>
					  <th class="g-w-12">����Ӧ����</th>
					  <th class="g-w-12">����ʵ����</th>
					  <th class="g-w-12">���һ�λ�������</th>
					  <th class="g-w-12">��ǰ��������</th>
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
					  <th>��ǰ�����ܶ�</th>
					  <th>���� 31��60 ��δ������</th>
					  <th>���� 61��90 ��δ������</th>
					  <th>���� 91��180 ��δ������</th>
					  <th>���� 180 ������δ������</th>
					  <th>͸֧ 180 ������δ�����</th>
					  <th>��� 6 ����ƽ��ʹ�ö��</th>
					  <th>��� 6 ����ƽ��͸֧���</th>
					  <th>���ʹ�ö��</th>
					  <th>���͸֧���</th>
					  <th colspan="2">��Ϣ��������</th>
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
						  <th colspan="13">��� 24 ���»���״̬</th>
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
						<xsl:variable name="v1" select ="substring(PD01D/PD01DR02,1,4)"/> <!--��ֹ����-->
						<xsl:variable name="v2" select ="substring(PD01D/PD01DR01,1,4)"/> <!--��ʼ����-->
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
						  <th colspan="13">��� 5 ���ڵ���ʷ����</th>
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
						<xsl:variable name="v1" select ="substring(PD01E/PD01ER02,1,4)"/> <!--��ֹ����-->
						<xsl:variable name="v2" select ="substring(PD01E/PD01ER01,1,4)"/> <!--��ʼ����-->
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
						  <th colspan="8">���⽻����Ϣ</th>
						</tr>
						<tr>
							<th class="g-w-5">���⽻������</th>
							<th class="g-w-5">���⽻�׷�������</th>
							<th class="g-w-5">�������ڱ������</th>
							<th class="g-w-5">���⽻�׷������</th>
							<th class="g-w-5">���⽻����ϸ��¼</th>
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
						  <th colspan="2">�����¼�˵��</th>
						</tr>
						<tr>
							<th class="g-w-2">�����¼������·�</th>
							<th class="g-w-2">�����¼�����</th>
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
						  <th colspan="4">���ר�����</th>
						</tr>
						<tr>
							<th class="g-w-4">���ר����ڶ��</th>
							<th class="g-w-4">���ڶ����Ч����</th>
							<th class="g-w-4">���ڶ�ȵ�������</th>
							<th class="g-w-4">���÷��ڽ��</th>
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
						  <th colspan="3">��ע��������Ϣ</th>
						</tr>
						<tr>
							<th class="g-w-3">��ע����������</th>
							<th class="g-w-3">��ע����������</th>
							<th class="g-w-3">�������</th>
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
		<div class="t2 f-mgtop">������ѭ������·��˻�</div>
		<xsl:for-each select="PD01[PD01A/PD01AD01 = 'R4']">
			<div class="tnt f-tleft f-mgtop">�˻�<xsl:number value="position()"/></div> 
			<table class="g-tab-bor f-tab-nomargin">
			  <tbody>
				<tr>
				  <th colspan="10">������Ϣ</th>
				</tr>
				<tr>
				  <th class="g-w-10">�˻����</th>
				  <th class="g-w-10">ҵ������������</th>
				  <th class="g-w-10">ҵ������������</th>
				  <th class="g-w-10">�˻���ʶ</th>
				  <th class="g-w-10">����Э����</th>
				  <th class="g-w-10">ҵ������</th>
				  <th class="g-w-10">��������</th>
				  <th class="g-w-10">����</th>
				  <th class="g-w-10">�����</th>
				  <th class="g-w-10">�˻����Ŷ��</th>
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
				  <th>�������Ŷ��</th>
				  <th>��������</th>
				  <th>���ʽ</th>
				  <th>����Ƶ��</th>
				  <th>��������</th>
				  <th>������ʽ</th>
				  <th>�������ʽ</th>
				  <th>��ͬ����־</th>
				  <th colspan="2">ծȨת��ʱ�Ļ���״̬</th>
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
				  <th colspan="9">���±�����Ϣ</th>
				</tr>
				<tr>
				  <th class="g-w-9">�˻�״̬</th>
				  <th class="g-w-9">�ر�����</th>
				  <th class="g-w-9">ת���·�</th>
				  <th class="g-w-9">���</th>
				  <th class="g-w-9">���һ�λ�������</th>
				  <th class="g-w-9">���һ�λ�����</th>
				  <th class="g-w-9">�弶����</th>
				  <th class="g-w-9">����״̬</th>
				  <th class="g-w-9">��Ϣ��������</th>
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
					  <th colspan="12">���һ���¶ȱ���</th>
					</tr>
					<tr>
					  <th class="g-w-12">�·�</th>
					  <th class="g-w-12">�˻�״̬</th>
					  <th class="g-w-12">���</th>
					  <th class="g-w-12">���ö��</th>
					  <th class="g-w-12">δ�����Ĵ��ר��������</th>
					  <th class="g-w-12">�弶����</th>
					  <th class="g-w-12">ʣ�໹������</th>
					  <th class="g-w-12">����/Ӧ������</th>
					  <th class="g-w-12">����Ӧ����</th>
					  <th class="g-w-12">����ʵ����</th>
					  <th class="g-w-12">���һ�λ�������</th>
					  <th class="g-w-12">��ǰ��������</th>
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
					  <th>��ǰ�����ܶ�</th>
					  <th>���� 31��60 ��δ������</th>
					  <th>���� 61��90 ��δ������</th>
					  <th>���� 91��180 ��δ������</th>
					  <th>���� 180 ������δ������</th>
					  <th>͸֧ 180 ������δ�����</th>
					  <th>��� 6 ����ƽ��ʹ�ö��</th>
					  <th>��� 6 ����ƽ��͸֧���</th>
					  <th>���ʹ�ö��</th>
					  <th>���͸֧���</th>
					  <th colspan="2">��Ϣ��������</th>
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
						  <th colspan="13">��� 24 ���»���״̬</th>
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
						<xsl:variable name="v1" select ="substring(PD01D/PD01DR02,1,4)"/> <!--��ֹ����-->
						<xsl:variable name="v2" select ="substring(PD01D/PD01DR01,1,4)"/> <!--��ʼ����-->
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
						  <th colspan="13">��� 5 ���ڵ���ʷ����</th>
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
						<xsl:variable name="v1" select ="substring(PD01E/PD01ER02,1,4)"/> <!--��ֹ����-->
						<xsl:variable name="v2" select ="substring(PD01E/PD01ER01,1,4)"/> <!--��ʼ����-->
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
						  <th colspan="8">���⽻����Ϣ</th>
						</tr>
						<tr>
							<th class="g-w-5">���⽻������</th>
							<th class="g-w-5">���⽻�׷�������</th>
							<th class="g-w-5">�������ڱ������</th>
							<th class="g-w-5">���⽻�׷������</th>
							<th class="g-w-5">���⽻����ϸ��¼</th>
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
						  <th colspan="2">�����¼�˵��</th>
						</tr>
						<tr>
							<th class="g-w-2">�����¼������·�</th>
							<th class="g-w-2">�����¼�����</th>
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
						  <th colspan="4">���ר�����</th>
						</tr>
						<tr>
							<th class="g-w-4">���ר����ڶ��</th>
							<th class="g-w-4">���ڶ����Ч����</th>
							<th class="g-w-4">���ڶ�ȵ�������</th>
							<th class="g-w-4">���÷��ڽ��</th>
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
						  <th colspan="3">��ע��������Ϣ</th>
						</tr>
						<tr>
							<th class="g-w-3">��ע����������</th>
							<th class="g-w-3">��ע����������</th>
							<th class="g-w-3">�������</th>
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
		<div class="t2 f-mgtop">���ģ�ѭ�����˻�</div>
		<xsl:for-each select="PD01[PD01A/PD01AD01 = 'R1']">
			<div class="tnt f-tleft f-mgtop">�˻�<xsl:number value="position()"/></div> 
			<table class="g-tab-bor f-tab-nomargin">
			  <tbody>
				<tr>
				  <th colspan="10">������Ϣ</th>
				</tr>
				<tr>
				  <th class="g-w-10">�˻����</th>
				  <th class="g-w-10">ҵ������������</th>
				  <th class="g-w-10">ҵ������������</th>
				  <th class="g-w-10">�˻���ʶ</th>
				  <th class="g-w-10">����Э����</th>
				  <th class="g-w-10">ҵ������</th>
				  <th class="g-w-10">��������</th>
				  <th class="g-w-10">����</th>
				  <th class="g-w-10">�����</th>
				  <th class="g-w-10">�˻����Ŷ��</th>
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
				  <th>�������Ŷ��</th>
				  <th>��������</th>
				  <th>���ʽ</th>
				  <th>����Ƶ��</th>
				  <th>��������</th>
				  <th>������ʽ</th>
				  <th>�������ʽ</th>
				  <th>��ͬ����־</th>
				  <th colspan="2">ծȨת��ʱ�Ļ���״̬</th>
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
				  <th colspan="9">���±�����Ϣ</th>
				</tr>
				<tr>
				  <th class="g-w-9">�˻�״̬</th>
				  <th class="g-w-9">�ر�����</th>
				  <th class="g-w-9">ת���·�</th>
				  <th class="g-w-9">���</th>
				  <th class="g-w-9">���һ�λ�������</th>
				  <th class="g-w-9">���һ�λ�����</th>
				  <th class="g-w-9">�弶����</th>
				  <th class="g-w-9">����״̬</th>
				  <th class="g-w-9">��Ϣ��������</th>
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
					  <th colspan="12">���һ���¶ȱ���</th>
					</tr>
					<tr>
					  <th class="g-w-12">�·�</th>
					  <th class="g-w-12">�˻�״̬</th>
					  <th class="g-w-12">���</th>
					  <th class="g-w-12">���ö��</th>
					  <th class="g-w-12">δ�����Ĵ��ר��������</th>
					  <th class="g-w-12">�弶����</th>
					  <th class="g-w-12">ʣ�໹������</th>
					  <th class="g-w-12">����/Ӧ������</th>
					  <th class="g-w-12">����Ӧ����</th>
					  <th class="g-w-12">����ʵ����</th>
					  <th class="g-w-12">���һ�λ�������</th>
					  <th class="g-w-12">��ǰ��������</th>
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
					  <th>��ǰ�����ܶ�</th>
					  <th>���� 31��60 ��δ������</th>
					  <th>���� 61��90 ��δ������</th>
					  <th>���� 91��180 ��δ������</th>
					  <th>���� 180 ������δ������</th>
					  <th>͸֧ 180 ������δ�����</th>
					  <th>��� 6 ����ƽ��ʹ�ö��</th>
					  <th>��� 6 ����ƽ��͸֧���</th>
					  <th>���ʹ�ö��</th>
					  <th>���͸֧���</th>
					  <th colspan="2">��Ϣ��������</th>
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
						  <th colspan="13">��� 24 ���»���״̬</th>
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
						<xsl:variable name="v1" select ="substring(PD01D/PD01DR02,1,4)"/> <!--��ֹ����-->
						<xsl:variable name="v2" select ="substring(PD01D/PD01DR01,1,4)"/> <!--��ʼ����-->
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
						  <th colspan="13">��� 5 ���ڵ���ʷ����</th>
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
						<xsl:variable name="v1" select ="substring(PD01E/PD01ER02,1,4)"/> <!--��ֹ����-->
						<xsl:variable name="v2" select ="substring(PD01E/PD01ER01,1,4)"/> <!--��ʼ����-->
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
						  <th colspan="8">���⽻����Ϣ</th>
						</tr>
						<tr>
							<th class="g-w-5">���⽻������</th>
							<th class="g-w-5">���⽻�׷�������</th>
							<th class="g-w-5">�������ڱ������</th>
							<th class="g-w-5">���⽻�׷������</th>
							<th class="g-w-5">���⽻����ϸ��¼</th>
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
						  <th colspan="2">�����¼�˵��</th>
						</tr>
						<tr>
							<th class="g-w-2">�����¼������·�</th>
							<th class="g-w-2">�����¼�����</th>
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
						  <th colspan="4">���ר�����</th>
						</tr>
						<tr>
							<th class="g-w-4">���ר����ڶ��</th>
							<th class="g-w-4">���ڶ����Ч����</th>
							<th class="g-w-4">���ڶ�ȵ�������</th>
							<th class="g-w-4">���÷��ڽ��</th>
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
						  <th colspan="3">��ע��������Ϣ</th>
						</tr>
						<tr>
							<th class="g-w-3">��ע����������</th>
							<th class="g-w-3">��ע����������</th>
							<th class="g-w-3">�������</th>
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
		<div class="t2 f-mgtop">���壩���ǿ��˻�</div>
		<xsl:for-each select="PD01[PD01A/PD01AD01 = 'R2']">
			<div class="tnt f-tleft f-mgtop">�˻�<xsl:number value="position()"/></div> 
			<table class="g-tab-bor f-tab-nomargin">
			  <tbody>
				<tr>
				  <th colspan="10">������Ϣ</th>
				</tr>
				<tr>
				  <th class="g-w-10">�˻����</th>
				  <th class="g-w-10">ҵ������������</th>
				  <th class="g-w-10">ҵ������������</th>
				  <th class="g-w-10">�˻���ʶ</th>
				  <th class="g-w-10">����Э����</th>
				  <th class="g-w-10">ҵ������</th>
				  <th class="g-w-10">��������</th>
				  <th class="g-w-10">����</th>
				  <th class="g-w-10">�����</th>
				  <th class="g-w-10">�˻����Ŷ��</th>
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
				  <th>�������Ŷ��</th>
				  <th>��������</th>
				  <th>���ʽ</th>
				  <th>����Ƶ��</th>
				  <th>��������</th>
				  <th>������ʽ</th>
				  <th>�������ʽ</th>
				  <th>��ͬ����־</th>
				  <th colspan="2">ծȨת��ʱ�Ļ���״̬</th>
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
				  <th colspan="9">���±�����Ϣ</th>
				</tr>
				<tr>
				  <th class="g-w-9">�˻�״̬</th>
				  <th class="g-w-9">�ر�����</th>
				  <th class="g-w-9">ת���·�</th>
				  <th class="g-w-9">���</th>
				  <th class="g-w-9">���һ�λ�������</th>
				  <th class="g-w-9">���һ�λ�����</th>
				  <th class="g-w-9">�弶����</th>
				  <th class="g-w-9">����״̬</th>
				  <th class="g-w-9">��Ϣ��������</th>
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
					  <th colspan="12">���һ���¶ȱ���</th>
					</tr>
					<tr>
					  <th class="g-w-12">�·�</th>
					  <th class="g-w-12">�˻�״̬</th>
					  <th class="g-w-12">���</th>
					  <th class="g-w-12">���ö��</th>
					  <th class="g-w-12">δ�����Ĵ��ר��������</th>
					  <th class="g-w-12">�弶����</th>
					  <th class="g-w-12">ʣ�໹������</th>
					  <th class="g-w-12">����/Ӧ������</th>
					  <th class="g-w-12">����Ӧ����</th>
					  <th class="g-w-12">����ʵ����</th>
					  <th class="g-w-12">���һ�λ�������</th>
					  <th class="g-w-12">��ǰ��������</th>
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
					  <th>��ǰ�����ܶ�</th>
					  <th>���� 31��60 ��δ������</th>
					  <th>���� 61��90 ��δ������</th>
					  <th>���� 91��180 ��δ������</th>
					  <th>���� 180 ������δ������</th>
					  <th>͸֧ 180 ������δ�����</th>
					  <th>��� 6 ����ƽ��ʹ�ö��</th>
					  <th>��� 6 ����ƽ��͸֧���</th>
					  <th>���ʹ�ö��</th>
					  <th>���͸֧���</th>
					  <th colspan="2">��Ϣ��������</th>
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
						  <th colspan="13">��� 24 ���»���״̬</th>
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
						<xsl:variable name="v1" select ="substring(PD01D/PD01DR02,1,4)"/> <!--��ֹ����-->
						<xsl:variable name="v2" select ="substring(PD01D/PD01DR01,1,4)"/> <!--��ʼ����-->
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
						  <th colspan="13">��� 5 ���ڵ���ʷ����</th>
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
						<xsl:variable name="v1" select ="substring(PD01E/PD01ER02,1,4)"/> <!--��ֹ����-->
						<xsl:variable name="v2" select ="substring(PD01E/PD01ER01,1,4)"/> <!--��ʼ����-->
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
						  <th colspan="8">���⽻����Ϣ</th>
						</tr>
						<tr>
							<th class="g-w-5">���⽻������</th>
							<th class="g-w-5">���⽻�׷�������</th>
							<th class="g-w-5">�������ڱ������</th>
							<th class="g-w-5">���⽻�׷������</th>
							<th class="g-w-5">���⽻����ϸ��¼</th>
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
						  <th colspan="2">�����¼�˵��</th>
						</tr>
						<tr>
							<th class="g-w-2">�����¼������·�</th>
							<th class="g-w-2">�����¼�����</th>
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
						  <th colspan="4">���ר�����</th>
						</tr>
						<tr>
							<th class="g-w-4">���ר����ڶ��</th>
							<th class="g-w-4">���ڶ����Ч����</th>
							<th class="g-w-4">���ڶ�ȵ�������</th>
							<th class="g-w-4">���÷��ڽ��</th>
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
						  <th colspan="3">��ע��������Ϣ</th>
						</tr>
						<tr>
							<th class="g-w-3">��ע����������</th>
							<th class="g-w-3">��ע����������</th>
							<th class="g-w-3">�������</th>
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
		<div class="t2 f-mgtop">������׼���ǿ��˻�</div>
		<xsl:for-each select="PD01[PD01A/PD01AD01 = 'R3']">
			<div class="tnt f-tleft f-mgtop">�˻�<xsl:number value="position()"/></div> 
			<table class="g-tab-bor f-tab-nomargin">
			  <tbody>
				<tr>
				  <th colspan="10">������Ϣ</th>
				</tr>
				<tr>
				  <th class="g-w-10">�˻����</th>
				  <th class="g-w-10">ҵ������������</th>
				  <th class="g-w-10">ҵ������������</th>
				  <th class="g-w-10">�˻���ʶ</th>
				  <th class="g-w-10">����Э����</th>
				  <th class="g-w-10">ҵ������</th>
				  <th class="g-w-10">��������</th>
				  <th class="g-w-10">����</th>
				  <th class="g-w-10">�����</th>
				  <th class="g-w-10">�˻����Ŷ��</th>
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
				  <th>�������Ŷ��</th>
				  <th>��������</th>
				  <th>���ʽ</th>
				  <th>����Ƶ��</th>
				  <th>��������</th>
				  <th>������ʽ</th>
				  <th>�������ʽ</th>
				  <th>��ͬ����־</th>
				  <th colspan="2">ծȨת��ʱ�Ļ���״̬</th>
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
				  <th colspan="9">���±�����Ϣ</th>
				</tr>
				<tr>
				  <th class="g-w-9">�˻�״̬</th>
				  <th class="g-w-9">�ر�����</th>
				  <th class="g-w-9">ת���·�</th>
				  <th class="g-w-9">���</th>
				  <th class="g-w-9">���һ�λ�������</th>
				  <th class="g-w-9">���һ�λ�����</th>
				  <th class="g-w-9">�弶����</th>
				  <th class="g-w-9">����״̬</th>
				  <th class="g-w-9">��Ϣ��������</th>
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
					  <th colspan="12">���һ���¶ȱ���</th>
					</tr>
					<tr>
					  <th class="g-w-12">�·�</th>
					  <th class="g-w-12">�˻�״̬</th>
					  <th class="g-w-12">���</th>
					  <th class="g-w-12">���ö��</th>
					  <th class="g-w-12">δ�����Ĵ��ר��������</th>
					  <th class="g-w-12">�弶����</th>
					  <th class="g-w-12">ʣ�໹������</th>
					  <th class="g-w-12">����/Ӧ������</th>
					  <th class="g-w-12">����Ӧ����</th>
					  <th class="g-w-12">����ʵ����</th>
					  <th class="g-w-12">���һ�λ�������</th>
					  <th class="g-w-12">��ǰ��������</th>
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
					  <th>��ǰ�����ܶ�</th>
					  <th>���� 31��60 ��δ������</th>
					  <th>���� 61��90 ��δ������</th>
					  <th>���� 91��180 ��δ������</th>
					  <th>���� 180 ������δ������</th>
					  <th>͸֧ 180 ������δ�����</th>
					  <th>��� 6 ����ƽ��ʹ�ö��</th>
					  <th>��� 6 ����ƽ��͸֧���</th>
					  <th>���ʹ�ö��</th>
					  <th>���͸֧���</th>
					  <th colspan="2">��Ϣ��������</th>
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
						  <th colspan="13">��� 24 ���»���״̬</th>
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
						<xsl:variable name="v1" select ="substring(PD01D/PD01DR02,1,4)"/> <!--��ֹ����-->
						<xsl:variable name="v2" select ="substring(PD01D/PD01DR01,1,4)"/> <!--��ʼ����-->
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
						  <th colspan="13">��� 5 ���ڵ���ʷ����</th>
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
						<xsl:variable name="v1" select ="substring(PD01E/PD01ER02,1,4)"/> <!--��ֹ����-->
						<xsl:variable name="v2" select ="substring(PD01E/PD01ER01,1,4)"/> <!--��ʼ����-->
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
						  <th colspan="8">���⽻����Ϣ</th>
						</tr>
						<tr>
							<th class="g-w-5">���⽻������</th>
							<th class="g-w-5">���⽻�׷�������</th>
							<th class="g-w-5">�������ڱ������</th>
							<th class="g-w-5">���⽻�׷������</th>
							<th class="g-w-5">���⽻����ϸ��¼</th>
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
						  <th colspan="2">�����¼�˵��</th>
						</tr>
						<tr>
							<th class="g-w-2">�����¼������·�</th>
							<th class="g-w-2">�����¼�����</th>
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
						  <th colspan="4">���ר�����</th>
						</tr>
						<tr>
							<th class="g-w-4">���ר����ڶ��</th>
							<th class="g-w-4">���ڶ����Ч����</th>
							<th class="g-w-4">���ڶ�ȵ�������</th>
							<th class="g-w-4">���÷��ڽ��</th>
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
						  <th colspan="3">��ע��������Ϣ</th>
						</tr>
						<tr>
							<th class="g-w-3">��ע����������</th>
							<th class="g-w-3">��ע����������</th>
							<th class="g-w-3">�������</th>
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
	<!-- ���ߣ�����Э����Ϣ -->
	<xsl:template match="PCA">
		<div class="t2 f-mgtop">���ߣ�����Э����Ϣ</div>
		<xsl:for-each select="PD02">
			<table class="g-subtab-bor f-tab-fix">
			  <tbody>
				<tr>
				  <th colspan="7">����Э��</th>
				</tr>
				<tr>
				  <th class="g-w-7">����Э����</th>
				  <th class="g-w-7">ҵ������������</th>
				  <th class="g-w-7">ҵ��������</th>
				  <th class="g-w-7">����Э���ʶ</th>
				  <th class="g-w-7">���Ŷ����;</th>
				  <th class="g-w-7">���Ŷ��</th>
				  <th class="g-w-7">����</th>
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
				  <th>��Ч����</th>
				  <th>��������</th>
				  <th>����Э��״̬</th>
				  <th>���ö��</th>
				  <th>�����޶�</th>
				  <th colspan="2">�����޶���</th>
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
						  <th colspan="3">��ע��������Ϣ</th>
						</tr>
						<tr>
						  <th class="g-w-3">��ע����������</th>
						  <th class="g-w-3">��ע����������</th>
						  <th class="g-w-3">�������</th>
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
	<!-- ���ˣ���ػ���������Ϣ -->
	<xsl:template match="PCR">
		<div class="t2 f-mgtop">���ˣ���ػ���������Ϣ</div>
		<div class="t2 f-mgtop">����ػ������εĸ��˽��</div>
		<xsl:for-each select="PD03[PD03A/PD03AD08 = '1']">
			<div class="tnt f-tleft f-mgtop">�˻�<xsl:number value="position()"/></div>
			<table class="g-tab-bor f-mgtop-s f-tab-fix">
			  <tbody>
				<tr>
				  <th class="g-w-8">�������������</th>
				  <th class="g-w-8">ҵ������������</th>
				  <th class="g-w-8">ҵ��������</th>
				  <th class="g-w-8">ҵ������</th>
				  <th class="g-w-8">��������</th>
				  <th class="g-w-8">��������</th>
				  <th class="g-w-8">��ػ�������������</th>
				  <th class="g-w-8">��֤��ͬ���</th>
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
				  <th class="g-w-8">��ػ������ν��</th>
				  <th class="g-w-8">����</th>
				  <th class="g-w-8">���</th>
				  <th class="g-w-8">�弶����</th>
				  <th class="g-w-8">�˻�����</th>
				  <th class="g-w-8">����״̬</th>
				  <th class="g-w-8">��������</th>
				  <th class="g-w-8">��Ϣ��������</th>
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
						  <th colspan="3">��ע��������Ϣ</th>
						</tr>
						<tr>
						  <th class="g-w-3">��ע����������</th>
						  <th class="g-w-3">��ע����������</th>
						  <th class="g-w-3">�������</th>
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
		<div class="t2 f-mgtop">����ػ������ε���ҵ���</div>
		<xsl:for-each select="PD03[PD03A/PD03AD08 = '2']">
			<div class="tnt f-tleft f-mgtop">�˻�<xsl:number value="position()"/></div>
			<table class="g-tab-bor f-mgtop-s f-tab-fix">
			  <tbody>
				<tr>
				  <th class="g-w-8">�������������</th>
				  <th class="g-w-8">ҵ������������</th>
				  <th class="g-w-8">ҵ��������</th>
				  <th class="g-w-8">ҵ������</th>
				  <th class="g-w-8">��������</th>
				  <th class="g-w-8">��������</th>
				  <th class="g-w-8">��ػ�������������</th>
				  <th class="g-w-8">��֤��ͬ���</th>
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
				  <th class="g-w-8">��ػ������ν��</th>
				  <th class="g-w-8">����</th>
				  <th class="g-w-8">���</th>
				  <th class="g-w-8">�弶����</th>
				  <th class="g-w-8">�˻�����</th>
				  <th class="g-w-8">����״̬</th>
				  <th class="g-w-8">��������</th>
				  <th class="g-w-8">��Ϣ��������</th>
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
						  <th colspan="3">��ע��������Ϣ</th>
						</tr>
						<tr>
						  <th class="g-w-3">��ע����������</th>
						  <th class="g-w-3">��ע����������</th>
						  <th class="g-w-3">�������</th>
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
	
<!-- �� ���Ŵ�������Ϣ��ϸ -->
	<xsl:template match="PND">
		<div class="t2 f-mgtop">�󸶷Ѽ�¼</div>
		<table class="g-subtab-bor">
		  <tbody>
			<tr>
			  <th class="g-w-9">���</th>
			  <th class="g-w-9">�󸶷��˻�����</th>
			  <th class="g-w-9">��������</th>
			  <th class="g-w-9">ҵ������</th>
			  <th class="g-w-9">ҵ��ͨ����</th>
			  <th class="g-w-9">��ǰ�ɷ�״̬</th>
			  <th class="g-w-9">��ǰǷ�ѽ��</th>
			  <th class="g-w-9">��������</th>
			  <th class="g-w-9">��� 24 ���½ɷѼ�¼</th>
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
					  <th colspan="9">��ע��������Ϣ</th>
					</tr>
					<tr>
					  <th colspan="2">��ע����������</th>
					  <th colspan="6">��ע����������</th>
					  <th>�������</th>
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
<!-- �� ������Ϣ��ϸ -->
	<!-- ��һ��Ƿ˰��¼ -->
	<xsl:template match="POT">
		<div class="t2 f-mgtop">��һ��Ƿ˰��¼</div>
		<xsl:if test="PF01 != ''">
			<table class="g-tab-bor f-mgtop-s f-tab-nomargin">
			  <tbody>
				<tr>
				  <th class="g-w-4">���</th>
				  <th class="g-w-4">����˰�����</th>
				  <th class="g-w-4">Ƿ˰�ܶ�</th>
				  <th class="g-w-4">Ƿ˰ͳ������</th>
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
						  <th colspan="4">��ע��������Ϣ</th>
						</tr>
						<tr>
						  <th>��ע����������</th>
						  <th colspan="2">��ע����������</th>
						  <th>�������</th>
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
	<!-- �����������о���¼ -->
	<xsl:template match="PCJ">
		<div class="t2 f-mgtop">�����������о���¼</div>
		<xsl:if test="PF02 != ''">
			<table class="g-tab-bor f-mgtop-s f-tab-nomargin">
			  <tbody>
				<tr>
				  <th class="g-w-8">������Ժ</th>
				  <th class="g-w-8">����</th>
				  <th class="g-w-8">��������</th>
				  <th class="g-w-8">�᰸��ʽ</th>
				  <th class="g-w-8">�о�/������</th>
				  <th class="g-w-8">�о�/������Ч����</th>
				  <th class="g-w-8">���ϱ��</th>
				  <th class="g-w-8">���ϱ�Ľ��</th>
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
						  <th colspan="8">��ע��������Ϣ</th>
						</tr>
						<tr>
						  <th colspan="2">��ע����������</th>
						  <th colspan="5">��ע����������</th>
						  <th>�������</th>
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
	<!-- ������ǿ��ִ�м�¼ -->
	<xsl:template match="PCE">
		<div class="t2 f-mgtop">������ǿ��ִ�м�¼</div>
		<xsl:if test="PF03 != ''">
			<table class="g-tab-bor f-mgtop-s f-tab-nomargin">
			  <tbody>
				<tr>
				  <th class="g-w-10">ִ�з�Ժ</th>
				  <th class="g-w-10">ִ�а���</th>
				  <th class="g-w-10">��������</th>
				  <th class="g-w-10">�᰸��ʽ</th>
				  <th class="g-w-10">����״̬</th>
				  <th class="g-w-10">�᰸����</th>
				  <th class="g-w-10">����ִ�б��</th>
				  <th class="g-w-10">����ִ�б��</th>
				  <th class="g-w-10">��ִ�б��</th>
				  <th class="g-w-10">��ִ�б�Ľ��</th>
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
						  <th colspan="10">��ע��������Ϣ</th>
						</tr>
						<tr>
						  <th colspan="2">��ע����������</th>
						  <th colspan="7">��ע����������</th>
						  <th>�������</th>
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
	<!-- ���ģ�����������¼ -->
	<xsl:template match="PAP">
		<div class="t2 f-mgtop">���ģ�����������¼</div>
		<xsl:if test="PF04 != ''">
			<table class="g-tab-bor f-mgtop-s f-tab-nomargin">
			  <tbody>
				<tr>
				  <th class="g-w-7">���</th>
				  <th class="g-w-7">��������</th>
				  <th class="g-w-7">��������</th>
				  <th class="g-w-7">�������</th>
				  <th class="g-w-7">������Ч����</th>
				  <th class="g-w-7">������ֹ����</th>
				  <th class="g-w-7">����������</th>
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
						  <th colspan="7">��ע��������Ϣ</th>
						</tr>
						<tr>
						  <th colspan="2">��ע����������</th>
						  <th colspan="4">��ע����������</th>
						  <th>�������</th>
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
	<!-- ���壩ס��������νɼ�¼ -->
	<xsl:template match="PHF">
		<div class="t2 f-mgtop">���壩ס��������νɼ�¼</div>
		<xsl:if test="PF05 != ''">
			<table class="g-tab-bor f-mgtop-s f-tab-nomargin">
			  <tbody>
				<tr>
				  <th class="g-w-8">�νɵ�</th>
				  <th class="g-w-8">�ν�����</th>
				  <th class="g-w-8">�ɷ�״̬</th>
				  <th class="g-w-8">�����·�</th>
				  <th class="g-w-8">�����·�</th>
				  <th class="g-w-8">��λ�ɴ�
				  <br />����</th>
				  <th class="g-w-8">���˽ɴ�
				  <br />����</th>
				  <th class="g-w-8">�½ɴ��</th>
				</tr>
				<tr>
				  <th style="WIDTH: 85%" colspan="7">�ɷѵ�λ</th>
				  <th style="WIDTH: 15%">��Ϣ����
				  <br />����</th>
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
						  <th colspan="8">��ע��������Ϣ</th>
						</tr>
						<tr>
						  <th colspan="2">��ע����������</th>
						  <th colspan="5">��ע����������</th>
						  <th>�������</th>
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
	<!-- �������ͱ�������¼ -->
	<xsl:template match="PBS">
		<div class="t2 f-mgtop">�������ͱ�������¼</div>
		<xsl:if test="PF06 != ''">
			<table class="g-tab-bor f-mgtop-s f-tab-nomargin">
			  <tbody>
				<tr>
				  <th class="g-w-8">���</th>
				  <th class="g-w-8">��Ա���</th>
				  <th class="g-w-8">���ڵ�</th>
				  <th class="g-w-8">������λ</th>
				  <th class="g-w-8">��ͥ������</th>
				  <th class="g-w-8">��������</th>
				  <th class="g-w-8">��׼����</th>
				  <th class="g-w-8">��Ϣ��������</th>
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
						  <th colspan="8">��ע��������Ϣ</th>
						</tr>
						<tr>
						  <th colspan="2">��ע����������</th>
						  <th colspan="5">��ע����������</th>
						  <th>�������</th>
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
	<!-- ���ߣ�ִҵ�ʸ��¼ -->
	<xsl:template match="PPQ">
		<div class="t2 f-mgtop">���ߣ�ִҵ�ʸ��¼</div>
		<xsl:if test="PF07 != ''">
			<table class="g-tab-bor f-mgtop-s f-tab-nomargin">
			  <tbody>
				<tr>
				  <th class="g-w-8">���</th>
				  <th class="g-w-8">ִҵ�ʸ�����</th>
				  <th class="g-w-8">�䷢����</th>
				  <th class="g-w-8">�ȼ�</th>
				  <th class="g-w-8">�������ڵ�</th>
				  <th class="g-w-8">�������</th>
				  <th class="g-w-8">��������</th>
				  <th class="g-w-8">��������</th>
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
						  <th colspan="8">��ע��������Ϣ</th>
						</tr>
						<tr>
						  <th colspan="2">��ע����������</th>
						  <th colspan="5">��ע����������</th>
						  <th>�������</th>
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
	<!-- ���ˣ�����������¼ -->
	<xsl:template match="PAH">
		<div class="t2 f-mgtop">���ˣ�����������¼</div>
		<xsl:if test="PF08 != ''">
			<table class="g-tab-bor f-mgtop-s f-tab-nomargin">
			  <tbody>
				<tr>
				  <th class="g-w-5">���</th>
				  <th class="g-w-5">��������</th>
				  <th class="g-w-5">��������</th>
				  <th class="g-w-5">��Ч����</th>
				  <th class="g-w-5">��ֹ����</th>
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
						  <th colspan="5">��ע��������Ϣ</th>
						</tr>
						<tr>
						  <th colspan="2">��ע����������</th>
						  <th colspan="2">��ע����������</th>
						  <th>�������</th>
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
	<!-- �� �������� -->
	<xsl:template match="POS">
		<xsl:if test="PG01 != ''">
			<table class="g-tab-bor f-mgtop-s">
			  <tbody>
				<tr>
				  <th style="WIDTH: 7%">���</th>
				  <th style="WIDTH: 31%">��������</th>
				  <th style="WIDTH: 31%">�����ʶ</th>
				  <th style="WIDTH: 31%">��ע���������͸���</th>
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
						  <th colspan="2">��ע����������</th>
						  <th>��ע����������</th>
						  <th>�������</th>
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
	<!-- �� ��ѯ��¼ -->
	<xsl:template match="POQ">
		<xsl:if test="PH01 != ''">
			<table class="g-tab-bor f-tab-nomargin">
			  <tbody>
				<tr>
				  <th class="g-w-5">���</th>
				  <th class="g-w-5">��ѯ����</th>
				  <th class="g-w-5">��ѯ��������</th>
				  <th class="g-w-5">��ѯ����</th>
				  <th class="g-w-5">��ѯԭ��</th>
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