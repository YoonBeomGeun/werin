package com.multi.werin.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PointService{

	@Autowired
	MemberDAO dao;
	
	public void pointvariation(MemberVO memberVO) {
		
		//VO에 variation을 추가를 하든 해쉬맵 방식으로 넘기면 된다
		//MemberVO memberVO = new MemberVO();
		//이렇게하면 MemberVO에 id부분에 세션에 저장된 아이디가 담기게 되는지?
		//memberVO.setMember_id((String)session.getAttribute("loginId"));
		dao.updatelevel(memberVO); //정산된 포인트를 다시 업데이트
	}
	
	public void updategrade(MemberVO memberVO) {
		dao.updategrade(memberVO); //등급을 다시 확인후 업데이트
	}
	
	// 이런식으로 해도 괜찮은지?
	public String callgrade(String userid) {
		MemberVO memberVO = new MemberVO();
		memberVO.setMember_id(userid);
		MemberVO getgrade = dao.callgrade(memberVO);
		String grade = getgrade.getMember_grade();
		return grade;
	}
}