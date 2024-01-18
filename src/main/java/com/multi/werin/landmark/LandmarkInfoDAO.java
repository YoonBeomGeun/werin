package com.multi.werin.landmark;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LandmarkInfoDAO implements LandmarkInfoDAOInterface {

	@Autowired
	SqlSessionTemplate my;
	
	@Override
	public void insert(LandmarkApiVO vo) {
		//db처리하기 전 전처리/후처리 
		//db처리 요청 
		my.insert("landmarkInfo.insert", vo);
	}
	
	@Override
	public List<LandmarkInfoVO> list(String ko) {
		//db처리하기 전 전처리/후처리 
		//db처리 요청 
		List<LandmarkInfoVO> list = my.selectList("landmarkInfo.list");
		return list;
	}
	

	
}
