package com.multi.werin.landmark;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LandmarkPageDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public void delete2 () {
		my.delete("landmarkPage.delete2");
	}
	
	public void insert2(LandmarkApiVO2 vo) {
		my.insert("landmarkPage.insert2", vo);
	}
	
	public List<LandmarkApiVO2> list2(String ko) {
		List<LandmarkApiVO2> list = my.selectList("landmarkPage.list2");
		return list;
	}
	

	
}
