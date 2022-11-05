package kr.guri.restaurant.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.guri.restaurant.main.dto.PagingDTO;
import kr.guri.restaurant.main.dto.RestaurantDTO;
import kr.guri.restaurant.main.service.MyPageService;
import kr.guri.restaurant.main.service.RestaurantService;
import kr.guri.restaurant.member.dto.MemberDTO;
import lombok.extern.java.Log;

@Controller
public class MyPageController {

	@Autowired
	private MyPageService mypageService;
	
	@Autowired
	private RestaurantService restaurantService;
	
	@Autowired
	private MemberDTO memberDTO;
	
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
	
	@GetMapping(value = "/changepwd")
	public String changepwd() {
		
		return "mypage/changepassword";
	}
	
	@PostMapping(value = "/updatepwd")
	public String updatePwd(@RequestParam(value = "id", defaultValue = "", required = false)
							String id, String pwd) throws Exception {
		
		memberDTO.setId(id);
		memberDTO.setPwd(pwd);
		mypageService.changfePwd(memberDTO);
		
		return "redirect:mainpage";
	}
}
