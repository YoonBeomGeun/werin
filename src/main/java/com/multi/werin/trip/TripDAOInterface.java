package com.multi.werin.trip;

import java.util.List;

public interface TripDAOInterface {

	public abstract int insert(TripVO vo);

	public abstract int update(TripVO vo);

	public abstract int incrementCount(int trip_id);

	public abstract int delete(TripVO vo);

	public abstract List<TripVO> list(PageVO1 pageVO);

	public abstract int count();

	public abstract TripVO one(Integer trip_id);

	public abstract int insertLike(TripLikeVO vo);

	public abstract int updateLike(TripVO vo);

	public abstract int updateLike2(TripLikeVO vo);

	public abstract int updateDislike(TripVO vo);

	public abstract TripLikeVO likeCheck(TripLikeVO vo);

	public abstract int insertDislike(TripLikeVO vo);

}