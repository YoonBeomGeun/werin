package com.multi.werin.main;

import java.util.List;

public interface MainDAOInterface {

	List<MainlandmarkVO> recommendlandmark(MainlandmarkVO mainlandmarkVO);

	List<SearchLandmarkVO> searchlandmark(SearchLandmarkVO searchlandmarkVO);

	List<SearchBbsVO> searchbbs(SearchBbsVO searchbbsVO);

	List<SearchTripVO> searchtrip(SearchTripVO searchtripVO);

	List<MaintripVO> hottravel(MaintripVO maintripVO);

	List<MainintroducestoreVO> hotshop(MainintroducestoreVO mainintroducestoreVO);

	List<MainbbsVO> hotboard(MainbbsVO mainbbsVO);

	List<SearchLandmarkVO> morelandmark(SearchVO searchVO);

	List<SearchTripVO> moretrip(SearchVO searchVO);

	List<SearchBbsVO> morebbs(SearchVO searchVO);

	int landmark_count(SearchVO searchVO);

	int trip_count(SearchVO searchVO);

	int bbs_count(SearchVO searchVO);

}