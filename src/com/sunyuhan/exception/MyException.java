package com.sunyuhan.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

/**
*@author SunYuHan
*2019��3��14������8:38:33
*
*/
public class MyException implements HandlerExceptionResolver{

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object obj,
			Exception e) {
		ModelAndView mav = new ModelAndView();
		//�ж��쳣����
		if (e instanceof MessageException) {
			MessageException me = (MessageException)e;
			mav.addObject("error", me.getMessage());
		}else {
			mav.addObject("error", "��Ǹ��δ֪�쳣");
		}
		mav.setViewName("error");
		return mav;
	}

}
