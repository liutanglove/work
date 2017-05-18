package com.zpark.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zpark.dao.UserDAO;
import com.zpark.entity.User;
import com.zpark.exception.UserException;
import com.zpark.service.UserService;
import com.zpark.util.MD5Utils;

@Component
@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED,readOnly=false,rollbackFor=Exception.class)
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO ud;
	public User queryUser(User user) {
		String password = MD5Utils.generateMD5Code(user.getPassword());
		user.setPassword(password);
		if(ud.selectUser(user) != null){
			return ud.selectUser(user);
		}else{
			throw new UserException("登录失败！");
		}
		
	}
	
	public UserDAO getUd() {
		return ud;
	}
	public void setUd(UserDAO ud) {
		this.ud = ud;
	}
	
}
