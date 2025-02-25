<?xml version="1.0" encoding="GB2312"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
	<xsl:output method="html" version="1.0" encoding="GB2312"/>  
	<xsl:template match="/Document">
		<html oncontextmenu="return false" onselectstart="return false">
			<head>
				<title>��ҵ���ñ���</title>
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
			<div class="m-repbox"><!--logo����ʾ��Ϣ-->
				<div class="m-hd">
				<div class="u-logo">
				<img src="../../../static/reportStyle/logo.gif" />
				</div>
				</div>
				<!-- ����ͷ��Ϣ - ��ݱ�ʶ - ������ʾ -->
				<xsl:apply-templates select="EAA/EA01"/>
				<!-- ������Ϣ -->
				<xsl:apply-templates select="ECA"/>
				<!-- ��Ϣ��Ҫ -->
					<!-- ������ʾ��Ϣ -->
					<xsl:apply-templates select="EBA"/>
					<!-- δ�����Ŵ���������Ϣ��Ҫ ��ػ���������Ϣ��Ҫ �ѽ����Ŵ���Ϣ��Ҫ ��ծ��ʷ -->
					<xsl:apply-templates select="EBB"/>
				<!-- �Ŵ���¼��ϸ -->
					<!-- ��׷��ҵ�� δ�����Ŵ� �ѽ����Ŵ� ��ػ������� -->
					<xsl:apply-templates select="EDA"/>
				<!-- ���Ŵ���¼��ϸ -->
				<xsl:apply-templates select="EEA"/>
				<!-- ������¼��ϸ -->
					<!-- Ƿ˰��Ϣ -->
					<xsl:apply-templates select="EFA"/>
					<!-- ��Ժ��Ϣ -->
					<xsl:apply-templates select="EFB"/>
					<!-- ����������Ϣ -->
					<xsl:apply-templates select="EFC"/>
					<!-- ס��������ν���Ϣ -->
					<xsl:apply-templates select="EFD"/>
					<!-- �����֤/���������Ϣ -->
					<xsl:apply-templates select="EFE"/>
					<!-- �����ڼ��������Ϣ -->
					<xsl:apply-templates select="EFF"/>
					<!-- ���ʹ�ģ������Ϣ -->
					<xsl:apply-templates select="EFG"/>
				<!-- ���񱨱� -->
				<xsl:apply-templates select="EGA"/>
				<!-- ������Ϣ -->
				<xsl:apply-templates select="EHA"/>
				<!-- �����������ע��Ϣ -->
				<xsl:apply-templates select="EIA"/>
				<!-- ���� 1�����ü�¼������Ϣ -->
				<xsl:call-template name="annex1"/>
				<!-- ���� 2�����񱨱���Ϣ -->
				<xsl:call-template name="annex2"/>
				<!-- ����˵�� -->
				<xsl:apply-templates select="EAA"/>
				<script src="../../js/common/jquery-1.10.2.js"></script><SCRIPT>function printReport(){ javascript:document.execCommand('print');$.ajax({async:false,cache:false,data:{"ID":'a8b7037f48cf4924a2a62b9e048f7d3ea6d2b0c985a540279085e38db3f05163'},url:'../../../PersonReportInquiry/isPrint.do',type:"post" });}</SCRIPT><script>document.oncontextmenu = function(){return false;}</script>
				<form method="POST" action="--WEBBOT-SELF--"> 
				   <p align="center"> 
					<input onMouseOver="msover();" style="border:1px solid #cc9966; FONT-WEIGHT: normal; FONT-SIZE: 10pt; BACKGROUND: #fff6dc; COLOR: #000000; LINE-HEIGHT: normal; FONT-STYLE: normal; HEIGHT: 30; FONT-VARIANT: normal; width:58" onMouseOut="msout();" type="button" name="doPrint" value="��  ӡ" class="button2" onclick="printReport()"/>
					<input onMouseOver="msover();" style="border:1px solid #cc9966; FONT-WEIGHT: normal; FONT-SIZE: 10pt; BACKGROUND: #fff6dc; COLOR: #000000; LINE-HEIGHT: normal; FONT-STYLE: normal; HEIGHT: 30; FONT-VARIANT: normal; width:58" onMouseOut="msout();" type="button" name="goBack" value="��  ��" class="button1" onclick="window.location.href=document.referrer;"/> </p> 
				</form>
			</div>
			</body>
		</html>
	</xsl:template>
<!-- ����˵�� -->
	<xsl:template match="EAA">
<div class="m-repbody">
        <div class="t1">����˵��</div>
        <ul class="u-msg-list">
          <li>1. �����������ĳ��ߣ����ݽ�������ʱ��ĸ�������ϵͳ��¼����Ϣ���ɡ�����ѯ��¼�⣬������Ϣ������ػ����ṩ���������Ĳ���֤����ʵ�Ժ�׼ȷ�ԣ�����ŵ����Ϣ���ܡ��ӹ������ϵ�ȫ�����б��ֿ͹ۡ������ĵ�λ��</li>
          <li>2. ��������Ŵ�������Ϣ��ʾ�У���ҵ�����͡�Ϊ���������Ļ�����Ϣ���������ʲ����á��͡���ҵ��</li>
          <li>3. �����������û�С��Ŵ�����ΥԼ��Ϣ��Ҫ����Ϣ��˵�������������5����û���������ڡ�</li>
          <li>4. ���ڴ��������޶��Э����Ϣ����Ϣ����Ŀ��ö�����ϡ�����Э����Ϣ���е����Ŷ�ȡ������޶���Ϣ�������й��㡣</li>
          <li>5. �������е��Ŵ��������ż���ծ��Ϣ��Ҫչʾ����Ϣ��ָδ����/δ���������ż���ծ��Ϣ��</li>
          <li>6. ������Ľ��������ϸ��Ϣ�У�ѭ�����˻��ĵ���������ָ�˻����Ŷ�ȵĵ������ڡ�</li>
          <li>7. ������Ľ��������ϸ��Ϣ�У�����˻�չʾ���5��Ļ��������������ǰ����״̬�͵�ǰ�����ܶ</li>
          <li>8.
          ����ͨ��������������ġ�С���Ƶ��ҵ�񣬽��ڻ������ϲ���������˻���չʾ�ڱ�����Ľ��������ϸ��Ϣ�У���ʱ�˻��Ļ��ʽΪ�������ֻ��ʽ�������˻��Ļ���Ƶ��ͳһԼ��Ϊ���¡������������������¼��㣬�仹����Ϣ���½��й۲�͸��¡�</li>
          <li>9. �������е�����׼���ǿ��˻���ָ���˻�60�����ϵ�͸֧��Ϊ��</li>
          <li>10. �������еĻ�������Ϊ��--����ָ���˻��ǷǷ��ڻ��</li>
          <li>11. �����治չʾ5��ǰ�Ѿ�������ΥԼ��Ϊ���Լ�5��ǰ��Ƿ˰��¼��ǿ��ִ�м�¼�������о���¼������������¼������Ƿ�Ѽ�¼��</li>
          <li>12. ����˵���������ṩ�����Ծ���ҵ����ӵ��ر�˵����Ϣ��</li>
          <li>13. ������������Ϣ��������ñ����е���Ϣ����ע�ļ�Ҫ˵������������Ա�����������ʵ�Ը���</li>
          <li>14. �����ע������������ӵģ�����˵��������������ñ����е���Щ��Ϣ�����顣</li>
          <li>15. �����������漰������˽����ѯ��Ӧ����ʹ�á����Ʊ��ܡ���ʹ�ò�����ɸ�����Ϣй¶�ģ��������Ľ����е�������Ρ�</li>
          <li>16. ��������ػ������ε���ҵ���еĽ��չʾ��Ӧ���ֽ���⣬�����������н���Ϊ�ۺ�����ҽ�</li>
          <li>17. �����������������ṩ��������Ϣ���岻֤ͬ�����͵���Ϣ��</li>
        </ul>
      </div>
	</xsl:template>
<!-- ����ͷ��Ϣģ�� -->
	<xsl:template match="EAA/EA01">
      <!--����ͷ-->
      <div class="m-rephead">
        <!--��Ʒ���ƣ��汾-->
        <div class="m-reptitle">
          <h1 class="u-repname">��ҵ���ñ���</h1>
          <h3 class="u-repver">(���Ż�����)</h3>
        </div>
		<!--��Ʒ���ƣ��汾-->
		<table class="g-tab-bor">
          <tbody>
            <tr>
              <td style="TEXT-ALIGN: left; WIDTH: 50%" colspan="3">�����ţ� <xsl:value-of select="EA01A/EA01AI01"/></td>
              <td style="TEXT-ALIGN: right; WIDTH: 50%" colspan="3">����ʱ�䣺<xsl:value-of select="EA01A/EA01AR01"/></td>
            </tr>
            <tr>
              <th style="WIDTH: 16%">��ѯ����</th>
              <th style="WIDTH: 16%">��ѯԭ��</th>
              <th style="WIDTH: 16%">��ҵ����</th>
              <th style="WIDTH: 16%">��ҵ��ݱ�ʶ����</th>
              <th style="WIDTH: 16%">��ҵ��ݱ�ʶ����</th>
              <th style="WIDTH: 16%">��ҵ��ݱ�ʶ����</th>
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
		<!-- ������ʾ -->
        <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="t2-2">������Ϣ��ʾ</th>
            </tr>
            <tr>
              <td>
				<xsl:if test="EA01D/EA01DS01 != 0">			  
					��Ϣ��������ñ������������ <xsl:value-of select="EA01D/EA01DS01"/>�����������ڴ����У������ʱע���Ķ�������ݡ�
				</xsl:if>
				<xsl:if test="EA01D/EA01DS01 = 0">			  
					û�����ڴ�������顣
				</xsl:if>
			  </td>
            </tr>
          </tbody>
        </table>
      </div>
	</xsl:template>	
<!-- ��ҵ������Ϣ -->
	<xsl:template match="ECA">
      <div class="m-repbody">
        <div class="t1">һ ��ҵ������Ϣ</div>
        <div class="t2 f-mgtop">��һ�������ſ���Ϣ</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-9">��������</th>
              <th class="g-w-9">��֯��������</th>
              <th class="g-w-9">��ҵ��ģ</th>
              <th class="g-w-9">������ҵ</th>
              <th class="g-w-9">�������</th>
              <th class="g-w-9">�Ǽ�֤����Ч��ֹ����</th>
              <th class="g-w-9">�Ǽǵ�ַ</th>
              <th class="g-w-9">�칫/��Ӫ��ַ</th>
              <th class="g-w-9">����״̬</th>
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
        <div class="t2 f-mgtop">������ע���ʱ�����Ҫ��������Ϣ</div>		
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-3">ע���ʱ�������Һϼ�</th>
              <th class="g-w-3">��Ҫ�����˸���</th>
              <th class="g-w-3">��������</th>
            </tr>
            <tr>
              <td><xsl:value-of select="EC02/EC020J01"/></td>
              <td><xsl:value-of select="EC02/EC020S01"/></td>
              <td><xsl:value-of select="EC02/EC020R01"/></td>
            </tr>
          </tbody>
        </table>
        <table class="g-subtab-bor">
          <!--�����ϱ߿�-->
          <tbody>
            <tr>
              <th class="g-w-6">����������</th>
              <th class="g-w-6">�������������</th>
              <th class="g-w-6">����������</th>
              <th class="g-w-6">��������ݱ�ʶ����</th>
              <th class="g-w-6">��������ݱ�ʶ����</th>
              <th class="g-w-6">���ʱ���</th>
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
        <div class="t2 f-mgtop">��������Ҫ�����Ա��Ϣ</div>
		<table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-2">��Ҫ��Ա����</th>
              <th class="g-w-2">��������</th>
            </tr>
            <tr>
              <td><xsl:value-of select="EC03/EC030S01"/></td>
              <td><xsl:value-of select="EC03/EC030R01"/></td>
            </tr>
          </tbody>
        </table>
		<table class="g-subtab-bor">
          <!--�����ϱ߿�-->
          <tbody>
            <tr>
              <th class="g-w-4">����</th>
              <th class="g-w-4">֤������</th>
              <th class="g-w-4">֤������</th>
              <th class="g-w-4">ְλ</th>
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
        <div class="t2 f-mgtop">���ģ��ϼ�������Ϣ</div> 
		<table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-5">�ϼ���������</th>
              <th class="g-w-5">�ϼ���������</th>
              <th class="g-w-5">�ϼ�������ݱ�ʶ����</th>
              <th class="g-w-5">�ϼ�������ݱ�ʶ����</th>
              <th class="g-w-5">��������</th>
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
        <div class="t2 f-mgtop">���壩ʵ�ʿ�������Ϣ</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-2">ʵ�ʿ����˸���</th>
              <th class="g-w-2">��������</th>
            </tr>
            <tr>
              <td><xsl:value-of select="EC05/EC050S01"/></td>
              <td><xsl:value-of select="EC05/EC050R01"/></td>
            </tr>
          </tbody>
        </table>
		<table class="g-subtab-bor">
          <!--�����ϱ߿�-->
          <tbody>
            <tr>
              <th class="g-w-4">ʵ�ʿ������������</th>
              <th class="g-w-4">ʵ�ʿ���������</th>
              <th class="g-w-4">ʵ�ʿ�������ݱ�ʶ����</th>
              <th class="g-w-4">ʵ�ʿ�������ݱ�ʶ����</th>
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
<!-- ��Ϣ��Ҫ -->
	<!-- ������ʾ��Ϣ -->
	<xsl:template match="EBA/EB01">
		<br/>
        <div class="t1">�� ������ʾ��Ϣ</div>
        <!-- ��������������� -->
        <div class="t2 f-mgtop">��һ���Ŵ�������ʾ��Ϣ</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-11">�״����Ŵ����׵����</th>
              <th class="g-w-11">�״�����ػ������ε����</th>
              <th class="g-w-11">�����Ŵ����׵Ļ�����</th>
              <th class="g-w-11">��ǰ��δ�����Ŵ����׵Ļ�����</th>
              <th class="g-w-11">����������</th>
              <th class="g-w-11">��׷���Ľ���������</th>
              <th class="g-w-11">��ע�����������</th>
              <th class="g-w-11">���������������</th>
              <th class="g-w-11">�����������</th>
              <th class="g-w-11">��ע�ൣ���������</th>
              <th class="g-w-11">�����ൣ���������</th>
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
        <div class="t2 f-mgtop">���������Ŵ����׼�������Ϣ��ʾ��Ϣ</div>
		<!-- ���Ŵ����� -->
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-5">���Ŵ������˻���</th>
              <th class="g-w-5">Ƿ˰��¼����</th>
              <th class="g-w-5">�����о���¼����</th>
              <th class="g-w-5">ǿ��ִ�м�¼����</th>
              <th class="g-w-5">����������¼����</th>
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
		<!-- δ�����Ŵ���������Ϣ��Ҫ -->
        <div class="t2 f-mgtop">������δ�����Ŵ���������Ϣ��Ҫ</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-10">�ʲ�����ҵ���˻���</th>
              <th class="g-w-10">�ʲ�����ҵ�����</th>
              <th class="g-w-10">���һ�δ�������</th>
              <th class="g-w-10">���ҵ���˻���</th>
              <th class="g-w-10">���ҵ�����</th>
              <th class="g-w-10">������һ�λ�������</th>
              <th class="g-w-10">�����ܶ�</th>
              <th class="g-w-10">���ڱ���</th>
              <th class="g-w-10">������Ϣ������</th>
              <th class="g-w-10">����������׷��������Ŀ����</th>
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
		<!-- δ�����������������Ϣ -->
        <div class="t2 f-mgtop">������δ�����������������Ϣ</div>

        <table class="g-tab-bor f-tab-nomargin">
			<tbody>
			<tr>
				<td style="WIDTH: 20%" rowspan="2"></td>
				<td style="WIDTH: 20%" colspan="2">
					������
				</td>
				<td style="WIDTH: 20%" colspan="2">
					��ע��
				</td>
				<td style="WIDTH: 20%" colspan="2">
					������
				</td>
				<td style="WIDTH: 20%" colspan="2">
					�ϼ�
				</td>
			</tr>
			<tr>
				<td>�˻���</td>
				<td>���</td>
				<td>�˻���</td>
				<td>���</td>
				<td>�˻���</td>
				<td>���</td>
				<td>�˻���</td>
				<td>���</td>
			</tr>
			<tr>
				<td>
					�г��ڽ��
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
					���ڽ��
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
					ѭ��͸֧
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
					����
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
					�ϼ�
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
		<!-- �ѽ����Ŵ����� -->
		<!-- �ѽ����Ŵ���Ϣ��Ҫ -->
		<div class="t2 f-mgtop">���ģ��ѽ����Ŵ���Ϣ��Ҫ</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-7">�ʲ�����ҵ���˻���</th>
              <th class="g-w-7">�ʲ�����ҵ����</th>
              <th class="g-w-7">�����������</th>
              <th class="g-w-7">��������</th>
              <th class="g-w-7">���ҵ���˻���</th>
              <th class="g-w-7">���ҵ����</th>
              <th class="g-w-7">����������׷��������Ŀ����</th>
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
		<div class="t2 f-mgtop">���壩�ѽ�������������׷��������Ϣ</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-5"></th>
              <th class="g-w-5">�������˻���</th>
              <th class="g-w-5">��ע���˻���</th>
              <th class="g-w-5">�������˻���</th>
              <th class="g-w-5">�ϼ�</th>
            </tr>
            <tr>
              <td>�г��ڽ��</td>
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
              <td>���ڽ��</td>
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
              <td>ѭ��͸֧</td>
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
              <td>����</td>
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
              <td>�ϼ�</td>
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
		<!-- ��ծ��ʷ������Ϣ -->
		<div class="t2 f-mgtop">��������ծ��ʷ</div>
        <table class="g-tab-bor f-tab-nomargin">
		<tbody>
			<tr>
				<th style="WIDTH: 10%" rowspan="2">
				</th>
				<th style="WIDTH: 20%" colspan="2">
					ȫ����ծ
				</th>
				<th style="WIDTH: 20%" colspan="2">
					��ע�ฺծ
				</th>
				<th style="WIDTH: 20%" colspan="2">
					�����ฺծ
				</th>
				<th style="WIDTH: 30%" colspan="4">
					�����ฺծ
				</th>
			</tr>
			<tr>
				<th>
					�˻���
				</th>
				<th>
					���
				</th>
				<th>
					�˻���
				</th>
				<th>
					���
				</th>
				<th>
					�˻���
				</th>
				<th>
					���
				</th>
				<th>
					�����˻���
				</th>
				<th>
					�����ܶ�
				</th>
				<th>
					���������˻���
				</th>
				<th>
					���ڱ���
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
		<!-- δ���嵣������ -->
		<div class="t2 f-mgtop">���ߣ�δ���嵣������</div>
        <table class="g-tab-bor f-tab-nomargin">
			<tbody>
			<tr>
				<td style="WIDTH: 20%" rowspan="2"></td>
				<td style="WIDTH: 20%" colspan="2">
					������
				</td>
				<td style="WIDTH: 20%" colspan="2">
					��ע��
				</td>
				<td style="WIDTH: 20%" colspan="2">
					������
				</td>
				<td style="WIDTH: 20%" colspan="2">
					�ϼ�
				</td>
			</tr>
			<tr>
				<td>�˻���</td>
				<td>���</td>
				<td>�˻���</td>
				<td>���</td>
				<td>�˻���</td>
				<td>���</td>
				<td>�˻���</td>
				<td>���</td>
			</tr>
			<tr>
				<td>
					���гжһ�Ʊ
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
					����֤
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
					���б���
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
					����
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
		<!-- �ѽ��嵣������ -->
		<div class="t2 f-mgtop">���ˣ��ѽ��嵣������</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-5"></th>
              <th class="g-w-5">�������˻���</th>
              <th class="g-w-5">��ע���˻���</th>
              <th class="g-w-5">�������˻���</th>
              <th class="g-w-5">�ϼ�</th>
            </tr>
            <tr>
              <td>���гжһ�Ʊ</td>
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
              <td>����֤</td>
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
              <td>���б���</td>
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
              <td>����</td>
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
		<!-- ����Э�������Ϣ -->
		<div class="t2 f-mgtop">���ţ�����Э�������Ϣ</div>
        <table class="g-tab-bor f-mgtop-s">
          <tbody>
            <tr>
              <th class="g-w-7" width="10%">��ѭ�����ö�Ⱥϼ�</th>
              <th class="g-w-7" width="10%">��ʹ�õķ�ѭ�����ö�Ⱥϼ�</th>
              <th class="g-w-7" width="10%">ʣ����õķ�ѭ����Ⱥϼ�</th>
              <th class="g-w-7" width="10%">ѭ�����ö�Ⱥϼ�</th>
              <th class="g-w-7" width="10%">��ʹ�õ�ѭ�����ö�Ⱥϼ�</th>
              <th class="g-w-7" width="10%">ʣ����õ�ѭ����Ⱥϼ�</th>
              <th class="g-w-7" width="10%">�Ƿ���������޶�</th>
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
		<!-- ��ػ���������Ϣ��Ҫ -->
		<div class="t2 f-mgtop">���ţ���ػ���������Ϣ��Ҫ</div>
        <table class="g-tab-bor f-mgtop-s">
          <tbody>
            <tr>
              <th rowspan="2"  width="20%">��������</th>
              <th colspan="3"  width="30%">��׷��ҵ��</th>
              <th colspan="5"  width="50%">�����������</th>
			</tr>
			<tr>
              <th  width="10%">�������ν��</th>
              <th  width="10%">�˻���</th>
              <th  width="10%">���</th>
              <th  width="10%">�������ν��</th>
              <th  width="10%">�˻���</th>
              <th  width="10%">���</th>
              <th  width="10%">��ע�����</th>
              <th  width="10%">���������</th>
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
		<!-- ����������ػ������λ�����Ϣ -->
		<div class="t2 f-mgtop">��ʮ������������ػ������λ�����Ϣ</div>	
        <table class="g-tab-bor f-mgtop-s">
          <tbody>
            <tr>
              <th class="g-w-6" width="10%">��������</th>
              <th class="g-w-6" width="11%">�������ν��</th>
              <th class="g-w-6" width="10%">�˻���</th>
              <th class="g-w-6" width="10%">���</th>
              <th class="g-w-6" width="10%">��ע�����</th>
              <th class="g-w-6" width="10%">���������</th>
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
<!-- �Ŵ���¼��ϸ -->
	<xsl:template match="EDA">
	<br/>
		<div class="t1">�� �Ŵ���¼��ϸ</div>
        <div class="t2 f-mgtop">��һ����׷��ҵ��</div>
		<table class="g-tab-bor f-tab-nomargin">
			<tr>
				<th rowspan="2">����˻����</th>
				<th>�˻��״̬</th>
				<th>����˻�����</th>
				<th>�������</th>
				<th>ҵ������������</th>
				<th>ҵ������������</th>
				<th>����Э����</th>
				<th>���ҵ���������</th>
				<th>���ҵ������ϸ��</th>
				<th>��������</th>
				<th>����</th>
				<th rowspan="2">�ض����׸���</th>
				<th rowspan="2">��ʷ����</th>
			</tr>
			<tr>
				<th>�����</th>
				<th>���ö��</th>
				<th>��������</th>
				<th>������ʽ</th>
				<th>�������֤��ʽ</th>
				<th>������ʽ</th>
				<th>��ͬ����ʶ</th>
				<th>�ر�����</th>
				<th>��Ϣ��������</th>
				<th>������ּ�¼����</th>
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
					<td rowspan="2">������</td>
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
		<!-- �г��ڽ�� -->
        <div class="t2 f-mgtop">������δ�����г��ڽ��</div>
		<table class="g-tab-bor f-tab-nomargin">
			<tr>
				<th rowspan="2">����˻����</th>
				<th>�˻��״̬</th>
				<th>����˻�����</th>
				<th>�������</th>
				<th>ҵ������������</th>
				<th>ҵ������������</th>
				<th>����Э����</th>
				<th>���ҵ���������</th>
				<th>���ҵ������ϸ��</th>
				<th>��������</th>
				<th>����</th>
				<th rowspan="2">�ض����׸���</th>
				<th rowspan="2">��ʷ����</th>
			</tr>
			<tr>
				<th>�����</th>
				<th>���ö��</th>
				<th>��������</th>
				<th>������ʽ</th>
				<th>�������֤��ʽ</th>
				<th>������ʽ</th>
				<th>��ͬ����ʶ</th>
				<th>�ر�����</th>
				<th>��Ϣ��������</th>
				<th>������ּ�¼����</th>
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
					<td rowspan="2">������</td>
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
		<!-- ���ڽ�� -->
        <div class="t2 f-mgtop">���������ڽ��</div>
		<table class="g-tab-bor f-tab-nomargin">
			<tr>
				<th rowspan="2">����˻����</th>
				<th>�˻��״̬</th>
				<th>����˻�����</th>
				<th>�������</th>
				<th>ҵ������������</th>
				<th>ҵ������������</th>
				<th>����Э����</th>
				<th>���ҵ���������</th>
				<th>���ҵ������ϸ��</th>
				<th>��������</th>
				<th>����</th>
				<th rowspan="2">�ض����׸���</th>
				<th rowspan="2">��ʷ����</th>
			</tr>
			<tr>
				<th>�����</th>
				<th>���ö��</th>
				<th>��������</th>
				<th>������ʽ</th>
				<th>�������֤��ʽ</th>
				<th>������ʽ</th>
				<th>��ͬ����ʶ</th>
				<th>�ر�����</th>
				<th>��Ϣ��������</th>
				<th>������ּ�¼����</th>
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
					<td rowspan="2">������</td>
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
        <div class="t2 f-mgtop">���ģ�ѭ��͸֧</div>		
		<!-- δ����ѭ��͸֧ -->
		<table class="g-tab-bor f-tab-nomargin">
			<tr>
				<th rowspan="2">����˻����</th>
				<th>�˻��״̬</th>
				<th>����˻�����</th>
				<th>�������</th>
				<th>ҵ������������</th>
				<th>ҵ������������</th>
				<th>����Э����</th>
				<th>���ҵ���������</th>
				<th>���ҵ������ϸ��</th>
				<th>��������</th>
				<th>����</th>
				<th rowspan="2">�ض����׸���</th>
				<th rowspan="2">��ʷ����</th>
			</tr>
			<tr>
				<th>�����</th>
				<th>���ö��</th>
				<th>��������</th>
				<th>������ʽ</th>
				<th>�������֤��ʽ</th>
				<th>������ʽ</th>
				<th>��ͬ����ʶ</th>
				<th>�ر�����</th>
				<th>��Ϣ��������</th>
				<th>������ּ�¼����</th>
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
					<td rowspan="2">������</td>
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
		<!-- δ���������˻� -->
        <div class="t2 f-mgtop">���壩δ���������˻�</div>
		<table class="g-tab-bor f-tab-nomargin">
			<tr>
				<th rowspan="2">����˻����</th>
				<th>�˻��״̬</th>
				<th>����˻�����</th>
				<th>�������</th>
				<th>ҵ������������</th>
				<th>ҵ������������</th>
				<th>����Э����</th>
				<th>���ҵ���������</th>
				<th>���ҵ������ϸ��</th>
				<th>��������</th>
				<th>����</th>
				<th rowspan="2">�ض����׸���</th>
				<th rowspan="2">��ʷ����</th>
			</tr>
			<tr>
				<th>�����</th>
				<th>���ö��</th>
				<th>��������</th>
				<th>������ʽ</th>
				<th>�������֤��ʽ</th>
				<th>������ʽ</th>
				<th>��ͬ����ʶ</th>
				<th>�ر�����</th>
				<th>��Ϣ��������</th>
				<th>������ּ�¼����</th>
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
					<td rowspan="2">������</td>
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
		<!-- �ѽ����Ŵ� -->
		<!-- ��׷��ҵ�� -->
		<div class="t2 f-mgtop">�������ѽ��屻׷��ҵ��</div>
		<table class="g-tab-bor f-tab-nomargin">
			<tr>
				<th rowspan="2">����˻����</th>
				<th>�˻��״̬</th>
				<th>����˻�����</th>
				<th>�������</th>
				<th>ҵ������������</th>
				<th>ҵ������������</th>
				<th>����Э����</th>
				<th>���ҵ���������</th>
				<th>���ҵ������ϸ��</th>
				<th>��������</th>
				<th>����</th>
				<th rowspan="2">�ض����׸���</th>
				<th rowspan="2">��ʷ����</th>
			</tr>
			<tr>
				<th>�����</th>
				<th>���ö��</th>
				<th>��������</th>
				<th>������ʽ</th>
				<th>�������֤��ʽ</th>
				<th>������ʽ</th>
				<th>��ͬ����ʶ</th>
				<th>�ر�����</th>
				<th>��Ϣ��������</th>
				<th>������ּ�¼����</th>
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
					<td rowspan="2">������</td>
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
		<!-- �г��ڽ�� -->
        <div class="t2 f-mgtop">���ߣ��ѽ����г��ڽ��</div>
		<table class="g-tab-bor f-tab-nomargin">
			<tr>
				<th rowspan="2">����˻����</th>
				<th>�˻��״̬</th>
				<th>����˻�����</th>
				<th>�������</th>
				<th>ҵ������������</th>
				<th>ҵ������������</th>
				<th>����Э����</th>
				<th>���ҵ���������</th>
				<th>���ҵ������ϸ��</th>
				<th>��������</th>
				<th>����</th>
				<th rowspan="2">�ض����׸���</th>
				<th rowspan="2">��ʷ����</th>
			</tr>
			<tr>
				<th>�����</th>
				<th>���ö��</th>
				<th>��������</th>
				<th>������ʽ</th>
				<th>�������֤��ʽ</th>
				<th>������ʽ</th>
				<th>��ͬ����ʶ</th>
				<th>�ر�����</th>
				<th>��Ϣ��������</th>
				<th>������ּ�¼����</th>
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
					<td rowspan="2">������</td>
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
		<!-- ���ڽ�� -->
        <div class="t2 f-mgtop">���ˣ��ѽ�����ڽ��</div>
		<table class="g-tab-bor f-tab-nomargin">
			<tr>
				<th rowspan="2">����˻����</th>
				<th>�˻��״̬</th>
				<th>����˻�����</th>
				<th>�������</th>
				<th>ҵ������������</th>
				<th>ҵ������������</th>
				<th>����Э����</th>
				<th>���ҵ���������</th>
				<th>���ҵ������ϸ��</th>
				<th>��������</th>
				<th>����</th>
				<th rowspan="2">�ض����׸���</th>
				<th rowspan="2">��ʷ����</th>
			</tr>
			<tr>
				<th>�����</th>
				<th>���ö��</th>
				<th>��������</th>
				<th>������ʽ</th>
				<th>�������֤��ʽ</th>
				<th>������ʽ</th>
				<th>��ͬ����ʶ</th>
				<th>�ر�����</th>
				<th>��Ϣ��������</th>
				<th>������ּ�¼����</th>
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
					<td rowspan="2">������</td>
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
		<!-- �ѽ���ѭ��͸֧ -->
        <div class="t2 f-mgtop">���ţ��ѽ���ѭ��͸֧</div>
		<table class="g-tab-bor f-tab-nomargin">
			<tr>
				<th rowspan="2">����˻����</th>
				<th>�˻��״̬</th>
				<th>����˻�����</th>
				<th>�������</th>
				<th>ҵ������������</th>
				<th>ҵ������������</th>
				<th>����Э����</th>
				<th>���ҵ���������</th>
				<th>���ҵ������ϸ��</th>
				<th>��������</th>
				<th>����</th>
				<th rowspan="2">�ض����׸���</th>
				<th rowspan="2">��ʷ����</th>
			</tr>
			<tr>
				<th>�����</th>
				<th>���ö��</th>
				<th>��������</th>
				<th>������ʽ</th>
				<th>�������֤��ʽ</th>
				<th>������ʽ</th>
				<th>��ͬ����ʶ</th>
				<th>�ر�����</th>
				<th>��Ϣ��������</th>
				<th>������ּ�¼����</th>
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
					<td rowspan="2">������</td>
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
		<!-- δ���������˻� -->
        <div class="t2 f-mgtop">��ʮ���ѽ�����������˻�</div>
		<table class="g-tab-bor f-tab-nomargin">
			<tr>
				<th rowspan="2">����˻����</th>
				<th>�˻��״̬</th>
				<th>����˻�����</th>
				<th>�������</th>
				<th>ҵ������������</th>
				<th>ҵ������������</th>
				<th>����Э����</th>
				<th>���ҵ���������</th>
				<th>���ҵ������ϸ��</th>
				<th>��������</th>
				<th>����</th>
				<th rowspan="2">�ض����׸���</th>
				<th rowspan="2">��ʷ����</th>
			</tr>
			<tr>
				<th>�����</th>
				<th>���ö��</th>
				<th>��������</th>
				<th>������ʽ</th>
				<th>�������֤��ʽ</th>
				<th>������ʽ</th>
				<th>��ͬ����ʶ</th>
				<th>�ر�����</th>
				<th>��Ϣ��������</th>
				<th>������ּ�¼����</th>
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
					<td rowspan="2">������</td>
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
		<!-- �����˻��ֻ���������Ϣ -->
		<!-- ���� -->
        <div class="t2 f-mgtop">��ʮһ�������˻��ֻ���������Ϣ</div>
		<table class="g-tab-bor f-tab-nomargin">
			<tr>
				<th class="g-w-11">�����˻��ֻ���������Ϣ���</th>
				<th class="g-w-11">ҵ������������</th>
				<th class="g-w-11">ҵ������������</th>
				<th class="g-w-11">ҵ������</th>
				<th class="g-w-11">�弶����</th>
				<th class="g-w-11">δ�����˻���</th>
				<th class="g-w-11">���ϼ�</th>
				<th class="g-w-11">�����ܶ�ϼ�</th>
				<th class="g-w-11">���ڱ���ϼ�</th>
				<th class="g-w-11">�ѽ����˻���</th>
				<th class="g-w-11">�ѽ����˻����ֽ��ϼ�</th>
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
		<!-- ǷϢ��Ϣ -->
        <div class="t2 f-mgtop">��ʮ����ǷϢ��Ϣ</div>
		<xsl:if test="ED03 != ''">	
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-8">ǷϢ��Ϣ���</th>
              <th class="g-w-8">ҵ������������</th>
              <th class="g-w-8">ҵ������������</th>
              <th class="g-w-8">����</th>
              <th class="g-w-8">ǷϢ���</th>
              <th class="g-w-8">���仯����</th>
              <th class="g-w-8">ǷϢ����</th>
              <th class="g-w-8">��Ϣ��������</th>
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
		<!-- �����˻���Ϣ��Ԫ -->
        <div class="t2 f-mgtop">��ʮ�������гжһ�Ʊ������֤������֤��ϸ</div>
		<xsl:for-each select="../EDB/ED04[ED04A/ED04AD03 = '51' or ED04A/ED04AD03 = '61']">
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-4">���Ż���</th>
              <th class="g-w-4">ҵ������</th>
              <th class="g-w-4">�˻�״̬</th>
              <th class="g-w-4">�弶����</th>
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
              <th rowspan="2">���</th>
              <th>��������</th>
              <th>������</th>
              <th>����</th>
              <th>���</th>
              <th>��������ʽ</th>
		    </tr>
		    <tr>
              <th>��֤�����</th>
              <th>���</th>
              <th>���ճ���</th>
              <th>����Э����</th>
              <th>��Ϣ��������</th>
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
				<th class="g-w-7">�˻����</th>
				<th class="g-w-7">��������</th>
				<th class="g-w-7">������</th>
				<th class="g-w-7">����</th>
				<th class="g-w-7">���</th>
				<th class="g-w-7">�ر�����</th>
				<th class="g-w-7">����־</th>
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
        <div class="t2 f-mgtop">��ʮ�ģ����б���������ҵ����Ŵ���ϸ</div>
		<xsl:for-each select="../EDB/ED04[ED04A/ED04AD03 != '51' and ED04A/ED04AD03 != '61']">
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-4">���Ż���</th>
              <th class="g-w-4">ҵ������</th>
              <th class="g-w-4">�˻�״̬</th>
              <th class="g-w-4">�弶����</th>
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
              <th rowspan="2">���</th>
              <th>��������</th>
              <th>������</th>
              <th>����</th>
              <th>���</th>
              <th>��������ʽ</th>
		    </tr>
		    <tr>
              <th>��֤�����</th>
              <th>���</th>
              <th>���ճ���</th>
              <th>����Э����</th>
              <th>��Ϣ��������</th>
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
				<th class="g-w-7">�˻����</th>
				<th class="g-w-7">��������</th>
				<th class="g-w-7">������</th>
				<th class="g-w-7">����</th>
				<th class="g-w-7">���</th>
				<th class="g-w-7">�ر�����</th>
				<th class="g-w-7">����־</th>
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
		<!-- �����˻��ֻ���������Ϣ -->
        <div class="t2 f-mgtop">��ʮ�壩�����˻��ֻ���������Ϣ</div>
        <table class="g-tab-bor f-tab-nomargin">
		<tbody>
			<tr>
				<td rowspan="2">�����˻��ֻ���������Ϣ���</td>
				<td rowspan="2">ҵ������������</td>
				<td rowspan="2">���Ż�������</td>
				<td rowspan="2">ҵ������</td>
				<td rowspan="2">�弶����</td>
				<td rowspan="2">�˻���</td>
				<td colspan="5">���</td>
			</tr>
			<tr>
				<td>�����ա�30��</td>
				<td>�����ա�60��</td>
				<td>�����ա�90��</td>
				<td>������>90��</td>
				<td>���ϼ�</td>
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
		<!-- ���б���������ҵ�� -->
        <div class="t2 f-mgtop">��ʮ�������б���������ҵ��</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-7">�����˻��ֻ���������Ϣ���</th>
              <th class="g-w-7">ҵ������������</th>
              <th class="g-w-7">ҵ������������</th>
              <th class="g-w-7">��������ҵ������ϸ��</th>
              <th class="g-w-7">�弶����</th>
              <th class="g-w-7">δ�����˻���</th>
              <th class="g-w-7">���</th>
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
		<!-- ������Ϣ -->
        <div class="t2 f-mgtop">��ʮ����������Ϣ</div>
        <table class="g-tab-bor">
          <tbody>
            <tr>
              <th rowspan="2">����Э����</th>
              <th rowspan="2">ҵ������������</th>
              <th>ҵ������������</th>
              <th>���Ŷ������</th>
              <th>���ѭ����־</th>
              <th>��Ч����</th>
              <th>������</th>
              <th rowspan="2">��Ϣ��������</th>
            </tr>
            <tr>
              <th>����</th>
              <th>���Ŷ��</th>
              <th>���ö��</th>
              <th>�����޶�</th>
              <th>�����޶���</th>
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
		<!-- ��ػ������� -->
        <div class="t2 f-mgtop">��ʮ�ߣ���ػ�������</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th rowspan="2">�˻����</th>
              <th>�������������</th>
              <th>�˻�����</th>
              <th>��������</th>
              <th>��֤��ͬ���</th>
              <th>�������α���</th>
              <th>�������ν��</th>
              <th>ҵ���������</th>
              <th>ҵ������ϸ��</th>
              <th>��������</th>
              <th>������</th>
              <th>����</th>
              <th>���ö��</th>
            </tr>
            <tr>
              <th>ҵ������������</th>
              <th>ҵ������</th>
              <th>�����</th>
              <th>���</th>
              <th>�弶����</th>
              <th>�����ܶ�</th>
              <th>���ڱ���</th>
              <th>��������</th>
              <th>����״̬</th>
              <th>ʣ�໹������</th>
              <th colspan="2">��Ϣ��������</th>
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
						<!-- ��ΪC1�˻���ʱ�򷵻ؿ� -->
						<xsl:if test="ED070D02 = 'C1'"></xsl:if>
						<!-- �������������ҵ��ʱ�򣬷��ؿ� -->
						<xsl:if test="ED070D01 = '2'"></xsl:if>
						<!-- ����������Ǹ��˵������˻�ʱ���μ���¼A -->
						<xsl:if test="ED070D01 = '1'"><span name="2019"><xsl:value-of select="ED070D09"/></span></xsl:if>
			  </td>
              <td><xsl:value-of select="ED070S02"/></td>
              <td colspan="2"><xsl:value-of select="ED070R03"/></td>
            </tr>
			</xsl:for-each>
		 </tbody>
		</table>
		<br/>
		<!-- ��ػ������������˻��ֻ���������Ϣ -->
        <div class="t2 f-mgtop">��ʮ�ˣ���ػ������������˻��ֻ���������Ϣ</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-13">�����˻��ֻ���������Ϣ���</th>
              <th class="g-w-13">��ػ�����������</th>
              <th class="g-w-13">ҵ������������</th>
              <th class="g-w-13">ҵ������������</th>
              <th class="g-w-13">�������ν��</th>
              <th class="g-w-13">ҵ������ϸ��</th>
              <th class="g-w-13">�弶����</th>
              <th class="g-w-13">�˻���</th>
              <th class="g-w-13">�����</th>
              <th class="g-w-13">���</th>
              <th class="g-w-13">�����ܶ�</th>
              <th class="g-w-13">���ڱ���</th>
              <th class="g-w-13">��֤��ͬ���</th>
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
		<!-- Ϊ�������׳е�����ػ������� -->
        <div class="t2 f-mgtop">��ʮ�ˣ�Ϊ�������׳е�����ػ�������</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-11">�����˻��ֻ���������Ϣ���</th>
              <th class="g-w-11">ҵ������������</th>
              <th class="g-w-11">��ػ�����������</th>
              <th class="g-w-11">ҵ������������</th>
              <th class="g-w-11">�������ν��</th>
              <th class="g-w-11">ҵ������ϸ��</th>
              <th class="g-w-11">�弶����</th>
              <th class="g-w-11">�˻���</th>
              <th class="g-w-11">�������</th>
              <th class="g-w-11">���</th>
              <th class="g-w-11">��֤��ͬ���</th>
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
	
<!-- ���Ŵ���¼��ϸ -->
<!-- ���Ŵ���¼��ϸ -->
	<xsl:template match="EEA">
        <div class="t1">�� ���Ŵ���¼��ϸ</div>
        <div class="t2 f-mgtop">��һ��������ҵ�ɷ���Ϣ</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-7">������ҵ�ɷ��˻����</th>
              <th class="g-w-7">������ҵ��λ����</th>
              <th class="g-w-7">ҵ������</th>
              <th class="g-w-7">�ɷ�״̬</th>
              <th class="g-w-7">�ۼ�Ƿ�ѽ��</th>
              <th class="g-w-7">ͳ������</th>
              <th class="g-w-7">�鿴��ȥ 24 ���½ɷ����</th>
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
              <td>������</td>
            </tr>
          </tbody>
        </table>
	</xsl:template>
<!-- ������¼��ϸ -->
	<!-- Ƿ˰��Ϣ -->
	<xsl:template match="EFA">
        <div class="t1">�� ������¼��ϸ</div>
        <div class="t2 f-mgtop">��һ��Ƿ˰��Ϣ</div>
		<xsl:if test="EF01 !=''">
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-4">Ƿ˰��¼���</th>
              <th class="g-w-4">����˰�����</th>
              <th class="g-w-4">Ƿ˰�ܶԪ��</th>
              <th class="g-w-4">Ƿ˰ͳ������</th>
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
	<!-- �����о���¼ ǿ��ִ�м�¼ -->
	<xsl:template match="EFB">
		<xsl:if test="count(EF02/child::*) != 0">
        <div class="t2 f-mgtop">�����������о���¼</div>
		<xsl:for-each select="EF02">
        <table class="g-tab-bor f-mgtop-s f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-8">�����о���¼���</th>
              <th class="g-w-8">������Ժ</th>
              <th class="g-w-8">��������</th>
              <th class="g-w-8">����</th>
              <th class="g-w-8">���ϵ�λ</th>
              <th class="g-w-8">����</th>
              <th class="g-w-8">���г���</th>
              <th class="g-w-8">���ϱ��</th>
              <th class="g-w-8">���ϱ�Ľ�Ԫ��</th>
              <th class="g-w-8">�᰸��ʽ</th>
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
              <th style="WIDTH: 70%" colspan="7">�о�/������</th>
              <th style="WIDTH: 30%" colspan="3">�о�/������Ч���ڣ�</th>
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
        <div class="t2 f-mgtop">������ǿ��ִ�м�¼</div>
		<xsl:for-each select="EF03">
        <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-11">ǿ��ִ�м�¼���</th>
              <th class="g-w-11">������Ժ</th>
              <th class="g-w-11">��������</th>
              <th class="g-w-11">����</th>
              <th class="g-w-11">����</th>
              <th class="g-w-11">����ִ�б��</th>
              <th class="g-w-11">����ִ�б�Ľ�Ԫ��</th>
              <th class="g-w-11">����״̬</th>
              <th class="g-w-11">�᰸��ʽ</th>
              <th class="g-w-11">��ִ�б��</th>
              <th class="g-w-11">��ִ�б�Ľ�Ԫ��</th>
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
	<!-- ����������Ϣ -->
	<xsl:template match="EFC">
		<xsl:if test="count(child::*) != 0">
        <div class="t2 f-mgtop">���ģ�����������Ϣ</div>
		<xsl:for-each select="EF04">
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-9">����������¼���</th>
              <th class="g-w-9">��������</th>
              <th class="g-w-9">�����������ĺ�</th>
              <th class="g-w-9">Υ����Ϊ</th>
              <th class="g-w-9">��������</th>
              <th class="g-w-9">��������</th>
              <th class="g-w-9">������Ԫ��</th>
              <th class="g-w-9">����ִ�����</th>
              <th class="g-w-9">����������</th>
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
	<!-- ס��������ν���Ϣ -->
	<xsl:template match="EFD">
		<xsl:if test="count(child::*) != 0">
        <div class="t2 f-mgtop">���壩ס��������ν���Ϣ</div>
       <table class="g-tab-bor">
		<xsl:for-each select="EF05">
          <tbody>
            <tr>
              <th class="g-w-9">�˻����</th>
              <th class="g-w-9">ͳ������</th>
              <th class="g-w-9">��������</th>
              <th class="g-w-9">ְ������</th>
              <th class="g-w-9">�ɷѻ�����Ԫ��</th>
              <th class="g-w-9">���һ�νɷ�����</th>
              <th class="g-w-9">��������</th>
              <th class="g-w-9">�ɷ�״̬</th>
              <th class="g-w-9">�ۼ�Ƿ�ѽ�Ԫ��</th>
              <th class="g-w-9">�ɷѼ�¼����</th>
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
	<!-- �����ɼ�¼ �����֤��¼ ������ʼ�¼ ��ý�����¼ ӵ��ר����� -->
	<xsl:template match="EFE">
		<xsl:if test="count(EF06/child::*) != 0">
        <div class="t2 f-mgtop">�����������ɼ�¼</div>
        <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-6">��ɼ�¼���</th>
              <th class="g-w-6">��ɲ���</th>
              <th class="g-w-6">�������</th>
              <th class="g-w-6">�������</th>
              <th class="g-w-6">��ֹ����</th>
              <th class="g-w-6">�������</th>
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
        <div class="t2 f-mgtop">���ߣ������֤��¼</div>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-6">��֤��¼���</th>
              <th class="g-w-6">��֤����</th>
              <th class="g-w-6">��֤����</th>
              <th class="g-w-6">��֤����</th>
              <th class="g-w-6">��ֹ����</th>
              <th class="g-w-6">��֤����</th>
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
        <div class="t2 f-mgtop">���ˣ�������ʼ�¼</div>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-6">���ʼ�¼���</th>
              <th class="g-w-6">�϶�����</th>
              <th class="g-w-6">��������</th>
              <th class="g-w-6">��׼����</th>
              <th class="g-w-6">��ֹ����</th>
              <th class="g-w-6">��������</th>
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
        <div class="t2 f-mgtop">���ţ���ý�����¼</div>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-6">������¼���</th>
              <th class="g-w-6">��������</th>
              <th class="g-w-6">��������</th>
              <th class="g-w-6">��������</th>
              <th class="g-w-6">��ֹ����</th>
              <th class="g-w-6">������ʵ</th>
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
        <div class="t2 f-mgtop">��ʮ��ӵ��ר�����</div>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-6">��Ϣ���</th>
              <th class="g-w-6">ר������</th>
              <th class="g-w-6">ר����</th>
              <th class="g-w-6">��������</th>
              <th class="g-w-6">��������</th>
              <th class="g-w-6">ר����Ч�ڣ���λ���꣩</th>
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
	<!-- ���뾳���������ɫͨ����Ϣ ��������Ʒ������Ϣ ��������Ʒ�����������Ϣ -->
	<xsl:template match="EFF">
		<xsl:if test="count(EF11/child::*) != 0">
        <div class="t2 f-mgtop">��ʮһ�����뾳���������ɫͨ����Ϣ</div>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-4">��Ϣ���</th>
              <th class="g-w-4">��׼����</th>
              <th class="g-w-4">������Ʒ����</th>
              <th class="g-w-4">��Ч����</th>
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
        <div class="t2 f-mgtop">��ʮ������������Ʒ������Ϣ</div>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-5">��Ϣ���</th>
              <th class="g-w-5">��׼����</th>
              <th class="g-w-5">������Ʒ����</th>
              <th class="g-w-5">�����</th>
              <th class="g-w-5">��ֹ����</th>
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
        <div class="t2 f-mgtop">��ʮ������������Ʒ�����������Ϣ</div>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-6">��Ϣ���</th>
              <th class="g-w-6">��ܲ���</th>
              <th class="g-w-6">��Ͻֱ����</th>
              <th class="g-w-6">��ܼ���</th>
              <th class="g-w-6">��Ч����</th>
              <th class="g-w-6">��ֹ����</th>
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
	
	<!-- ���ʹ�ģ������Ϣ -->
	<xsl:template match="EFG">
		<xsl:if test="count(child::*) != 0">
        <div class="t2 f-mgtop">��ʮ�ģ����ʹ�ģ������Ϣ</div>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-5">��Ϣ���</th>
              <th class="g-w-5">������¼</th>
              <th class="g-w-5">���ʿ�������</th>
              <th class="g-w-5">���</th>
              <th class="g-w-5">��ģ</th>
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
<!-- ���񱨱� -->
	<xsl:template match="EGA"/>
<!-- ������Ϣ -->
	<xsl:template match="EHA">
        <div class="t1">�� ������Ϣ</div>
		<xsl:if test="count(child::*) != 0">
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-9">������Ϣ���</th>
              <th class="g-w-9">��������</th>
              <th class="g-w-9">�������</th>
              <th class="g-w-9">��������</th>
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
				��
			</div>
			<br/>
		</xsl:if>
	</xsl:template>
<!-- �����������ע��Ϣ -->
	<xsl:template match="EIA">
		<br/>
        <div class="t1">�� �����������ע��Ϣ</div>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-5">��������</th>
              <th class="g-w-5">�����ʶ</th>
              <th class="g-w-5">��ע����������</th>
              <th class="g-w-5">��ע����������</th>
              <th class="g-w-5">�������</th>
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
				��
			</div>
		</xsl:if>
	</xsl:template>
<!-- ���� 1�����ü�¼������Ϣ -->
	<xsl:template name="annex1">
        <div class="t1">���� 1�����ü�¼������Ϣ</div>
        <div class="t2 f-mgtop">(һ)��׷����¼����ʷ����</div>
		<xsl:for-each select="EDA/ED01[ED01A/ED01AD02='C1']">
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-5">�˻����</th>
              <th class="g-w-5">�˻�״̬</th>
              <th class="g-w-5">ҵ������������</th>
              <th class="g-w-5">���ҵ���������</th>
              <th class="g-w-5">���ҵ������ϸ��</th>
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
              <th class="g-w-14">��Ϣ��������</th>
              <th class="g-w-14">���</th>
              <th class="g-w-14">���仯����</th>
              <th class="g-w-14">�弶����</th>
              <th class="g-w-14">�弶�����϶�����</th>
              <th class="g-w-14">���һ��ʵ�ʻ�������</th>
              <th class="g-w-14">���һ��ʵ�ʻ����ܶ�</th>
              <th class="g-w-14">���һ�λ�����ʽ</th>
              <th class="g-w-14">���һ��Լ����������</th>
              <th class="g-w-14">���һ��Ӧ���ܶ�</th>
              <th class="g-w-14">�����ܶ�</th>
              <th class="g-w-14">���ڱ���</th>
              <th class="g-w-14">��������</th>
              <th class="g-w-14">ʣ�໹������</th>
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
        <div class="t2 f-mgtop">�ض�������ʾ</div>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-5">��������</th>
              <th class="g-w-5">��������</th>
              <th class="g-w-5">���׽��</th>
              <th class="g-w-5">�������ڱ������</th>
              <th class="g-w-5">������ϸ��Ϣ</th>
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
		<!-- (��)�г��ڽ�����ʷ���� -->
        <div class="t2 f-mgtop">(��)�г��ڽ�����ʷ����</div>
		<xsl:for-each select="EDA/ED01">
		<xsl:if test="(ED01A/ED01AD02 = 'D1' or ED01A/ED01AD02 = 'R4') and (ED01A/ED01AD03 = '20' or ED01A/ED01AD03 ='30')">
		<table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-5">�˻����</th>
              <th class="g-w-5">�˻�״̬</th>
              <th class="g-w-5">ҵ������������</th>
              <th class="g-w-5">���ҵ���������</th>
              <th class="g-w-5">���ҵ������ϸ��</th>
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
              <th class="g-w-14">��Ϣ��������</th>
              <th class="g-w-14">���</th>
              <th class="g-w-14">���仯����</th>
              <th class="g-w-14">�弶����</th>
              <th class="g-w-14">�弶�����϶�����</th>
              <th class="g-w-14">���һ��ʵ�ʻ�������</th>
              <th class="g-w-14">���һ��ʵ�ʻ����ܶ�</th>
              <th class="g-w-14">���һ�λ�����ʽ</th>
              <th class="g-w-14">���һ��Լ����������</th>
              <th class="g-w-14">���һ��Ӧ���ܶ�</th>
              <th class="g-w-14">�����ܶ�</th>
              <th class="g-w-14">���ڱ���</th>
              <th class="g-w-14">��������</th>
              <th class="g-w-14">ʣ�໹������</th>
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
	   <div class="t2 f-mgtop">�ض�������ʾ</div>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-5">��������</th>
              <th class="g-w-5">��������</th>
              <th class="g-w-5">���׽��</th>
              <th class="g-w-5">�������ڱ������</th>
              <th class="g-w-5">������ϸ��Ϣ</th>
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
		<!-- (��)���ڽ�����ʷ���� -->
        <div class="t2 f-mgtop">(��)���ڽ�����ʷ����</div>
		<xsl:for-each select="EDA/ED01[(ED01A/ED01AD02 = 'D1' or ED01A/ED01AD02 = 'R4') and ED01A/ED01AD03 = '10']">
		<table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-5">�˻����</th>
              <th class="g-w-5">�˻�״̬</th>
              <th class="g-w-5">ҵ������������</th>
              <th class="g-w-5">���ҵ���������</th>
              <th class="g-w-5">���ҵ������ϸ��</th>
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
              <th class="g-w-14">��Ϣ��������</th>
              <th class="g-w-14">���</th>
              <th class="g-w-14">���仯����</th>
              <th class="g-w-14">�弶����</th>
              <th class="g-w-14">�弶�����϶�����</th>
              <th class="g-w-14">���һ��ʵ�ʻ�������</th>
              <th class="g-w-14">���һ��ʵ�ʻ����ܶ�</th>
              <th class="g-w-14">���һ�λ�����ʽ</th>
              <th class="g-w-14">���һ��Լ����������</th>
              <th class="g-w-14">���һ��Ӧ���ܶ�</th>
              <th class="g-w-14">�����ܶ�</th>
              <th class="g-w-14">���ڱ���</th>
              <th class="g-w-14">��������</th>
              <th class="g-w-14">ʣ�໹������</th>
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
	   <div class="t2 f-mgtop">�ض�������ʾ</div>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-5">��������</th>
              <th class="g-w-5">��������</th>
              <th class="g-w-5">���׽��</th>
              <th class="g-w-5">�������ڱ������</th>
              <th class="g-w-5">������ϸ��Ϣ</th>
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
		<!-- (��)ѭ��͸֧����ʷ���� -->
        <div class="t2 f-mgtop">(��)ѭ��͸֧����ʷ����</div>
		<xsl:for-each select="EDA/ED01[ED01A/ED01AD02 = 'R1']">
		<table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-5">�˻����</th>
              <th class="g-w-5">�˻�״̬</th>
              <th class="g-w-5">ҵ������������</th>
              <th class="g-w-5">���ҵ���������</th>
              <th class="g-w-5">���ҵ������ϸ��</th>
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
              <th class="g-w-14">��Ϣ��������</th>
              <th class="g-w-14">���</th>
              <th class="g-w-14">���仯����</th>
              <th class="g-w-14">�弶����</th>
              <th class="g-w-14">�弶�����϶�����</th>
              <th class="g-w-14">���һ��ʵ�ʻ�������</th>
              <th class="g-w-14">���һ��ʵ�ʻ����ܶ�</th>
              <th class="g-w-14">���һ�λ�����ʽ</th>
              <th class="g-w-14">���һ��Լ����������</th>
              <th class="g-w-14">���һ��Ӧ���ܶ�</th>
              <th class="g-w-14">�����ܶ�</th>
              <th class="g-w-14">���ڱ���</th>
              <th class="g-w-14">��������</th>
              <th class="g-w-14">ʣ�໹������</th>
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
	   <div class="t2 f-mgtop">�ض�������ʾ</div>
       <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-5">��������</th>
              <th class="g-w-5">��������</th>
              <th class="g-w-5">���׽��</th>
              <th class="g-w-5">�������ڱ������</th>
              <th class="g-w-5">������ϸ��Ϣ</th>
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
		<!-- (��)���ֵ��Ŵ���ϸ����ʷ���� -->
        <div class="t2 f-mgtop">(��)���ֵ��Ŵ���ϸ����ʷ����</div>
		<xsl:for-each select="EDA/ED01[ED01A/ED01AD02 = 'D2']">
		<table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-5">�˻����</th>
              <th class="g-w-5">�˻�״̬</th>
              <th class="g-w-5">ҵ������������</th>
              <th class="g-w-5">���ҵ���������</th>
              <th class="g-w-5">���ҵ������ϸ��</th>
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
              <th class="g-w-14">��Ϣ��������</th>
              <th class="g-w-14">���</th>
              <th class="g-w-14">���仯����</th>
              <th class="g-w-14">�弶����</th>
              <th class="g-w-14">�弶�����϶�����</th>
              <th class="g-w-14">���һ��ʵ�ʻ�������</th>
              <th class="g-w-14">���һ��ʵ�ʻ����ܶ�</th>
              <th class="g-w-14">���һ�λ�����ʽ</th>
              <th class="g-w-14">���һ��Լ����������</th>
              <th class="g-w-14">���һ��Ӧ���ܶ�</th>
              <th class="g-w-14">�����ܶ�</th>
              <th class="g-w-14">���ڱ���</th>
              <th class="g-w-14">��������</th>
              <th class="g-w-14">ʣ�໹������</th>
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
              <th class="g-w-14">��Ϣ��������</th>
              <th class="g-w-14">���</th>
              <th class="g-w-14">���仯����</th>
              <th class="g-w-14">�弶����</th>
              <th class="g-w-14">�弶�����϶�����</th>
              <th class="g-w-14">���һ��ʵ�ʻ�������</th>
              <th class="g-w-14">���һ��ʵ�ʻ����ܶ�</th>
              <th class="g-w-14">���һ�λ�����ʽ</th>
              <th class="g-w-14">���һ��Լ����������</th>
              <th class="g-w-14">���һ��Ӧ���ܶ�</th>
              <th class="g-w-14">�����ܶ�</th>
              <th class="g-w-14">���ڱ���</th>
              <th class="g-w-14">��������</th>
              <th class="g-w-14">ʣ�໹������</th>
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
		   <div class="t2 f-mgtop">�ض�������ʾ</div>
		   <table class="g-tab-bor">
			  <tbody>
				<tr>
				  <th class="g-w-5">��������</th>
				  <th class="g-w-5">��������</th>
				  <th class="g-w-5">���׽��</th>
				  <th class="g-w-5">�������ڱ������</th>
				  <th class="g-w-5">������ϸ��Ϣ</th>
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
		<!-- �������Ŵ���¼��ϸ -->
        <div class="t1">�������Ŵ���¼��ϸ</div>
        <div class="t2 f-mgtop">��һ��������ҵ��ʷ�ɷѼ�¼��ϸ</div>
		<xsl:for-each select="EEA/EE01">
        <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-3">������ҵ��λ����</th>
              <th class="g-w-3">ҵ������</th>
              <th class="g-w-3">�ɷѼ�¼����</th>
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
              <th class="g-w-5">ͳ������</th>
              <th class="g-w-5">�ɷ�״̬</th>
              <th class="g-w-5">����Ӧ�ɽ��</th>
              <th class="g-w-5">����ʵ�ɽ��</th>
              <th class="g-w-5">�ۼ�Ƿ�ѽ��</th>
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
		<!-- ����������¼��ϸ -->
        <div class="t1">����������¼��ϸ</div>
		<div class="t2 f-mgtop">��һ��ס����������ʷ�ɷѼ�¼��ϸ</div>
		<!-- ס����������ʷ�ɷѼ�¼��ϸ -->
		<xsl:for-each select="EFD/EF05">
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-5">ͳ������</th>
              <th class="g-w-5">�ɷ�״̬</th>
              <th class="g-w-5">����Ӧ�ɽ�Ԫ��</th>
              <th class="g-w-5">����ʵ�ɽ�Ԫ��</th>
              <th class="g-w-5">�ۼ�Ƿ�ѽ�Ԫ��</th>
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
<!-- ���� 2�����񱨱���Ϣ -->
	<xsl:template name="annex2">
        <div class="t1">���� 2�����񱨱���Ϣ</div>
        <div class="t2 f-mgtop">��ҵ�ʲ���ծ��(2002 ��)</div>		
		<!-- ��ҵ�ʲ���ծ��(2002 ��) -->
		<xsl:for-each select="EGA/EG01">
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-8">���񱨱���</th>
              <th class="g-w-8">ҵ������������</th>
              <th class="g-w-8">ҵ������������</th>
              <th class="g-w-8">�������</th>
              <th class="g-w-8">��������</th>
              <th class="g-w-8">��������ϸ��</th>
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
          <!--�����ϱ߿�-->
          <tbody>
			<tr>
				<th>
					��Ŀ
				</th>
				<th>
					��ĩֵ
				</th>
				<th>
					��Ŀ
				</th>
				<th>
					��ĩֵ
				</th>
			</tr>
			<tr><td>�����ʽ�</td><td><xsl:value-of select="EG01B/EG01BJ01"/></td>
			<td>���ڽ��</td><td><xsl:value-of select="EG01B/EG01BJ45"/></td></tr>
			<tr><td>����Ͷ��</td><td><xsl:value-of select="EG01B/EG01BJ02"/></td><td>Ӧ��Ʊ��</td><td><xsl:value-of select="EG01B/EG01BJ46"/></td></tr>
			<tr><td>Ӧ��Ʊ��</td><td><xsl:value-of select="EG01B/EG01BJ03"/></td><td>Ӧ���˿�</td><td><xsl:value-of select="EG01B/EG01BJ47"/></td></tr>
			<tr><td>Ӧ�չ���</td><td><xsl:value-of select="EG01B/EG01BJ04"/></td><td>Ԥ���˿�</td><td><xsl:value-of select="EG01B/EG01BJ48"/></td></tr>
			<tr><td>Ӧ����Ϣ</td><td><xsl:value-of select="EG01B/EG01BJ05"/></td><td>Ӧ������</td><td><xsl:value-of select="EG01B/EG01BJ49"/></td></tr>
			<tr><td>Ӧ���˿�</td><td><xsl:value-of select="EG01B/EG01BJ06"/></td><td>Ӧ��������</td><td><xsl:value-of select="EG01B/EG01BJ50"/></td></tr>
			<tr><td>����Ӧ�տ�</td><td><xsl:value-of select="EG01B/EG01BJ07"/></td><td>Ӧ������</td><td><xsl:value-of select="EG01B/EG01BJ51"/></td></tr>
			<tr><td>Ԥ���˿�</td><td><xsl:value-of select="EG01B/EG01BJ08"/></td><td>Ӧ��˰��</td><td><xsl:value-of select="EG01B/EG01BJ52"/></td></tr>
			<tr><td>�ڻ���֤��</td><td><xsl:value-of select="EG01B/EG01BJ09"/></td><td>����Ӧ����</td><td><xsl:value-of select="EG01B/EG01BJ53"/></td></tr>
			<tr><td>Ӧ�ղ�����</td><td><xsl:value-of select="EG01B/EG01BJ10 "/></td><td>����Ӧ����</td><td><xsl:value-of select="EG01B/EG01BJ54"/></td></tr>
			<tr><td>Ӧ�ճ�����˰</td><td><xsl:value-of select="EG01B/EG01BJ11"/></td><td>Ԥ�����</td><td><xsl:value-of select="EG01B/EG01BJ55"/></td></tr>
			<tr><td>���</td><td><xsl:value-of select="EG01B/EG01BJ12"/></td><td>Ԥ�Ƹ�ծ</td><td><xsl:value-of select="EG01B/EG01BJ56"/></td></tr>
			<tr><td>���ԭ����</td><td><xsl:value-of select="EG01B/EG01BJ13"/></td><td>һ���ڵ��ڵĳ��ڸ�ծ</td><td><xsl:value-of select="EG01B/EG01BJ57"/></td></tr>
			<tr><td>�������Ʒ</td><td><xsl:value-of select="EG01B/EG01BJ14"/></td><td>����������ծ</td><td><xsl:value-of select="EG01B/EG01BJ58"/></td></tr>
			<tr><td>��̯����</td><td><xsl:value-of select="EG01B/EG01BJ15"/></td><td>������ծ�ϼ�</td><td><xsl:value-of select="EG01B/EG01BJ59"/></td></tr>
			<tr><td>�����������ʲ�����ʧ</td><td><xsl:value-of select="EG01B/EG01BJ16"/></td><td>���ڽ��</td><td><xsl:value-of select="EG01B/EG01BJ60"/></td></tr>
			<tr><td>һ���ڵ��ڵĳ���ծȨͶ��</td><td><xsl:value-of select="EG01B/EG01BJ17"/></td><td>Ӧ��ծȯ</td><td><xsl:value-of select="EG01B/EG01BJ61"/></td></tr>
			<tr><td>���������ʲ�</td><td><xsl:value-of select="EG01B/EG01BJ18"/></td><td>����Ӧ����</td><td><xsl:value-of select="EG01B/EG01BJ62"/></td></tr>
			<tr><td>�����ʲ��ϼ�</td><td><xsl:value-of select="EG01B/EG01BJ19"/></td><td>ר��Ӧ����</td><td><xsl:value-of select="EG01B/EG01BJ63"/></td></tr>
			<tr><td>����Ͷ��</td><td><xsl:value-of select="EG01B/EG01BJ20"/></td><td>�������ڸ�ծ</td><td><xsl:value-of select="EG01B/EG01BJ64"/></td></tr>
			<tr><td>���ڹ�ȨͶ��</td><td><xsl:value-of select="EG01B/EG01BJ21"/></td><td>���������ڸ�ծ��Ŀ�£���׼��������</td><td><xsl:value-of select="EG01B/EG01BJ65"/></td></tr>
			<tr><td>����ծȨͶ��</td><td><xsl:value-of select="EG01B/EG01BJ22"/></td><td>���ڸ�ծ�ϼ�</td><td><xsl:value-of select="EG01B/EG01BJ66"/></td></tr>
			<tr><td>�ϲ��۲�</td><td><xsl:value-of select="EG01B/EG01BJ23"/></td><td>����˰�����</td><td><xsl:value-of select="EG01B/EG01BJ67"/></td></tr>
			<tr><td>����Ͷ�ʺϼ�</td><td><xsl:value-of select="EG01B/EG01BJ24"/></td><td>��ծ�ϼ�</td><td><xsl:value-of select="EG01B/EG01BJ68"/></td></tr>
			<tr><td>�̶��ʲ�ԭ��</td><td><xsl:value-of select="EG01B/EG01BJ25"/></td><td>�����ɶ�Ȩ��</td><td><xsl:value-of select="EG01B/EG01BJ69"/></td></tr>
			<tr><td>�ۼ��۾�</td><td><xsl:value-of select="EG01B/EG01BJ26"/></td><td>ʵ���ʱ�</td><td><xsl:value-of select="EG01B/EG01BJ70"/></td></tr>
			<tr><td>�̶��ʲ���ֵ</td><td><xsl:value-of select="EG01B/EG01BJ27"/></td><td>�����ʱ�</td><td><xsl:value-of select="EG01B/EG01BJ71"/></td></tr>
			<tr><td>�̶��ʲ�ֵ��ֵ׼��</td><td><xsl:value-of select="EG01B/EG01BJ28"/></td><td>�����ʱ�</td><td><xsl:value-of select="EG01B/EG01BJ72"/></td></tr>
			<tr><td>�̶��ʲ�����</td><td><xsl:value-of select="EG01B/EG01BJ29"/></td><td>�����ʱ�</td><td><xsl:value-of select="EG01B/EG01BJ73 "/></td></tr>
			<tr><td>�̶��ʲ�����</td><td><xsl:value-of select="EG01B/EG01BJ30"/></td><td>�������ʱ���Ŀ�£����з����ʱ�</td><td><xsl:value-of select="EG01B/EG01BJ74"/></td></tr>
			<tr><td>��������</td><td><xsl:value-of select="EG01B/EG01BJ31"/></td><td>�������ʱ���Ŀ�£����巨���ʱ�</td><td><xsl:value-of select="EG01B/EG01BJ75"/></td></tr>
			<tr><td>�ڽ�����</td><td><xsl:value-of select="EG01B/EG01BJ32"/></td><td>�����ʱ�</td><td><xsl:value-of select="EG01B/EG01BJ76"/></td></tr>
			<tr><td>������̶��ʲ�����ʧ</td><td><xsl:value-of select="EG01B/EG01BJ33"/></td><td>�����ʱ�</td><td><xsl:value-of select="EG01B/EG01BJ77"/></td></tr>
			<tr><td>�̶��ʲ��ϼ�</td><td><xsl:value-of select="EG01B/EG01BJ34"/></td><td>�ʱ�����</td><td><xsl:value-of select="EG01B/EG01BJ78"/></td></tr>
			<tr><td>�����ʲ�</td><td><xsl:value-of select="EG01B/EG01BJ35"/></td><td>ӯ�๫��</td><td><xsl:value-of select="EG01B/EG01BJ79"/></td></tr>
			<tr><td>�������ʲ���Ŀ�£�����ʹ��Ȩ</td><td><xsl:value-of select="EG01B/EG01BJ36"/></td><td>��ӯ�๫����Ŀ�£�����ӯ�๫��</td><td><xsl:value-of select="EG01B/EG01BJ80"/></td></tr>
			<tr><td>�����ʲ�</td><td><xsl:value-of select="EG01B/EG01BJ37"/></td><td>��ӯ�๫����Ŀ�£������</td><td><xsl:value-of select="EG01B/EG01BJ81"/></td></tr>
			<tr><td>�������ʲ���Ŀ�£��̶��ʲ�����</td><td><xsl:value-of select="EG01B/EG01BJ38"/></td><td>��ӯ�๫����Ŀ�£����������ʱ�</td><td><xsl:value-of select="EG01B/EG01BJ82"/></td></tr>
			<tr><td>�������ʲ���Ŀ�£��̶��ʲ�����֧��</td><td><xsl:value-of select="EG01B/EG01BJ39"/></td><td>δȷ�ϵ�Ͷ����ʧ</td><td><xsl:value-of select="EG01B/EG01BJ83"/></td></tr>
			<tr><td>���������ʲ�</td><td><xsl:value-of select="EG01B/EG01BJ40"/></td><td>δ��������</td><td><xsl:value-of select="EG01B/EG01BJ84"/></td></tr>
			<tr><td>�����������ʲ���Ŀ�£���׼��������</td><td><xsl:value-of select="EG01B/EG01BJ41 "/></td><td>��ұ���������</td><td><xsl:value-of select="EG01B/EG01BJ85"/></td></tr>
			<tr><td>���μ������ʲ��ϼ�</td><td><xsl:value-of select="EG01B/EG01BJ42"/></td><td>������Ȩ��ϼ�</td><td><xsl:value-of select="EG01B/EG01BJ86"/></td></tr>
			<tr><td>����˰�����</td><td><xsl:value-of select="EG01B/EG01BJ43"/></td><td>��ծ��������Ȩ���ܼ�</td><td><xsl:value-of select="EG01B/EG01BJ87"/></td></tr>
			<tr><td>�ʲ��ܼ�</td><td><xsl:value-of select="EG01B/EG01BJ44"/></td><td></td><td></td></tr>
		</tbody>
		</table>
		<br/>
		</xsl:for-each>
		<!-- ��ҵ�ʲ���ծ��(2007 ��) -->
		<xsl:for-each select="EGA/EG02">
       <div class="t2 f-mgtop">��ҵ�ʲ���ծ��(2007 ��)</div>
        <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-6">���񱨱���</th>
              <th class="g-w-6">ҵ������������</th>
              <th class="g-w-6">ҵ������������</th>
              <th class="g-w-6">�������</th>
              <th class="g-w-6">��������</th>
              <th class="g-w-6">��������ϸ��</th>
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
          <!--�����ϱ߿�-->
          <tbody>
			<tr>
				<th>
					��Ŀ
				</th>
				<th>
					��ĩֵ
				</th>
				<th>
					��Ŀ
				</th>
				<th>
					��ĩֵ
				</th>
			</tr>
			<tr><td>�����ʽ�</td><td><xsl:value-of select="EG02B/EG02BJ01 "/></td><td>���ڽ��</td><td><xsl:value-of select="EG02B/EG02BJ32"/></td></tr>
			<tr><td>�����Խ����ʲ�</td><td><xsl:value-of select="EG02B/EG02BJ02"/></td><td>�����Խ��ڸ�ծ</td><td><xsl:value-of select="EG02B/EG02BJ33"/></td></tr>
			<tr><td>Ӧ��Ʊ��</td><td><xsl:value-of select="EG02B/EG02BJ03"/></td><td>Ӧ��Ʊ��</td><td><xsl:value-of select="EG02B/EG02BJ34 "/></td></tr>
			<tr><td>Ӧ���˿�</td><td><xsl:value-of select="EG02B/EG02BJ04"/></td><td>Ӧ���˿�</td><td><xsl:value-of select="EG02B/EG02BJ35"/></td></tr>
			<tr><td>Ԥ���˿�</td><td><xsl:value-of select="EG02B/EG02BJ05"/></td><td>Ԥ���˿�</td><td><xsl:value-of select="EG02B/EG02BJ36"/></td></tr>
			<tr><td>Ӧ����Ϣ</td><td><xsl:value-of select="EG02B/EG02BJ06"/></td><td>Ӧ����Ϣ</td><td><xsl:value-of select="EG02B/EG02BJ37"/></td></tr>
			<tr><td>Ӧ�չ���</td><td><xsl:value-of select="EG02B/EG02BJ07"/></td><td>Ӧ��ְ��н��</td><td><xsl:value-of select="EG02B/EG02BJ38"/></td></tr>
			<tr><td>����Ӧ�տ�</td><td><xsl:value-of select="EG02B/EG02BJ08"/></td><td>Ӧ��˰��</td><td><xsl:value-of select="EG02B/EG02BJ39"/></td></tr>
			<tr><td>���</td><td><xsl:value-of select="EG02B/EG02BJ09"/></td><td>Ӧ������</td><td><xsl:value-of select="EG02B/EG02BJ40"/></td></tr>
			<tr><td>һ���ڵ��ڵķ������ʲ�</td><td><xsl:value-of select="EG02B/EG02BJ10"/></td><td>����Ӧ����</td><td><xsl:value-of select="EG02B/EG02BJ41"/></td></tr>
			<tr><td>���������ʲ�</td><td><xsl:value-of select="EG02B/EG02BJ11"/></td><td>һ���ڵ��ڵķ�������ծ</td><td><xsl:value-of select="EG02B/EG02BJ42"/></td></tr>
			<tr><td>�����ʲ��ϼ�</td><td><xsl:value-of select="EG02B/EG02BJ12"/></td><td>����������ծ</td><td><xsl:value-of select="EG02B/EG02BJ43"/></td></tr>
			<tr><td>�ɹ����۵Ľ����ʲ�</td><td><xsl:value-of select="EG02B/EG02BJ13"/></td><td>������ծ�ϼ�</td><td><xsl:value-of select="EG02B/EG02BJ44"/></td></tr>
			<tr><td>����������Ͷ��</td><td><xsl:value-of select="EG02B/EG02BJ14"/></td><td>���ڽ��</td><td><xsl:value-of select="EG02B/EG02BJ45"/></td></tr>
			<tr><td>���ڹ�ȨͶ��</td><td><xsl:value-of select="EG02B/EG02BJ15"/></td><td>Ӧ��ծȯ</td><td><xsl:value-of select="EG02B/EG02BJ46"/></td></tr>
			<tr><td>����Ӧ�տ�</td><td><xsl:value-of select="EG02B/EG02BJ16"/></td><td>����Ӧ����</td><td><xsl:value-of select="EG02B/EG02BJ47"/></td></tr>
			<tr><td>Ͷ���Է��ز�</td><td><xsl:value-of select="EG02B/EG02BJ17"/></td><td>ר��Ӧ����</td><td><xsl:value-of select="EG02B/EG02BJ48"/></td></tr>
			<tr><td>�̶��ʲ�</td><td><xsl:value-of select="EG02B/EG02BJ18"/></td><td>Ԥ�Ƹ�ծ</td><td><xsl:value-of select="EG02B/EG02BJ49"/></td></tr>
			<tr><td>�ڽ�����</td><td><xsl:value-of select="EG02B/EG02BJ19"/></td><td>��������˰��ծ</td><td><xsl:value-of select="EG02B/EG02BJ50"/></td></tr>
			<tr><td>��������</td><td><xsl:value-of select="EG02B/EG02BJ20"/></td><td>������������ծ</td><td><xsl:value-of select="EG02B/EG02BJ51"/></td></tr>
			<tr><td>�̶��ʲ�����</td><td><xsl:value-of select="EG02B/EG02BJ21"/></td><td>��������ծ�ϼ�</td><td><xsl:value-of select="EG02B/EG02BJ52"/></td></tr>
			<tr><td>�����������ʲ�</td><td><xsl:value-of select="EG02B/EG02BJ22"/></td><td>��ծ�ϼ�</td><td><xsl:value-of select="EG02B/EG02BJ53"/></td></tr>
			<tr><td>�����ʲ�</td><td><xsl:value-of select="EG02B/EG02BJ23"/></td><td>ʵ���ʱ�����ɱ���</td><td><xsl:value-of select="EG02B/EG02BJ54"/></td></tr>
			<tr><td>�����ʲ�</td><td><xsl:value-of select="EG02B/EG02BJ24"/></td><td>�ʱ�����</td><td><xsl:value-of select="EG02B/EG02BJ55"/></td></tr>
			<tr><td>����֧��</td><td><xsl:value-of select="EG02B/EG02BJ25"/></td><td>��������</td><td><xsl:value-of select="EG02B/EG02BJ56"/></td></tr>
			<tr><td>����</td><td><xsl:value-of select="EG02B/EG02BJ26"/></td><td>ӯ�๫��</td><td><xsl:value-of select="EG02B/EG02BJ57"/></td></tr>
			<tr><td>���ڴ�̯����</td><td><xsl:value-of select="EG02B/EG02BJ27"/></td><td>δ��������</td><td><xsl:value-of select="EG02B/EG02BJ58"/></td></tr>
			<tr><td>��������˰�ʲ�</td><td><xsl:value-of select="EG02B/EG02BJ28"/></td><td>������Ȩ��ϼ�</td><td><xsl:value-of select="EG02B/EG02BJ59"/></td></tr>
			<tr><td>�����������ʲ�</td><td><xsl:value-of select="EG02B/EG02BJ29"/></td><td>��ծ��������Ȩ��ϼ�</td><td><xsl:value-of select="EG02B/EG02BJ60"/></td></tr>
			<tr><td>�������ʲ��ϼ�</td><td><xsl:value-of select="EG02B/EG02BJ30"/></td><td></td><td></td></tr>
			<tr><td>�ʲ��ܼ�</td><td><xsl:value-of select="EG02B/EG02BJ31"/></td><td></td><td></td></tr>
			</tbody>
		</table>
		<br/>
		</xsl:for-each>
		<!-- ��ҵ������������2002 �棩 -->
		<xsl:for-each select="EGA/EG03">
       <div class="t2 f-mgtop">��ҵ������������2002 �棩</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-8">���񱨱���</th>
              <th class="g-w-8">ҵ������������</th>
              <th class="g-w-8">ҵ������������</th>
              <th class="g-w-8">�������</th>
              <th class="g-w-8">��������</th>
              <th class="g-w-8">��������ϸ��</th>
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
					��Ŀ
				</th>
				<th>
					��ĩֵ
				</th>
			</tr>
			<tr><td>��Ӫҵ������</td><td><xsl:value-of select="EG03B/EG03BJ01"/></td></tr>
			<tr><td>����Ӫҵ�������Ŀ�£����ڲ�Ʒ��������</td><td><xsl:value-of select="EG03B/EG03BJ02"/></td></tr>
			<tr><td>����Ӫҵ�������Ŀ�£����ڲ�Ʒ��������</td><td><xsl:value-of select="EG03B/EG03BJ03"/></td></tr>
			<tr><td>�����ۿ�������</td><td><xsl:value-of select="EG03B/EG03BJ04"/></td></tr>
			<tr><td>��Ӫҵ�����뾻��</td><td><xsl:value-of select="EG03B/EG03BJ05"/></td></tr>
			<tr><td>��Ӫҵ��ɱ�</td><td><xsl:value-of select="EG03B/EG03BJ06"/></td></tr>
			<tr><td>����Ӫҵ��ɱ���Ŀ�£����ڲ�Ʒ���۳ɱ�</td><td><xsl:value-of select="EG03B/EG03BJ07"/></td></tr>
			<tr><td>��Ӫҵ��˰�𼰸���</td><td><xsl:value-of select="EG03B/EG03BJ08"/></td></tr>
			<tr><td>��Ӫ����</td><td><xsl:value-of select="EG03B/EG03BJ09"/></td></tr>
			<tr><td>������ҵ��ɱ���</td><td><xsl:value-of select="EG03B/EG03BJ10"/></td></tr>
			<tr><td>��������</td><td><xsl:value-of select="EG03B/EG03BJ11"/></td></tr>
			<tr><td>������������</td><td><xsl:value-of select="EG03B/EG03BJ12"/></td></tr>
			<tr><td>���������룩</td><td><xsl:value-of select="EG03B/EG03BJ13"/></td></tr>
			<tr><td>��Ӫҵ������</td><td><xsl:value-of select="EG03B/EG03BJ14"/></td></tr>
			<tr><td>����ҵ������</td><td><xsl:value-of select="EG03B/EG03BJ15"/></td></tr>
			<tr><td>Ӫҵ����</td><td><xsl:value-of select="EG03B/EG03BJ16"/></td></tr>
			<tr><td>�������</td><td><xsl:value-of select="EG03B/EG03BJ17"/></td></tr>
			<tr><td>�������</td><td><xsl:value-of select="EG03B/EG03BJ18"/></td></tr>
			<tr><td>���������ã�</td><td><xsl:value-of select="EG03B/EG03BJ19"/></td></tr>
			<tr><td>Ӫҵ����</td><td><xsl:value-of select="EG03B/EG03BJ20"/></td></tr>
			<tr><td>Ͷ������</td><td><xsl:value-of select="EG03B/EG03BJ21"/></td></tr>
			<tr><td>�ڻ�����</td><td><xsl:value-of select="EG03B/EG03BJ22"/></td></tr>
			<tr><td>��������</td><td><xsl:value-of select="EG03B/EG03BJ23 "/></td></tr>
			<tr><td>�����������Ŀ�£�����ǰ�������ҵ��������</td><td><xsl:value-of select="EG03B/EG03BJ24"/></td></tr>
			<tr><td>Ӫҵ������</td><td><xsl:value-of select="EG03B/EG03BJ25"/></td></tr>
			<tr><td>��Ӫҵ�������Ŀ�£����ù̶��ʲ�������</td><td><xsl:value-of select="EG03B/EG03BJ26"/></td></tr>
			<tr><td>��Ӫҵ�������Ŀ�£��ǻ����Խ�������</td><td><xsl:value-of select="EG03B/EG03BJ27"/></td></tr>
			<tr><td>��Ӫҵ�������Ŀ�£����������ʲ�����</td><td><xsl:value-of select="EG03B/EG03BJ28"/></td></tr>
			<tr><td>��Ӫҵ�������Ŀ�£��������</td><td><xsl:value-of select="EG03B/EG03BJ29"/></td></tr>
			<tr><td>����������</td><td><xsl:value-of select="EG03B/EG03BJ30"/></td></tr>
			<tr><td>��������Ŀ�£�����ǰ��Ⱥ������ʽ����ֲ�����</td><td><xsl:value-of select="EG03B/EG03BJ31"/></td></tr>
			<tr><td>Ӫҵ��֧��</td><td><xsl:value-of select="EG03B/EG03BJ32"/></td></tr>
			<tr><td>��Ӫҵ��֧����Ŀ�£����ù̶��ʲ�����ʧ</td><td><xsl:value-of select="EG03B/EG03BJ33"/></td></tr>
			<tr><td>��Ӫҵ��֧����Ŀ�£�ծ��������ʧ</td><td><xsl:value-of select="EG03B/EG03BJ34"/></td></tr>
			<tr><td>��Ӫҵ��֧����Ŀ�£�����֧��</td><td><xsl:value-of select="EG03B/EG03BJ35"/></td></tr>
			<tr><td>��Ӫҵ��֧����Ŀ�£�����֧��</td><td><xsl:value-of select="EG03B/EG03BJ36"/></td></tr>
			<tr><td>����֧��</td><td><xsl:value-of select="EG03B/EG03BJ37"/></td></tr>
			<tr><td>������֧������ת�ĺ������ʰ��ɽ���</td><td><xsl:value-of select="EG03B/EG03BJ38"/></td></tr>
			<tr><td>�����ܶ�</td><td><xsl:value-of select="EG03B/EG03BJ39"/></td></tr>
			<tr><td>����˰</td><td><xsl:value-of select="EG03B/EG03BJ40"/></td></tr>
			<tr><td>�����ɶ�����</td><td><xsl:value-of select="EG03B/EG03BJ41"/></td></tr>
			<tr><td>δȷ�ϵ�Ͷ����ʧ</td><td><xsl:value-of select="EG03B/EG03BJ42"/></td></tr>
			<tr><td>������</td><td><xsl:value-of select="EG03B/EG03BJ43"/></td></tr>
			<tr><td>���δ��������</td><td><xsl:value-of select="EG03B/EG03BJ44"/></td></tr>
			<tr><td>ӯ�๫������</td><td><xsl:value-of select="EG03B/EG03BJ45"/></td></tr>
			<tr><td>������������</td><td><xsl:value-of select="EG03B/EG03BJ46"/></td></tr>
			<tr><td>�ɹ����������</td><td><xsl:value-of select="EG03B/EG03BJ47 "/></td></tr>
			<tr><td>�������õ�����</td><td><xsl:value-of select="EG03B/EG03BJ48"/></td></tr>
			<tr><td>���������ʱ�</td><td><xsl:value-of select="EG03B/EG03BJ49"/></td></tr>
			<tr><td>��ȡ����ӯ�๫��</td><td><xsl:value-of select="EG03B/EG03BJ50"/></td></tr>
			<tr><td>��ȡ���������</td><td><xsl:value-of select="EG03B/EG03BJ51"/></td></tr>
			<tr><td>��ȡְ����������������</td><td><xsl:value-of select="EG03B/EG03BJ52"/></td></tr>
			<tr><td>��ȡ��������</td><td><xsl:value-of select="EG03B/EG03BJ53"/></td></tr>
			<tr><td>��ȡ��ҵ��չ����</td><td><xsl:value-of select="EG03B/EG03BJ54"/></td></tr>
			<tr><td>����黹Ͷ��</td><td><xsl:value-of select="EG03B/EG03BJ55"/></td></tr>
			<tr><td>���ɹ�����������Ŀ�£�����</td><td><xsl:value-of select="EG03B/EG03BJ56"/></td></tr>
			<tr><td>�ɹ�Ͷ���߷��������</td><td><xsl:value-of select="EG03B/EG03BJ57"/></td></tr>
			<tr><td>Ӧ�����ȹɹ���</td><td><xsl:value-of select="EG03B/EG03BJ58"/></td></tr>
			<tr><td>��ȡ����ӯ�๫��</td><td><xsl:value-of select="EG03B/EG03BJ59"/></td></tr>
			<tr><td>Ӧ����ͨ�ɹ���</td><td><xsl:value-of select="EG03B/EG03BJ60"/></td></tr>
			<tr><td>ת���ʱ�����ͨ�ɹ���</td><td><xsl:value-of select="EG03B/EG03BJ61"/></td></tr>
			<tr><td>���ɹ�Ͷ���߷���������Ŀ�£�����</td><td><xsl:value-of select="EG03B/EG03BJ62"/></td></tr>
			<tr><td>δ��������</td><td><xsl:value-of select="EG03B/EG03BJ63"/></td></tr>
			<tr><td>��δ���������Ŀ�£�Ӧ���Ժ����˰ǰ�����ֲ��Ŀ���</td><td><xsl:value-of select="EG03B/EG03BJ64"/></td></tr>
		</table>
		<br/>
		</xsl:for-each>
		<!-- ��ҵ������������2007 �棩 -->
		<xsl:for-each select="EGA/EG04">
       <div class="t2 f-mgtop">��ҵ������������2007 �棩</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-8">���񱨱���</th>
              <th class="g-w-8">ҵ������������</th>
              <th class="g-w-8">ҵ������������</th>
              <th class="g-w-8">�������</th>
              <th class="g-w-8">��������</th>
              <th class="g-w-8">��������ϸ��</th>
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
					��Ŀ
				</td>
				<td>
					��ĩֵ
				</td>
			</tr>
			<tr><td>Ӫҵ����</td><td><xsl:value-of select="EG04B/EG04BJ01"/></td></tr>
			<tr><td>Ӫҵ�ɱ�</td><td><xsl:value-of select="EG04B/EG04BJ02"/></td></tr>
			<tr><td>Ӫҵ˰�𼰸���</td><td><xsl:value-of select="EG04B/EG04BJ03"/></td></tr>
			<tr><td>���۷���</td><td><xsl:value-of select="EG04B/EG04BJ04"/></td></tr>
			<tr><td>�������</td><td><xsl:value-of select="EG04B/EG04BJ05"/></td></tr>
			<tr><td>�������</td><td><xsl:value-of select="EG04B/EG04BJ06"/></td></tr>
			<tr><td>�ʲ���ֵ��ʧ</td><td><xsl:value-of select="EG04B/EG04BJ07"/></td></tr>
			<tr><td>���ʼ�ֵ�䶯������</td><td><xsl:value-of select="EG04B/EG04BJ08"/></td></tr>
			<tr><td>Ͷ�ʾ�����</td><td><xsl:value-of select="EG04B/EG04BJ09"/></td></tr>
			<tr><td>����Ӫ��ҵ�ͺ�Ӫ��ҵ��Ͷ������</td><td><xsl:value-of select="EG04B/EG04BJ10"/></td></tr>
			<tr><td>Ӫҵ����</td><td><xsl:value-of select="EG04B/EG04BJ11"/></td></tr>
			<tr><td>Ӫҵ������</td><td><xsl:value-of select="EG04B/EG04BJ12"/></td></tr>
			<tr><td>Ӫҵ��֧��</td><td><xsl:value-of select="EG04B/EG04BJ13"/></td></tr>
			<tr><td>�������ʲ���ʧ�����У��������ʲ�������ʧ��</td><td><xsl:value-of select="EG04B/EG04BJ14"/></td></tr>
			<tr><td>�����ܶ�</td><td><xsl:value-of select="EG04B/EG04BJ15"/></td></tr>
			<tr><td>����˰����</td><td><xsl:value-of select="EG04B/EG04BJ16"/></td></tr>
			<tr><td>������</td><td><xsl:value-of select="EG04B/EG04BJ17"/></td></tr>
			<tr><td>����ÿ������</td><td><xsl:value-of select="EG04B/EG04BJ18"/></td></tr>
			<tr><td>ϡ��ÿ������</td><td><xsl:value-of select="EG04B/EG04BJ19"/></td></tr>
		</table>
		<br/>
		</xsl:for-each>
		<!-- ��ҵ�ֽ�������2002 �棩 -->

		<xsl:for-each select="EGA/EG05">
       <div class="t2 f-mgtop">��ҵ�ֽ�������2002 �棩</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-6">���񱨱���</th>
              <th class="g-w-6">ҵ������������</th>
              <th class="g-w-6">ҵ������������</th>
              <th class="g-w-6">�������</th>
              <th class="g-w-6">��������</th>
              <th class="g-w-6">��������ϸ��</th>
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
					��Ŀ
				</th>
				<th>
					��ĩֵ
				</th>
			</tr>
			<tr><td>������Ʒ���ṩ�����յ����ֽ�</td><td><xsl:value-of select="EG05B/EG05BJ01"/></td></tr>
			<tr><td>�յ���˰�ѷ���</td><td><xsl:value-of select="EG05B/EG05BJ02"/></td></tr>
			<tr><td>�յ��������뾭Ӫ��йص��ֽ�</td><td><xsl:value-of select="EG05B/EG05BJ03"/></td></tr>
			<tr><td>��Ӫ��ֽ�����С��</td><td><xsl:value-of select="EG05B/EG05BJ04"/></td></tr>
			<tr><td>������Ʒ����������֧�����ֽ�</td><td><xsl:value-of select="EG05B/EG05BJ05"/></td></tr>
			<tr><td>֧����ְ���Լ�Ϊְ��֧�����ֽ�</td><td><xsl:value-of select="EG05B/EG05BJ06"/></td></tr>
			<tr><td>֧���ĸ���˰��</td><td><xsl:value-of select="EG05B/EG05BJ07"/></td></tr>
			<tr><td>֧���������뾭Ӫ��йص��ֽ�</td><td><xsl:value-of select="EG05B/EG05BJ08"/></td></tr>
			<tr><td>��Ӫ��ֽ�����С��</td><td><xsl:value-of select="EG05B/EG05BJ09"/></td></tr>
			<tr><td>��Ӫ��������ֽ���������</td><td><xsl:value-of select="EG05B/EG05BJ10"/></td></tr>
			<tr><td>�ջ�Ͷ�����յ����ֽ�</td><td><xsl:value-of select="EG05B/EG05BJ11"/></td></tr>
			<tr><td>ȡ��Ͷ���������յ����ֽ�</td><td><xsl:value-of select="EG05B/EG05BJ12"/></td></tr>
			<tr><td>���ù̶��ʲ������ʲ������������ʲ����ջص��ֽ𾻶�</td><td><xsl:value-of select="EG05B/EG05BJ13"/></td></tr>
			<tr><td>�յ���������Ͷ�ʻ�йص��ֽ�</td><td><xsl:value-of select="EG05B/EG05BJ14"/></td></tr>
			<tr><td>Ͷ�ʻ�ֽ�����С��</td><td><xsl:value-of select="EG05B/EG05BJ15"/></td></tr>
			<tr><td>�����̶��ʲ������ʲ������������ʲ���֧�����ֽ�</td><td><xsl:value-of select="EG05B/EG05BJ16"/></td></tr>
			<tr><td>Ͷ����֧�����ֽ�</td><td><xsl:value-of select="EG05B/EG05BJ17"/></td></tr>
			<tr><td>֧����������Ͷ�ʻ�йص��ֽ�</td><td><xsl:value-of select="EG05B/EG05BJ18"/></td></tr>
			<tr><td>Ͷ�ʻ�ֽ�����С��</td><td><xsl:value-of select="EG05B/EG05BJ19"/></td></tr>
			<tr><td>Ͷ�ʻ�������ֽ���������</td><td><xsl:value-of select="EG05B/EG05BJ20"/></td></tr>
			<tr><td>����Ͷ�����յ����ֽ�</td><td><xsl:value-of select="EG05B/EG05BJ21"/></td></tr>
			<tr><td>������յ����ֽ�</td><td><xsl:value-of select="EG05B/EG05BJ22 "/></td></tr>
			<tr><td>�յ�����������ʻ�йص��ֽ�</td><td><xsl:value-of select="EG05B/EG05BJ23"/></td></tr>
			<tr><td>���ʻ�ֽ�����С��</td><td><xsl:value-of select="EG05B/EG05BJ24"/></td></tr>
			<tr><td>����ծ����֧�����ֽ�</td><td><xsl:value-of select="EG05B/EG05BJ25"/></td></tr>
			<tr><td>�������������򳥸���Ϣ��֧�����ֽ�</td><td><xsl:value-of select="EG05B/EG05BJ26"/></td></tr>
			<tr><td>֧������������ʻ�йص��ֽ�</td><td><xsl:value-of select="EG05B/EG05BJ27"/></td></tr>
			<tr><td>���ʻ�ֽ�����С��</td><td><xsl:value-of select="EG05B/EG05BJ28"/></td></tr>
			<tr><td>�Ｏ��������ֽ���������</td><td><xsl:value-of select="EG05B/EG05BJ29"/></td></tr>
			<tr><td>���ʱ䶯���ֽ��Ӱ��</td><td><xsl:value-of select="EG05B/EG05BJ30"/></td></tr>
			<tr><td>�ֽ��ֽ�ȼ��ﾻ���Ӷ�</td><td><xsl:value-of select="EG05B/EG05BJ31"/></td></tr>
			<tr><td>������</td><td><xsl:value-of select="EG05B/EG05BJ32"/></td></tr>
			<tr><td>������ʲ���ֵ׼��</td><td><xsl:value-of select="EG05B/EG05BJ33"/></td></tr>
			<tr><td>�̶��ʲ����</td><td><xsl:value-of select="EG05B/EG05BJ34"/></td></tr>
			<tr><td>�����ʲ�̯��</td><td><xsl:value-of select="EG05B/EG05BJ35"/></td></tr>
			<tr><td>���ڴ�̯����̯��</td><td><xsl:value-of select="EG05B/EG05BJ36"/></td></tr>
			<tr><td>��̯���ü���</td><td><xsl:value-of select="EG05B/EG05BJ37"/></td></tr>
			<tr><td>Ԥ���������</td><td><xsl:value-of select="EG05B/EG05BJ38"/></td></tr>
			<tr><td>���ù̶��ʲ������ʲ������������ʲ�����ʧ</td><td><xsl:value-of select="EG05B/EG05BJ39"/></td></tr>
			<tr><td>�̶��ʲ�������ʧ</td><td><xsl:value-of select="EG05B/EG05BJ40"/></td></tr>
			<tr><td>�������</td><td><xsl:value-of select="EG05B/EG05BJ41"/></td></tr>
			<tr><td>Ͷ����ʧ</td><td><xsl:value-of select="EG05B/EG05BJ42"/></td></tr>
			<tr><td>����˰�����</td><td><xsl:value-of select="EG05B/EG05BJ43"/></td></tr>
			<tr><td>����ļ���</td><td><xsl:value-of select="EG05B/EG05BJ44"/></td></tr>
			<tr><td>��Ӫ��Ӧ����Ŀ�ļ���</td><td><xsl:value-of select="EG05B/EG05BJ45"/></td></tr>
			<tr><td>��Ӫ��Ӧ����Ŀ������</td><td><xsl:value-of select="EG05B/EG05BJ46"/></td></tr>
			<tr><td>�����������Ϊ��Ӫ��ֽ�������Ŀ�£�����</td><td><xsl:value-of select="EG05B/EG05BJ47"/></td></tr>
			<tr><td>��Ӫ��������ֽ���������</td><td><xsl:value-of select="EG05B/EG05BJ48"/></td></tr>
			<tr><td>ծ��תΪ�ʱ�</td><td><xsl:value-of select="EG05B/EG05BJ49"/></td></tr>
			<tr><td>һ���ڵ��ڵĿ�ת����˾ծȯ</td><td><xsl:value-of select="EG05B/EG05BJ50"/></td></tr>
			<tr><td>��������̶��ʲ�</td><td><xsl:value-of select="EG05B/EG05BJ51"/></td></tr>
			<tr><td>�����漰�ֽ���֧��Ͷ�ʺͳ��ʻ��Ŀ�£�����</td><td><xsl:value-of select="EG05B/EG05BJ52 "/></td></tr>
			<tr><td>�ֽ����ĩ���</td><td><xsl:value-of select="EG05B/EG05BJ53"/></td></tr>
			<tr><td>�ֽ���ڳ����</td><td><xsl:value-of select="EG05B/EG05BJ54"/></td></tr>
			<tr><td>�ֽ�ȼ������ĩ���</td><td><xsl:value-of select="EG05B/EG05BJ55"/></td></tr>
			<tr><td>�ֽ�ȼ�����ڳ����</td><td><xsl:value-of select="EG05B/EG05BJ56"/></td></tr>
			<tr><td>�ֽ��ֽ�ȼ��ﾻ���Ӷ�</td><td><xsl:value-of select="EG05B/EG05BJ57"/></td></tr>
			</tbody>
		</table>
		<br/>
		</xsl:for-each>
		<!-- ��ҵ�ֽ�������2007 �棩 -->
		<xsl:for-each select="EGA/EG06">
       <div class="t2 f-mgtop">��ҵ�ֽ�������2007 �棩</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-6">���񱨱���</th>
              <th class="g-w-6">ҵ������������</th>
              <th class="g-w-6">ҵ������������</th>
              <th class="g-w-6">�������</th>
              <th class="g-w-6">��������</th>
              <th class="g-w-6">��������ϸ��</th>
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
					��Ŀ
				</td>
				<td>
					��ĩֵ
				</td>
			</tr>
			<tr><td>������Ʒ���ṩ�����յ����ֽ�</td><td><xsl:value-of select="EG06B/EG06BJ01"/></td></tr>
			<tr><td>�յ���˰�ѷ���</td><td><xsl:value-of select="EG06B/EG06BJ02"/></td></tr>
			<tr><td>�յ������뾭Ӫ��йص��ֽ�</td><td><xsl:value-of select="EG06B/EG06BJ03"/></td></tr>
			<tr><td>��Ӫ��ֽ�����С��</td><td><xsl:value-of select="EG06B/EG06BJ04"/></td></tr>
			<tr><td>������Ʒ����������֧�����ֽ�</td><td><xsl:value-of select="EG06B/EG06BJ05"/></td></tr>
			<tr><td>֧����ְ���Լ�Ϊְ��֧�����ֽ�</td><td><xsl:value-of select="EG06B/EG06BJ06"/></td></tr>
			<tr><td>֧���ĸ���˰��</td><td><xsl:value-of select="EG06B/EG06BJ07"/></td></tr>
			<tr><td>֧�������뾭Ӫ��йص��ֽ�</td><td><xsl:value-of select="EG06B/EG06BJ08 "/></td></tr>
			<tr><td>��Ӫ��ֽ�����С��</td><td><xsl:value-of select="EG06B/EG06BJ09"/></td></tr>
			<tr><td>��Ӫ��������ֽ���������</td><td><xsl:value-of select="EG06B/EG06BJ10"/></td></tr>
			<tr><td>�ջ�Ͷ�����յ����ֽ�</td><td><xsl:value-of select="EG06B/EG06BJ11"/></td></tr>
			<tr><td>ȡ��Ͷ���������յ����ֽ�</td><td><xsl:value-of select="EG06B/EG06BJ12"/></td></tr>
			<tr><td>���ù̶��ʲ������ʲ������������ʲ����ջص��ֽ𾻶�</td><td><xsl:value-of select="EG06B/EG06BJ13"/></td></tr>
			<tr><td>�����ӹ�˾������Ӫҵ��λ�յ����ֽ𾻶�</td><td><xsl:value-of select="EG06B/EG06BJ14"/></td></tr>
			<tr><td>�յ�������Ͷ�ʻ�йص��ֽ�</td><td><xsl:value-of select="EG06B/EG06BJ15"/></td></tr>
			<tr><td>Ͷ�ʻ�ֽ�����С��</td><td><xsl:value-of select="EG06B/EG06BJ16"/></td></tr>
			<tr><td>�����̶��ʲ������ʲ������������ʲ���֧�����ֽ�</td><td><xsl:value-of select="EG06B/EG06BJ17"/></td></tr>
			<tr><td>Ͷ����֧�����ֽ�</td><td><xsl:value-of select="EG06B/EG06BJ18"/></td></tr>
			<tr><td>ȡ���ӹ�˾������Ӫҵ��λ֧�����ֽ𾻶�</td><td><xsl:value-of select="EG06B/EG06BJ19"/></td></tr>
			<tr><td>֧��������Ͷ�ʻ�йص��ֽ�</td><td><xsl:value-of select="EG06B/EG06BJ20"/></td></tr>
			<tr><td>Ͷ�ʻ�ֽ�����С��</td><td><xsl:value-of select="EG06B/EG06BJ21"/></td></tr>
			<tr><td>Ͷ�ʻ�������ֽ���������</td><td><xsl:value-of select="EG06B/EG06BJ22"/></td></tr>
			<tr><td>����Ͷ���յ����ֽ�</td><td><xsl:value-of select="EG06B/EG06BJ23"/></td></tr>
			<tr><td>ȡ�ý���յ����ֽ�</td><td><xsl:value-of select="EG06B/EG06BJ24"/></td></tr>
			<tr><td>�յ���������ʻ�йص��ֽ�</td><td><xsl:value-of select="EG06B/EG06BJ25"/></td></tr>
			<tr><td>���ʻ�ֽ�����С��</td><td><xsl:value-of select="EG06B/EG06BJ26"/></td></tr>
			<tr><td>����ծ����֧�����ֽ�</td><td><xsl:value-of select="EG06B/EG06BJ27"/></td></tr>
			<tr><td>�������������򳥸���Ϣ��֧�����ֽ�</td><td><xsl:value-of select="EG06B/EG06BJ28"/></td></tr>
			<tr><td>֧����������ʻ�йص��ֽ�</td><td><xsl:value-of select="EG06B/EG06BJ29"/></td></tr>
			<tr><td>���ʻ�ֽ�����С��</td><td><xsl:value-of select="EG06B/EG06BJ30"/></td></tr>
			<tr><td>�Ｏ��������ֽ���������</td><td><xsl:value-of select="EG06B/EG06BJ31"/></td></tr>
			<tr><td>���ʱ䶯���ֽ��ֽ�ȼ����Ӱ��</td><td><xsl:value-of select="EG06B/EG06BJ32 "/></td></tr>
			<tr><td>�ֽ��ֽ�ȼ��ﾻ���Ӷ�</td><td><xsl:value-of select="EG06B/EG06BJ33"/></td></tr>
			<tr><td>�ڳ��ֽ��ֽ�ȼ������</td><td><xsl:value-of select="EG06B/EG06BJ34"/></td></tr>
			<tr><td>��ĩ�ֽ��ֽ�ȼ������</td><td><xsl:value-of select="EG06B/EG06BJ35"/></td></tr>
			<tr><td>������</td><td><xsl:value-of select="EG06B/EG06BJ36"/></td></tr>
			<tr><td>�ʲ���ֵ׼��</td><td><xsl:value-of select="EG06B/EG06BJ37"/></td></tr>
			<tr><td>�̶��ʲ��۾ɡ������ʲ��ۺġ������������ʲ��۾�</td><td><xsl:value-of select="EG06B/EG06BJ38"/></td></tr>
			<tr><td>�����ʲ�̯��</td><td><xsl:value-of select="EG06B/EG06BJ39"/></td></tr>
			<tr><td>���ڴ�̯����̯��</td><td><xsl:value-of select="EG06B/EG06BJ40"/></td></tr>
			<tr><td>��̯���ü���</td><td><xsl:value-of select="EG06B/EG06BJ41"/></td></tr>
			<tr><td>Ԥ���������</td><td><xsl:value-of select="EG06B/EG06BJ42"/></td></tr>
			<tr><td>���ù̶��ʲ������ʲ������������ʲ�����ʧ</td><td><xsl:value-of select="EG06B/EG06BJ43"/></td></tr>
			<tr><td>�̶��ʲ�������ʧ</td><td><xsl:value-of select="EG06B/EG06BJ44"/></td></tr>
			<tr><td>���ʼ�ֵ�䶯��ʧ</td><td><xsl:value-of select="EG06B/EG06BJ45"/></td></tr>
			<tr><td>�������</td><td><xsl:value-of select="EG06B/EG06BJ46"/></td></tr>
			<tr><td>Ͷ����ʧ</td><td><xsl:value-of select="EG06B/EG06BJ47"/></td></tr>
			<tr><td>��������˰�ʲ�����</td><td><xsl:value-of select="EG06B/EG06BJ48"/></td></tr>
			<tr><td>��������˰��ծ����</td><td><xsl:value-of select="EG06B/EG06BJ49"/></td></tr>
			<tr><td>����ļ���</td><td><xsl:value-of select="EG06B/EG06BJ50"/></td></tr>
			<tr><td>��Ӫ��Ӧ����Ŀ�ļ���</td><td><xsl:value-of select="EG06B/EG06BJ51"/></td></tr>
			<tr><td>��Ӫ��Ӧ����Ŀ������</td><td><xsl:value-of select="EG06B/EG06BJ52"/></td></tr>
			<tr><td>�����������Ϊ��Ӫ��ֽ�������Ŀ�£�����</td><td><xsl:value-of select="EG06B/EG06BJ53"/></td></tr>
			<tr><td>��Ӫ��������ֽ���������</td><td><xsl:value-of select="EG06B/EG06BJ54"/></td></tr>
			<tr><td>ծ��תΪ�ʱ�</td><td><xsl:value-of select="EG06B/EG06BJ55"/></td></tr>
			<tr><td>һ���ڵ��ڵĿ�ת����˾ծȯ</td><td><xsl:value-of select="EG06B/EG06BJ56"/></td></tr>
			<tr><td>��������̶��ʲ�</td><td><xsl:value-of select="EG06B/EG06BJ57"/></td></tr>
			<tr><td>�ֽ����ĩ���</td><td><xsl:value-of select="EG06B/EG06BJ58"/></td></tr>
			<tr><td>�ֽ���ڳ����</td><td><xsl:value-of select="EG06B/EG06BJ59"/></td></tr>
			<tr><td>�ֽ�ȼ������ĩ���</td><td><xsl:value-of select="EG06B/EG06BJ60"/></td></tr>
			<tr><td>�ֽ�ȼ�����ڳ����</td><td><xsl:value-of select="EG06B/EG06BJ61"/></td></tr>
			<tr><td>�ֽ��ֽ�ȼ��ﾻ���Ӷ�</td><td><xsl:value-of select="EG06B/EG06BJ62 "/></td></tr>
			<tr><td>�����漰�ֽ���֧��Ͷ�ʺͳ��ʻ��Ŀ�£�����</td><td><xsl:value-of select="EG06B/EG06BJ63 "/></td></tr>
			</tbody>
		</table>
		<br/>
		</xsl:for-each>
		<!-- ��ҵ��λ�ʲ���ծ��(1997 ��) -->
		<xsl:for-each select="EGA/EG07">
       <div class="t2 f-mgtop">��ҵ��λ�ʲ���ծ��(1997 ��)</div>
        <table class="g-tab-bor f-tab-nomargin">
          <tbody>
            <tr>
              <th class="g-w-6">���񱨱���</th>
              <th class="g-w-6">ҵ������������</th>
              <th class="g-w-6">ҵ������������</th>
              <th class="g-w-6">�������</th>
              <th class="g-w-6">��������</th>
              <th class="g-w-6">��������ϸ��</th>
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
					��Ŀ
				</td>
				<td>
					��ĩֵ
				</td>
			</tr>
			<tr><td>�ֽ�</td><td><xsl:value-of select="EG07B/EG07BJ01"/></td></tr>
			<tr><td>���д��</td><td><xsl:value-of select="EG07B/EG07BJ02"/></td></tr>
			<tr><td>Ӧ��Ʊ��</td><td><xsl:value-of select="EG07B/EG07BJ03"/></td></tr>
			<tr><td>Ӧ���˿�</td><td><xsl:value-of select="EG07B/EG07BJ04"/></td></tr>
			<tr><td>Ԥ���˿�</td><td><xsl:value-of select="EG07B/EG07BJ05"/></td></tr>
			<tr><td>����Ӧ�տ�</td><td><xsl:value-of select="EG07B/EG07BJ06"/></td></tr>
			<tr><td>����</td><td><xsl:value-of select="EG07B/EG07BJ07"/></td></tr>
			<tr><td>����Ʒ</td><td><xsl:value-of select="EG07B/EG07BJ08"/></td></tr>
			<tr><td>����Ͷ��</td><td><xsl:value-of select="EG07B/EG07BJ09"/></td></tr>
			<tr><td>�̶��ʲ�</td><td><xsl:value-of select="EG07B/EG07BJ10"/></td></tr>
			<tr><td>�����ʲ�</td><td><xsl:value-of select="EG07B/EG07BJ11"/></td></tr>
			<tr><td>�ʲ��ϼ�</td><td><xsl:value-of select="EG07B/EG07BJ12"/></td></tr>
			<tr><td>��������</td><td><xsl:value-of select="EG07B/EG07BJ13"/></td></tr>
			<tr><td>����ר��</td><td><xsl:value-of select="EG07B/EG07BJ14"/></td></tr>
			<tr><td>ר��֧��</td><td><xsl:value-of select="EG07B/EG07BJ15"/></td></tr>
			<tr><td>��ҵ֧��</td><td><xsl:value-of select="EG07B/EG07BJ16"/></td></tr>
			<tr><td>��Ӫ֧��</td><td><xsl:value-of select="EG07B/EG07BJ17 "/></td></tr>
			<tr><td>�ɱ�����</td><td><xsl:value-of select="EG07B/EG07BJ18"/></td></tr>
			<tr><td>����˰��</td><td><xsl:value-of select="EG07B/EG07BJ19"/></td></tr>
			<tr><td>�Ͻ��ϼ�֧��</td><td><xsl:value-of select="EG07B/EG07BJ20"/></td></tr>
			<tr><td>�Ը�����λ����</td><td><xsl:value-of select="EG07B/EG07BJ21"/></td></tr>
			<tr><td>��ת�Գ����</td><td><xsl:value-of select="EG07B/EG07BJ22"/></td></tr>
			<tr><td>֧���ϼ�</td><td><xsl:value-of select="EG07B/EG07BJ23"/></td></tr>
			<tr><td>�ʲ������ܼ�</td><td><xsl:value-of select="EG07B/EG07BJ24"/></td></tr>
			<tr><td>��ǿ���</td><td><xsl:value-of select="EG07B/EG07BJ25"/></td></tr>
			<tr><td>Ӧ��Ʊ��</td><td><xsl:value-of select="EG07B/EG07BJ26"/></td></tr>
			<tr><td>Ӧ���˿�</td><td><xsl:value-of select="EG07B/EG07BJ27"/></td></tr>
			<tr><td>Ԥ���˿�</td><td><xsl:value-of select="EG07B/EG07BJ28"/></td></tr>
			<tr><td>����Ӧ����</td><td><xsl:value-of select="EG07B/EG07BJ29"/></td></tr>
			<tr><td>Ӧ��Ԥ���</td><td><xsl:value-of select="EG07B/EG07BJ30"/></td></tr>
			<tr><td>Ӧ�ɲ���ר����</td><td><xsl:value-of select="EG07B/EG07BJ31"/></td></tr>
			<tr><td>Ӧ��˰��</td><td><xsl:value-of select="EG07B/EG07BJ32"/></td></tr>
			<tr><td>��ծ�ϼ�</td><td><xsl:value-of select="EG07B/EG07BJ33"/></td></tr>
			<tr><td>��ҵ����</td><td><xsl:value-of select="EG07B/EG07BJ34"/></td></tr>
			<tr><td>һ�����</td><td><xsl:value-of select="EG07B/EG07BJ35"/></td></tr>
			<tr><td>Ͷ�ʻ���</td><td><xsl:value-of select="EG07B/EG07BJ36"/></td></tr>
			<tr><td>�̶�����</td><td><xsl:value-of select="EG07B/EG07BJ37"/></td></tr>
			<tr><td>ר�û���</td><td><xsl:value-of select="EG07B/EG07BJ38"/></td></tr>
			<tr><td>��ҵ����</td><td><xsl:value-of select="EG07B/EG07BJ39"/></td></tr>
			<tr><td>��Ӫ����</td><td><xsl:value-of select="EG07B/EG07BJ40"/></td></tr>
			<tr><td>���ʲ��ϼ�</td><td><xsl:value-of select="EG07B/EG07BJ41"/></td></tr>
			<tr><td>������������</td><td><xsl:value-of select="EG07B/EG07BJ42"/></td></tr>
			<tr><td>�ϼ���������</td><td><xsl:value-of select="EG07B/EG07BJ43"/></td></tr>
			<tr><td>����ר��</td><td><xsl:value-of select="EG07B/EG07BJ44"/></td></tr>
			<tr><td>��ҵ����</td><td><xsl:value-of select="EG07B/EG07BJ45"/></td></tr>
			<tr><td>��Ӫ����</td><td><xsl:value-of select="EG07B/EG07BJ46"/></td></tr>
			<tr><td>������λ�ɿ�</td><td><xsl:value-of select="EG07B/EG07BJ47"/></td></tr>
			<tr><td>��������</td><td><xsl:value-of select="EG07B/EG07BJ48"/></td></tr>
			<tr><td>����ϼ�</td><td><xsl:value-of select="EG07B/EG07BJ49"/></td></tr>
			<tr><td>��ծ�����ܼ�</td><td><xsl:value-of select="EG07B/EG07BJ50 "/></td></tr>
			</tbody>
		</table>
		<br/>
		</xsl:for-each>
		<!-- ��ҵ��λ�ʲ���ծ��(2013 ��) -->
		<xsl:for-each select="EGA/EG08">
       <div class="t2 f-mgtop">��ҵ��λ�ʲ���ծ��(2013 ��)</div>
        <table class="g-tab-bor">
          <tbody>
            <tr>
              <th class="g-w-8">���񱨱���</th>
              <th class="g-w-8">ҵ������������</th>
              <th class="g-w-8">ҵ������������</th>
              <th class="g-w-8">�������</th>
              <th class="g-w-8">��������</th>
              <th class="g-w-8">��������ϸ��</th>
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
          <!--�����ϱ߿�-->
          <tbody>
			<tr>
				<th>
					��Ŀ
				</th>
				<th>
					��ĩֵ
				</th>
				<th>
					��Ŀ
				</th>
				<th>
					��ĩֵ
				</th>
			</tr>
			<tr><td>�����ʽ�</td><td><xsl:value-of select="EG08B/EG08BJ01"/></td><td>���ڽ��</td><td><xsl:value-of select="EG08B/EG08BJ22"/></td></tr>
			<tr><td>����Ͷ��</td><td><xsl:value-of select="EG08B/EG08BJ02"/></td><td>Ӧ��˰��</td><td><xsl:value-of select="EG08B/EG08BJ23"/></td></tr>
			<tr><td>����Ӧ�������</td><td><xsl:value-of select="EG08B/EG08BJ03"/></td><td>Ӧ�ɹ����</td><td><xsl:value-of select="EG08B/EG08BJ24"/></td></tr>
			<tr><td>Ӧ��Ʊ��</td><td><xsl:value-of select="EG08B/EG08BJ04"/></td><td>Ӧ�ɲ���ר����</td><td><xsl:value-of select="EG08B/EG08BJ25"/></td></tr>
			<tr><td>Ӧ���˿�</td><td><xsl:value-of select="EG08B/EG08BJ05"/></td><td>Ӧ��ְ��н��</td><td><xsl:value-of select="EG08B/EG08BJ26"/></td></tr>
			<tr><td>Ԥ���˿�</td><td><xsl:value-of select="EG08B/EG08BJ06"/></td><td>Ӧ��Ʊ��</td><td><xsl:value-of select="EG08B/EG08BJ27"/></td></tr>
			<tr><td>����Ӧ�տ�</td><td><xsl:value-of select="EG08B/EG08BJ07"/></td><td>Ӧ���˿�</td><td><xsl:value-of select="EG08B/EG08BJ28"/></td></tr>
			<tr><td>���</td><td><xsl:value-of select="EG08B/EG08BJ08"/></td><td>Ԥ���˿�</td><td><xsl:value-of select="EG08B/EG08BJ29"/></td></tr>
			<tr><td>���������ʲ�</td><td><xsl:value-of select="EG08B/EG08BJ09"/></td><td>����Ӧ����</td><td><xsl:value-of select="EG08B/EG08BJ30"/></td></tr>
			<tr><td>�����ʲ��ϼ�</td><td><xsl:value-of select="EG08B/EG08BJ10"/></td><td>����������ծ</td><td><xsl:value-of select="EG08B/EG08BJ31"/></td></tr>
			<tr><td>����Ͷ��</td><td><xsl:value-of select="EG08B/EG08BJ11"/></td><td>������ծ�ϼ�</td><td><xsl:value-of select="EG08B/EG08BJ32"/></td></tr>
			<tr><td>�̶��ʲ�</td><td><xsl:value-of select="EG08B/EG08BJ12"/></td><td>���ڽ��</td><td><xsl:value-of select="EG08B/EG08BJ33"/></td></tr>
			<tr><td>�̶��ʲ�ԭ��</td><td><xsl:value-of select="EG08B/EG08BJ13"/></td><td>����Ӧ����</td><td><xsl:value-of select="EG08B/EG08BJ34"/></td></tr>
			<tr><td>�ۼ��۾�</td><td><xsl:value-of select="EG08B/EG08BJ14"/></td><td>��������ծ�ϼ�</td><td><xsl:value-of select="EG08B/EG08BJ35"/></td></tr>
			<tr><td>�ڽ�����</td><td><xsl:value-of select="EG08B/EG08BJ15"/></td><td>��ծ�ϼ�</td><td><xsl:value-of select="EG08B/EG08BJ36"/></td></tr>
			<tr><td>�����ʲ�</td><td><xsl:value-of select="EG08B/EG08BJ16"/></td><td>��ҵ����</td><td><xsl:value-of select="EG08B/EG08BJ37"/></td></tr>
			<tr><td>�����ʲ�ԭ��</td><td><xsl:value-of select="EG08B/EG08BJ17"/></td><td>�������ʲ�����</td><td><xsl:value-of select="EG08B/EG08BJ38"/></td></tr>
			<tr><td>�ۼ�̯��</td><td><xsl:value-of select="EG08B/EG08BJ18"/></td><td>ר�û���</td><td><xsl:value-of select="EG08B/EG08BJ39"/></td></tr>
			<tr><td>�������ʲ�����</td><td><xsl:value-of select="EG08B/EG08BJ19"/></td><td>����������ת</td><td><xsl:value-of select="EG08B/EG08BJ40"/></td></tr>
			<tr><td>�������ʲ��ϼ�</td><td><xsl:value-of select="EG08B/EG08BJ20 "/></td><td>������������</td><td><xsl:value-of select="EG08B/EG08BJ41"/></td></tr>
			<tr><td>�ʲ��ܼ�</td><td><xsl:value-of select="EG08B/EG08BJ21"/></td><td>�ǲ���������ת</td><td><xsl:value-of select="EG08B/EG08BJ42"/></td></tr>
			<tr><td></td><td></td><td>�ǲ�����������</td><td><xsl:value-of select="EG08B/EG08BJ43"/></td></tr>
			<tr><td></td><td></td><td>��ҵ����</td><td><xsl:value-of select="EG08B/EG08BJ44"/></td></tr>
			<tr><td></td><td></td><td>��Ӫ����</td><td><xsl:value-of select="EG08B/EG08BJ45"/></td></tr>
			<tr><td></td><td></td><td>���ʲ��ϼ�</td><td><xsl:value-of select="EG08B/EG08BJ46"/></td></tr>
			<tr><td></td><td></td><td>��ծ�;��ʲ��ܼ�</td><td><xsl:value-of select="EG08B/EG08BJ47 "/></td></tr>
			<tr><td></td><td></td><td>δ��������</td><td><xsl:value-of select="EG08B/EG02BJ58"/></td></tr>
			<tr><td></td><td></td><td>������Ȩ��ϼ�</td><td><xsl:value-of select="EG08B/EG02BJ59"/></td></tr>
			<tr><td></td><td></td><td>��ծ��������Ȩ��ϼ�</td><td><xsl:value-of select="EG08B/EG02BJ60"/></td></tr>
			</tbody>
		</table>
		<br/>
		</xsl:for-each>
		<!-- ��ҵ��λ����֧����1997 �棩 -->
		<xsl:for-each select="EGA/EG09">
       <div class="t2 f-mgtop">��ҵ��λ����֧����1997 �棩</div>
        <table class="g-tab-bor">
			<tr>
				<td>
					���񱨱���
				</td>
				<td>
					ҵ������������
				</td>
				<td>
					ҵ������������
				</td>
				<td>
					�������
				</td>
				<td>
					��������
				</td>
				<td>
					��������ϸ��
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
					��Ŀ
				</td>
				<td>
					��ĩֵ
				</td>
			</tr>
			<tr><td>������������</td><td><xsl:value-of select="EG09B/EG09BJ01"/></td></tr>
			<tr><td>�ϼ���������</td><td><xsl:value-of select="EG09B/EG09BJ02"/></td></tr>
			<tr><td>������λ�ɿ�</td><td><xsl:value-of select="EG09B/EG09BJ03"/></td></tr>
			<tr><td>��ҵ����</td><td><xsl:value-of select="EG09B/EG09BJ04"/></td></tr>
			<tr><td>Ԥ�����ʽ�����</td><td><xsl:value-of select="EG09B/EG09BJ05"/></td></tr>
			<tr><td>��������</td><td><xsl:value-of select="EG09B/EG09BJ06"/></td></tr>
			<tr><td>��ҵ����С��</td><td><xsl:value-of select="EG09B/EG09BJ07"/></td></tr>
			<tr><td>��Ӫ����</td><td><xsl:value-of select="EG09B/EG09BJ08"/></td></tr>
			<tr><td>��Ӫ����С��</td><td><xsl:value-of select="EG09B/EG09BJ09"/></td></tr>
			<tr><td>����ר��</td><td><xsl:value-of select="EG09B/EG09BJ10"/></td></tr>
			<tr><td>����ר��С��</td><td><xsl:value-of select="EG09B/EG09BJ11"/></td></tr>
			<tr><td>�����ܼ�</td><td><xsl:value-of select="EG09B/EG09BJ12"/></td></tr>
			<tr><td>��������</td><td><xsl:value-of select="EG09B/EG09BJ13"/></td></tr>
			<tr><td>�Ͻ��ϼ�֧��</td><td><xsl:value-of select="EG09B/EG09BJ14"/></td></tr>
			<tr><td>�Ը�����λ����</td><td><xsl:value-of select="EG09B/EG09BJ15"/></td></tr>
			<tr><td>��ҵ֧��</td><td><xsl:value-of select="EG09B/EG09BJ16"/></td></tr>
			<tr><td>��������֧��</td><td><xsl:value-of select="EG09B/EG09BJ17"/></td></tr>
			<tr><td>Ԥ�����ʽ�֧��</td><td><xsl:value-of select="EG09B/EG09BJ18"/></td></tr>
			<tr><td>����˰��</td><td><xsl:value-of select="EG09B/EG09BJ19"/></td></tr>
			<tr><td>��ת�Գ����</td><td><xsl:value-of select="EG09B/EG09BJ20 "/></td></tr>
			<tr><td>��ҵ֧��С��</td><td><xsl:value-of select="EG09B/EG09BJ21"/></td></tr>
			<tr><td>��Ӫ֧��</td><td><xsl:value-of select="EG09B/EG09BJ22"/></td></tr>
			<tr><td>����˰��</td><td><xsl:value-of select="EG09B/EG09BJ23"/></td></tr>
			<tr><td>��Ӫ֧��С��</td><td><xsl:value-of select="EG09B/EG09BJ24"/></td></tr>
			<tr><td>����ר��</td><td><xsl:value-of select="EG09B/EG09BJ25"/></td></tr>
			<tr><td>ר��֧��</td><td><xsl:value-of select="EG09B/EG09BJ26"/></td></tr>
			<tr><td>ר��С��</td><td><xsl:value-of select="EG09B/EG09BJ27"/></td></tr>
			<tr><td>֧���ܼ�</td><td><xsl:value-of select="EG09B/EG09BJ28"/></td></tr>
			<tr><td>��ҵ����</td><td><xsl:value-of select="EG09B/EG09BJ29"/></td></tr>
			<tr><td>�����������</td><td><xsl:value-of select="EG09B/EG09BJ30"/></td></tr>
			<tr><td>�ջ���ǰ�����ҵ֧��</td><td><xsl:value-of select="EG09B/EG09BJ31"/></td></tr>
			<tr><td>��Ӫ����</td><td><xsl:value-of select="EG09B/EG09BJ32"/></td></tr>
			<tr><td>��ǰ��Ⱦ�Ӫ����</td><td><xsl:value-of select="EG09B/EG09BJ33"/></td></tr>
			<tr><td>�������</td><td><xsl:value-of select="EG09B/EG09BJ34"/></td></tr>
			<tr><td>Ӧ������˰</td><td><xsl:value-of select="EG09B/EG09BJ35"/></td></tr>
			<tr><td>��ȡר�û���</td><td><xsl:value-of select="EG09B/EG09BJ36"/></td></tr>
			<tr><td>ת����ҵ����</td><td><xsl:value-of select="EG09B/EG09BJ37"/></td></tr>
			<tr><td>�����������</td><td><xsl:value-of select="EG09B/EG09BJ38"/></td></tr>
		</table>
		<br/>
		</xsl:for-each>
		<!-- ��ҵ��λ����֧����2013 �棩 -->
		<xsl:for-each select="EGA/EG10">
       <div class="t2 f-mgtop">��ҵ��λ����֧����2013 �棩</div>
        <table class="g-tab-bor">
			<tr>
				<td>
					���񱨱���
				</td>
				<td>
					ҵ������������
				</td>
				<td>
					ҵ������������
				</td>
				<td>
					�������
				</td>
				<td>
					��������
				</td>
				<td>
					��������ϸ��
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
					��Ŀ
				</td>
				<td>
					��ĩֵ
				</td>
			</tr>
			<tr><td>���ڲ���������ת����</td><td><xsl:value-of select="EG10B/EG10BJ01"/></td></tr>
			<tr><td>������������</td><td><xsl:value-of select="EG10B/EG10BJ02"/></td></tr>
			<tr><td>��ҵ֧������������֧����</td><td><xsl:value-of select="EG10B/EG10BJ03"/></td></tr>
			<tr><td>������ҵ��ת����</td><td><xsl:value-of select="EG10B/EG10BJ04"/></td></tr>
			<tr><td>��ҵ������</td><td><xsl:value-of select="EG10B/EG10BJ05"/></td></tr>
			<tr><td>��ҵ����</td><td><xsl:value-of select="EG10B/EG10BJ06"/></td></tr>
			<tr><td>�ϼ���������</td><td><xsl:value-of select="EG10B/EG10BJ07"/></td></tr>
			<tr><td>������λ�Ͻ�����</td><td><xsl:value-of select="EG10B/EG10BJ08"/></td></tr>
			<tr><td>��������</td><td><xsl:value-of select="EG10B/EG10BJ09"/></td></tr>
			<tr><td>�����������Ŀ�£���������</td><td><xsl:value-of select="EG10B/EG10BJ10"/></td></tr>
			<tr><td>��ҵ��֧��</td><td><xsl:value-of select="EG10B/EG10BJ11"/></td></tr>
			<tr><td>��ҵ֧�����ǲ�������֧����</td><td><xsl:value-of select="EG10B/EG10BJ12"/></td></tr>
			<tr><td>�Ͻ��ϼ�֧��</td><td><xsl:value-of select="EG10B/EG10BJ13"/></td></tr>
			<tr><td>�Ը�����λ����֧��</td><td><xsl:value-of select="EG10B/EG10BJ14"/></td></tr>
			<tr><td>����֧��</td><td><xsl:value-of select="EG10B/EG10BJ15"/></td></tr>
			<tr><td>���ھ�Ӫ����</td><td><xsl:value-of select="EG10B/EG10BJ16"/></td></tr>
			<tr><td>��Ӫ����</td><td><xsl:value-of select="EG10B/EG10BJ17"/></td></tr>
			<tr><td>��Ӫ֧��</td><td><xsl:value-of select="EG10B/EG10BJ18"/></td></tr>
			<tr><td>�ֲ���ǰ��ȿ����ľ�Ӫ����</td><td><xsl:value-of select="EG10B/EG10BJ19"/></td></tr>
			<tr><td>����ǲ���������ת����</td><td><xsl:value-of select="EG10B/EG10BJ20"/></td></tr>
			<tr><td>�ǲ���������ת</td><td><xsl:value-of select="EG10B/EG10BJ21"/></td></tr>
			<tr><td>����ǲ�����������</td><td><xsl:value-of select="EG10B/EG10BJ22"/></td></tr>
			<tr><td>Ӧ����ҵ����˰</td><td><xsl:value-of select="EG10B/EG10BJ23"/></td></tr>
			<tr><td>��ȡר�û���</td><td><xsl:value-of select="EG10B/EG10BJ24"/></td></tr>
			<tr><td>ת����ҵ����</td><td><xsl:value-of select="EG10B/EG10BJ25"/></td></tr>
		</table>
		<br/>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
