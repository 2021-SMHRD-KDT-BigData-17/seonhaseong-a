package kr.smhrd.PMnt.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.smhrd.PMnt.entity.ProUser;
import kr.smhrd.PMnt.mapper.LoginMapper;

@Controller
public class UserController {
	
	

	    @Autowired
	    private LoginMapper mapper;

	    @Autowired
	    private HttpServletRequest request;

	    @RequestMapping("/login.do")
	    public String loginPage() {
	        return "loginpage";
	    }

	    @PostMapping("/loginu.do")
	    public String login(ProUser user) {
	        ProUser loginuser = mapper.loginuser(user);

	        if (loginuser != null) {
	            HttpSession session = request.getSession();
	            session.setAttribute("loginuser", loginuser);
	            return "redirect:/main.do";
	        } else {
	            return "redirect:/loginfalse.do";
	        }
	    }

	    @GetMapping("/signup.do")
	    public String showSignupForm() {
	        return "signup";
	    }

	    @PostMapping("/signup.do")
	    public String processSignupForm(ProUser user) {
	        mapper.signup(user);
	        return "redirect:/login.do";
	    }

	    @RequestMapping("/main.do")
	    public String mainPage() {
	        return "main";
	    }

	    @RequestMapping("/loginfalse.do")
	    public String loginFalse() {
	        return "loginpage";
	    }
}


    

