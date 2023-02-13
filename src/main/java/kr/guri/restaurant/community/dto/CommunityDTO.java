package kr.guri.restaurant.community.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("communityDTO")
public class CommunityDTO {

	private int post_num;
	private String post_title;
	private String post_id;
	private int post_hits;
	private int post_good;
	private int post_bad;
	private Date post_date;
	
	public CommunityDTO() {
		
	}
	
	public CommunityDTO(int post_num, String post_title, String post_id, int post_hits, int post_good, int post_bad,
			Date post_date) {
		this.post_num = post_num;
		this.post_title = post_title;
		this.post_id = post_id;
		this.post_hits = post_hits;
		this.post_good = post_good;
		this.post_bad = post_bad;
		this.post_date = post_date;
	}

	public int getPost_num() {
		return post_num;
	}
	public void setPost_num(int post_num) {
		this.post_num = post_num;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getPost_id() {
		return post_id;
	}
	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}
	public int getPost_hits() {
		return post_hits;
	}
	public void setPost_hits(int post_hits) {
		this.post_hits = post_hits;
	}
	public int getPost_good() {
		return post_good;
	}
	public void setPost_good(int post_good) {
		this.post_good = post_good;
	}
	public int getPost_bad() {
		return post_bad;
	}
	public void setPost_bad(int post_bad) {
		this.post_bad = post_bad;
	}
	public Date getPost_date() {
		return post_date;
	}
	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}
	
}
