package com.dcits.credit.schedul;

import com.dcits.credit.service.creditAcctManage.PwdExpireRemindManager;
import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.util.Logger;
import com.dcits.platform.util.PageData;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import javax.annotation.Resource;
import java.util.*;

public class QuartzModifyhist extends BaseController implements Job {
    protected Logger logger = Logger.getLogger(this.getClass());

    @Autowired
    @Resource(name="PwdExpireRemindService")
    private PwdExpireRemindManager pwdExpireRemindService;
    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        Map<String, String> map = new HashMap<>();
        PageData data = getPropertiesByFileName("dbconfig-sense.properties");
        //获取密码过期剩余天数
        String expiresNum = String.valueOf(data.get("expiresNum"));
        map.put("EXPIRES_NUM",expiresNum);
        List<PageData> list = new ArrayList<>();
        try {
            //查询过期剩余天数下所有账号
            list = pwdExpireRemindService.queryhistAccount(map);
            if(!CollectionUtils.isEmpty(list)){
                for (PageData pageData:list) {
                    String REPORT_ID = String.valueOf(pageData.get("REPORT_ID"));
                    String APPLICATION_TIME = String.valueOf(pageData.get("APPLICATION_TIME"));
                    map.put("REPORT_ID",REPORT_ID);
                    map.put("APPLICATION_TIME",APPLICATION_TIME);
                    pwdExpireRemindService.saveY5(map);
                    pwdExpireRemindService.saveM24(map);
                    pwdExpireRemindService.savepld(map);
                    pwdExpireRemindService.delY5(map);
                    pwdExpireRemindService.delM24(map);
                    pwdExpireRemindService.delpld(map);
                }
            }
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
        }
    }
}
