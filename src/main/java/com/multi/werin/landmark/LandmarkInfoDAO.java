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
	
	public List<LandmarkInfoVO> list(String string) {
		List<LandmarkInfoVO> list = my.selectList("landmarkInfo.list", string);
		return list;
	}
	
	public List<LandmarkInfoVO> pagelist1(LandmarkPageVO landmarkpageVO) {
		List<LandmarkInfoVO> list = my.selectList("landmarkInfo.pagelist1", landmarkpageVO);
		return list;
	}
	
	public List<LandmarkInfoVO> pagelist2(LandmarkPageVO landmarkpageVO) {
		List<LandmarkInfoVO> list = my.selectList("landmarkInfo.pagelist2", landmarkpageVO);
		return list;
	}
	
	public int count1(LandmarkPageVO landmarkpageVO) {
		return my.selectOne("landmarkInfo.count1", landmarkpageVO);
	}
	
	public int count2() {
		return my.selectOne("landmarkInfo.count2");
	}
	
	public void delete1 () {
		my.delete("landmarkInfo.delete1");
		my.update("landmarkInfo.resetAutoIncrement");
	}
	
}
