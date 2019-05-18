package com.sunyuhan.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sunyuhan.service.UserService;

/**
*@author SunYuHan
*2019年3月16日下午4:41:27
*用户相关Controller
*/
@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	/*用户注册*/
	@RequestMapping(value = "/user/userReg.action")
	public String userReg(String username,String password,Model model) throws Exception {
		boolean result = userService.userReg(username, password);
		if (result) {
			model.addAttribute("msg", "注册成功！");
			return "msg";
		}else {
			model.addAttribute("msg", "抱歉，已有该用户，请重新注册！");
			return "msg";
		}
	}
	/*用户登录*/
	@RequestMapping(value = "/user/userLogin.action")
	public String userLogin(String username,String password,HttpSession session,Model model,HttpServletResponse response) throws Exception {
		boolean result = userService.userLogin(username,password);
		if(result) {
			session.setAttribute("username", username);
			model.addAttribute("msg","登陆成功！");
			return "msg";
		}else {
			model.addAttribute("msg","用户名或密码错误！");
			return "msg";
		}
	}
	 /*用户注销*/
	@RequestMapping(value = "/user/userOff.action")
	public void userOff(HttpSession session,HttpServletResponse response)throws Exception{
		session.invalidate();
		response.sendRedirect("/MyGame/hello.jsp");
	}
	/*访问用户中心*/
	@RequestMapping(value = "/user/to{username}Center.action")
	public String toUserCenter(@PathVariable String username,HttpSession session,Model model) throws Exception {
		//验证是否是当前用户访问
		if (session.getAttribute("username").equals(username)) {
			//验证是否是管理员
			if(username.equals("admin")) {
				return "admin";
			}else {
				return "center";
			}
		}else {
			model.addAttribute("msg", "抱歉！您没有权限访问！");
			return "msg";
		}
	}

	
}
