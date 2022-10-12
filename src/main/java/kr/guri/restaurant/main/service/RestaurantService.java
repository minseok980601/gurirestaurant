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
	
	public List<RestaurantDTO> showRestaurant() throws DataAccessException {
		return restaurantDAO.showRestaurant();
	}
}
