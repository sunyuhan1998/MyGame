package com.sunyuhan.service;
/**
*@author SunYuHan
*2019��3��16������4:45:41
*
*/
public interface UserService {
	 /*�û�ע��*/
	public boolean userReg(String username , String password)throws Exception;
	/*�û���¼*/
	public boolean userLogin(String username , String password)throws Exception;

}
