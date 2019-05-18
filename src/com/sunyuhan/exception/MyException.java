package com.sunyuhan.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

/**
*@author SunYuHan
*2019年3月14日下午8:38:33
*
*/
public class MyException implements HandlerExceptionResolver{

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object obj,
			Exception e) {
		ModelAndView mav = new ModelAndView();
		//判断异常类型
		if (e instanceof MessageException) {
			MessageException me = (MessageException)e;
			mav.addObject("error", me.getMessage());
		}else {
			mav.addObject("error", "抱歉，未知异常");
		}
		mav.setViewName("error");
		return mav;
	}

}
