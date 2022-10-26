package kr.guri.restaurant.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.guri.restaurant.main.dto.CommentDTO;
import kr.guri.restaurant.main.dto.PagingDTO;
import kr.guri.restaurant.main.dto.RestaurantDTO;
import kr.guri.restaurant.main.service.RestaurantService;

@Controller
public class MainController {
	
	@Autowired
	private RestaurantService restaurantService;
	
//	@GetMapping(value = "/mainpage")
//	public String main(Model model) throws Exception {
//		
//		List<RestaurantDTO> restaurantList = restaurantService.listRestaurant();
//		
//		model.addAttribute("showRt", restaurantList);
//		
//		return "mainpage/mainpage";
//	}
	
	@GetMapping(value = "/test")
	public String test() {
		return "test/test";
	}
	
	@GetMapping(value = "/mainpage")
	public String main(Model model, PagingDTO pagingDTO,
						@RequestParam(value = "nowPage", required = false)String nowPage,
						@RequestParam(value = "cntPerPage", required = false)String cntPerPage) throws Exception {
		
		int total = restaurantService.countRestaurant(pagingDTO);
		
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "8";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "8";
		}
		
		pagingDTO = new PagingDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		List<RestaurantDTO> restaurantList = restaurantService.selectRestaurant(pagingDTO);
		model.addAttribute("showRt", restaurantList);
		model.addAttribute("paging", pagingDTO);
		

		
		return "mainpage/mainpage";
	}
	
	@GetMapping(value = "/showpage")
	public String showrestaurant(RestaurantDTO restaurantDTO, Model model, CommentDTO commentDTO) throws Exception {
		
		RestaurantDTO showrestaurant = restaurantService.showRestaurant(restaurantDTO);
		
		model.addAttribute("showRt", showrestaurant);
		
		List<CommentDTO> commentList = restaurantService.restaurantCommentSelect(commentDTO);
		model.addAttribute("commentList", commentList);
		
		return "viewpage/restaurantview";
	}
	
	@PostMapping(value = "/steamrestaurant")
	@ResponseBody
	public int steamRestaurant(int gr_num, String id) throws Exception {
		
		int steamedCheck = restaurantService.heartCheck(gr_num, id);
		
		if(steamedCheck == 0) {
			restaurantService.heartRestaurant(gr_num, id); 	// 찜 1
			restaurantService.restaurantUpHeart(gr_num); 	// 가게 테이블 + 1
			restaurantService.heartRestaurantCheck(gr_num, id); 	// 찜 테이블 구분 1
		} else if (steamedCheck == 1) {
			restaurantService.heartDeleteCheckCancel(gr_num, id);	// 찜 0
			restaurantService.restaurantDownHeart(gr_num);			// 가게 테이블 -1
			restaurantService.heartDeleteCheck(gr_num, id);			// 찜 테이블 삭제
		}
		
		return steamedCheck;
	}
	
	@GetMapping(value = "/mypage")
	public String showMyPage(String id, Model model) throws Exception {
		
		List<RestaurantDTO> steamList = restaurantService.MySteamedRestaurant(id);
		
		model.addAttribute("steamList", steamList);
		
		return "mypage/mypage";
	}
	
	@PostMapping(value ="/commentwrite")
	public String restaurantCommentWrite(CommentDTO commentDTO, RestaurantDTO restaurantDTO, RedirectAttributes rttr) throws Exception {
		restaurantService.restaurantCommentWrite(commentDTO);
		rttr.addAttribute("gr_num", commentDTO.getGr_num());
		
		return "redirect:showpage";
	}
}
