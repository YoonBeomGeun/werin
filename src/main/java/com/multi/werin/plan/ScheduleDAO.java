package com.multi.werin.plan;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ScheduleDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public int insert(ScheduleVO vo) {
		return my.insert("schedule.insert", vo);
	}
}
