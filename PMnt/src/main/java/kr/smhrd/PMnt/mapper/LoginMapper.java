package kr.smhrd.PMnt.mapper;


import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.PMnt.entity.ProUser;

@Mapper
public interface LoginMapper {

	// 로그인
	public ProUser loginuser(ProUser user);
	 

		
	
}
