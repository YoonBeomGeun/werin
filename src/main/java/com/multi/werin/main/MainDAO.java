package com.multi.werin.main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/*각 함수마다 데이터베이스에서 가져올 정보들 보고 리턴타입 다시 확인해봐야함*/
/*검색 리턴 한번 확인해보기*/

@Repository
public class MainDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public List<MainlandmarkVO> recommendlandmark(MainlandmarkVO mainlandmarkVO) {
		return my.selectList("main.hotlandmark", mainlandmarkVO);
	}
	
	public List<SearchLandmarkVO> searchlandmark(SearchLandmarkVO searchlandmarkVO) {
		return my.selectList("main.mainsearch_landmark", searchlandmarkVO);
	}
	
	public List<SearchBbsVO> searchbbs(SearchBbsVO searchbbsVO) {
		return my.selectList("main.mainsearch_trip", searchbbsVO);
	}
	
	public List<SearchTripVO> searchtrip(SearchTripVO searchtripVO) {
		return my.selectList("main.mainsearch_trip", searchtripVO);
	}
	
	public List<MaintripVO> hottravel(MaintripVO maintripVO) {
		return my.selectList("main.hottravel", maintripVO);
	}
	
	public List<MainintroducestoreVO> hotshop(MainintroducestoreVO mainintroducestoreVO) {
		return my.selectList("main.hotshop", mainintroducestoreVO);
	}
	
	public List<MainbbsVO> hotboard(MainbbsVO mainbbsVO) {
		return my.selectList("main.hotboard", mainbbsVO);
	}
}
