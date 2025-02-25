package com.dcits.credit.clawer;

import java.io.FileReader;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.script.Invocable;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;

import com.dcits.platform.util.Logger;
import org.jsoup.Connection.Method;
import org.jsoup.Connection.Response;

import com.dcits.credit.clawer.util.Util;

import net.sf.json.JSONObject;



/**
 * 由登录界面进入到信用报告查询界面
 * @author zhangyy
 *
 */
public class WebCrawler {

	private static Logger logger = Logger.getLogger(WebCrawler.class);
	public static void main(String[] args){
		getByJsoup();
	}
	//jsoup方式
	private static String getByJsoup(){
		/**进入登录界面*/
		String url="";
		String status="";
		String message="";
		Response response = null;
		Response response1 = null;
		Map<String, String> cookies = new HashMap<String, String>();
		Map<String, String> map = new HashMap<String, String>();
		Map<String, String> map1 = new HashMap<String, String>();
		Map<String, String> map2 = new HashMap<String, String>();
		try{
//			map.put("userid", pd.getString("CREDIT_ACCT"));
//			map.put("password",pd.getString("PASSWORD"));
//			map.put("B1","%B5%C7++%C2%BC");	
//			map.put("isDissentLogin", "null");
			map.put("local_cpu", "466CFA415BED933DBFC56F6CC83E419DB34219D6D44E35AA98F9092A76A3DB21D50CD64BBB82172D2104ADF21E2024369AB239102A0B4F96C259DAED6B838FA74489072C110B885C9B192F4A53928567185206EE65D3845FA7FEDFC82D0DF91ED69042A2995CB1FEB882086DBDCD16BA3C23E4BED00B76F1563D78F677C1C4ADE660B8F489DC472E2CC15333BB739743A2AD68C90061F401650AF7E26FCB2217867B19CEC5473BD22A555AEA0C6B16C2");
			map.put("local_disk", "DB0DFBCB83A974AD3964E54A31D50346E3C6AC01A9A18421F0606AB3A7743F6938AED2E784DA7F64A286173237E92F9E42B69EA1AAD6608D76E5F0C699B124D46E8A5040AC1AEF187B1A498F4D25AFAC69C559BD907F912F929E3C4D793CF15810D066734A7BD2E968A8E47609E62D18AF6D8A0F1C39CD9C06856EEC257C633EA6A40656F1CE7EF9E8A5745ED802C0D68382A1243D15B7CD30E3EB2D3EB893B2");
			map.put("local_network", "9B4CB1428EF4C3266862889AF808F7D29653DFE01D26F8954AE92B442F02D59647B770A90A8540489C125D9F12AE62222E577F027F1C719104C21FA31BDC4D1A3C288F5652EECD17544BE8CC590AFC043CF16E1C69FD7998067D4E3A73C2837A2A4F376F89567A8784734A452B243394EEA29775F831A8E14389C6722B2A390D545F30E36C6A74CE4AF361E285E74423");
			map.put("password", "DAC096F464910A6D2454C6525A47293300595E61814AEBBC8D01471842EEA87E786A5D13F7BEFA8360E8A9E4A610C8FD1B21F770A299EBAD1F5594F2E8E21C67A68F4007CB4E531AE8060C9C7F59E9966F152D6FF26937873FD1DFB50207EAEE8D880A6AF5FAF68AD01218EAD1929C74445EBC0C27A35E153E0352D496011320");
			map.put("username", "TBOXA_001089");
			
//			map.put("local_cpu", "9A2B8EA5FE983518CF670F2117BF24A4011F96077C54CCECB41CA54CAB0BB0E3BEACF9D957005F5A80D4975850355B8FE64FDC56490AD16F6BA5E9DD802D44E82754FBB8F375AD77572CF0B628250AAA2C9EFC583B9D5264FAF97FA0269B0B9B8D9E73D9A46BE46836E1BA74AF67348AF24CFF50C69CFC86AB9669555E18E79829C6DAFC715B739E6C19FD86B442BDC973A17E1280D22E5CEA6F24A3F8740AD2EE4B411B6CE19B10D634EB8B660D1D35");
//			map.put("local_disk", "0B4A2BFA2E2F75442FC86CC07C4E788CF8469DF98185D0F87290E4CF2A232FF9F9742F9D264A97F1B51590979690DE07C76F94C4A7FA5E958774735ED05B5334E111BEF8A986F7B10B64C3A3519A007DDC90CF57348B15886FC60D99F858AB345AD546ACD53E5A98DA907AA55F8791278ABA588C81C33D8FA0236179460E59624B79779C7C79183FD48D9F275268CC63959C1D0B28D079DD233FD0A0C29383DB");
//			map.put("local_network", "2FDB435FE6AE2FDD04F02B4F31F0FF28281FBE193D58F815115052F35E2C1BE5B63CAE4D0E5F457C9D2E4C893835ED69E2F9269B69DF2346D23DAB2BAAA9B936A152471AC39F429F3D8DA3B767D47BC44D7A92BEA64CA4DA8462B07E3309A0515DAA6B1BB26B9C086DE8075F04DE2C05BF1318AA8ED05DA2D6B5395E4A7ADAF117150BEF75208EE5338AB2099222CD51");
//			map.put("password", "30157B6D6F2EDE9C3897CA3C88FF4D65C2BA4BB1F788D776D81DF691278DB14A25A7AAB107B3867F64AF8B22DAE2C5E573821630FBCDDB184306A251E8B4A9466517A61054AC8C54C0EE444DCAEACEA25ECE92E5F5939B61871205B5AA2261DC9C2D4F8E40012F17BAC12002960F7D852EC8B3EF8A00F9B7AD9261F02482F1C7");
//			map.put("username", "XAGLYGRB_261001");
//			url = "http://21.5.250.1/creditreferencetest/index.html";
//			url = "http://21.5.250.1/creditreferencetest/v2/test/web-bank-manage/auth/login.do?t="+new Date().getTime();			
			response = Util.queryContentOfCharset(url, map, cookies,Method.POST,"UTF-8");
			cookies = response.cookies();
			
			url = "http://21.5.250.1/creditreferencetest/v2/test/web-bank-manage/personDir/queryCreditReportAjax.action";
			map1.put("backUrl","/creditreferencetest/v2/test/web-bank-manage/personDir/personDirQueryPage.action");
			map1.put("reportVersion","2462728429062106112");
			map1.put("reportFormat","2492639467605691392");
			map1.put("certName","张某某");
			map1.put("certTypeID","1014691");
			map1.put("certNum","11010819931010444X");
			map1.put("queryReasonID","3007753");
			map1.put("声明","on");
			map1.put("csrfToken","MOW2Kl0eV6S3");
			map1.put("serviceID","");
			
			response = Util.queryContentOfCharset(url, map1, cookies,Method.POST,"UTF-8");
			JSONObject json =  JSONObject.fromObject(response.body());
				
			url = "http://21.5.250.1/creditreferencetest/v2/test/web-bank-manage/personDir/viewReport.action?fileID="+json.getString("fileID");
			map2.put("fileID", json.getString("fileID"));
			response1 = Util.queryContentOfCharset(url, map2, cookies,Method.POST,"UTF-8");
			logger.debug(response1.body());
//			cookies = response1.cookies();
//			System.out.println(cookies);
			
			//			JSONObject job = new JSONObject();
//			job.put("id", "value"+new Date().getTime()+1);
//			job.put("interfacetype", "2");
//			JSONObject data = new JSONObject();
//			data.put("datatype", "900");
//			data.put("encrypttype", "0");
//			job.put("data", data);
//			String pgeRZRandNum = "76455339100848309353216803064083";
//			
//			pgeGetEnStr();
			
			
			
			/*url = "http://21.5.250.1/creditreferencetest/v2/prod/web-bank-manage/auth/login.do?t=0.7208007404829242";
			response = Util.queryContentOfCharset(url, map, cookies,Method.POST,"UTF-8");
			System.out.println(response.body());
			//logger.info(response.body());
			if(response.statusCode() != 200){
				status="04";
				logger.info("登录系统时,网络请求异常" + response.statusCode());
				message="04";
				return message;
			}*/
		}catch (Exception e){
			status="04";
			logger.error(e.getMessage(),e);
			logger.info("登录页加载或登录页提交失败，登录失败");
			message="04";
			return message;
		}
		return message;	
	}
	
	public static void pgeGetEnStr() throws Exception{
		ScriptEngineManager manager = new ScriptEngineManager();
		ScriptEngine engine = manager.getEngineByName("javascript");
		String jsFileName = "C:\\Users\\Administrator\\Desktop\\PassGuardCtrl.js";
		//String jsFileN = "C:\\Users\\Administrator\\Desktop\\crypto-js.js";
		FileReader reader = new FileReader(jsFileName);
		//FileReader rd = new FileReader(jsFileName);
		engine.eval(reader);
		//engine.eval(rd);
		if (engine instanceof Invocable) {
			Invocable invoke = (Invocable)engine;
			logger.debug(invoke.invokeFunction("pwdResultSM"));;
		}
		/*int[] neiKey = new int[]{0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x1A, 0x2A, 0x2B,
				0x2C, 0x2D, 0x2E, 0x2F, 0x3A, 0x3B, 0x11, 0x22, 0x33, 0x44, 0x55,
				0x66, 0x77, 0x1A, 0x2A, 0x2B, 0x2C, 0x2D, 0x2E, 0x2F, 0x3A, 0x3B};
		   	String fkey = "";
		   	String  lx = "";
		   	for ( int i = 0; i < sKey.length(); i++) {
		   		lx = ""+(char)((int)sKey.charAt(i) ^ (int)neiKey[i]);
		   		fkey += lx;
		   	}
		   	String hexKey = CryptoJS.enc.Utf8.parse(fkey);
		   	String enStr = CryptoJS.AES.encrypt(JSON.stringify(jsonStr), hexKey, {
		   		mode : CryptoJS.mode.ECB,
		   		padding : CryptoJS.pad.Pkcs7
		   	});
		   	return enStr.toString();*/
		   }
	
	//多次加载报告
	public static Response getRequest(String url,Map<String, String> cookies,Method med,String charset){
		Response response = null;
		try{
			response = Util.queryContentByGet(url,cookies,Method.GET,"GBK");
			if(response.statusCode() != 200){
				response = Util.queryContentByGet(url,cookies,Method.GET,"GBK");
				if(response.statusCode() != 200){
					response = Util.queryContentByGet(url,cookies,Method.GET,"GBK");
				}
			}
		}catch(Exception e){
			logger.error("报告页跳转时,网络请求异常"+e.getMessage(),e);
		}
		return response;
	}
	
}
