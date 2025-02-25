package com.dcits.platform.resolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dcits.platform.util.Logger;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
/**
 * 
* 类名称：MyExceptionResolver.java
* 类描述： 
* @author pengyj FH
* 作者单位： 
* 联系方式： pengyj
* @version 1.0
 */
public class MyExceptionResolver implements HandlerExceptionResolver{
	private static Logger logger = Logger.getLogger(MyExceptionResolver.class);
	public ModelAndView resolveException(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex) {
		// TODO Auto-generated method stub
		logger.debug("==============异常开始=============");
		logger.error(ex.getMessage(),ex);
		logger.debug("==============异常结束=============");
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("exception", ex.toString().replaceAll("\n", "<br/>"));
		return mv;
	}

}
