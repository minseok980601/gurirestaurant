package kr.guri.restaurant.member.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import kr.guri.restaurant.main.dto.RestaurantDTO;
import kr.guri.restaurant.member.dao.MemberDAO;
import kr.guri.restaurant.member.dto.MemberDTO;

@Service("memberService")
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	public MemberDTO selectID(MemberDTO memberDTO, HttpSession session) throws DataAccessException {
		return memberDAO.selectID(memberDTO, session);
	}
	
	
}
