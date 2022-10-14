package kr.guri.restaurant.main.dao;

import java.util.List;

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
}
