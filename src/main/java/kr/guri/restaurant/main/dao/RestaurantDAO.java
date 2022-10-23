package kr.guri.restaurant.main.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.guri.restaurant.main.dto.PagingDTO;
import kr.guri.restaurant.main.dto.RestaurantDTO;

@Repository("restaurantDAO")
public class RestaurantDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public List<RestaurantDTO> listRestaurant() throws DataAccessException {
		return sqlSession.selectList("mapper.restaurant.listrestaurant");
	}
	
	public RestaurantDTO showRestaurant(RestaurantDTO restaurantDTO) throws DataAccessException {
		return sqlSession.selectOne("mapper.restaurant.showrestaurant", restaurantDTO);
	}
	
	public int countRestaurant(PagingDTO pagingDTO) throws Exception {
		return sqlSession.selectOne("mapper.restaurant.countRestaurant", pagingDTO);
	}
	
	public List<RestaurantDTO> selectRestaurant(PagingDTO pagingDTO) throws Exception {
		return sqlSession.selectList("mapper.restaurant.selectRestaurant", pagingDTO);
	}
	
	// 찜 추가
	public void heartRestaurant(int gr_num, String id) throws DataAccessException {
		Map<String, Object> heart = new HashMap<String, Object>();
		heart.put("id", id);
		heart.put("gr_num", gr_num);
		sqlSession.insert("mapper.heart.heartRestaurant", heart);
	}
	
	// 음식점 찜시 추천수 증가
	public void restaurantUpHeart(int gr_num) throws DataAccessException {
		sqlSession.update("mapper.restaurant.restaurantUpHeart", gr_num);
	}
	
	// 찜 1로 만들어서 중복 방지 
	public void heartRestaurantCheck(int gr_num, String id) throws Exception {
		Map<String, Object> heart = new HashMap<String, Object>();
		heart.put("id", id);
		heart.put("gr_num", gr_num);
		sqlSession.selectOne("mapper.heart.heartUpdateCheck", heart);
	}
	
	// 찜 중복 방지
	public int heartCheck(int gr_num, String id) throws Exception {
		Map<String, Object> heart = new HashMap<String, Object>();
		heart.put("id", id);
		heart.put("gr_num", gr_num);
		return sqlSession.selectOne("mapper.heart.heartCheck", heart);
	}
	
	// 음식점 찜 취소 시 delete
	public void heartDeleteCheck(int gr_num, String id) throws Exception {
		Map<String, Object> heart = new HashMap<String, Object>();
		heart.put("id", id);
		heart.put("gr_num", gr_num);
		sqlSession.delete("mapper.heart.heartDeleteCheck", heart);
	}
	
	// 찜 취소시 다시 0
	public void heartDeleteCheckCancel(int gr_num, String id) throws Exception {
		Map<String, Object> heart = new HashMap<String, Object>();
		heart.put("id", id);
		heart.put("gr_num", gr_num);
		sqlSession.update("mapper.heart.heartDeleteCheckCancel", heart);
	}
	
	// 음식점 찜 취소시 추천수 다운
	public void restaurantDownHeart(int gr_num) throws Exception {
		sqlSession.update("mapper.restaurant.restaurantDownHeart", gr_num);
	}
	
	public List<RestaurantDTO> MySteamedRestaurant(String id) throws Exception {
		return sqlSession.selectList("mapper.mypage.MySteamedRestaurant", id);
	}
}
