package com.dcits.credit.schedul;

import com.dcits.credit.controller.ceshi.SchedulerTask;
import com.dcits.credit.controller.creditAcctManage.PwdExpireRemindController;
import com.dcits.credit.controller.rest.util.RequestReportUtil;
import com.dcits.credit.service.IndAppReview.IndAppReManager;
import com.dcits.credit.service.creditAcctManage.PwdExpireRemindManager;
import com.dcits.credit.util.PasswordOper;
import com.dcits.credit.util.ReportUtil;
import com.dcits.credit.util.sm3.SM3Digest;
import com.dcits.credit.wsimport.IServiceUtil;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.Logger;
import com.dcits.platform.util.PageData;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;

public class QuartzModifypwd extends BaseController implements Job {
    protected Logger logger = Logger.getLogger(this.getClass());

    @Autowired
    private IndAppReManager indAppReService;
    @Autowired
    private SchedulerTask schedulerTask;
    @Resource(name="PwdExpireRemindService")
    private PwdExpireRemindManager pwdExpireRemindService;
    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
    	logger.error("BIGIN START UPDATE PWD MUNANS");
    	schedulerTask.updatePwd();
//        Map<String, String> map = new HashMap<>();
//        PageData data = getPropertiesByFileName("dbconfig-sense.properties");
//        //获取密码过期剩余天数
//        String expiresNum = String.valueOf(data.get("expiresNum"));
//        map.put("EXPIRES_NUM",expiresNum);
//        List<PageData> list = new ArrayList<>();
//        try {
//            //查询过期剩余天数下所有账号
//            list = pwdExpireRemindService.queryExpireAccount(map);
//            if(!CollectionUtils.isEmpty(list)){
//                for (PageData pageData:list) {
//                    String creditCode = String.valueOf(pageData.get("CREDIT_CODE"));
//                    //更新人行用户密码
//                    String flag = updatePwd(creditCode);
//                    logger.debug(flag);
//                }
//            }
//        } catch (Exception e) {
//            logger.error(e.getMessage(),e);
//        }
    }

    /**
     * 修改用户密码
     * @param CREDIT_CODE
     * @return
     */
    public String updatePwd(String CREDIT_CODE){
        PageData pd =new PageData();
        String Str= "密码修改失败";
        pd.put("USERNAME", CREDIT_CODE);//用户名
        pd.put("NEW_PASSWORD", new PwdExpireRemindController().randomPWD());//新密码
        PageData pwdInfo;
        try {
            pwdInfo = indAppReService.findPerbankInfo(pd);
            pd.put("CURRENT_PASSWORD", PasswordOper.decode(pwdInfo.getString("CURRENT_PASSWORD")));
            PageData sqlPd = new PageData();
            String sql = "SELECT VALUE from SERVER_MESSAGE_INFO  WHERE CODE = 'PER_QueryOrgCode'";
            sqlPd.put("selectSql", sql);
            PageData QUERY_ORG_CODE =indAppReService.selectPdInfo(sqlPd);
            sql = "SELECT VALUE from SERVER_MESSAGE_INFO  WHERE CODE = 'RECE_ORG_CODE'";
            sqlPd.put("selectSql", sql);
            PageData RECE_ORG_CODE = (PageData) indAppReService.selectPdInfo(sqlPd);

            //拼接修改密码请求报文
            StringBuffer strBuf = new StringBuffer();
            strBuf.append(ReportUtil.headInfo(QUERY_ORG_CODE.getString("VALUE"),RECE_ORG_CODE.getString("VALUE"),"L101"));
            strBuf.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
            strBuf.append("<Document>");
            strBuf.append("<Head>");
            strBuf.append("<QueryOrgCode>"+QUERY_ORG_CODE.getString("VALUE")+"</QueryOrgCode>");
            strBuf.append("<UserCode>"+pd.getString("USERNAME")+"</UserCode>");
            strBuf.append("<Password>"+ SM3Digest.SM3OfUpper(pd.getString("CURRENT_PASSWORD"))+"</Password>");
            strBuf.append("</Head>");
            strBuf.append("<Msg>");
            strBuf.append("<UserCode>"+pd.getString("USERNAME")+"</UserCode>");//用户账号
            strBuf.append("<OPassword>"+pd.getString("CURRENT_PASSWORD")+"</OPassword>");//旧密码
            strBuf.append("<NPassword>"+pd.getString("NEW_PASSWORD")+"</NPassword>");//新密码
            strBuf.append("</Msg>");
            strBuf.append("</Document>");
            strBuf.append("{S:"+ReportUtil.numSignature(strBuf.toString())+":S}"); //数字签名
            logger.info("***********修改密码请求报文***********");
            logger.info(strBuf.toString());
            String reponseXml = IServiceUtil.queryReport_UpdatePwd(strBuf.toString());
            logger.info("***********密码修改完成返回报文***********");
            logger.info(reponseXml);
            PageData reponsePd = RequestReportUtil.parseXml_updPwd(reponseXml);
            if(reponsePd!=null){
                PageData resultPd = new PageData();
                String date =new SimpleDateFormat("yyyyMMdd").format(new Date());
                resultPd.put("UPDATE_TIME",date);//修改时间
                resultPd.put("USERNAME", pd.getString("USERNAME"));
                resultPd.put("RESULTCODE", reponsePd.getString("ResultCode"));
                resultPd.put("RESULTDESC", reponsePd.getString("ResultDesc"));
                Str = reponsePd.getString("ResultDesc");
                if(reponsePd.getString("ModifResultCode")!=null){
                    resultPd.put("MODIFRESULTCODE", reponsePd.getString("ModifResultCode"));
                    if(("0").equals(reponsePd.getString("ModifResultCode"))){
                        resultPd.put("PREVIOUS_PASSWORD", PasswordOper.encode(pd.getString("CURRENT_PASSWORD")));//之前的密码
                        resultPd.put("CURRENT_PASSWORD", PasswordOper.encode(pd.getString("NEW_PASSWORD")));//新密码
                        resultPd.put("ERRDESC", null);
                        indAppReService.updatePerbankInfo(resultPd);//更新perbank表信息
                        //更新CIFM_CREDIT_ACCT_MANAGE表密码信息
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
                        Calendar rightNow = Calendar.getInstance();
                        rightNow.add(Calendar.DAY_OF_YEAR,30);//日期加58天
                        Date dt1 = rightNow.getTime();
                        sql="update CIFM_CREDIT_ACCT_MANAGE set CURRENT_PASSWORD = '"
                                +resultPd.getString("CURRENT_PASSWORD")+"',PREVIOUS_PASSWORD = '"
                                +resultPd.getString("PREVIOUS_PASSWORD")+"',PWD_EXPIRES_DATE = '"
                                +sdf.format(dt1)
                                +"' where CREDIT_CODE = '"+resultPd.getString("USERNAME")+"'";
                        sqlPd.put("updateSql", sql);
                        indAppReService.updateInfo(sqlPd);
                        logger.info("***********"+pd.getString("USERNAME")+"密码修改完成***********");
                        //System.out.println("***********"+pd.getString("USERNAME")+"密码修改完成***********");
                        logger.info("旧密码："+pd.getString("CURRENT_PASSWORD")+"   新密码："+pd.getString("NEW_PASSWORD"));
                        //System.out.println("旧密码："+pd.getString("CURRENT_PASSWORD")+"   新密码："+pd.getString("NEW_PASSWORD"));

                        return Str;
                    }else if(reponsePd.getString("ErrDesc")!=null){
                        resultPd.put("ERRDESC", reponsePd.getString("ErrDesc"));
                    }else{
                        resultPd.put("ERRDESC", null);
                    }
                }else{
                    resultPd.put("ModifResultCode", null);
                    resultPd.put("ERRDESC", null);
                }
                //修改失败 还是之前的密码
                resultPd.put("PREVIOUS_PASSWORD", pwdInfo.getString("PREVIOUS_PASSWORD"));//旧密码不变未解密
                resultPd.put("CURRENT_PASSWORD", PasswordOper.encode(pd.getString("CURRENT_PASSWORD")));//新密码为之前的密码
                indAppReService.updatePerbankInfo(resultPd);
                logger.info("*********"+resultPd.getString("RESULTDESC")+"**********");
                //System.out.println("*********"+resultPd.getString("RESULTDESC")+"**********");
            }

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return Str;
    }

}
