<?xml version="1.0" encoding="GB2312"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
	<xsl:output method="html" version="1.0" encoding="GB2312"/>  
	<xsl:template match="/Document">
		<html oncontextmenu="return false" onselectstart="return false">
			<head>
				<title>��ҵ���ñ���</title>				
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
				<noscript><iframe src="*.htm"></iframe></noscript>
			</body>
		</html>
	</xsl:template>
<!-- ����˵�� -->
	<xsl:template match="EAA">
		<table bgcolor="" width="80%" align='center' border="0" cellspacing="0" cellpadding="2">
			<tr>
				<td height='4' colspan="4">
					<div align="center" class="style2">
						<font style="font-size: 18.0pt;font-weight:bold">����˵��</font>
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
					<font style="font-size: 12.0pt">���������й����������������ĳ��ߣ����ݽ�ֹ����ʱ������ϵͳ��¼����Ϣ���ɡ����������ı�ע�⣬��Ϣ������������ṩ��������Ϣ�����ṩ���������Ĳ���֤����ʵ�Ժ�׼ȷ�ԣ�����ŵ����Ϣ���ܡ��ӹ������ϵ�ȫ�����б��ֿ͹ۡ������ĵ�λ��</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					2.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">��������չʾ�Ļ�����Ϣ��������ϵͳ�Բ�ͬ������Դ�ṩ��ͬһ����Ϣ���������Ϣ�������Ϻ�Ľ����</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					3.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">���������Ŵ����װ���������׺͵������ס�</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					4.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">�������н�����װ���������ʽ�Ĵ��Ҳ�����Ը��������������ʵ�ʵ�����ǽ������Ϊ�������ʷ�������ȷ�������εĽ��ס������Ĳ�Ʒ������������ó�����ʡ�Ʊ�����֡�����͸֧���������ޡ��ع������ƽ�֤ȯ�������˾����ծ�ȡ�</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					5.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">�������е�������ָ�����˺�ծȨ��Լ������ծ���˲�����ծ��ʱ�������˰�Լ������ծ�����Ϊ������������û�е�����ͬԼ������ծ����ΥԼʱ��������ʵ����Ҫ��������Ϊ�������Ĳ�Ʒ������������гжһ�Ʊ������֤�����б��������ʵ�����˾�ṩ�ĵ������񣬱��չ�˾�ṩ�����ñ�֤���շ���</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					6.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">�������б�׷��ҵ����ָʣ�౾Ϣ���ڴ���״̬����ծȨ��Ҫ��ծ���˾���黹ȫ�����Ľ�����ס������Ĳ�Ʒ������������ʲ�����˾���õ�ծ�񡢵���������������</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					7.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">�������еĶ��ڽ��г��ڽ����ָ��������г���׷��ҵ��ѭ��͸֧������֮���ҵ�񣬰��ա�������޷��ࡱ���֣��ֱ��Ӧ���еĶ��ڡ����ںͳ��ڡ�</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					8.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">�������н�����׵���������ָ����׷��ҵ��֮�⣬�弶����Ϊ�������������弶����Ϊ��δ���ࡱ����������Ϊ0��ҵ�񣻹�ע����ָ����׷��ҵ��֮�⣬�弶����Ϊ����ע�������弶����Ϊ��δ���ࡱ������0��90���ҵ�񣻲�������ָ����׷��ҵ��֮�⣬�弶����Ϊ���μ����������ɡ�������ʧ������ΥԼ�������弶����Ϊ��δ���ࡱ������90�����ϵ�ҵ��</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					9.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">�������е������׵������ࡢ��ע�ࡢ������ֱ��Ӧ�弶����Ϊ��������ע�ͺ������ҵ��</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					10.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">����������Ϣ��Ҫ�����еĸ�ծ��ʷ��Ϣ�����и�ծ��ָ���Ŵ�������������ծ�������ܶ���ڱ�����ָ����׷��ҵ��֮��Ľ�����׵������ܶ��ǷϢ���ϼƼ����ڱ���ϼơ�</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					11.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">�������չʾһ�����޷�Χ�ڵ��ѽ����Ŵ���Ϣ�����Ŵ���Ϣ��������Ϣ��</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					12.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">�����ر�˵�����������еĽ���������λ��Ϊ��Ԫ��</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					13.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">�����ر�˵�����������еĽ��������������Ϊ����ҼƼۡ����������ҵļ������ݹ���������ֵ��¹����ĸ��ֻ��Ҷ���Ԫ�����ʱ�</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					14.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">����Ϣ��¼б��չʾ����˵����Ϣ����Դ�����¼�������顣</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					15.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">�����ṩ����˵���Ǳ��������Ա����е���Ϣ��¼�����Ϣ���������Ĳ���˵����</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					16.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">��������˵�����������ĶԱ����е���Ϣ��¼�����Ϣ����������˵����</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					17.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">��Ϣ������������Ϣ����Ա��������ṩ����Ϣ��¼�����ļ�Ҫ˵����</font>
				</td>
			</tr>
			<tr style="line-height:30px">
				<td valign="top">
					18.
				</td>
				<td colspan="3" valign="top" height='30px'>
					<font style="font-size: 12.0pt">������������ڻ�����������Ϣ�����Լ��ʹ�ã������Ʊ��ܡ���ʹ�ò�����������׵ģ��������Ĳ��е�������Ρ�</font>
				</td>
			</tr>
			<tr>
				<td colspan="4" height='10'>&#160;</td>
			</tr>
			<tr style="line-height:30px">
				<td colspan="4" valign="top" height='30px'>
					<font style="font-size: 12.0pt">���ʣ���Ԫ������ң���<xsl:value-of select="EA01/EA01E/EA01EQ01"/>&#160;&#160;��Ч�ڣ�<xsl:value-of select="EA01/EA01E/EA01ER01"/></font>
				</td>
			</tr>
		</table>
	</xsl:template>
<!-- ����ͷ��Ϣģ�� -->
	<xsl:template match="EAA/EA01">
		<table bgcolor="" width="80%" align='center' border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td colspan="2" align="center">
					<font style="font-size: 32.0pt;font-weight:bold;">��ҵ���ñ���</font>
					<br/><br/>
					<font style="font-size: 16.0pt;font-weight:bold;">(���Ż�����)</font>
					<br/><br/><br/>
				</td>
			</tr>
			
		</table>
		<br/><br/>
		
		<!-- ����ͷ -->
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td width="30%" height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������</font>
				</td>
				<td width="70%">
					<font style="font-size: 12.0pt"><xsl:value-of select="EA01A/EA01AI01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td width="30%" height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td width="70%">
					<font style="font-size: 12.0pt"><xsl:value-of select="EA01A/EA01AR01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td width="30%" height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ѯ����</font>
				</td>
				<td width="70%">
					<font style="font-size: 12.0pt"><xsl:value-of select="EA01B/EA01BI01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td width="30%" height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ѯԭ��</font>
				</td>
				<td width="70%">
					<font style="font-size: 12.0pt"><span name="2004"><xsl:value-of select="EA01B/EA01BD02"/></span></font>
				</td>
			</tr>
		</table>
		
		<!--  -->
		<div align="center">
			<font style="font-size: 22.0pt;font-weight:bold;">��ݱ�ʶ</font>
		</div>
		<br/><br/>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td width="30%" height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ҵ����</font>
				</td>
				<td width="70%">
					<font style="font-size: 12.0pt"><xsl:value-of select="EA01C/EA01CQ01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td width="30%" height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ҵ��ݱ�ʶ����</font>
				</td>
				<td width="70%">
					<font style="font-size: 12.0pt"><xsl:value-of select="EA01C/EA01CS01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td width="30%" height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ҵ��ݱ�ʶ����</font>
				</td>
				<td width="70%">
					<font style="font-size: 12.0pt"><span name="2002"><xsl:value-of select="EA01C/EA01CH/EA01CD01"/></span></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td width="30%" height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ҵ��ݱ�ʶ����</font>
				</td>
				<td width="70%">
					<font style="font-size: 12.0pt"><xsl:value-of select="EA01C/EA01CH/EA01CI01"/></font>
				</td>
			</tr>
		</table>
		<br/><br/>
		<xsl:if test="EA01D/EA01DS01 != 0">
			<div align="center">
				<font style="font-size: 22.0pt;font-weight:bold;">������ʾ</font>
			</div>
			<br/>
			<br/>
			<table width="80%" align='center'>
				<tr>
					<td align="left">
						<font style="font-size: 13.0pt;">��Ϣ��������ñ������������ <xsl:value-of select="EA01D/EA01DS01"/> �����������ڴ����У������ʱע���Ķ�������ݡ�</font>						
					</td>
				</tr>
			</table>
			<br/>
		</xsl:if>
	</xsl:template>	
<!-- ��ҵ������Ϣ -->
	<xsl:template match="ECA">
		<br/>
		<div align="center">
			<font style="font-size: 22.0pt;font-weight:bold;">������Ϣ</font>
		</div>
		<br/><br/>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left" >
					<font style="font-size: 14.0pt;font-weight:bold;">�����ſ���Ϣ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name=""><xsl:value-of select="EC01/EC010D01"/></span></font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��֯��������</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name=""><xsl:value-of select="EC01/EC010D02"/></span></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ҵ��ģ</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name="2005"><xsl:value-of select="EC01/EC010D03"/></span></font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ҵ</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<span name=""><xsl:value-of select="EC01/EC010D04"/></span></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC01/EC010R01"/></font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�Ǽ�֤����Ч��ֹ����</font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC01/EC010R02"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�Ǽǵ�ַ</font>
				</td>
				<td height="25px" align="center" colspan="3">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC01/EC010Q01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�칫/��Ӫ��ַ</font>
				</td>
				<td height="25px" align="center" colspan="3">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC01/EC010Q02"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����״̬</font>
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
					<font style="font-size: 14.0pt;font-weight:bold;">ע���ʱ�����Ҫ��������Ϣ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
		<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ע���ʱ�������Һϼ�</font>
				</td>
				<td height="25px" align="center" colspan="3">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC02/EC020J01"/> ��Ԫ</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ҫ�����˸���</font>
				</td>
				<td height="25px" align="center" colspan="3">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC02/EC020S01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" colspan="3">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC02/EC020R01"/></font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left" >
					<font style="font-size: 14.0pt;font-weight:bold;">��������Ϣ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������ݱ�ʶ����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������ݱ�ʶ����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ʱ���</font>
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
					<font style="font-size: 14.0pt;font-weight:bold;">��Ҫ�����Ա��Ϣ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
		<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ҫ��Ա����</font>
				</td>
				<td height="25px" align="center" colspan="3">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC03/EC030S01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">֤������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">֤������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ְλ</font>
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
					<font style="font-size: 14.0pt;font-weight:bold;">�ϼ�������Ϣ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ϼ���������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ϼ���������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ϼ�������ݱ�ʶ����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ϼ�������ݱ�ʶ����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
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
					<font style="font-size: 14.0pt;font-weight:bold;">ʵ�ʿ�������Ϣ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ʵ�ʿ����˸���</font>
				</td>
				<td height="25px" align="center" colspan="3">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EC05/EC050S01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">ʵ�ʿ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ʵ�ʿ���������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ʵ�ʿ�������ݱ�ʶ����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ʵ�ʿ�������ݱ�ʶ����</font>
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
<!-- ��Ϣ��Ҫ -->
	<!-- ������ʾ��Ϣ -->
	<xsl:template match="EBA/EB01">
		<br/>
		<div align="center">
			<font style="font-size: 22.0pt;font-weight:bold;">������ʾ��Ϣ</font>
		</div>
		<br/><br/>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left" >
					<font style="font-size: 14.0pt;font-weight:bold;">�Ŵ�������ʾ��Ϣ</font>
				</td>
			</tr>
		</table>
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�״����Ŵ����׵����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�״�����ػ������ε����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����Ŵ����׵Ļ�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ǰ��δ�����Ŵ����׵Ļ�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��׷���Ľ���������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ע�����������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ע�ൣ���������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����ൣ���������</font>
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
					<font style="font-size: 14.0pt;font-weight:bold;">���Ŵ����׼�������Ϣ��ʾ��Ϣ</font>
				</td>
			</tr>
		</table>
		<!-- ���Ŵ����� -->
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���Ŵ������˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">Ƿ˰��¼����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����о���¼����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ǿ��ִ�м�¼����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����������¼����</font>
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
		<!-- δ�����Ŵ���������Ϣ��Ҫ -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">δ�����Ŵ���������Ϣ��Ҫ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ʲ�����ҵ���˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ʲ�����ҵ�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ�δ�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ���˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������һ�λ�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����ܶ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ڱ���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������Ϣ������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����������׷��������Ŀ����</font>
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
					<font style="font-size: 14.0pt;font-weight:bold;"> δ�����������������Ϣ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">&#160;</font>
				</td>
				<td height="25px" align="center" colspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������</font>
				</td>
				<td height="25px" align="center" colspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ע��</font>
				</td>
				<td height="25px" align="center" colspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������</font>
				</td>
				<td height="25px" align="center" colspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ϼ�</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�г��ڽ��</font>
				</td>
			<xsl:for-each select="EB02/EB02A/EB02AH">
				<xsl:sort select="EB02AD02"/>
				<xsl:if test="EB02AD01 = '1' and EB02AD02 != 0"><!-- ��ȡ�ϼ� -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AS04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AJ06"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="EB02/EB02A/EB02AH">
				<xsl:if test="EB02AD01 = '1' and EB02AD02 = 0"><!-- ȡ�ϼ� -->
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
					<font style="font-size: 12.0pt;font-weight:bold;">���ڽ��</font>
				</td>
			<xsl:for-each select="EB02/EB02A/EB02AH">
				<xsl:sort select="EB02AD02"/>
				<xsl:if test="EB02AD01 = '2' and EB02AD02 != 0"><!-- ��ȡ�ϼ� -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AS04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AJ06"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="EB02/EB02A/EB02AH">
				<xsl:if test="EB02AD01 = '2' and EB02AD02 = 0"><!-- ȡ�ϼ� -->
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
					<font style="font-size: 12.0pt;font-weight:bold;">ѭ��͸֧</font>
				</td>
			<xsl:for-each select="EB02/EB02A/EB02AH">
				<xsl:sort select="EB02AD02"/>
				<xsl:if test="EB02AD01 = '3' and EB02AD02 != 0"><!-- ��ȡ�ϼ� -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AS04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AJ06"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="EB02/EB02A/EB02AH">
				<xsl:if test="EB02AD01 = '3' and EB02AD02 = 0"><!-- ȡ�ϼ� -->
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
					<font style="font-size: 12.0pt;font-weight:bold;">����</font>
				</td>
			<xsl:for-each select="EB02/EB02A/EB02AH">
				<xsl:sort select="EB02AD02"/>
				<xsl:if test="EB02AD01 = '4' and EB02AD02 != 0"><!-- ��ȡ�ϼ� -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AS04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AJ06"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="EB02/EB02A/EB02AH">
				<xsl:if test="EB02AD01 = '4' and EB02AD02 = 0"><!-- ȡ�ϼ� -->
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
					<font style="font-size: 12.0pt;font-weight:bold;">�ϼ�</font>
				</td>
			<xsl:for-each select="EB02/EB02A/EB02AH">
				<xsl:sort select="EB02AD02"/>
				<xsl:if test="EB02AD01 = '0' and EB02AD02 != 0"><!-- ��ȡ�ϼ� -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AS04"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02AJ06"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="EB02/EB02A/EB02AH">
				<xsl:if test="EB02AD01 = '0' and EB02AD02 = 0"><!-- ȡ�ϼ� -->
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
		<!-- �ѽ����Ŵ����� -->
		<!-- �ѽ����Ŵ���Ϣ��Ҫ -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">�ѽ����Ŵ���Ϣ��Ҫ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ʲ�����ҵ���˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ʲ�����ҵ����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ���˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����������׷��������Ŀ����</font>
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
					<font style="font-size: 14.0pt;font-weight:bold;">�ѽ�������������׷��������Ϣ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">&#160;</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ע���˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ϼ�</font>
				</td>
			</tr>			
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�г��ڽ��</font>
				</td>
			<xsl:for-each select="EB02/EB02B/EB02BH">
				<xsl:sort select="EB02BD01"/>
				<xsl:if test="EB02BD01 = '1' and EB02BD02 != 0"><!-- ��ȡ�ϼ� -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02BS04"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="EB02/EB02B/EB02BH">
				<xsl:if test="EB02BD01 = '1' and EB02BD02 = 0"><!-- ȡ�ϼ� -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02BS04"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ڽ��</font>
				</td>
			<xsl:for-each select="EB02/EB02B/EB02BH">
				<xsl:sort select="EB02BD01"/>
				<xsl:if test="EB02BD01 = '2' and EB02BD02 != 0"><!-- ��ȡ�ϼ� -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02BS04"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="EB02/EB02B/EB02BH">
				<xsl:if test="EB02BD01 = '2' and EB02BD02 = 0"><!-- ȡ�ϼ� -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02BS04"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ѭ��͸֧</font>
				</td>
			<xsl:for-each select="EB02/EB02B/EB02BH">
				<xsl:sort select="EB02BD01"/>
				<xsl:if test="EB02BD01 = '3' and EB02BD02 != 0"><!-- ��ȡ�ϼ� -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02BS04"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="EB02/EB02B/EB02BH">
				<xsl:if test="EB02BD01 = '3' and EB02BD02 = 0"><!-- ȡ�ϼ� -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02BS04"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����</font>
				</td>
			<xsl:for-each select="EB02/EB02B/EB02BH">
				<xsl:sort select="EB02BD01"/>
				<xsl:if test="EB02BD01 = '4' and EB02BD02 != 0"><!-- ��ȡ�ϼ� -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02BS04"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="EB02/EB02B/EB02BH">
				<xsl:if test="EB02BD01 = '4' and EB02BD02 = 0"><!-- ȡ�ϼ� -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02BS04"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ϼ�</font>
				</td>
			<xsl:for-each select="EB02/EB02B/EB02BH">
				<xsl:sort select="EB02BD01"/>
				<xsl:if test="EB02BD01 = '0' and EB02BD02 != 0"><!-- ��ȡ�ϼ� -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02BS04"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="EB02/EB02B/EB02BH">
				<xsl:if test="EB02BD01 = '0' and EB02BD02 = 0"><!-- ȡ�ϼ� -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB02BS04"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			</tr>
		</table>		
		<br/>
		<!-- ��ծ��ʷ������Ϣ -->
		<!-- ��ծ��ʷ -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">��ծ��ʷ</font>
				</td>
				<td height="25px" align="right">
					<font style="font-size: 12.0pt;font-weight:bold;">�·������� <xsl:value-of select="EB02/EB02C/EB02CS01"/> ��</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">&#160;</font>
				</td>
				<td height="25px" align="center" colspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ȫ����ծ</font>
				</td>
				<td height="25px" align="center" colspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ע�ฺծ</font>
				</td>
				<td height="25px" align="center" colspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����ฺծ</font>
				</td>
				<td height="25px" align="center" colspan="4" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����ฺծ</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����ܶ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���������˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ڱ���</font>
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
		<!-- δ���嵣������ -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left" >
					<font style="font-size: 14.0pt;font-weight:bold;"> δ���嵣������</font>
				</td>
			</tr>
		</table>
				<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">δ���嵣������</font>
				</td>
				<td height="25px" align="right">
					<font style="font-size: 12.0pt;font-weight:bold;">����Ŀ�������� <xsl:value-of select="../EBC/EB03/EB03A/EB03AS01"/> ��</font>
				</td>
			</tr>
		</table>
		
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">&#160;</font>
				</td>
				<td height="25px" align="center" colspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������</font>
				</td>
				<td height="25px" align="center" colspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ע��</font>
				</td>
				<td height="25px" align="center" colspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������</font>
				</td>
				<td height="25px" align="center" colspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ϼ�</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���гжһ�Ʊ</font>
				</td>
			<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
				<xsl:sort select="EB03AD02"/>
				<xsl:if test="EB03AD01 = '1' and EB03AD02 != 0"><!-- ��ȡ�ϼ� -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03AS02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03AJ01"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
				<xsl:if test="EB03AD01 = '1' and EB03AD02 = 0"><!-- ȡ�ϼ� -->
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
					<font style="font-size: 12.0pt;font-weight:bold;">����֤</font>
				</td>
			<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
				<xsl:sort select="EB03AD02"/>
				<xsl:if test="EB03AD01 = '2' and EB03AD02 != 0"><!-- ��ȡ�ϼ� -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03AS02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03AJ01"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
				<xsl:if test="EB03AD01 = '2' and EB03AD02 = 0"><!-- ȡ�ϼ� -->
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
					<font style="font-size: 12.0pt;font-weight:bold;">���б���</font>
				</td>
			<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
				<xsl:sort select="EB03AD02"/>
				<xsl:if test="EB03AD01 = '3' and EB03AD02 != 0"><!-- ��ȡ�ϼ� -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03AS02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03AJ01"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
				<xsl:if test="EB03AD01 = '3' and EB03AD02 = 0"><!-- ȡ�ϼ� -->
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
					<font style="font-size: 12.0pt;font-weight:bold;">����</font>
				</td>
			<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
				<xsl:sort select="EB03AD02"/>
				<xsl:if test="EB03AD01 = '9' and EB03AD02 != 0"><!-- ��ȡ�ϼ� -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03AS02"/></font>
				</td>
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03AJ01"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="../EBC/EB03/EB03A/EB03AH">
				<xsl:if test="EB03AD01 = '9' and EB03AD02 = 0"><!-- ȡ�ϼ� -->
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
		<!-- �ѽ��嵣������ -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">�ѽ��嵣������</font>
				</td>
				<td height="25px" align="right">
					<font style="font-size: 12.0pt;font-weight:bold;">����Ŀ�������� <xsl:value-of select="../EBC/EB03/EB03B/EB03BS01"/> ��</font>
				</td>
			</tr>
		</table>
			<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">&#160;</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ע���˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ϼ�</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���гжһ�Ʊ</font>
				</td>
			<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
				<xsl:sort select="EB03BD02"/>
				<xsl:if test="EB03BD01 = '1' and EB03BD02 != 0"><!-- ��ȡ�ϼ� -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03BS02"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
				<xsl:if test="EB03BD01 = '1' and EB03BD02 = 0"><!-- ȡ�ϼ� -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03BS02"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����֤</font>
				</td>
			<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
				<xsl:sort select="EB03BD02"/>
				<xsl:if test="EB03BD01 = '2' and EB03BD02 != 0"><!-- ��ȡ�ϼ� -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03BS02"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
				<xsl:if test="EB03BD01 = '2' and EB03BD02 = 0"><!-- ȡ�ϼ� -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03BS02"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���б���</font>
				</td>
			<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
				<xsl:sort select="EB03BD02"/>
				<xsl:if test="EB03BD01 = '3' and EB03BD02 != 0"><!-- ��ȡ�ϼ� -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03BS02"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
				<xsl:if test="EB03BD01 = '3' and EB03BD02 = 0"><!-- ȡ�ϼ� -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03BS02"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����</font>
				</td>
			<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
				<xsl:sort select="EB03BD02"/>
				<xsl:if test="EB03BD01 = '9' and EB03BD02 != 0"><!-- ��ȡ�ϼ� -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03BS02"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>			
			<xsl:for-each select="../EBC/EB03/EB03B/EB03BH">
				<xsl:if test="EB03BD01 = '9' and EB03BD02 = 0"><!-- ȡ�ϼ� -->
				<td height="25px" align="center">
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EB03BS02"/></font>
				</td>
				</xsl:if>
			</xsl:for-each>
			</tr>
		</table>
		<!-- ����Э�������Ϣ -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left" >
					<font style="font-size: 14.0pt;font-weight:bold;">����Э�������Ϣ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ѭ�����ö�Ⱥϼ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ʹ�õķ�ѭ�����ö�Ⱥϼ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ʣ����õķ�ѭ����Ⱥϼ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ѭ�����ö�Ⱥϼ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ʹ�õ�ѭ�����ö�Ⱥϼ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ʣ����õ�ѭ����Ⱥϼ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�Ƿ���������޶�</font>
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
						<font style="font-size: 12.0pt;">˵���� ���ڴ��������޶�Ŀ��ƣ� ʣ����ö���޷�׼ȷ���㣬��Ҫ���������ϸ��Ϣ���й��㡣</font>
					</td>
				</tr>
			</xsl:if>
			</table>
		<br/>
		<!-- ��ػ���������Ϣ��Ҫ -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">��ػ���������Ϣ��Ҫ</font>
				</td>
				<td height="25px" align="right">
					<font style="font-size: 12.0pt;font-weight:bold;">�������������������� <xsl:value-of select="../EBE/EB05/EB05A/EB05AS01"/> ��</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" colspan="3" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��׷��ҵ��</font>
				</td>
				<td height="25px" align="center" colspan="5" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����������</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������ν��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������ν��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ע�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���������</font>
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
		<!-- ����������ػ������λ�����Ϣ -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">����������ػ������λ�����Ϣ</font>
				</td>
				<td height="25px" align="right">
					<font style="font-size: 12.0pt;font-weight:bold;">�������������������� <xsl:value-of select="../EBE/EB05/EB05B/EB05BS01"/> ��</font>
				</td>
			</tr>
		</table>		
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������ν��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ע�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���������</font>
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
		<!-- �ѽ����Ŵ���Ϣ��Ҫ -->
		
		<br/>
		
		<br/>
	
		<br/>
		<!-- ��ծ��ʷ -->
		
		
		<br/>
	</xsl:template>

<!-- �Ŵ���¼��ϸ -->
	<xsl:template match="EDA">
		<br/>
		<div align="center">
			<font style="font-size: 22.0pt;font-weight:bold;">�Ŵ���¼��ϸ</font>
		</div>
		<br/>
		<!-- ��׷��ҵ�� -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">��׷��ҵ��</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����˻����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻��״̬</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����˻�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����Э����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ���������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ������ϸ��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ض����׸���</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ʷ����</font>
				</td>
				
			</tr><tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ö��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������֤��ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ͬ����ʶ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ر�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ּ�¼����</font>
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
						<font style="font-size: 12.0pt;">&#160;������</font>
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
		<!-- �г��ڽ�� -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">δ�����г��ڽ��</font>
				</td>
				<td height="25px" align="right">
					<font style="font-size: 12.0pt;font-weight:bold;">�� <xsl:value-of select="count(ED01/ED01A[ED01AD01 ='1' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and (ED01AD03 = '20' or ED01AD03 ='30')])"/> ��</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����˻����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻��״̬</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����˻�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����Э����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ���������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ������ϸ��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ض����׸���</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ʷ����</font>
				</td>
				
			</tr><tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ö��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������֤��ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ͬ����ʶ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ر�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ּ�¼����</font>
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
						<font style="font-size: 12.0pt;">&#160;������</font>
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
		<!-- ���ڽ�� -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">���ڽ��</font>
				</td>
				<td height="25px" align="right">
					<font style="font-size: 12.0pt;font-weight:bold;">�� <xsl:value-of select="count(ED01/ED01A[ED01AD01 ='1' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and (ED01AD03 = '20' or ED01AD03 ='30')])"/> ��</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����˻����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻��״̬</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����˻�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����Э����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ���������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ������ϸ��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ض����׸���</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ʷ����</font>
				</td>
				
			</tr><tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ö��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������֤��ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ͬ����ʶ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ر�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ּ�¼����</font>
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
						<font style="font-size: 12.0pt;">&#160;������</font>
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
		<!-- δ����ѭ��͸֧ -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">ѭ��͸֧</font>
				</td>
				<td height="25px" align="right">
					<font style="font-size: 12.0pt;font-weight:bold;">�� <xsl:value-of select="count(ED01/ED01A[ED01AD01 ='1' and ED01AD02 = 'R1'])"/> ��</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����˻����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻��״̬</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����˻�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����Э����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ���������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ������ϸ��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ض����׸���</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ʷ����</font>
				</td>
				
			</tr><tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ö��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������֤��ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ͬ����ʶ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ر�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ּ�¼����</font>
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
						<font style="font-size: 12.0pt;">&#160;������</font>
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
		<!-- δ���������˻� -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">δ���������˻�</font>
				</td>
				<td height="25px" align="right">
					<font style="font-size: 12.0pt;font-weight:bold;">�� <xsl:value-of select="count(ED01/ED01A[ED01AD01 ='1' and ED01AD02 = 'D2'])"/> ��</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����˻����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻��״̬</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����˻�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����Э����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ���������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ������ϸ��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ض����׸���</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ʷ����</font>
				</td>
				
			</tr><tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ö��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������֤��ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ͬ����ʶ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ر�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ּ�¼����</font>
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
						<font style="font-size: 12.0pt;">&#160;������</font>
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
		<!-- �ѽ����Ŵ� -->
		<!-- ��׷��ҵ�� -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">�ѽ��屻׷��ҵ��</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����˻����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻��״̬</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����˻�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����Э����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ���������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ������ϸ��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ض����׸���</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ʷ����</font>
				</td>
				
			</tr><tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ö��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������֤��ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ͬ����ʶ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ر�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ּ�¼����</font>
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
						<font style="font-size: 12.0pt;">&#160;������</font>
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
		<!-- �г��ڽ�� -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�ѽ����г��ڽ��</font>
				</td>
				<td height="25px" align="right">
					<font style="font-size: 12.0pt;font-weight:bold;">�� <xsl:value-of select="count(ED01/ED01A[ED01AD01 ='2' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and (ED01AD03 = '20' or ED01AD03 ='30')])"/> ��</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����˻����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻��״̬</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����˻�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����Э����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ���������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ������ϸ��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ض����׸���</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ʷ����</font>
				</td>
				
			</tr><tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ö��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������֤��ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ͬ����ʶ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ر�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ּ�¼����</font>
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
						<font style="font-size: 12.0pt;">&#160;������</font>
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
		<!-- ���ڽ�� -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�ѽ�����ڽ��</font>
				</td>
				<td height="25px" align="right">
					<font style="font-size: 12.0pt;font-weight:bold;">�� <xsl:value-of select="count(ED01/ED01A[ED01AD01 ='2' and (ED01AD02 = 'D1' or ED01AD02 = 'R4') and (ED01AD03 = '20' or ED01AD03 ='30')])"/> ��</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����˻����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻��״̬</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����˻�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����Э����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ���������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ������ϸ��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ض����׸���</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ʷ����</font>
				</td>
				
			</tr><tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ö��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������֤��ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ͬ����ʶ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ر�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ּ�¼����</font>
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
						<font style="font-size: 12.0pt;">&#160;������</font>
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
		<!-- �ѽ���ѭ��͸֧ -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�ѽ���ѭ��͸֧</font>
				</td>
				<td height="25px" align="right">
					<font style="font-size: 12.0pt;font-weight:bold;">�� <xsl:value-of select="count(ED01/ED01A[ED01AD01 ='2' and ED01AD02 = 'R1'])"/> ��</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����˻����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻��״̬</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����˻�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����Э����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ���������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ������ϸ��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ض����׸���</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ʷ����</font>
				</td>
				
			</tr><tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ö��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������֤��ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ͬ����ʶ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ر�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ּ�¼����</font>
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
						<font style="font-size: 12.0pt;">&#160;������</font>
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
		<!-- δ���������˻� -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�ѽ�����������˻�</font>
				</td>
				<td height="25px" align="right">
					<font style="font-size: 12.0pt;font-weight:bold;">�� <xsl:value-of select="count(ED01/ED01A[ED01AD01 ='2' and ED01AD02 = 'D2'])"/> ��</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����˻����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻��״̬</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����˻�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����Э����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ���������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ������ϸ��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ض����׸���</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ʷ����</font>
				</td>
				
			</tr><tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ö��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������֤��ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ͬ����ʶ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ر�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ּ�¼����</font>
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
						<font style="font-size: 12.0pt;">&#160;������</font>
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
		<!-- �����˻��ֻ���������Ϣ -->
		<!-- ���� -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�����˻��ֻ���������Ϣ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����˻��ֻ���������Ϣ���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�弶����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">δ�����˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ϼ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����ܶ�ϼ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ڱ���ϼ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ѽ����˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ѽ����˻����ֽ��ϼ�</font>
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
		<!-- ǷϢ��Ϣ -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">ǷϢ��Ϣ</font>
				</td>
			</tr>
			<xsl:if test="ED03 != ''">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">ǷϢ</font>
				</td>
				<td height="25px" align="right">
					<font style="font-size: 12.0pt;font-weight:bold;">�� <xsl:value-of select="count(ED03)"/> ��</font>
				</td>
			</tr>
			</xsl:if>
		</table>
		<xsl:if test="ED03 != ''">		
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ǷϢ��Ϣ���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ǷϢ���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���仯����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ǷϢ����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
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
		<!-- �����˻���Ϣ��Ԫ -->
		<br/>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">���гжһ�Ʊ������֤������֤��ϸ</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="../EDB/ED04[ED04A/ED04AD03 = '51' or ED04A/ED04AD03 = '61']">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">���Ż�����</font>
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04A/ED04AI02"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ�����ࣺ</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2034"><xsl:value-of select="ED04A/ED04AD03"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻�״̬��</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2010"><xsl:value-of select="ED04B/ED04BD01"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�弶���ࣺ</font>
					<font style="font-size: 12.0pt;f">&#160;<span name="2045"><xsl:value-of select="ED04B/ED04BD02"/></span></font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<xsl:if test="ED04B/ED04BD01 = '1'">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������ʽ</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��֤�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ճ���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����Э����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">�˻����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ر�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle"> 
					<font style="font-size: 12.0pt;font-weight:bold;">����־</font>
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
					<font style="font-size: 14.0pt;font-weight:bold;">(��)���б���������ҵ����Ŵ���ϸ</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="../EDB/ED04[ED04A/ED04AD03 != '51' and ED04A/ED04AD03 != '61']">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">���Ż�����</font>
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED04A/ED04AI02"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ�����ࣺ</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2034"><xsl:value-of select="ED04A/ED04AD03"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻�״̬��</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2010"><xsl:value-of select="ED04B/ED04BD01"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�弶���ࣺ</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2045"><xsl:value-of select="ED04B/ED04BD02"/></span></font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<xsl:if test="ED04B/ED04BD01 = '1'">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������ʽ</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��֤�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ճ���</font>
				</td>
				<td height="25px" align="center" colspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">�˻����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ر�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����־</font>
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
		<!-- �����˻��ֻ���������Ϣ -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�����˻��ֻ���������Ϣ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">���гжһ�Ʊ������֤</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����˻��ֻ���������Ϣ���</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���Ż�������</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�弶����</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" colspan="5" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����ա�30��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����ա�60��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����ա�90��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������>90��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ϼ�</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">���б���������ҵ��</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����˻��ֻ���������Ϣ���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������ҵ������ϸ��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�弶����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">δ�����˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">������Ϣ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����Э����</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���Ŷ������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ѭ����־</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ч����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������</font>
				</td>
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���Ŷ��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ö��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����޶�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����޶���</font>
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
		<!-- ��ػ������� -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">��ػ�������</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">Ϊ��������˳е�����ػ�������</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�������������ҵ��</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" rowspan="2" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻�����</font>
				</td>
				
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��֤��ͬ���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������α���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������ν��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ���������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������ϸ��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ö��</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�弶����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����ܶ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ڱ���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����״̬</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ʣ�໹������</font>
				</td>
				<td height="25px" align="center" colspan="3" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
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
						<!-- ��ΪC1�˻���ʱ�򷵻ؿ� -->
						<xsl:if test="ED070D02 = 'C1'"></xsl:if>
						<!-- �������������ҵ��ʱ�򣬷��ؿ� -->
						<xsl:if test="ED070D01 = '2'"></xsl:if>
						<!-- ����������Ǹ��˵������˻�ʱ���μ���¼A -->
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
					<font style="font-size: 12.0pt;font-weight:bold;">��ػ������������˻��ֻ���������Ϣ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����˻��ֻ���������Ϣ���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ػ�����������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������ </font>
				</td>
				
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������ν��</font>
				</td>
				
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������ϸ��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�弶����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����ܶ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ڱ���</font>
				</td>
				<td height="25px" width="10%" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��֤��ͬ���</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">Ϊ�������׳е�����ػ�������</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����˻��ֻ���������Ϣ���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ػ�����������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������ν��</font>
				</td>
				
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������ϸ��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�弶����</font>
				</td>
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
					<font style="font-size: 12.0pt;font-weight:bold;">��֤��ͬ���</font>
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
	
<!-- ���Ŵ���¼��ϸ -->
	<xsl:template match="EEA">
		<br/>
		<div align="center">
			<font style="font-size: 22.0pt;font-weight:bold;">���Ŵ���¼��ϸ</font>
		</div>
		<br/><br/>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">������ҵ�ɷ���Ϣ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ҵ�ɷ��˻����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ҵ��λ����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ɷ�״̬</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ۼ�Ƿ�ѽ��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ͳ������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�鿴��ȥ 24 ���½ɷ����</font>
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
					<font style="font-size: 12.0pt;">������</font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<br/>	
	</xsl:template>
<!-- ������¼��ϸ -->
	<!-- Ƿ˰��Ϣ -->
	<xsl:template match="EFA">
		<br/>
		<div align="center">
			<font style="font-size: 22.0pt;font-weight:bold;">������¼��ϸ</font>
		</div>
		<br/>
		<xsl:if test="EF01 !=''">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;" color="red">Ƿ˰��¼</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">Ƿ˰��¼���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����˰�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">Ƿ˰�ܶԪ��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">Ƿ˰ͳ������</font>
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
	<!-- �����о���¼ ǿ��ִ�м�¼ -->
	<xsl:template match="EFB">
		<xsl:if test="count(EF02/child::*) != 0">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;" color="red">�����о���¼</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="EF02">
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�����о���¼���</font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF020I01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">������Ժ��</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF020Q01"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�������ڣ�</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF020R01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">���ɣ�</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF020Q02"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">���ϵ�λ��</font>
					<font style="font-size: 12.0pt;"><span name="2055"><xsl:value-of select="EF020D01"/></span></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">���ţ�</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF020I02"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">���г���</font>
					<font style="font-size: 12.0pt;"><span name="2056"><xsl:value-of select="EF020D02"/></span></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">���ϱ�ģ�</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF020Q03"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">���ϱ�Ľ�Ԫ����</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF020J01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�᰸��ʽ��</font>
					<font style="font-size: 12.0pt;"><span name="2057"><xsl:value-of select="EF020D03"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�о�/������Ч���ڣ�</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF020R02"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left" colspan="2">
					<font style="font-size: 12.0pt;font-weight:bold;">�о�/��������</font>
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
					<font style="font-size: 14.0pt;font-weight:bold;" color="red">ǿ��ִ�м�¼</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="EF03">
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
		<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">ǿ��ִ�м�¼���</font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF030I01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">������Ժ��</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF030Q01"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�������ڣ�</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF030R01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">���ɣ�</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF030Q02"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">���ţ�</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF030I02"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">����ִ�б�ģ�</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF030Q03"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">����ִ�б�Ľ�Ԫ����</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF030J01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">����״̬��</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF030Q04"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�᰸��ʽ��</font>
					<font style="font-size: 12.0pt;"><span name="2058"><xsl:value-of select="EF030D01"/></span></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">��ִ�б�ģ�</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF030Q05"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">��ִ�б�Ľ�Ԫ����</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF030J02"/></font>
				</td>
			</tr>
		</table>
		<br/>
		</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- ����������Ϣ -->
	<xsl:template match="EFC">
		<xsl:if test="count(child::*) != 0">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;" color="red">����������Ϣ</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="EF04">
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
		<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">����������¼���</font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF040I01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">����������</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF040Q01"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�����������ĺţ�</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF040I02"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">Υ����Ϊ��</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF040Q02"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�������ڣ�</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF040R01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">����������</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF040Q03"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">������Ԫ����</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF040J01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">����ִ�������</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF040Q04"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">������������</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF040Q05"/></font>
				</td>
			</tr>
		</table>
		<br/>
		</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- ס��������ν���Ϣ -->
	<xsl:template match="EFD">
		<xsl:if test="count(child::*) != 0">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">ס��������ν���Ϣ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<xsl:for-each select="EF05">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻����</font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF05A/EF05AI01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">ͳ�����£�</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF05A/EF05AR04"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�������£�</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF05A/EF05AR01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">ְ��������</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF05A/EF05AS01"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�ɷѻ�����Ԫ����</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF05A/EF05AJ01"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ�νɷ����ڣ�</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF05A/EF05AR02"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�������£�</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF05A/EF05AR03"/></font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�ɷ�״̬��</font>
					<font style="font-size: 12.0pt;"><span name="2059"><xsl:value-of select="EF05A/EF05AD01"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�ۼ�Ƿ�ѽ�Ԫ����</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EF05A/EF05AJ02"/></font>
				</td>
			</tr>
			</xsl:for-each>
		</table>
		<br/>
		</xsl:if>
	</xsl:template>
	<!-- �����ɼ�¼ �����֤��¼ ������ʼ�¼ ��ý�����¼ ӵ��ר����� -->
	<xsl:template match="EFE">
		<xsl:if test="count(EF06/child::*) != 0">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">�����ɼ�¼</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ɼ�¼���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ɲ���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ֹ����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
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
					<font style="font-size: 14.0pt;font-weight:bold;">�����֤��¼</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��֤��¼���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��֤����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��֤����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��֤����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ֹ����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��֤����</font>
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
					<font style="font-size: 14.0pt;font-weight:bold;">������ʼ�¼</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ʼ�¼���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�϶�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��׼����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ֹ����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
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
					<font style="font-size: 14.0pt;font-weight:bold;">��ý�����¼</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������¼���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ֹ����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ʵ</font>
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
					<font style="font-size: 14.0pt;font-weight:bold;">ӵ��ר�����</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ר������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ר����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ר����Ч�ڣ���λ���꣩</font>
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
	<!-- ���뾳���������ɫͨ����Ϣ ��������Ʒ������Ϣ ��������Ʒ�����������Ϣ -->
	<xsl:template match="EFF">
		<xsl:if test="count(EF11/child::*) != 0">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">���뾳���������ɫͨ����Ϣ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��׼����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������Ʒ����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ч����</font>
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
					<font style="font-size: 14.0pt;font-weight:bold;">��������Ʒ������Ϣ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��׼����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������Ʒ����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ֹ����</font>
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
					<font style="font-size: 14.0pt;font-weight:bold;">��������Ʒ�����������Ϣ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ܲ���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ͻֱ����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ܼ���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ч����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ֹ����</font>
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
	
	<!-- ���ʹ�ģ������Ϣ -->
	<xsl:template match="EFG">
		<xsl:if test="count(child::*) != 0">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">���ʹ�ģ������Ϣ</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������¼</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ʿ�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ģ</font>
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
<!-- ���񱨱� -->
	<xsl:template match="EGA"/>
<!-- ������Ϣ -->
	<xsl:template match="EHA">
		<br/>
		<div align="center">
			<font style="font-size: 22.0pt;font-weight:bold;">������Ϣ</font>
		</div>
		<br/><br/>
		<xsl:if test="count(child::*) != 0">
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������Ϣ���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
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
				<font style="font-size: 16.0pt;font-weight:bold;">��</font>
			</div>
			<br/>
		</xsl:if>
	</xsl:template>
<!-- �����������ע��Ϣ -->
	<xsl:template match="EIA">
		<br/>
		<div align="center">
			<font style="font-size: 22.0pt;font-weight:bold;">�����������ע��Ϣ</font>
		</div>
		<br/><br/>
		<xsl:if test="EI01[EI010D02='1']">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">�����ṩ����˵��</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" width="70%" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����ṩ����˵��</font>
				</td>
				<td height="25px" align="center" width="20%" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
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
					<font style="font-size: 14.0pt;font-weight:bold;">��������˵��</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" width="70%" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������˵��</font>
				</td>
				<td height="25px" align="center" width="20%" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
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
					<font style="font-size: 14.0pt;font-weight:bold;">��Ϣ��������</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" width="70%" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
				</td>
				<td height="25px" align="center" width="20%" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
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
					<font style="font-size: 14.0pt;font-weight:bold;">�����ע</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" width="70%" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����ע</font>
				</td>
				<td height="25px" align="center" width="20%" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������</font>
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
				<font style="font-size: 16.0pt;font-weight:bold;">��</font>
			</div>
			<br/>
		</xsl:if>
	</xsl:template>
<!-- ���� 1�����ü�¼������Ϣ -->
	<xsl:template name="annex1">
		<br/>
		<div align="left" style="padding-left:70pt;">
			<font style="font-size: 22.0pt;font-weight:bold;">���� 1�����ü�¼������Ϣ</font>
		</div>
		<br/><br/>
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left" style="padding-left:30pt;">
					<font style="font-size: 20.0pt;font-weight:bold;">һ���Ŵ���¼��ϸ</font>
				</td>
			</tr>
		</table>
		<br/>
		<!-- (һ)��׷����¼����ʷ���� -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">(һ)��׷����¼����ʷ����</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="EDA/ED01[ED01A/ED01AD02='C1']">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���ţ�</font>
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01A/ED01AI01"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻�״̬��</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2010"><xsl:value-of select="ED01A/ED01AD01"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ�����������룺</font>
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01A/ED01AI02"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ��������ࣺ</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2022"><xsl:value-of select="ED01AD05"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ������ϸ�֣�</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���仯����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�弶����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�弶�����϶�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ��ʵ�ʻ�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ��ʵ�ʻ����ܶ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ�λ�����ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ��Լ����������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ��Ӧ���ܶ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����ܶ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ڱ���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ʣ�໹������</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">�ض�������ʾ</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���׽��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������ڱ������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ϸ��Ϣ</font>
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
		<!-- (��)�г��ڽ�����ʷ���� -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">(��)�г��ڽ�����ʷ����</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="EDA/ED01">
		<xsl:if test="(ED01A/ED01AD02 = 'D1' or ED01A/ED01AD02 = 'R4') and (ED01A/ED01AD03 = '20' or ED01A/ED01AD03 ='30')">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���ţ�</font>
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01A/ED01AI01"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻�״̬��</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2010"><xsl:value-of select="ED01A/ED01AD01"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ�����������룺</font>
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01A/ED01AI02"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ��������ࣺ</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2022"><xsl:value-of select="ED01AD05"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ������ϸ�֣�</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���仯����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�弶����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�弶�����϶�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ��ʵ�ʻ�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ��ʵ�ʻ����ܶ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ�λ�����ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ��Լ����������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ��Ӧ���ܶ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����ܶ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ڱ���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ʣ�໹������</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">�ض�������ʾ</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���׽��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������ڱ������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ϸ��Ϣ</font>
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
		<!-- (��)���ڽ�����ʷ���� -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">(��)���ڽ�����ʷ����</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="EDA/ED01[(ED01A/ED01AD02 = 'D1' or ED01A/ED01AD02 = 'R4') and ED01A/ED01AD03 = '10']">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���ţ�</font>
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01A/ED01AI01"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻�״̬��</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2010"><xsl:value-of select="ED01A/ED01AD01"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ�����������룺</font>
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01A/ED01AI02"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ��������ࣺ</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2022"><xsl:value-of select="ED01AD05"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ������ϸ�֣�</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���仯����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�弶����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�弶�����϶�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ��ʵ�ʻ�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ��ʵ�ʻ����ܶ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ�λ�����ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ��Լ����������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ��Ӧ���ܶ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����ܶ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ڱ���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" width="5%" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ʣ�໹������</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">�ض�������ʾ</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���׽��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������ڱ������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ϸ��Ϣ</font>
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
		<!-- (��)ѭ��͸֧����ʷ���� -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">(��)ѭ��͸֧����ʷ����</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="EDA/ED01[ED01A/ED01AD02 = 'R1']">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���ţ�</font>
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01A/ED01AI01"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻�״̬��</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2010"><xsl:value-of select="ED01A/ED01AD01"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ�����������룺</font>
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01A/ED01AI02"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ��������ࣺ</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2022"><xsl:value-of select="ED01AD05"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ������ϸ�֣�</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���仯����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�弶����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�弶�����϶�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ��ʵ�ʻ�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ��ʵ�ʻ����ܶ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ�λ�����ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ��Լ����������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ��Ӧ���ܶ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����ܶ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ڱ���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" width="5%" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ʣ�໹������</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">�ض�������ʾ</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���׽��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������ڱ������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ϸ��Ϣ</font>
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
		<!-- (��)���ֵ��Ŵ���ϸ����ʷ���� -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">(��)���ֵ��Ŵ���ϸ����ʷ����</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="EDA/ED01[ED01A/ED01AD02 = 'D2']">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻���ţ�</font>
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01A/ED01AI01"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">�˻�״̬��</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2010"><xsl:value-of select="ED01A/ED01AD01"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ�����������룺</font>
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="ED01A/ED01AI02"/></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ��������ࣺ</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2022"><xsl:value-of select="ED01AD05"/></span></font>
				</td>
				<td height="25px" align="left">
					<font style="font-size: 12.0pt;font-weight:bold;">���ҵ������ϸ�֣�</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���仯����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�弶����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�弶�����϶�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ��ʵ�ʻ�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ��ʵ�ʻ����ܶ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ�λ�����ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ��Լ����������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ��Ӧ���ܶ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����ܶ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ڱ���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" width="5%" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ʣ�໹������</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">��Ϣ��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���仯����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�弶����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�弶�����϶�����</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ��ʵ�ʻ�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ��ʵ�ʻ����ܶ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ�λ�����ʽ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ��Լ����������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���һ��Ӧ���ܶ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�����ܶ�</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���ڱ���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" width="5%" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ʣ�໹������</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">�ض�������ʾ</font>
				</td>
			</tr>
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">���׽��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�������ڱ������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">������ϸ��Ϣ</font>
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
		<!-- (��)���гжһ�Ʊ������֤���Ŵ���ϸ -->
		
		<br/><br/>
		<!-- �������Ŵ���¼��ϸ -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left" style="padding-left:30pt;">
					<font style="font-size: 20.0pt;font-weight:bold;">�������Ŵ���¼��ϸ</font>
				</td>
			</tr>
		</table>
		<br/>
		<!-- ������ҵ��ʷ�ɷѼ�¼��ϸ -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">������ҵ��ʷ�ɷѼ�¼��ϸ</font>
				</td>
			</tr>
		</table>
		<xsl:for-each select="EEA/EE01">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left" width="50%">
					<font style="font-size: 12.0pt;font-weight:bold;">������ҵ��λ���ƣ�</font>
					<font style="font-size: 12.0pt;"><xsl:value-of select="EE01A/EE01AQ01"/></font>
				</td>
				<td height="25px" align="left" width="30%">
					<font style="font-size: 12.0pt;font-weight:bold;">ҵ�����ͣ�</font>
					<font style="font-size: 12.0pt;">&#160;<span name="2051"><xsl:value-of select="EE01A/EE01AD01"/></span></font>
				</td>
				<td height="25px" align="left" width="50%">
					<font style="font-size: 12.0pt;font-weight:bold;">�ɷѼ�¼������</font>
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EE01B/EE01BS01"/></font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ͳ������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ɷ�״̬</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����Ӧ�ɽ��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����ʵ�ɽ��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ۼ�Ƿ�ѽ��</font>
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
		<!-- ����������¼��ϸ -->
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left" style="padding-left:30pt;">
					<font style="font-size: 20.0pt;font-weight:bold;">����������¼��ϸ</font>
				</td>
			</tr>
		</table>
		<br/>
		<!-- ס����������ʷ�ɷѼ�¼��ϸ -->
		<xsl:for-each select="EFD/EF05">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">ס����������ʷ�ɷѼ�¼��ϸ</font>
				</td>
				<td height="25px" align="left" width="50%">
					<font style="font-size: 12.0pt;font-weight:bold;">�ɷѼ�¼������</font>
					<font style="font-size: 12.0pt;">&#160;<xsl:value-of select="../EF05B/EF05BS01"/></font>
				</td>
			</tr>
		</table>
		
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">ͳ������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ɷ�״̬</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����Ӧ�ɽ�Ԫ��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">����ʵ�ɽ�Ԫ��</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">�ۼ�Ƿ�ѽ�Ԫ��</font>
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
<!-- ���� 2�����񱨱���Ϣ -->
	<xsl:template name="annex2">
		<br/>
		<div align="left" style="padding-left:70pt;">
			<font style="font-size: 22.0pt;font-weight:bold;">���� 2�����񱨱���Ϣ</font>
		</div>
		<br/><br/>
		<!-- ��ҵ�ʲ���ծ��(2002 ��) -->
		<xsl:for-each select="EGA/EG01">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">��ҵ�ʲ���ծ��(2002 ��)</font>
				</td>
				
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">���񱨱���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">��������ϸ��</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">��Ŀ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ĩֵ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ŀ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ĩֵ</font>
				</td>
			</tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����ʽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ01"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">���ڽ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ45"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����Ͷ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ02"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ��Ʊ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ46"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ��Ʊ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ03"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ���˿�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ47"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ�չ���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ04"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">Ԥ���˿�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ48"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ����Ϣ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ05"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ49"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ���˿�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ06"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ��������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ50"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����Ӧ�տ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ07"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ51"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ԥ���˿�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ08"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ��˰��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ52"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ڻ���֤��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ09"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">����Ӧ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ53"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ�ղ�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ10 "/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">����Ӧ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ54"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ�ճ�����˰</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ11"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">Ԥ�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ55"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ12"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">Ԥ�Ƹ�ծ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ56"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���ԭ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ13"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">һ���ڵ��ڵĳ��ڸ�ծ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ57"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�������Ʒ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ14"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">����������ծ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ58"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��̯����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ15"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">������ծ�ϼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ59"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����������ʲ�����ʧ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ16"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">���ڽ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ60"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">һ���ڵ��ڵĳ���ծȨͶ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ17"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ��ծȯ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ61"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���������ʲ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ18"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">����Ӧ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ62"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����ʲ��ϼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ19"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">ר��Ӧ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ63"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����Ͷ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ20"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">�������ڸ�ծ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ64"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���ڹ�ȨͶ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ21"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">���������ڸ�ծ��Ŀ�£���׼��������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ65"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����ծȨͶ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ22"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">���ڸ�ծ�ϼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ66"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ϲ��۲�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ23"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">����˰�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ67"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����Ͷ�ʺϼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ24"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">��ծ�ϼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ68"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�̶��ʲ�ԭ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ25"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">�����ɶ�Ȩ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ69"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ۼ��۾�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ26"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">ʵ���ʱ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ70"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�̶��ʲ���ֵ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ27"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">�����ʱ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ71"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�̶��ʲ�ֵ��ֵ׼��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ28"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">�����ʱ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ72"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�̶��ʲ�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ29"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">�����ʱ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ73 "/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�̶��ʲ�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ30"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">�������ʱ���Ŀ�£����з����ʱ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ74"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ31"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">�������ʱ���Ŀ�£����巨���ʱ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ75"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ڽ�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ32"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">�����ʱ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ76"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">������̶��ʲ�����ʧ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ33"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">�����ʱ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ77"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�̶��ʲ��ϼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ34"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">�ʱ�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ78"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����ʲ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ35"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">ӯ�๫��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ79"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�������ʲ���Ŀ�£�����ʹ��Ȩ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ36"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">��ӯ�๫����Ŀ�£�����ӯ�๫��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ80"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����ʲ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ37"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">��ӯ�๫����Ŀ�£������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ81"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�������ʲ���Ŀ�£��̶��ʲ�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ38"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">��ӯ�๫����Ŀ�£����������ʱ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ82"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�������ʲ���Ŀ�£��̶��ʲ�����֧��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ39"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">δȷ�ϵ�Ͷ����ʧ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ83"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���������ʲ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ40"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">δ��������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ84"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����������ʲ���Ŀ�£���׼��������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ41 "/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">��ұ���������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ85"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���μ������ʲ��ϼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ42"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">������Ȩ��ϼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ86"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����˰�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ43"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">��ծ��������Ȩ���ܼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ87"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ʲ��ܼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG01B/EG01BJ44"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;</font></td></tr>
		</table>
		<br/>
		</xsl:for-each>
		<!-- ��ҵ�ʲ���ծ��(2007 ��) -->
		<xsl:for-each select="EGA/EG02">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">��ҵ�ʲ���ծ��(2007 ��)</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">���񱨱���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">��������ϸ��</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">��Ŀ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ĩֵ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ŀ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ĩֵ</font>
				</td>
			</tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����ʽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ01 "/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">���ڽ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ32"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����Խ����ʲ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ02"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">�����Խ��ڸ�ծ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ33"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ��Ʊ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ03"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ��Ʊ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ34 "/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ���˿�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ04"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ���˿�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ35"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ԥ���˿�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ05"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">Ԥ���˿�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ36"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ����Ϣ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ06"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ����Ϣ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ37"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ�չ���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ07"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ��ְ��н��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ38"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����Ӧ�տ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ08"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ��˰��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ39"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ09"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ40"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">һ���ڵ��ڵķ������ʲ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ10"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">����Ӧ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ41"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���������ʲ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ11"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">һ���ڵ��ڵķ�������ծ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ42"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����ʲ��ϼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ12"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">����������ծ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ43"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ɹ����۵Ľ����ʲ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ13"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">������ծ�ϼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ44"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����������Ͷ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ14"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">���ڽ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ45"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���ڹ�ȨͶ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ15"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ��ծȯ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ46"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����Ӧ�տ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ16"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">����Ӧ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ47"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ͷ���Է��ز�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ17"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">ר��Ӧ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ48"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�̶��ʲ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ18"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">Ԥ�Ƹ�ծ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ49"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ڽ�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ19"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">��������˰��ծ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ50"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ20"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">������������ծ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ51"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�̶��ʲ�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ21"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">��������ծ�ϼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ52"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����������ʲ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ22"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">��ծ�ϼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ53"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����ʲ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ23"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">ʵ���ʱ�����ɱ���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ54"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����ʲ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ24"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">�ʱ�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ55"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����֧��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ25"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">��������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ56"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ26"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">ӯ�๫��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ57"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���ڴ�̯����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ27"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">δ��������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ58"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��������˰�ʲ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ28"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">������Ȩ��ϼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ59"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����������ʲ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ29"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">��ծ��������Ȩ��ϼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ60"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�������ʲ��ϼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ30"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;</font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ʲ��ܼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG02B/EG02BJ31"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;</font></td></tr>
		</table>
		<br/>
		</xsl:for-each>
		<!-- ��ҵ������������2002 �棩 -->
		<xsl:for-each select="EGA/EG03">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">��ҵ������������2002 �棩</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">���񱨱���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">��������ϸ��</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">��Ŀ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ĩֵ</font>
				</td>
			</tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫҵ������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ01"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����Ӫҵ�������Ŀ�£����ڲ�Ʒ��������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ02"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����Ӫҵ�������Ŀ�£����ڲ�Ʒ��������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ03"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����ۿ�������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ04"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫҵ�����뾻��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ05"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫҵ��ɱ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ06"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����Ӫҵ��ɱ���Ŀ�£����ڲ�Ʒ���۳ɱ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ07"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫҵ��˰�𼰸���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ08"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ09"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">������ҵ��ɱ���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ10"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ11"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">������������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ12"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���������룩</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ13"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫҵ������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ14"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����ҵ������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ15"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӫҵ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ16"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ17"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ18"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���������ã�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ19"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӫҵ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ20"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ͷ������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ21"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ڻ�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ22"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ23 "/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����������Ŀ�£�����ǰ�������ҵ��������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ24"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӫҵ������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ25"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫҵ�������Ŀ�£����ù̶��ʲ�������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ26"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫҵ�������Ŀ�£��ǻ����Խ�������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ27"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫҵ�������Ŀ�£����������ʲ�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ28"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫҵ�������Ŀ�£��������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ29"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ30"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��������Ŀ�£�����ǰ��Ⱥ������ʽ����ֲ�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ31"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӫҵ��֧��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ32"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫҵ��֧����Ŀ�£����ù̶��ʲ�����ʧ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ33"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫҵ��֧����Ŀ�£�ծ��������ʧ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ34"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫҵ��֧����Ŀ�£�����֧��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ35"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫҵ��֧����Ŀ�£�����֧��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ36"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����֧��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ37"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">������֧������ת�ĺ������ʰ��ɽ���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ38"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����ܶ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ39"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����˰</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ40"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����ɶ�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ41"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">δȷ�ϵ�Ͷ����ʧ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ42"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ43"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���δ��������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ44"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">ӯ�๫������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ45"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">������������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ46"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ɹ����������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ47 "/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�������õ�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ48"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���������ʱ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ49"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ȡ����ӯ�๫��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ50"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ȡ���������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ51"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ȡְ����������������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ52"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ȡ��������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ53"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ȡ��ҵ��չ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ54"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����黹Ͷ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ55"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���ɹ�����������Ŀ�£�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ56"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ɹ�Ͷ���߷��������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ57"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ�����ȹɹ���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ58"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ȡ����ӯ�๫��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ59"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ����ͨ�ɹ���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ60"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">ת���ʱ�����ͨ�ɹ���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ61"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���ɹ�Ͷ���߷���������Ŀ�£�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ62"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">δ��������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ63"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��δ���������Ŀ�£�Ӧ���Ժ����˰ǰ�����ֲ��Ŀ���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG03B/EG03BJ64"/></font></td></tr>
		</table>
		<br/>
		</xsl:for-each>
		<!-- ��ҵ������������2007 �棩 -->
		<xsl:for-each select="EGA/EG04">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">��ҵ������������2007 �棩</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">���񱨱���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">��������ϸ��</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">��Ŀ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ĩֵ</font>
				</td>
			</tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӫҵ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ01"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӫҵ�ɱ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ02"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӫҵ˰�𼰸���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ03"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���۷���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ04"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ05"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ06"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ʲ���ֵ��ʧ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ07"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���ʼ�ֵ�䶯������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ08"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ͷ�ʾ�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ09"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����Ӫ��ҵ�ͺ�Ӫ��ҵ��Ͷ������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ10"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӫҵ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ11"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӫҵ������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ12"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӫҵ��֧��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ13"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�������ʲ���ʧ�����У��������ʲ�������ʧ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ14"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����ܶ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ15"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����˰����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ16"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ17"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����ÿ������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ18"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">ϡ��ÿ������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG04B/EG04BJ19"/></font></td></tr>
		</table>
		<br/>
		</xsl:for-each>
		<!-- ��ҵ�ֽ�������2002 �棩 -->
		<xsl:for-each select="EGA/EG05">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">��ҵ�ֽ�������2002 �棩</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">���񱨱���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">��������ϸ��</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">��Ŀ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ĩֵ</font>
				</td>
			</tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">������Ʒ���ṩ�����յ����ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ01"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�յ���˰�ѷ���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ02"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�յ��������뾭Ӫ��йص��ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ03"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫ��ֽ�����С��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ04"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">������Ʒ����������֧�����ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ05"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">֧����ְ���Լ�Ϊְ��֧�����ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ06"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">֧���ĸ���˰��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ07"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">֧���������뾭Ӫ��йص��ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ08"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫ��ֽ�����С��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ09"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫ��������ֽ���������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ10"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ջ�Ͷ�����յ����ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ11"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">ȡ��Ͷ���������յ����ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ12"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���ù̶��ʲ������ʲ������������ʲ����ջص��ֽ𾻶�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ13"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�յ���������Ͷ�ʻ�йص��ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ14"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ͷ�ʻ�ֽ�����С��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ15"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����̶��ʲ������ʲ������������ʲ���֧�����ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ16"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ͷ����֧�����ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ17"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">֧����������Ͷ�ʻ�йص��ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ18"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ͷ�ʻ�ֽ�����С��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ19"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ͷ�ʻ�������ֽ���������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ20"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����Ͷ�����յ����ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ21"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">������յ����ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ22 "/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�յ�����������ʻ�йص��ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ23"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���ʻ�ֽ�����С��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ24"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����ծ����֧�����ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ25"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�������������򳥸���Ϣ��֧�����ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ26"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">֧������������ʻ�йص��ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ27"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���ʻ�ֽ�����С��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ28"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�Ｏ��������ֽ���������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ29"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���ʱ䶯���ֽ��Ӱ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ30"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ֽ��ֽ�ȼ��ﾻ���Ӷ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ31"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ32"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">������ʲ���ֵ׼��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ33"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�̶��ʲ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ34"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����ʲ�̯��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ35"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���ڴ�̯����̯��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ36"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��̯���ü���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ37"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ԥ���������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ38"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���ù̶��ʲ������ʲ������������ʲ�����ʧ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ39"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�̶��ʲ�������ʧ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ40"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ41"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ͷ����ʧ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ42"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����˰�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ43"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����ļ���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ44"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫ��Ӧ����Ŀ�ļ���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ45"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫ��Ӧ����Ŀ������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ46"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����������Ϊ��Ӫ��ֽ�������Ŀ�£�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ47"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫ��������ֽ���������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ48"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">ծ��תΪ�ʱ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ49"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">һ���ڵ��ڵĿ�ת����˾ծȯ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ50"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��������̶��ʲ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ51"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����漰�ֽ���֧��Ͷ�ʺͳ��ʻ��Ŀ�£�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ52 "/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ֽ����ĩ���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ53"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ֽ���ڳ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ54"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ֽ�ȼ������ĩ���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ55"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ֽ�ȼ�����ڳ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ56"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ֽ��ֽ�ȼ��ﾻ���Ӷ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG05B/EG05BJ57"/></font></td></tr>
		</table>
		<br/>
		</xsl:for-each>
		<!-- ��ҵ�ֽ�������2007 �棩 -->
		<xsl:for-each select="EGA/EG06">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">��ҵ�ֽ�������2007 �棩</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">���񱨱���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">��������ϸ��</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">��Ŀ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ĩֵ</font>
				</td>
			</tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">������Ʒ���ṩ�����յ����ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ01"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�յ���˰�ѷ���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ02"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�յ������뾭Ӫ��йص��ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ03"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫ��ֽ�����С��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ04"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">������Ʒ����������֧�����ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ05"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">֧����ְ���Լ�Ϊְ��֧�����ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ06"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">֧���ĸ���˰��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ07"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">֧�������뾭Ӫ��йص��ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ08 "/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫ��ֽ�����С��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ09"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫ��������ֽ���������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ10"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ջ�Ͷ�����յ����ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ11"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">ȡ��Ͷ���������յ����ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ12"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���ù̶��ʲ������ʲ������������ʲ����ջص��ֽ𾻶�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ13"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����ӹ�˾������Ӫҵ��λ�յ����ֽ𾻶�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ14"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�յ�������Ͷ�ʻ�йص��ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ15"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ͷ�ʻ�ֽ�����С��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ16"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����̶��ʲ������ʲ������������ʲ���֧�����ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ17"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ͷ����֧�����ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ18"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">ȡ���ӹ�˾������Ӫҵ��λ֧�����ֽ𾻶�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ19"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">֧��������Ͷ�ʻ�йص��ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ20"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ͷ�ʻ�ֽ�����С��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ21"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ͷ�ʻ�������ֽ���������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ22"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����Ͷ���յ����ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ23"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">ȡ�ý���յ����ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ24"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�յ���������ʻ�йص��ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ25"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���ʻ�ֽ�����С��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ26"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����ծ����֧�����ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ27"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�������������򳥸���Ϣ��֧�����ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ28"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">֧����������ʻ�йص��ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ29"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���ʻ�ֽ�����С��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ30"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�Ｏ��������ֽ���������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ31"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���ʱ䶯���ֽ��ֽ�ȼ����Ӱ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ32 "/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ֽ��ֽ�ȼ��ﾻ���Ӷ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ33"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ڳ��ֽ��ֽ�ȼ������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ34"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ĩ�ֽ��ֽ�ȼ������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ35"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ36"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ʲ���ֵ׼��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ37"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�̶��ʲ��۾ɡ������ʲ��ۺġ������������ʲ��۾�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ38"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����ʲ�̯��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ39"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���ڴ�̯����̯��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ40"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��̯���ü���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ41"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ԥ���������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ42"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���ù̶��ʲ������ʲ������������ʲ�����ʧ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ43"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�̶��ʲ�������ʧ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ44"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���ʼ�ֵ�䶯��ʧ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ45"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ46"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ͷ����ʧ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ47"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��������˰�ʲ�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ48"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��������˰��ծ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ49"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����ļ���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ50"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫ��Ӧ����Ŀ�ļ���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ51"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫ��Ӧ����Ŀ������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ52"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����������Ϊ��Ӫ��ֽ�������Ŀ�£�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ53"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫ��������ֽ���������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ54"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">ծ��תΪ�ʱ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ55"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">һ���ڵ��ڵĿ�ת����˾ծȯ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ56"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��������̶��ʲ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ57"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ֽ����ĩ���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ58"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ֽ���ڳ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ59"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ֽ�ȼ������ĩ���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ60"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ֽ�ȼ�����ڳ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ61"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ֽ��ֽ�ȼ��ﾻ���Ӷ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ62 "/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����漰�ֽ���֧��Ͷ�ʺͳ��ʻ��Ŀ�£�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG06B/EG06BJ63 "/></font></td></tr>
		</table>
		<br/>
		</xsl:for-each>
		<!-- ��ҵ��λ�ʲ���ծ��(1997 ��) -->
		<xsl:for-each select="EGA/EG07">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">��ҵ��λ�ʲ���ծ��(1997 ��)</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">���񱨱���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">��������ϸ��</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">��Ŀ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ĩֵ</font>
				</td>
			</tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ֽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ01"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���д��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ02"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ��Ʊ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ03"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ���˿�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ04"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ԥ���˿�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ05"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����Ӧ�տ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ06"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ07"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����Ʒ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ08"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����Ͷ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ09"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�̶��ʲ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ10"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����ʲ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ11"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ʲ��ϼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ12"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ13"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����ר��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ14"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">ר��֧��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ15"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ҵ֧��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ16"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫ֧��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ17 "/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ɱ�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ18"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����˰��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ19"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�Ͻ��ϼ�֧��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ20"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�Ը�����λ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ21"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ת�Գ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ22"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">֧���ϼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ23"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ʲ������ܼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ24"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ǿ���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ25"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ��Ʊ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ26"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ���˿�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ27"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ԥ���˿�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ28"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����Ӧ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ29"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ��Ԥ���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ30"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ�ɲ���ר����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ31"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ��˰��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ32"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ծ�ϼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ33"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ҵ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ34"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">һ�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ35"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ͷ�ʻ���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ36"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�̶�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ37"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">ר�û���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ38"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ҵ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ39"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ40"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���ʲ��ϼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ41"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">������������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ42"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ϼ���������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ43"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����ר��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ44"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ҵ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ45"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ46"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">������λ�ɿ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ47"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ48"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����ϼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ49"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ծ�����ܼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG07B/EG07BJ50 "/></font></td></tr>
		</table>
		<br/>
		</xsl:for-each>
		<!-- ��ҵ��λ�ʲ���ծ��(2013 ��) -->
		<xsl:for-each select="EGA/EG08">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">��ҵ��λ�ʲ���ծ��(2013 ��)</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">���񱨱���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">��������ϸ��</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">��Ŀ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ĩֵ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��Ŀ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ĩֵ</font>
				</td>
			</tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����ʽ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ01"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">���ڽ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ22"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����Ͷ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ02"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ��˰��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ23"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����Ӧ�������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ03"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ�ɹ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ24"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ��Ʊ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ04"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ�ɲ���ר����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ25"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ���˿�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ05"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ��ְ��н��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ26"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ԥ���˿�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ06"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ��Ʊ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ27"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����Ӧ�տ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ07"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ���˿�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ28"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ08"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">Ԥ���˿�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ29"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���������ʲ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ09"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">����Ӧ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ30"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����ʲ��ϼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ10"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">����������ծ</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ31"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����Ͷ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ11"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">������ծ�ϼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ32"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�̶��ʲ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ12"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">���ڽ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ33"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�̶��ʲ�ԭ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ13"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">����Ӧ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ34"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ۼ��۾�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ14"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">��������ծ�ϼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ35"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ڽ�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ15"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">��ծ�ϼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ36"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����ʲ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ16"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">��ҵ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ37"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����ʲ�ԭ��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ17"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">�������ʲ�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ38"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ۼ�̯��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ18"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">ר�û���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ39"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�������ʲ�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ19"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">����������ת</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ40"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�������ʲ��ϼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ20 "/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">������������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ41"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ʲ��ܼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ21"/></font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">�ǲ���������ת</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ42"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">�ǲ�����������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ43"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">��ҵ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ44"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ45"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">���ʲ��ϼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ46"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">��ծ�;��ʲ��ܼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG08BJ47 "/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">δ��������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG02BJ58"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">������Ȩ��ϼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG02BJ59"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;</font></td><td height="25px" align="left"><font style="font-size: 12.0pt;">��ծ��������Ȩ��ϼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG08B/EG02BJ60"/></font></td></tr>
		</table>
		<br/>
		</xsl:for-each>
		<!-- ��ҵ��λ����֧����1997 �棩 -->
		<xsl:for-each select="EGA/EG09">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">��ҵ��λ����֧����1997 �棩</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">���񱨱���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">��������ϸ��</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">��Ŀ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ĩֵ</font>
				</td>
			</tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">������������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ01"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ϼ���������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ02"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">������λ�ɿ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ03"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ҵ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ04"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ԥ�����ʽ�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ05"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ06"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ҵ����С��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ07"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ08"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫ����С��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ09"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����ר��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ10"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����ר��С��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ11"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����ܼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ12"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ13"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�Ͻ��ϼ�֧��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ14"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�Ը�����λ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ15"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ҵ֧��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ16"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��������֧��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ17"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ԥ�����ʽ�֧��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ18"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����˰��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ19"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ת�Գ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ20 "/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ҵ֧��С��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ21"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫ֧��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ22"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����˰��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ23"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫ֧��С��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ24"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����ר��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ25"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">ר��֧��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ26"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">ר��С��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ27"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">֧���ܼ�</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ28"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ҵ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ29"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ30"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ջ���ǰ�����ҵ֧��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ31"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ32"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ǰ��Ⱦ�Ӫ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ33"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ34"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ������˰</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ35"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ȡר�û���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ36"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">ת����ҵ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ37"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG09B/EG09BJ38"/></font></td></tr>
		</table>
		<br/>
		</xsl:for-each>
		<!-- ��ҵ��λ����֧����2013 �棩 -->
		<xsl:for-each select="EGA/EG10">
		<table bgcolor="" width="1000pt" align="center" border="0" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="left">
					<font style="font-size: 14.0pt;font-weight:bold;">��ҵ��λ����֧����2013 �棩</font>
				</td>
			</tr>
		</table>
		<table bgcolor="" width="1000pt" align="center" border="1" cellspacing="0" cellpadding="5">
			<tr style="line-height:20px">
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">���񱨱���</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">ҵ������������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">�������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">��������</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 14.0pt;font-weight:bold;">��������ϸ��</font>
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
					<font style="font-size: 12.0pt;font-weight:bold;">��Ŀ</font>
				</td>
				<td height="25px" align="center" class="tdStyle">
					<font style="font-size: 12.0pt;font-weight:bold;">��ĩֵ</font>
				</td>
			</tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���ڲ���������ת����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ01"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">������������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ02"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ҵ֧������������֧����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ03"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">������ҵ��ת����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ04"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ҵ������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ05"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ҵ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ06"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ϼ���������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ07"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">������λ�Ͻ�����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ08"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ09"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�����������Ŀ�£���������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ10"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ҵ��֧��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ11"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ҵ֧�����ǲ�������֧����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ12"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�Ͻ��ϼ�֧��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ13"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�Ը�����λ����֧��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ14"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����֧��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ15"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">���ھ�Ӫ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ16"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ17"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��Ӫ֧��</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ18"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ֲ���ǰ��ȿ����ľ�Ӫ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ19"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����ǲ���������ת����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ20"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">�ǲ���������ת</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ21"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">����ǲ�����������</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ22"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">Ӧ����ҵ����˰</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ23"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">��ȡר�û���</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ24"/></font></td></tr>
			<tr style="line-height:20px"><td height="25px" align="left"><font style="font-size: 12.0pt;">ת����ҵ����</font></td><td height="25px" align="center"><font style="font-size: 12.0pt;">&#160;<xsl:value-of select="EG10B/EG10BJ25"/></font></td></tr>
		</table>
		<br/>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
