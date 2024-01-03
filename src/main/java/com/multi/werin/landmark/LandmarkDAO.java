package com.multi.werin.landmark;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LandmarkDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public int insert (LandmarkVO landmarkVO) {
		return my.insert("landmark.insert", landmarkVO);
	}
	
	public List<LandmarkVO> list (LandmarkVO landmarkVO) {
		return my.selectList("landmark.list", landmarkVO);
	}
	
	public List<LandmarkVO> list2 (PageVO pageVO) {
		return my.selectList("landmark.list2", pageVO);
	}
	
	public int count() {
		return my.selectOne("landmark.count"); 
	}
	
}
