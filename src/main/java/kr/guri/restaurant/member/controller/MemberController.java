package kr.guri.restaurant.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.guri.restaurant.member.dto.MemberDTO;
import kr.guri.restaurant.member.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberDTO memberDTO;
	
	@PostMapping(value = "/login")
	public String loginMember(MemberDTO memberDTO, HttpSession session) throws Exception {
		MemberDTO loginMember = memberService.selectID(memberDTO, session);
		session.setAttribute("loginMember", loginMember);
		
		return "redirect:/mainpage";
	}
	
	@GetMapping(value = "logout")
	public String logoutMember(HttpSession session) throws Exception {
		session.invalidate();
		
		return "redirect:mainpage";
	}
	
	@GetMapping(value = "/join")
	public String joinPage() throws Exception {
		return "joinpage/joinmember";
	}
}
