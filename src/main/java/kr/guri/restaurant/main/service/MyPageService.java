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
	
	// 비밀번호 변경
	public void changfePwd(MemberDTO memberDTO) throws Exception {
		mypageDAO.changfePwd(memberDTO);
	}
	
	// 닉네임 검사
	public int checkNickname(MemberDTO memberDTO) throws Exception {
		int result = mypageDAO.checkNickname(memberDTO);
		return result;
	}
	
	// 닉네임 변경
	public void changeNickname(MemberDTO memberDTO) throws Exception {
		mypageDAO.changeNickname(memberDTO);
	}
}
