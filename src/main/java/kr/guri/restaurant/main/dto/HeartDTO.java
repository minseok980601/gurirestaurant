package kr.guri.restaurant.main.dto;

import org.springframework.stereotype.Component;

@Component("heartDTO")
public class HeartDTO {
	
	private int h_no;
	private int gr_no;
	private String id;
	private int steamcheck;
	
	public HeartDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public HeartDTO(int h_no, int gr_no, String id, int steamcheck) {
		this.h_no = h_no;
		this.gr_no = gr_no;
		this.id = id;
		this.steamcheck = steamcheck;
	}
	
	public int getH_no() {
		return h_no;
	}
	public void setH_no(int h_no) {
		this.h_no = h_no;
	}
	public int getGr_no() {
		return gr_no;
	}
	public void setGr_no(int gr_no) {
		this.gr_no = gr_no;
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
