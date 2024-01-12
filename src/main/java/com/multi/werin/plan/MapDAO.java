package com.multi.werin.plan;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.multi.werin.member.MemberVO;

@Repository
public class MapDAO {
	
	SqlSessionTemplate my;

	public int insert(MapVO vo) {
		return my.insert("map.insert", vo);
	}
}
