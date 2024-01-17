package com.multi.werin.plan;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ScheduleDAO implements ScheduleDAOInterface {

	@Autowired
	SqlSessionTemplate my;
	
	@Override
	public int insert(ScheduleVO vo) {
		return my.insert("schedule.insert", vo);
	}
}
