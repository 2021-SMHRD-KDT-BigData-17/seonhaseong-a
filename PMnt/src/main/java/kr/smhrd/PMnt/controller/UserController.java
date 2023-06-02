package kr.smhrd.PMnt.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.smhrd.PMnt.entity.ProUser;
import kr.smhrd.PMnt.service.UserService;

@Controller
@RequestMapping("/login.do")
public class UserController {
    private final UserService userService;

    @Inject
    public UserController(UserService userService) {
        this.userService = userService;
    }

    // 로그인 페이지
    @GetMapping
    public String toLoginPage(HttpSession session) {
        String id = (String) session.getAttribute("userBno");
        if (id != null) { // 로그인 됨
            return "redirect:/";
        }
        return "loginpage"; // 로그인 안됨
    }

    // 로그인
    @PostMapping
    public String login(String userBno, String userPw, HttpSession session) {
        String id = userService.login(userBno, userPw);
        if (id == null) { // 로그인 실패
            return "redirect:/login.do";
        }
        session.setAttribute("userBno", id);
        return "redirect:/";
    }
    
    //회원가입페이지
    @GetMapping("/signup.do")
    public String toSignupPage() {return "signuppage";}
    
    //회원가입
    @PostMapping("/signup.do")
    public String signup(ProUser proUser) {
    	try {
    		userService.signup(proUser);
    	}catch(DuplicateKeyException e) {
    		return "redirect:/signup?error_code=-1";
    	}catch(Exception e) {
    		e.printStackTrace();
    		return "redirect://signup?error_code=-99";
    	}
		return "redirect:/login.do";
 
    }
    
}

	

