package kr.smhrd.PMnt.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.smhrd.PMnt.entity.ProUser;
import kr.smhrd.PMnt.mapper.LoginMapper;

@Controller
public class UserController {
	
	@Autowired // 의존성 주입
	private LoginMapper mapper;

	@Autowired
	private HttpServletRequest request;

	
	@RequestMapping("/login.do")
	public String login1() {
		return "loginpage";
	}
	
	
	@PostMapping("/loginu.do")
	public String Login(ProUser user, HttpServletRequest request) {
		
		ProUser loginuser = mapper.loginuser(user);
		
		if(loginuser != null) {
			// 세션 객체 생성
			HttpSession session = request.getSession();
			// 세션에 로그인 정보 저장(setAtteibute())
			session.setAttribute("loginuser", loginuser);
			System.out.println(loginuser);
			return "redirect:/main.do";
		}else {
			System.out.println(loginuser);
			return "redirect:/loginfalse.do";
		}
	}
	
	@RequestMapping("/main.do")
	public String mainpage() {
		return "main";
	}
	
	@RequestMapping("/loginfalse.do")
	public String loginfalse() {
		return "loginpage";
	}

}
