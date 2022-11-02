package kr.guri.restaurant.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.guri.restaurant.main.dao.MyPageDAO;
import kr.guri.restaurant.main.dao.RestaurantDAO;
import kr.guri.restaurant.main.dto.PagingDTO;
import kr.guri.restaurant.main.dto.RestaurantDTO;

@Service("mypageService")
public class MyPageService {

	@Autowired
	private RestaurantDAO restaurantDAO;
	
	@Autowired
	private MyPageDAO mypageDAO;
	
	public int getTotalSteamedCount(PagingDTO pagingDTO) throws Exception {
		
		return mypageDAO.getTotalSteamedCount(pagingDTO); 
	}
	
	public List<RestaurantDTO> mySteamedRestaurant(PagingDTO pagingDTO) throws Exception {
		return mypageDAO.mySteamedRestaurant(pagingDTO);
	}
}
