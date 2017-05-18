package com.zpark.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zpark.entity.User;
import com.zpark.service.UserService;
import com.zpark.util.URLUtil;
import com.zpark.util.ValidateCode;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService us;
	@RequestMapping("/checkUserName")
	public String checkLogin(HttpServletRequest request,User user,String reCode){
		String imgCode = (String) request.getSession().getAttribute("code");
		if(imgCode.equals(reCode)){
			/*if(us.queryUser(user) == null){
				return "redirect:/index.jsp";
			}else{
				return "redirect:/back/index.html";
			}*/
			try {
				us.queryUser(user);
				return "redirect:/index.jsp";
			} catch (Exception e) {
				e.printStackTrace();
				String msg = URLUtil.encoder(e.getMessage(),"UTF-8");
				return "redirect:/back/login.html?msg="+msg;
			}
		}else{
			return "redirect:/back/login.html?msg=验证码错误";
		}
		
		
	}
	@RequestMapping("/code")
	public void imgCode(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//调用生成图片验证码类
		ValidateCode vcode = new ValidateCode(120,30,5,30);
		//写图片
		vcode.write(response.getOutputStream());
		//将图片验证码计算后的值存入session
		request.getSession().setAttribute("code", vcode.getCode());
	}
	public UserService getUs() {
		return us;
	}
	public void setUs(UserService us) {
		this.us = us;
	}


	
}
