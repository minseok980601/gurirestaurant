package kr.guri.restaurant.member.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	// 아이디 중복 검사
	@ResponseBody
	@PostMapping(value = "/checkid")
	public int checkID(@RequestParam Map<String, Object> id) throws Exception {
		
		String checkid = (String) id.get("id");
		memberDTO.setId(checkid);
		System.out.println("전달받은 checkid : " + checkid);
		int result = memberService.checkID(memberDTO);
		System.out.println("확인 결과 : " + result);
		return result;
	}
	
	@PostMapping(value = "/joinmember")
	public String joinMember(MemberDTO memberDTO) throws Exception {
		memberService.joinMember(memberDTO);
		
		return "mainpage/mainpage";
	}
}
