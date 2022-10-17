package kr.guri.restaurant.member.dao;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import kr.guri.restaurant.member.dto.MemberDTO;

@Repository("memberDAO")
public class MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public MemberDTO selectID(MemberDTO memberDTO, HttpSession session) throws DataAccessException {
		return sqlSession.selectOne("mapper.member.selectID", memberDTO);
	}
}
