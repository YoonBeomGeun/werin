package com.multi.werin.trip;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TripDAO implements TripDAOInterface {
	@Autowired
	SqlSessionTemplate my;

	@Override
	public int insert(TripVO vo) {
		return my.insert("trip.create", vo);
	}

	@Override
	public int update(TripVO vo) {
		return my.update("trip.update", vo);
	}
	
	
	@Override
	public int incrementCount(int trip_id) { 
		return my.update("trip.viewCount", trip_id);
	}
	 

	@Override
	public int delete(TripVO vo) {
		return my.delete("trip.delete", vo);
	}

	@Override
	public List<TripVO> list(PageVO1 pageVO) {
		return my.selectList("trip.list", pageVO);
	}
	
	@Override
	public int count() {
		return my.selectOne("trip.count");
	}

	@Override
	public TripVO one(Integer trip_id) {
		return my.selectOne("trip.one", trip_id);
	}
	
	@Override
	public int insertLike(TripLikeVO vo) {
		return my.insert("trip.insertLike", vo);
	}
	
	@Override
	public int insertDislike(TripLikeVO vo) {
		return my.insert("trip.insertDislike", vo);
	}
	
	
	@Override
	public int updateLike(TripVO vo) {
		return my.update("trip.updateLike", vo);
	}
	
	@Override
	public int updateLike2(TripLikeVO vo) {
		return my.update("trip.updateLike2", vo);
	}
	
	@Override
	public int updateDislike(TripVO vo) {
		return my.update("trip.updateDislike", vo);
	}
	
	@Override
	public TripLikeVO likeCheck(TripLikeVO vo) {
		return my.selectOne("trip.likeCheck", vo);	
		}
}
