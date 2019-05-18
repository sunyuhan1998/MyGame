package com.sunyuhan.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunyuhan.dao.UserMapper;
import com.sunyuhan.exception.MessageException;
import com.sunyuhan.pojo.User;
import com.sunyuhan.pojo.UserExample;
import com.sunyuhan.service.UserService;

/**
*@author SunYuHan
*2019��3��16������4:47:10
*
*/
@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;

	@Override
	/*�û�ע��*/
	public boolean userReg(String username, String password) throws Exception {
		try {
			//�ж��Ƿ�����
			UserExample example = new UserExample();
			example.createCriteria().andUsernameEqualTo(username);
			List<User> users = userMapper.selectByExample(example);
			for (User user : users) {
				if(user.getUsername().equals(username)) {
					return false;
				}
			}
			//���û�
			User user = new User();
			user.setUsername(username);
			user.setPassword(password);
			user.setCreatetime(new Date());
			userMapper.insert(user);
			return true;
		} catch (Exception e) {
			throw new MessageException("��Ǹ��ע��ʧ�ܣ�");
		}
	}

	@Override
	/*�û���¼*/
	public boolean userLogin(String username, String password) throws Exception {
		UserExample example = new UserExample();
		example.createCriteria().andUsernameEqualTo(username);
		List<User> users = userMapper.selectByExample(example);
		for (User user : users) {
			if (user.getPassword().equals(password)) {
				return true;
			}
		}
		return false;
	}

}
