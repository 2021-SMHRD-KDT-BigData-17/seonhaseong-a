package kr.smhrd.PMnt.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.smhrd.PMnt.entity.ProUser;
import kr.smhrd.PMnt.mapper.ImformationMapper;

@Controller
public class userImformation {

	@Autowired // 의존성 주입
	private ImformationMapper mapper;
	
	// imformation.jsp 열리는 지 확인용
	@RequestMapping("/imformation.do")
	public String imformation() {
		return "imformation";
	}
	
	// 정보 수정
	@PutMapping("/impormatoin")
	public void impormationUpdate(@RequestBody ProUser user) {
		// json형식으로 데이터 가져오려면 Board객체로 알아서 묶게 스프링에게 알려주기
		// {"idx":20, "content" :"안녕하세여"}
		// @RequestbBody
		// mapper.boardUpdate(vo); 전에 만들었던 내용으로 쓰려고 했던 수정 항목 다름
		mapper.impormationUpdate(user);
		
		
	}
	



}
