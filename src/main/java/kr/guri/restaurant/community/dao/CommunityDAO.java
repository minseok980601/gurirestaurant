package kr.guri.restaurant.community.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.guri.restaurant.community.dto.CommunityDTO;

@Repository("communityDAO")
public class CommunityDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public List<CommunityDTO> listCommunity(CommunityDTO communityDTO) throws Exception {
		return sqlSession.selectList("mapper.community.listCommunity", communityDTO);
	}
}
