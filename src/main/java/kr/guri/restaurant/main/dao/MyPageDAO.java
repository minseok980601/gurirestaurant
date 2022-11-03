package kr.guri.restaurant.main.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.guri.restaurant.main.dto.PagingDTO;
import kr.guri.restaurant.main.dto.RestaurantDTO;

@Repository("mypageDAO")
public class MyPageDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 내가 찜한 개수	
	public int getTotalSteamedCount(PagingDTO pagingDTO) throws Exception {
		return sqlSession.selectOne("mapper.mypage.getTotalSteamedCount", pagingDTO);
	}
	
	// 내가 찜한 리스트
	public List<RestaurantDTO> mySteamedRestaurant(PagingDTO pagingDTO) throws Exception {
		return sqlSession.selectList("mapper.mypage.mySteamedRestaurant", pagingDTO);
	}
}
