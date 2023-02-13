package kr.guri.restaurant.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.guri.restaurant.community.dto.CommunityDTO;
import kr.guri.restaurant.community.service.CommunityService;

@Controller
public class CommunityController {

	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private CommunityDTO communityDTO;
	
	@GetMapping(value = "/community")
	public String community(Model model) throws Exception {
		
		List<CommunityDTO> communityList = communityService.listCommunity(communityDTO);
		model.addAttribute("communityList", communityList);
		
		return "community/communitypage";
	}
}
