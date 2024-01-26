package com.multi.werin.plan;

import java.util.List;

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

	public List<PlanVO> select(String plan_writer) {
		return my.selectList("plan.select",plan_writer); 
	}
	
	public List<PlanVO> select2(PlanVO vo) {
		return my.selectList("plan.select2", vo); 
		
	}
	
	//details
	public PlanVO selectWithSchedules(PlanVO vo) { 
		return my.selectOne("plan.selectWithSchedules", vo); }

	public List<PlanVO> selectchedule(PlanVO vo) {
		return my.selectList("plan.selectchedule", vo); 
		
	}
}