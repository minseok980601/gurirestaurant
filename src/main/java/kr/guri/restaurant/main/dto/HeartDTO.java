package kr.guri.restaurant.main.dto;

import org.springframework.stereotype.Component;

@Component("heartDTO")
public class HeartDTO {
	
	private int h_no;
	private int gr_num;
	private String id;
	private int steamcheck;
	
	public HeartDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public HeartDTO(int h_no, int gr_num, String id, int steamcheck) {
		this.h_no = h_no;
		this.gr_num = gr_num;
		this.id = id;
		this.steamcheck = steamcheck;
	}
	
	public int getH_no() {
		return h_no;
	}
	public void setH_no(int h_no) {
		this.h_no = h_no;
	}
	public int getGr_num() {
		return gr_num;
	}
	public void setGr_num(int gr_num) {
		this.gr_num = gr_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public int getSteamcheck() {
		return steamcheck;
	}

	public void setSteamcheck(int steamcheck) {
		this.steamcheck = steamcheck;
	}
	
	
	
}
