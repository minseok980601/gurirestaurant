package kr.guri.restaurant.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.guri.restaurant.main.dto.RestaurantDTO;
import kr.guri.restaurant.main.service.RestaurantService;

@Controller
public class MainController {
	
	@Autowired
	private RestaurantService restaurantService;
	
	@GetMapping(value = "/mainpage")
	public String main(Model model) throws Exception {
		
		List<RestaurantDTO> restaurantList = restaurantService.listRestaurant();
		
		model.addAttribute("showRt", restaurantList);
		
		return "mainpage/mainpage";
	}
	
	@GetMapping(value = "/showpage")
	public String showrestaurant(RestaurantDTO restaurantDTO, Model model) throws Exception {
		
		RestaurantDTO showrestaurant = restaurantService.showRestaurant(restaurantDTO);
		
		model.addAttribute("showRt", showrestaurant);
		
		return "viewpage/restaurantview";
	}
	

}
