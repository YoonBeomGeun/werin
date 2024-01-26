package com.multi.werin.main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/*각 함수마다 데이터베이스에서 가져올 정보들 보고 리턴타입 다시 확인해봐야함*/
/*검색 리턴 한번 확인해보기*/

@Repository
public class MainDAO implements MainDAOInterface {

	@Autowired
	SqlSessionTemplate my;
	
	/*
	 * @Override public List<MainlandmarkVO> recommendlandmark(MainlandmarkVO
	 * mainlandmarkVO) { return my.selectList("main.hotlandmark", mainlandmarkVO); }
	 */
	
	/*
	 * @Override public List<SearchLandmarkVO> searchlandmark(SearchLandmarkVO
	 * searchlandmarkVO) { return my.selectList("main.mainsearch_landmark",
	 * searchlandmarkVO); }
	 */
	
	@Override
	public List<SearchBbsVO> searchbbs(SearchBbsVO searchbbsVO) {
		return my.selectList("main.mainsearch_bbs", searchbbsVO);
	}
	
	@Override
	public List<SearchTripVO> searchtrip(SearchTripVO searchtripVO) {
		return my.selectList("main.mainsearch_trip", searchtripVO);
	}
	
	@Override
	public List<MaintripVO> hottravel(MaintripVO maintripVO) {
		return my.selectList("main.hottravel", maintripVO);
	}
	
	@Override
	public List<MainintroducestoreVO> hotshop(MainintroducestoreVO mainintroducestoreVO) {
		return my.selectList("main.hotshop", mainintroducestoreVO);
	}
	
	@Override
	public List<MainbbsVO> hotboard(MainbbsVO mainbbsVO) {
		return my.selectList("main.hotboard", mainbbsVO);
	}
	
	@Override
	public List<SearchLandmarkVO> morelandmark(SearchVO searchVO){
		return my.selectList("main.morelandmark",searchVO);
	}

	@Override
	public List<SearchTripVO> moretrip(SearchVO searchVO){
		return my.selectList("main.moretrip",searchVO);
	}
	
	@Override
	public List<SearchBbsVO> morebbs(SearchVO searchVO){
		return my.selectList("main.morebbs",searchVO);
	}
	
	@Override
	public int landmark_count(SearchVO searchVO) {
		return my.selectOne("main.landmark_count", searchVO);
	}
	
	@Override
	public int trip_count(SearchVO searchVO) {
		return my.selectOne("main.trip_count", searchVO);
	}
	
	@Override
	public int bbs_count(SearchVO searchVO) {
		return my.selectOne("main.bbs_count", searchVO);
	}

	@Override
	public List<MainlandmarkVO> recommendlandmark(MainlandmarkVO mainlandmarkVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SearchLandmarkVO> searchlandmark(SearchLandmarkVO searchlandmarkVO) {
		// TODO Auto-generated method stub
		return null;
	}
}
