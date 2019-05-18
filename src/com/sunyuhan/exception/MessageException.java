package com.sunyuhan.exception;
/**
*@author SunYuHan
*2019年3月14日下午8:53:09
*
*/
public class MessageException extends Exception{
	private static final long serialVersionUID = 1L;
	private String msg;

	
	public MessageException(String msg) {
		super();
		this.msg = msg;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	

}
