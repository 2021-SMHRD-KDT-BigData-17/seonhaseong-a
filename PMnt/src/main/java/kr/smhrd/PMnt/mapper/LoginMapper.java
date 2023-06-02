package kr.smhrd.PMnt.mapper;


import kr.smhrd.PMnt.entity.ProUser;

public interface LoginMapper {

	
	//회원가입 
	void getSign(ProUser proUser);
	

	//로그인 - 회원정보
	ProUser getLogin(String userBno);
	 

		
	
}
