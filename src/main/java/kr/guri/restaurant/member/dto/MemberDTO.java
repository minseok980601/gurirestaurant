package kr.guri.restaurant.member.dto;

import org.springframework.stereotype.Component;

@Component("memberDTO")
public class MemberDTO {

	private String id;
	private String pwd;
	private String name;
	private String nick_nm;
	private String email;
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public MemberDTO(String id, String pwd, String name, String nick_nm, String email) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.nick_nm = nick_nm;
		this.email = email;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNick_nm() {
		return nick_nm;
	}
	public void setNick_nm(String nick_nm) {
		this.nick_nm = nick_nm;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
