package com.sunyuhan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
*@author SunYuHan
*2019年3月16日下午5:11:56
*跳转相关Controller
*/
@Controller
public class JumpController {
	
	@RequestMapping("index.action")
	public String toIndex() {
		return "index";
	}
	@RequestMapping("reg.action")
	public String toReg() {
		return "reg";
	}
}
