package kr.guri.restaurant.main.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

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
	
	// 찜 추가
	public void heartRestaurant(int gr_num, String id) throws DataAccessException {
		Map<String, Object> heart = new HashMap<String, Object>();
		heart.put("id", id);
		heart.put("gr_num", gr_num);
		sqlSession.insert("mapper.heart.heartRestaurant", heart);
	}
	
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
}
