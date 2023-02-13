package kr.guri.restaurant.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.guri.restaurant.community.dao.CommunityDAO;
import kr.guri.restaurant.community.dto.CommunityDTO;

@Service("communityService")
public class CommunityService {

	@Autowired
	private CommunityDAO communityDAO;
	
	public List<CommunityDTO> listCommunity(CommunityDTO communityDTO) throws Exception {
		return communityDAO.listCommunity(communityDTO);
	}
}
