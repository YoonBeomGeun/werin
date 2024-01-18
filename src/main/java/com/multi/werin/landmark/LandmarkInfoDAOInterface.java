package com.multi.werin.landmark;

import java.util.List;

public interface LandmarkInfoDAOInterface {

	void insert(LandmarkApiVO vo);

	List<LandmarkInfoVO> list(String ko);

}