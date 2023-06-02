package kr.smhrd.PMnt.service;

import org.springframework.stereotype.Service;

import kr.smhrd.PMnt.entity.ProUser;
import kr.smhrd.PMnt.mapper.LoginMapper;
@Service
public class UserService {
  
  private final LoginMapper loginMapper;

    public UserService(LoginMapper loginMapper) {
        this.loginMapper = loginMapper;
    }
	    
	public String login(String userBno, String userPw) {
		ProUser proUser = loginMapper.getLogin(userBno);
		if(proUser.getUserPw().equals(userPw)) 
			return proUser.getUserPw();
		return null;	
		}
		
		
	
    
    // 회원가입
    public void signup(ProUser proUser) {
        loginMapper.getSign(proUser);
    }
}


	



	
	

	

	

	

	

