package com.multi.werin.trip;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TripDAO {
	@Autowired
	SqlSessionTemplate my;

	public int insert(TripVO vo) {
		return my.insert("trip.create", vo);
	}

	public int update(TripVO vo) {
		return my.update("trip.update", vo);
	}
	
	
	public int incrementCount(int trip_id) { 
		return my.update("trip.viewCount", trip_id);
	}
	 

	public int delete(TripVO vo) {
		return my.delete("trip.delete", vo);
	}

	public List<TripVO> list(PageVO1 pageVO) {
		return my.selectList("trip.list", pageVO);
	}
	
	public int count() {
		return my.selectOne("trip.count");
	}

	public TripVO one(Integer trip_id) {
		return my.selectOne("trip.one", trip_id);
	}
	
	public int updateLike(Integer trip_id) {
		return my.update("trip.updateLike", trip_id);
	}
}
