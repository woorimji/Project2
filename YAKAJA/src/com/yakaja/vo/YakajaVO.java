package com.yakaja.vo;

public class YakajaVO {

	

	private String mem_id;
	private String memPw;
	private String memEmail;
	private String memName;
	private String memTel;
	private int memAdmin;
	public String getmem_id() {
		return mem_id;
	}
	public void setmem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemTel() {
		return memTel;
	}
	public void setMemTel(String memTel) {
		this.memTel = memTel;
	}
	public int getMemAdmin() {
		return memAdmin;
	}
	public void setMemAdmin(int memAdmin) {
		this.memAdmin = memAdmin;
	}
	
	
	public YakajaVO(String mem_id, String memPw, String memEmail, String memName, String memTel, int memAdmin) {
		super();
		this.mem_id = mem_id;
		this.memPw = memPw;
		this.memEmail = memEmail;
		this.memName = memName;
		this.memTel = memTel;
		this.memAdmin = memAdmin;
	}
	
	public YakajaVO() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "YakajaVO [mem_id=" + mem_id + ", memPw=" + memPw + ", memEmail=" + memEmail + ", memName=" + memName
				+ ", memTel=" + memTel + ", memAdmin=" + memAdmin + "]";
	}	
}







