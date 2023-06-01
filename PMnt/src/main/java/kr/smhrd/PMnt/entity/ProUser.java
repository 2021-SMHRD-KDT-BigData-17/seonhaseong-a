package kr.smhrd.PMnt.entity;

public class ProUser {

	private String userBno;
	private String userPw;
	private String userName;
	private String userEmail;
	private String userAddr;
	private String userCompany;

	
	public String getUserBno() {
		return userBno;
	}


	public void setUserBno(String userBno) {
		this.userBno = userBno;
	}


	public String getUserPw() {
		return userPw;
	}


	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public String getUserAddr() {
		return userAddr;
	}


	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}


	public String getUserCompany() {
		return userCompany;
	}


	public void setUserCompany(String userCompany) {
		this.userCompany = userCompany;
	}

	@Override
	public String toString() {
		return "ProUser [userBno=" + userBno + ", userPw=" + userPw + ", userName=" + userName + ", userEmail="
				+ userEmail + ", userAddr=" + userAddr + ", userCompany=" + userCompany + "]";
	}
	
	
	
}
