package com.sunyuhan.service;
/**
*@author SunYuHan
*2019年3月16日下午4:45:41
*
*/
public interface UserService {
	 /*用户注册*/
	public boolean userReg(String username , String password)throws Exception;
	/*用户登录*/
	public boolean userLogin(String username , String password)throws Exception;

}
