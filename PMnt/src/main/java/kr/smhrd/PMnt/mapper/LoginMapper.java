package kr.smhrd.PMnt.mapper;



import org.apache.ibatis.annotations.Param;

import kr.smhrd.PMnt.entity.ProUser;

public interface LoginMapper {

	
	//회원가입 
	void getSign(ProUser proUser);
	

	//로그인 - 회원정보
	ProUser getLogin(@Param ("userBno") String userBno);
	 

		
	
		
	
		
	
}
