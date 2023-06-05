package kr.smhrd.PMnt.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import kr.smhrd.PMnt.entity.ProUser;

@Mapper
public interface ImformationMapper {
	
	// xml로 굳이 sql문을 관리하고 싶지 않은 경우에  interface에 바로 적용할수 있다.
	// 회원정보 수정 sql문
	// 수정 할 것
	// @Update("update pro_user set content =#{content} where idx=#{idx}")
	@Update("update pro_user set user_pw=#{userPw},user_name=#{userName},user_email=#{userEmail},user_addr=#{userAddr},user_company=#{userCompany} where user_bno=#{userBno}")
	public void impormationUpdate(ProUser vo);
	
}
