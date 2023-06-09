package kr.smhrd.PMnt.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.smhrd.PMnt.entity.ProProduct;
import kr.smhrd.PMnt.entity.ProUser;
import kr.smhrd.PMnt.mapper.LoginMapper;
import kr.smhrd.PMnt.mapper.ProductMapper;

@Controller
public class UserController {
	
	


	
	    @Autowired
	    private LoginMapper mapper;

	    //ProductMapper 의존성
		@Autowired
		private ProductMapper mapper2;
	    
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
	    public String mainPage(Model model) {
	    	List<ProProduct> list = mapper2.productList();
			model.addAttribute("list", list);
	        return "main";
	    }

	    @RequestMapping("/loginfalse.do")
	    public String loginFalse() {
	        return "loginpage";
	    }
	    
		// 로그아웃(UserController.java로 이동)
		@RequestMapping("/logout.do")
		public String logout(HttpSession session) {
			System.out.println(session);
			session.invalidate();
			
			return "redirect:/login.do";
		}
	    
	    
}


    

