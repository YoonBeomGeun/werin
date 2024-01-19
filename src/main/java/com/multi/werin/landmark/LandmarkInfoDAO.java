package com.multi.werin.landmark;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LandmarkInfoDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public void insert(LandmarkApiVO vo) {
		my.insert("landmarkInfo.insert", vo);
	}
	
	public List<LandmarkInfoVO> list(String ko) {
		List<LandmarkInfoVO> list = my.selectList("landmarkInfo.list");
		return list;
	}
	
	public void delete1 () {
		my.delete("landmarkInfo.delete1");
	}
	
}
