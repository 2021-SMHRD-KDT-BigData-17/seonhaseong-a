package kr.smhrd.PMnt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class userController {

	
	@RequestMapping("/login.do")
	public String login() {
		
		return "loginpage";
	}
	
	@RequestMapping("/imformation.do")
	public String imformation() {
		
		return "imformation";
	}
	
}
