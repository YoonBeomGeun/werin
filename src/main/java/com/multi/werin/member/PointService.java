package com.multi.werin.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PointService{

	@Autowired
	MemberDAO dao;
	
	public void pointvariation(MemberVO memberVO) {
		dao.updatelevel(memberVO); //정산된 포인트를 업데이트
	}
	
	public void updategrade(MemberVO memberVO) {
		dao.updategrade(memberVO); //점수를 확인후 등급 업데이트
	}
	
	public String callgrade(String userid) { // 해당 유저의 등급을 db에서 불러오는 함수
		MemberVO memberVO = new MemberVO();
		memberVO.setMember_id(userid);
		MemberVO getgrade = dao.callgrade(memberVO);
		String grade = getgrade.getMember_grade();
		return grade;
	}
}