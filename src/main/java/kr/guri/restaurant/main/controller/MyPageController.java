package kr.guri.restaurant.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.guri.restaurant.main.dto.PagingDTO;
import kr.guri.restaurant.main.dto.RestaurantDTO;
import kr.guri.restaurant.main.service.MyPageService;
import kr.guri.restaurant.main.service.RestaurantService;
import lombok.extern.java.Log;

@Controller
public class MyPageController {

	@Autowired
	private MyPageService mypageService;
	
	@Autowired
	private RestaurantService restaurantService;
	
	@GetMapping(value = "/mypage")
	public String showMyPage(String id, Model model, PagingDTO pagingDTO, RestaurantDTO restaurantDTO,
							 @RequestParam(value = "nowPage", required = false)String nowPage,
							 @RequestParam(value = "cntPerPage", required = false)String cntPerPage) throws Exception {
		
//		List<RestaurantDTO> steamList = restaurantService.MySteamedRestaurant(id);
//		model.addAttribute("steamList", steamList);
		
		int total = mypageService.getTotalSteamedCount(pagingDTO);
		
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "8";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "8";
		}
		
		pagingDTO = new PagingDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), id);
		
		List<RestaurantDTO> steamList = mypageService.mySteamedRestaurant(pagingDTO);
		model.addAttribute("showRt", steamList);
		model.addAttribute("paging", pagingDTO);
		
		return "mypage/mypage";
	}
}
