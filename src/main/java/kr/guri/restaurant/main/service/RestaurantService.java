package kr.guri.restaurant.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import kr.guri.restaurant.main.dao.RestaurantDAO;
import kr.guri.restaurant.main.dto.RestaurantDTO;

@Service("restaurantService")
public class RestaurantService {

	@Autowired
	private RestaurantDAO restaurantDAO;
	
	public List<RestaurantDTO> listRestaurant() throws DataAccessException {
		return restaurantDAO.listRestaurant();
	}
	
	public RestaurantDTO showRestaurant(RestaurantDTO restaurantDTO) throws DataAccessException {
		return restaurantDAO.showRestaurant(restaurantDTO);
	}
	
	// 찜 추가
	public void heartRestaurant(int gr_num, String id) throws DataAccessException {
		restaurantDAO.heartRestaurant(gr_num, id);
	}
	
	// 음식점 찜시 추천수 증가
	public void restaurantUpHeart(int gr_num) throws DataAccessException {
		restaurantDAO.restaurantUpHeart(gr_num);
	}
	
	// 찜 1로 만들어서 중복 방지
	public void heartRestaurantCheck(int gr_num, String id) throws Exception {
		restaurantDAO.heartRestaurantCheck(gr_num, id);
	}
	
	// 찜 중복 방지
	public int heartCheck(int gr_num, String id) throws Exception {
		return restaurantDAO.heartCheck(gr_num, id);
	}
	
	// 음식점 찜 취소 시 delete
	public void heartDeleteCheck(int gr_num, String id) throws Exception {
		restaurantDAO.heartDeleteCheck(gr_num, id);
	}
	
	// 찜 취소시 다시 0
	public void heartDeleteCheckCancel(int gr_num, String id) throws Exception {
		restaurantDAO.heartDeleteCheckCancel(gr_num, id);
	}
	
	// 음식점 찜 취소시 추천수 다운
	public void restaurantDownHeart(int gr_num) throws Exception {
		restaurantDAO.restaurantDownHeart(gr_num);
	}
	
	public List<RestaurantDTO> MySteamedRestaurant(String id) throws Exception {
		return restaurantDAO.MySteamedRestaurant(id);
	}
}
