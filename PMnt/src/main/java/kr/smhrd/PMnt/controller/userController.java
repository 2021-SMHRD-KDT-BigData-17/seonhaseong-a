package kr.smhrd.PMnt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class userController {

	
	@RequestMapping("/login.do")
	public String boardAjaxMain() {
		
		return "loginpage";
	}
}
