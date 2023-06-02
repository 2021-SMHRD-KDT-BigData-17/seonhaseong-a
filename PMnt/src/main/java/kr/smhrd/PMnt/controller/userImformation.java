//package kr.smhrd.PMnt.controller;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.PostMapping;
//
//import kr.board.entity.Member;
//import kr.board.mapper.BoardMapper;
//import kr.smhrd.PMnt.entity.ProUser;
//import kr.smhrd.PMnt.mapper.LoginMapper;

//public class userImformation {

//	@Autowired // 의존성 주입
//	private LoginMapper mapper;

//	@PostMapping("/Login.do")
//	public String Login(ProUser prouser, HttpServletRequest request) {
//		ProUser loginMember = mapper.UserLogin(prouser);
//
//		// 만약에 존재하고 있는 회원정보라서 로그인을 할 수 있다면
//		// 회원정보를 세션에 저장
//		if (loginMember != null) {
//			// 1. 세션 객체 생성
//			HttpSession session = request.getSession();
//			// 2. 세션에 로그인정보 저장(setAttribute())
//			session.setAttribute("loginMember", loginMember);
//		}
//		// 어... 다시 basic.jsp에서 게시글 목록 보여줘야하는데...
//		// boardAjaxMain.do요청으로 가야함
//		// 다른 컨트롤러 요청으로 갈때도 redirect:로 이동
//
//		return "redirect:/imformation.do";
//	}
//}
