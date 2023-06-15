package kr.smhrd.PMnt.entity;

public class ProFruits {

	
	private int fseq;
	private String fmonth;
	private String ftext;
	public int getFseq() {
		return fseq;
	}
	public void setFseq(int fseq) {
		this.fseq = fseq;
	}
	public String getFmonth() {
		return fmonth;
	}
	public void setFmonth(String fmonth) {
		this.fmonth = fmonth;
	}
	public String getFtext() {
		return ftext;
	}
	public void setFtext(String ftext) {
		this.ftext = ftext;
	}
	
	@Override
	public String toString() {
		return "ProFruits [fseq=" + fseq + ", fmonth=" + fmonth + ", ftext=" + ftext + "]";
	}
	
	
	
}
