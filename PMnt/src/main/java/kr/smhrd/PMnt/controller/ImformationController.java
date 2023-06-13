package kr.smhrd.PMnt.controller;




import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.smhrd.PMnt.entity.ProUser;
import kr.smhrd.PMnt.mapper.ImformationMapper;

@Controller
@SessionAttributes({"loginuser"})
public class ImformationController {

	@Autowired // 의존성 주입
	private ImformationMapper mapper;
	
	
	
	// imformation.jsp 열리는 지 확인용
	@GetMapping("/imformation.do")
	public String imformation() {
		return "/imformation";
	}
	
//	// 정보 수정
//	@PutMapping("/impormation")
//	public void impormationUpdate(@RequestBody ProUser user) {
//	
//		mapper.impormationUpdate(user);
//		
//		
//		
//	}
	
	//회원 정보 수정
	@PostMapping("/imformation.do")
	public String userUpdate(ProUser user)  {
		mapper.imformation(user);
		return "redirect:/main.do";
		
	}
	
	



}
