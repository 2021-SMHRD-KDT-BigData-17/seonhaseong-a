package kr.smhrd.PMnt.entity;

public class ProSynthesis {

	private int syseq;
	private String syday;
	private String syproduct;
	private int sycnt;
	private double wtemperature;
	private double wmintemperature;
	private double wmaxtemperature;
	private double wprecipitation;
	private double whumidity;
	private int scnt;
	public int getSyseq() {
		return syseq;
	}
	public void setSyseq(int syseq) {
		this.syseq = syseq;
	}
	public String getSyday() {
		return syday;
	}
	public void setSyday(String syday) {
		this.syday = syday;
	}
	public String getSyproduct() {
		return syproduct;
	}
	public void setSyproduct(String syproduct) {
		this.syproduct = syproduct;
	}
	public int getSycnt() {
		return sycnt;
	}
	public void setSycnt(int sycnt) {
		this.sycnt = sycnt;
	}
	public double getWtemperature() {
		return wtemperature;
	}
	public void setWtemperature(double wtemperature) {
		this.wtemperature = wtemperature;
	}
	public double getWmintemperature() {
		return wmintemperature;
	}
	public void setWmintemperature(double wmintemperature) {
		this.wmintemperature = wmintemperature;
	}
	public double getWmaxtemperature() {
		return wmaxtemperature;
	}
	public void setWmaxtemperature(double wmaxtemperature) {
		this.wmaxtemperature = wmaxtemperature;
	}
	public double getWprecipitation() {
		return wprecipitation;
	}
	public void setWprecipitation(double wprecipitation) {
		this.wprecipitation = wprecipitation;
	}
	public double getWhumidity() {
		return whumidity;
	}
	public void setWhumidity(double whumidity) {
		this.whumidity = whumidity;
	}
	public int getScnt() {
		return scnt;
	}
	public void setScnt(int scnt) {
		this.scnt = scnt;
	}
	
	@Override
	public String toString() {
		return "ProSynthesis [syseq=" + syseq + ", syday=" + syday + ", syproduct=" + syproduct + ", sycnt=" + sycnt
				+ ", wtemperature=" + wtemperature + ", wmintemperature=" + wmintemperature + ", wmaxtemperature="
				+ wmaxtemperature + ", wprecipitation=" + wprecipitation + ", whumidity=" + whumidity + ", scnt=" + scnt + "]";
	}
	
	
	
}
