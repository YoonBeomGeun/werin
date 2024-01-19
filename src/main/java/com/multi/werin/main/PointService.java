package com.multi.werin.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.multi.werin.member.MemberDAO;
import com.multi.werin.member.MemberVO;

@Service
public class PointService{

	@Autowired
	MemberDAO dao;
	
	public void userpoint(int variation, MemberVO memberVO) {
		
		int currentpoint = 0;
		int totalpoint = 0;
		String membergrade = "";
		
		MemberVO getinfo = dao.pointcheck(memberVO);
		currentpoint = getinfo.getMember_level();
		totalpoint = currentpoint+variation;
		dao.updatelevel(totalpoint); //정산된 포인트를 다시 업데이트
		
		if(totalpoint<10) {
			membergrade = "bronze";
		}else if(totalpoint >= 10 && totalpoint < 20) {			
			membergrade = "silver";
		}else {			
			membergrade = "gold";
		}
		
		//굳이 저장을 해야하나? 저장이 잘 됐는지 확인하기위해 if문으로 확인해보는게 좋은가...?
		dao.updategrade(memberVO); //등급을 다시 확인후 업데이트
	}
	
}
