package com.dcits.crawl.util;

import java.io.IOException;
import java.nio.charset.Charset;
import java.security.cert.X509Certificate;

import org.apache.log4j.Logger;

import com.dcits.platform.controller.base.BaseController;

import com.dcits.platform.util.PageData;
import cn.com.infosec.netsign.agent.NetSignAgent;
import cn.com.infosec.netsign.agent.NetSignResult;
import cn.com.infosec.netsign.agent.NetSignService;
import cn.com.infosec.netsign.agent.PBCAgent;
import cn.com.infosec.netsign.agent.PBCAgent2G;
import cn.com.infosec.netsign.agent.exception.NetSignAgentException;
import cn.com.infosec.netsign.agent.exception.ServerProcessException;

public class NetSignUtil {
	
	private static Logger logger = Logger.getLogger(NetSignUtil.class);

	public static void main(String[] args) {

/*		boolean in = NetSignUtil.init();
		System.out.println(in);
		if(in){
			PageData pd = new PageData();
			pd.put("reportMessage", "征信测试");
			pd.put("subject", "CN=041@Z313791000015@xacbank@00000001,OU=Enterprises,OU=CNAPS,O=CFCA TEST CA,C=cn");
			NetSignUtil.generateBondMsgSign(pd);
		}*/
	}

	/**
	 * detached方式--单笔查询--webService
	 * @param pd
	 * @return String
	 */
	public static String detachedSign(PageData pd){
		String signTextBase64 = "";
		try {
			//获取拼接好的报文头+报文头
			String reportMessage = pd.getString("reportMessage");
			byte[] plainText = reportMessage.getBytes();
			//获取签名证书DN，null表示服务器默认证书进行签名
			String subject = pd.getString("subject");
			//摘要算法，null表示服务器默认的摘要算法
			String digestAlg = null;
			//是否做TSA签名
			boolean useTSA = false;
			//签名
			NetSignResult result = NetSignAgent.detachedSignature(plainText, subject, digestAlg, useTSA);
			signTextBase64 = result.getStringResult(NetSignResult.SIGN_TEXT);
		} catch (NetSignAgentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServerProcessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return signTextBase64;
	}
	
	public static String generateBondMsgSign2(PageData pd) throws IOException{
		PageData serverInfo=new PageData();
		serverInfo = BaseController.getServerInfo();
		String signTextBase64 = "";
		try {
			//获取拼接好的报文头+报文头
			String reportMessage = pd.getString("reportMessage");
			byte[] plainText = reportMessage.getBytes("utf-8");
			//获取签名证书DN，null表示服务器默认证书进行签名
			String subject = pd.getString("subject");
//			boolean  useTSA = false ;
//			String digestAlg = null ;
			//签名
			PBCAgent2G pBCAgent2G = new PBCAgent2G();
			pBCAgent2G.openSignServer(serverInfo.getString("SIGN_IP"),Integer.valueOf(serverInfo.getString("SIGN_PORT")),serverInfo.getString("SIGN_PASSWORD"));
			pBCAgent2G.setTimeout(60000);
//			PBCAgent2G.setConnectionMode(1);
			signTextBase64 = pBCAgent2G.dettachedSign(plainText, subject);
		}	catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			logger.info(e);
		}
		return signTextBase64;
	}
	
	/**
	 * 底层使用  NetSignAgent.PBCDetachedSignature()方法
	 * @param pd
			
	 * @return
	 */
	public static String generateBondMsgSign(PageData pd){
		String signTextBase64 = "";
		try {
			//获取拼接好的报文头+报文头
			String reportMessage = pd.getString("reportMessage");
			byte[] plainText = reportMessage.getBytes();
			//获取签名证书DN，null表示服务器默认证书进行签名
			//CN=041@Z313791000015@xacbank@00000001,OU=Enterprises,OU=CNAPS,O=CFCA TEST CA,C=cn
			String subject = pd.getString("subject");
			boolean  useTSA = false ;
			String digestAlg = null ;
			//签名
			NetSignResult result = PBCAgent.generateBondMsg(plainText, subject);
//			NetSignResult result = NetSignAgent.detachedSignature(plainText , subject , digestAlg , useTSA ) ;
			signTextBase64 = result.getStringResult(NetSignResult.SIGN_TEXT);
//			// base64编码的签名
//			String signedText = subject;
//			// base64编码的TSA
//			String tsaText = null;
//			// 是否需要返回签名证书
//			boolean needCert = false;
//			// 验签名
//			NetSignResult results = NetSignAgent.attachedVerify( signedText , tsaText ,
//							needCert );
//			// 签名原文
//			result.getByteArrayResult(NetSignResult.PLAIN_TEXT);
//			// 签名证书主题
//			result.getStringResult( NetSignResult.SIGN_SUBJECT );
//			// 签名证书颁发者主题为
//			result.getStringResult( NetSignResult.SIGN_ISSUER_SUBJECT );
//			// 签名证书序列号为
//			result.getStringResult( NetSignResult.SIGN_SER_NUMBER );
//			// 签名证书起始时间为
//			result.getStringResult( NetSignResult.SIGN_START_TIME );
//			// 签名证书终止时间为
//			result.getStringResult( NetSignResult.SIGN_END_TIME );
//			// 签名证书
//			X509Certificate cert = ( X509Certificate ) result
//				.getResult( NetSignResult.SIGN_CERT );

		} catch (NetSignAgentException e) {
			// TODO Auto-generated catch block
			System.out.println( "errorCode:" + e.getErrorCode() );
			System.out.println( "errorMsg:" + e.getMessage() );
			e.printStackTrace();
		}	catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			logger.info(e);
		}
		return signTextBase64;
	}
	
	public static boolean init() {
		boolean ret=true;
		try {
			PageData paramsPd = BaseController.getPropertiesByFileName("netSign.properties");
			String[] ips = paramsPd.getString("ServerIP").split(",");
			int serverCount = ips.length;
			String[] ports1 = paramsPd.getString("ServerPort").split(",");
			String[] pwds = paramsPd.getString("ServerPWD").split(",");
			String[] threads1 = paramsPd.getString("ServerThread").split(",");
			String[] timeouts1 = paramsPd.getString("ServerTimeout").split(",");
			
			int[] ports = new int[serverCount];
			int[] threads = new int[serverCount];
			int[] timeouts = new int[serverCount];

			for (int i = 0; i < serverCount; i++) {
				ports[i] = Integer.parseInt(ports1[i]);
				threads[i] = Integer.parseInt(threads1[i]);
				timeouts[i] = Integer.parseInt(timeouts1[i]);
			}
			NetSignService[] services = new NetSignService[serverCount];
			for (int i = 0; i < serverCount; i++) {
				logger.info("IP:"+ips[i]+"PORT:"+ports[i]+"PWD:"+pwds[i]);
				services[i] = NetSignService.getInstance(ips[i], ports[i],pwds[i]);
				// 设置连接签名服务器的超时时间,默认为1分钟
				services[i].setTimeout(timeouts[i]);
				// 设置线程池大小，默认为50个
				services[i].setPoolSize(threads[i]);
			}
			//初始化
			logger.info("数字签名线程池开始初始化。。。");
			int result = PBCAgent.initialize(services);
			logger.info("数字签名线程池初始化完成。。。");
			if (result > -1) {
				logger.info("初始化结果："+ret);
			} else {
				ret=false;
				logger.info("初始化结果："+ret);
			}
		} catch (Exception e) {
			ret=false;
			logger.info("初始化结果异常："+ret);
		}
		return ret;
	}
}
