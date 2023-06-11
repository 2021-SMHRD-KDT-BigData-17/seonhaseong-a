package kr.smhrd.PMnt.entity;

public class ProProduct {
	
	private int pseq;
	private String pnum; // 제품번호
	private String pname; // 제품 이름
	private int preceivingquantity; // 입고량
	private int pshipments; // 출고량
	private String preceivingdate; // 입고일
	private String pshippingdate; // 출고일
	private int pexpirationdate; // 소비기한
	private int preceivingamount; // 입고금액
	private int pshippingamount; // 출고금액
	private int pincome; // 수입
	private String premarks; // 비고
	private String userbno; // 사용자 사업자 등록번호(아이디), 등록번호(아이디)
	
	
	public int getPseq() {
		return pseq;
	}
	public void setPseq(int pseq) {
		this.pseq = pseq;
	}
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPreceivingquantity() {
		return preceivingquantity;
	}
	public void setPreceivingquantity(int preceivingquantity) {
		this.preceivingquantity = preceivingquantity;
	}
	public int getPshipments() {
		return pshipments;
	}
	public void setPshipments(int pshipments) {
		this.pshipments = pshipments;
	}
	public String getPreceivingdate() {
		return preceivingdate;
	}
	public void setPreceivingdate(String preceivingdate) {
		this.preceivingdate = preceivingdate;
	}
	public String getPshippingdate() {
		return pshippingdate;
	}
	public void setPshippingdate(String pshippingdate) {
		this.pshippingdate = pshippingdate;
	}
	public int getPexpirationdate() {
		return pexpirationdate;
	}
	public void setPexpirationdate(int pexpirationdate) {
		this.pexpirationdate = pexpirationdate;
	}
	public int getPreceivingamount() {
		return preceivingamount;
	}
	public void setPreceivingamount(int preceivingamount) {
		this.preceivingamount = preceivingamount;
	}
	public int getPshippingamount() {
		return pshippingamount;
	}
	public void setPshippingamount(int pshippingamount) {
		this.pshippingamount = pshippingamount;
	}
	public int getPincome() {
		return pincome;
	}
	public void setPincome(int pincome) {
		this.pincome = pincome;
	}
	public String getPremarks() {
		return premarks;
	}
	public void setPremarks(String premarks) {
		this.premarks = premarks;
	}
	public String getUserbno() {
		return userbno;
	}
	public void setUserbno(String userbno) {
		this.userbno = userbno;
	}
	@Override
	public String toString() {
		return "ProProduct [pseq=" + pseq + ", pnum=" + pnum + ", pname=" + pname + ", preceivingquantity="
				+ preceivingquantity + ", pshipments=" + pshipments + ", preceivingdate=" + preceivingdate
				+ ", pshippingdate=" + pshippingdate + ", pexpirationdate=" + pexpirationdate + ", preceivingamount="
				+ preceivingamount + ", pshippingamount=" + pshippingamount + ", pincome=" + pincome + ", premarks="
				+ premarks + ", userbno=" + userbno + "]";
	}
	
	
	
	
}
