package kr.guri.restaurant.main.dto;

import org.springframework.stereotype.Component;

@Component("restaurantDTO")
public class RestaurantDTO {

	private int gr_num;
	private String business_name;
	private String location;
	private String location_tel;
	private String gr_img;
	
	public RestaurantDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public RestaurantDTO(int gr_num, String business_name, String location, String location_tel, String gr_img) {
		this.gr_num = gr_num;
		this.business_name = business_name;
		this.location = location;
		this.location_tel = location_tel;
		this.gr_img = gr_img;
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
	
	
}
