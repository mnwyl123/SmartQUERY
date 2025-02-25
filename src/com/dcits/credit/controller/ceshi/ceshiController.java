package com.dcits.credit.controller.ceshi;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dcits.platform.controller.base.BaseController;
import com.dcits.platform.entity.Page;


@Controller
@RequestMapping(value="/ceshi")
public class ceshiController extends BaseController {

	@RequestMapping(value="/ok")
	public ModelAndView listChannel(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/ok");
		return mv;
	}
}
