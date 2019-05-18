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
*2019��3��16������4:41:27
*�û����Controller
*/
@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	/*�û�ע��*/
	@RequestMapping(value = "/user/userReg.action")
	public String userReg(String username,String password,Model model) throws Exception {
		boolean result = userService.userReg(username, password);
		if (result) {
			model.addAttribute("msg", "ע��ɹ���");
			return "msg";
		}else {
			model.addAttribute("msg", "��Ǹ�����и��û���������ע�ᣡ");
			return "msg";
		}
	}
	/*�û���¼*/
	@RequestMapping(value = "/user/userLogin.action")
	public String userLogin(String username,String password,HttpSession session,Model model,HttpServletResponse response) throws Exception {
		boolean result = userService.userLogin(username,password);
		if(result) {
			session.setAttribute("username", username);
			model.addAttribute("msg","��½�ɹ���");
			return "msg";
		}else {
			model.addAttribute("msg","�û������������");
			return "msg";
		}
	}
	 /*�û�ע��*/
	@RequestMapping(value = "/user/userOff.action")
	public void userOff(HttpSession session,HttpServletResponse response)throws Exception{
		session.invalidate();
		response.sendRedirect("/MyGame/hello.jsp");
	}
	/*�����û�����*/
	@RequestMapping(value = "/user/to{username}Center.action")
	public String toUserCenter(@PathVariable String username,HttpSession session,Model model) throws Exception {
		//��֤�Ƿ��ǵ�ǰ�û�����
		if (session.getAttribute("username").equals(username)) {
			//��֤�Ƿ��ǹ���Ա
			if(username.equals("admin")) {
				return "admin";
			}else {
				return "center";
			}
		}else {
			model.addAttribute("msg", "��Ǹ����û��Ȩ�޷��ʣ�");
			return "msg";
		}
	}

	
}
