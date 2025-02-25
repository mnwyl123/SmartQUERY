package com.dcits.credit.application;

import javax.ws.rs.ApplicationPath;

import org.codehaus.jackson.jaxrs.JacksonJsonProvider;
import org.glassfish.jersey.server.ResourceConfig;

import com.dcits.credit.controller.ServerUtilTest.ServerUtilTestController;
import com.dcits.credit.controller.rest.CompanyInterface;
import com.dcits.credit.controller.rest.CompanyLoanInterface;
import com.dcits.credit.controller.rest.ObjectionComInterface;
import com.dcits.credit.controller.rest.ObjectionPerInterface;
import com.dcits.credit.controller.rest.PersonLoanInterface;
import com.dcits.credit.controller.rest.PersonInterface;
import com.dcits.credit.controller.rest.QueryLoanCardNoInterface;
import com.dcits.credit.controller.rest.UpdatePWDInterface;

@ApplicationPath("/")
public class RestApplication extends ResourceConfig {
	 public RestApplication() {
	     //服务类所在的包路径
	   //  packages("com.dcits.rest.resources");
	     register(PersonLoanInterface.class); //信贷个人
	     register(CompanyLoanInterface.class); //信贷企业
	     register(ServerUtilTestController.class); //测试 
	     register(PersonInterface.class); //个人公共
	     register(CompanyInterface.class); //企业公共
	     register(QueryLoanCardNoInterface.class); //中征码
	     register(UpdatePWDInterface.class); //修改密码
	     //企业异议
	     register(ObjectionComInterface.class);
	     //个人异议
	     register(ObjectionPerInterface.class);
	     //注册JSON转换器
	     register(JacksonJsonProvider.class);
	     //数字解读接口
	      //打印访问日志，便于跟踪调试，正式发布可清除 QueryComInterface
	    // register(LoggingFilter.class);
	    }
}
