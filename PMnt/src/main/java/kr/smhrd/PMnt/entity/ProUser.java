package kr.smhrd.PMnt.entity;

public class ProUser {

	private String userbno;
	private String userpw;
	private String username;
	private String useremail;
	private String useraddr;
	private String usercompany;
	
	public String getUserbno() {
		return userbno;
	}
	public void setUserbno(String userbno) {
		this.userbno = userbno;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public String getUseraddr() {
		return useraddr;
	}
	public void setUseraddr(String useraddr) {
		this.useraddr = useraddr;
	}
	public String getUsercompany() {
		return usercompany;
	}
	public void setUsercompany(String usercompany) {
		this.usercompany = usercompany;
	}
	
	@Override
	public String toString() {
		return "ProUser [userbno=" + userbno + ", userpw=" + userpw + ", username=" + username + ", useremail="
				+ useremail + ", useraddr=" + useraddr + ", usercompany=" + usercompany + "]";
	}
	
	
}
