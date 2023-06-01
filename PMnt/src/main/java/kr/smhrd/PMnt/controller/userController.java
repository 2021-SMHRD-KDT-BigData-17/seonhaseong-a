package kr.smhrd.PMnt.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;



import kr.smhrd.PMnt.mapper.LoginMapper;


@Controller
public class userController {

	
	@Autowired
	private LoginMapper mapper;
	
	@RequestMapping("/Login.do")
	public String Login() {
		
		
			
			return "login";
		
		
	}
	

	
	
	@RequestMapping("/imformation.do")
	public String imformation() {
		
		return "imformation";
	}
	
}
