package kr.guri.restaurant.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import kr.guri.restaurant.main.dao.RestaurantDAO;
import kr.guri.restaurant.main.dto.CommentDTO;
import kr.guri.restaurant.main.dto.PagingDTO;
import kr.guri.restaurant.main.dto.RestaurantDTO;
import kr.guri.restaurant.main.dto.SearchCriteria;

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
	
	public int countRestaurant(PagingDTO pagingDTO) throws Exception {
		return restaurantDAO.countRestaurant(pagingDTO);
	}
	
	public List<RestaurantDTO> selectRestaurant(PagingDTO pagingDTO) throws Exception {
		return restaurantDAO.selectRestaurant(pagingDTO);
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
	
	// 레스토랑 댓글 총 갯수
	public int restaurantCommentCount(CommentDTO commentDTO) throws Exception {
		return restaurantDAO.restaurantCommentCount(commentDTO);
	}
	
	// 레스토랑 댓글 조회
	public List<CommentDTO> restaurantCommentSelect(CommentDTO commentDTO) throws Exception {
		return restaurantDAO.restaurantCommentSelect(commentDTO);
	}
	
	// 레스토랑 댓글 작성
	public void restaurantCommentWrite(CommentDTO commentDTO) throws Exception {
		restaurantDAO.restaurantCommentWrite(commentDTO);
	}
	
	// 레스토랑 댓글 수 증가
	public int restaurantCommentCountUp(RestaurantDTO restaurantDTO) throws Exception {
		return restaurantDAO.restaurantCommentCountUp(restaurantDTO);
	}
	
	// 레스토랑 댓글 수정
	public CommentDTO restaurantMyCommentSelect(CommentDTO commentDTO) throws Exception {
		return restaurantDAO.restaurantMyCommentSelect(commentDTO);
	}
	
	// 검색어 입력
	public List<RestaurantDTO> searchPage(SearchCriteria scri) throws Exception {
		List<RestaurantDTO> restaurantList = restaurantDAO.searchPage(scri);
		return restaurantList;
	}
	
	// 검색어 총 개수
	public int countSearch(SearchCriteria scri) throws Exception {
		return restaurantDAO.countSearch(scri);
	}
}
