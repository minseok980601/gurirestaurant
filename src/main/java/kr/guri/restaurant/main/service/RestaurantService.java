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
	public void heartRestaurant(int gr_no, String id) throws DataAccessException {
		restaurantDAO.heartRestaurant(gr_no, id);
	}
	
	public void restaurantUpHeart(int gr_num) throws DataAccessException {
		restaurantDAO.restaurantUpHeart(gr_num);
	}
	
	// 찜 1로 만들어서 중복 방지
	public int heartRestaurantCheck(int gr_no, String id) throws Exception {
		return restaurantDAO.heartRestaurantCheck(gr_no, id);
	}
	
	// 찜 중복 방지
	public int heartCheck(int gr_no, String id) throws Exception {
		return restaurantDAO.heartCheck(gr_no, id);
	}
}
