package kr.guri.restaurant.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping
	public String main() throws Exception {
		return "mainpage/mainpage";
	}

}
