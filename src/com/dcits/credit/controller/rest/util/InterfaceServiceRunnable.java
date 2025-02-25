package com.dcits.credit.controller.rest.util;

import com.dcits.crawl.service.IndAppReview.CrawlIndAppReManager;
import com.dcits.credit.entity.XmlMapEntity;
import com.dcits.credit.service.EnterAppReview.EntAppReManager;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.dataSubmission.IDataSubmissionService;
import com.dcits.credit.util.CompressUtils;
import com.dcits.credit.util.XmlParseUtil;
import com.dcits.credit.wsimport.IServiceUtil;
import com.dcits.platform.util.*;
import org.apache.commons.codec.binary.Base64;
import org.apache.log4j.Logger;

import java.io.File;
import java.util.List;

/**
 * 接口实现类
 */
public class InterfaceServiceRunnable implements Runnable {

    private static Logger logger = Logger.getLogger(InterfaceServiceRunnable.class);
    private static String encoding = "UTF-8";
    private PageData queryData;
    private String authType;
    private IndAppReManager indAppReService;
    private EntAppReManager entAppReService;
    private IDataSubmissionService iDataSubmissionService;
    private CrawlIndAppReManager crawlIndAppReService;

    public InterfaceServiceRunnable(PageData pd, String authType, IndAppReManager indAppReService, EntAppReManager entAppReService,
                                    IDataSubmissionService iDataSubmissionService, CrawlIndAppReManager crawlIndAppReService) {
        this.queryData = pd;
        this.authType = authType;
        this.indAppReService = indAppReService;
        this.entAppReService = entAppReService;
        this.iDataSubmissionService = iDataSubmissionService;
        this.crawlIndAppReService = crawlIndAppReService;
    }

    public void run() {
        queryReportAndSave();
    }

    public void queryReportAndSave() {
        long date = System.currentTimeMillis();
        String report_id = null;
        String xml = null;
        String id = queryData.getString("ID");
        String path = PathUtil.getClasspath() + Const.FILEPATHIMG;
        try {
            //拼接请求报文
            PageData data = indAppReService.getQueryInfo(queryData);
            PageData pdtmp =new PageData();
            try {
    			pdtmp.put("ISWHITE", "1");
    			List<PageData> listPd = indAppReService.getCREDITNUM(pdtmp);
    			if(!listPd.isEmpty()){
    				data.put("USERNAME_PERBANK", listPd.get(0).get("CREDIT_CODE"));
    				data.put("PASSWORD", listPd.get(0).get("CURRENT_PASSWORD"));
    			}else{
    				logger.error("there has no valide USERNAME !");
    				return ;
    			}
    		} catch (Exception e) {
    			logger.error("get USERNAME has error: "+ e.getMessage());
    		}
//            data.put("USERNAME_PERBANK", "HFRZ_JKCX");
//            data.put("PASSWORD", "QWExMjM0NTY=");
            queryData.put("REQ_REPORT", RequestReportUtil.getPerRequest(data));
            queryData.put("QUERY_NAME", data.getString("NAME"));
            logger.debug("USERNAME:" + data.getString("NAME"));
            //查询征信报告并报送
            xml = queryReport(queryData, authType, indAppReService, iDataSubmissionService);
        } catch (Exception e) {
            //查询失败
            queryData.put("STATUS", "04");
            indAppReService.updateStatus(queryData); //更新查询状态
            logger.error("【去人行webservice接口查询报告异常】", e);
        }
        if (xml == null) {
            return;
        }
        logger.debug("Feedback message: " + xml);

        PageData pd = null;
        try {
            pd = XmlParseUtil.xmlToPd(xml, authType);
            //数据单独入库方法 返回report_id后面要用到
            report_id = getReportId(pd);
        } catch (Exception e) {
            logger.error("获取接口报文reportId异常：", e);
        }
        String xmlPath = path + id + "/" + id + ".xml";
        boolean isExist = false;//是否查无此人
        if (!"AAA001".equals(xml)) {
            isExist = true;
            //数据入库
            try {
                PageData pdbody = new PageData();
                pdbody.put("ID", queryData.getString("ID"));
                pdbody.put("QUERY_NO", queryData.getString("QUERY_NO"));
                pdbody.put("BODY", Base64.encodeBase64String(xml.getBytes()));
                crawlIndAppReService.saveBody(pdbody);
                //更新信息表中状态：06-报告生成
                CompressUtils.updateStatus("06", entAppReService, indAppReService, id, report_id, ("1".equals(authType) ? true : false));
            } catch (Exception e) {
                XmlMapEntity.xmlMap.remove(queryData.getString("ID"));
                logger.info("异常情况移除xml:" + queryData.getString("ID"));
                logger.error("数据落库出错，", e);
            }
            try {
                File f = new File(path + id);
                f.mkdir(); //创建目录
            } catch (Exception e) {
                logger.error("创建目录失败!", e);
            }
            //生成xml报告
            FileUtil.writeFile(xmlPath, xml, encoding);
            //报告存放本地，将本地报告加密加压保存
            String fileName = id + ".zip"; //ftp服务器存放报告的文件名
            String localFilePath = path + fileName; //压缩文件路径
            String zipPasswd = id.substring(0, 6);
            CompressUtils.zip(path + id + "/", localFilePath, true, zipPasswd);
            delFile(path + id); //删除存放人行返回xml和html的页面。
        }
        if (!isExist) {//查无此人
            CompressUtils.updateStatus("05", entAppReService, indAppReService, id, report_id, ("1".equals(authType) ? true : false));
            return;
        }
        logger.debug("此次查询报告用时" + ((System.currentTimeMillis() - date) / 1000) + "秒");
    }

    public String getReportId(PageData pd) {
        String report_id = null;
        for (Object obj : pd.keySet()) {
            String tab_name = (String) obj;
            Object tab_val = pd.get(tab_name);
            if (tab_val instanceof PageData) {
                PageData data = (PageData) tab_val;
                if (report_id == null) {
                    report_id = data.getString("REPORT_ID");
                }
            }
        }
        return report_id;
    }

    /**
     * 删除文件
     *
     * @param path
     */
    private void delFile(String path) {
        try {
            if (!StringUtil.isEmpty(path)) {
                File file = new File(path);
                if (file.exists()) {
                    if (file.isFile()) {
                        file.delete();
                    } else if (file.isDirectory()) {
                        File[] arrFile = file.listFiles();
                        for (File fi : arrFile) {
                            delFile(fi.getAbsolutePath());
                        }
                        file.delete();
                    }
                }
            }
        } catch (Exception e) {
            logger.error("IndAppReController.delFile方法出错", e);
        }
    }

    /**
     * 通过人行接口查询请求数据
     *
     * @param authType 1-个人
     * @return
     * @throws Exception
     */
    private String queryReport(PageData queryData, String authType, IndAppReManager indAppReService, IDataSubmissionService iDataSubmissionService) throws Exception {
        //请求报文
        String requestXml = queryData.getString("REQ_REPORT");
        //人行返回报文
        String reponseXml = null;
        String flow_id = queryData.getString("ID");
        PageData pdXmlMain = new PageData();
        if ("1".equals(authType)) {
            reponseXml = IServiceUtil.queryReport(requestXml, "D101");
            pdXmlMain = RequestReportUtil.parseXml(reponseXml, flow_id);
        } else {
            throw new Exception("参数客户类型不正确！");
        }
        logger.info("人行返回报文" + reponseXml);
        //报送
        try {
            boolean report = indAppReService.findQueryType("REPORTTYPE");
            if (report) {
                iDataSubmissionService.sendSubmissionData(queryData.getString("ID"), authType);
            }
        } catch (Exception e) {
            logger.error("报文报送异常!", e);
        }
        //根据查询结果代码处理查询结果
        String resultCode = pdXmlMain.getString("ResultCode");
        if ("AAA000".equals(resultCode)) {
            //查询成功
            indAppReService.updateResult(pdXmlMain);
            return pdXmlMain.getString("ReportMessage");
        } else if ("AAA001".equals(resultCode)) {
            //处理成功，但无查询结果
            pdXmlMain.put("STATUS", "05");
            indAppReService.updateStatus(pdXmlMain);
            return "AAA001";
        } else {
            //查询失败
            pdXmlMain.put("STATUS", "04");
            indAppReService.updateStatus(pdXmlMain); //更新查询状态
            indAppReService.updateResult(pdXmlMain); //更新查询结果
        }
        return null;
    }

}
