package com.multi.werin.plan;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PlanDAO {
	@Autowired
	SqlSessionTemplate my;
	
	public int insert(PlanVO vo) {
		return my.insert("plan.insert", vo);
	}
}