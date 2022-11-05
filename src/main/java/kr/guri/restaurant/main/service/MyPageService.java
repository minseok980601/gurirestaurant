package kr.guri.restaurant.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.guri.restaurant.main.dao.MyPageDAO;
import kr.guri.restaurant.main.dao.RestaurantDAO;
import kr.guri.restaurant.main.dto.PagingDTO;
import kr.guri.restaurant.main.dto.RestaurantDTO;
import kr.guri.restaurant.member.dto.MemberDTO;

@Service("mypageService")
public class MyPageService {

	@Autowired
	private RestaurantDAO restaurantDAO;
	
	@Autowired
	private MyPageDAO mypageDAO;
	
	// 내가 찜한 개수
	public int getTotalSteamedCount(PagingDTO pagingDTO) throws Exception {
		return mypageDAO.getTotalSteamedCount(pagingDTO); 
	}
	
	// 내가 찜한 리스트
	public List<RestaurantDTO> mySteamedRestaurant(PagingDTO pagingDTO) throws Exception {
		return mypageDAO.mySteamedRestaurant(pagingDTO);
	}
	
	public void changfePwd(MemberDTO memberDTO) throws Exception {
		mypageDAO.changfePwd(memberDTO);
	}
}
