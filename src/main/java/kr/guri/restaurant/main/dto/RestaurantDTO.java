package kr.guri.restaurant.main.dto;

import org.springframework.stereotype.Component;

@Component("restaurantDTO")
public class RestaurantDTO {

	private int gr_num;
	private String business_name;
	private String location;
	private String location_tel;
	private String gr_img;
	private String latitude;
	private String longitude;
	private int heart;
	private int comment_counter;
	
	public RestaurantDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public RestaurantDTO(int gr_num, String business_name, String location, String location_tel, String gr_img, String latitude, String longitude, int heart, int comment_counter) {
		this.gr_num = gr_num;
		this.business_name = business_name;
		this.location = location;
		this.location_tel = location_tel;
		this.gr_img = gr_img;
		this.latitude= latitude;
		this.longitude = longitude;
		this.heart = heart;
		this.comment_counter = comment_counter;
	}
	
	public int getGr_num() {
		return gr_num;
	}
	public void setGr_num(int gr_num) {
		this.gr_num = gr_num;
	}
	public String getBusiness_name() {
		return business_name;
	}
	public void setBusiness_name(String business_name) {
		this.business_name = business_name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getLocation_tel() {
		return location_tel;
	}
	public void setLocation_tel(String location_tel) {
		this.location_tel = location_tel;
	}
	public String getGr_img() {
		return gr_img;
	}
	public void setGr_img(String gr_img) {
		this.gr_img = gr_img;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public int getHeart() {
		return heart;
	}

	public void setHeart(int heart) {
		this.heart = heart;
	}

	public int getComment_counter() {
		return comment_counter;
	}

	public void setComment_counter(int comment_counter) {
		this.comment_counter = comment_counter;
	}
	
}
