package com.dcits.credit.schedul;

import com.dcits.credit.service.creditAcctManage.PwdExpireRemindManager;
import com.dcits.credit.service.dataSubmission.IDataSubmissionService;
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

public class QuartzSyncUpload extends BaseController implements Job {
    protected Logger logger = Logger.getLogger(this.getClass());

    @Autowired
    @Resource(name="PwdExpireRemindService")
    private PwdExpireRemindManager pwdExpireRemindService;
    @Resource(name = "dataSubmissionService")
	private IDataSubmissionService iDataSubmissionService;
    
    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        Map<String, String> map = new HashMap<>();
        List<PageData> list = new ArrayList<>();
        try {
            list = pwdExpireRemindService.querySyncAccount(map);
            if(!CollectionUtils.isEmpty(list)){
                for (PageData pageData:list) {
                    String ID = String.valueOf(pageData.get("ID"));
                    String CLIENT_TYPE = String.valueOf(pageData.get("CLIENT_TYPE"));
                    iDataSubmissionService.sendSubmissionData(ID,CLIENT_TYPE);
                }
            }
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
        }
    }

}
