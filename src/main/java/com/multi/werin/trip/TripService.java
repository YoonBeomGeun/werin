package com.multi.werin.trip;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TripService {
	
	@Autowired
	TripDAO dao;
	
	public int insert(TripVO vo) {
		return dao.insert(vo);
	}
	
	public int incrementCount(int trip_id) { 
		return dao.incrementCount(trip_id);
	}
	
	public TripVO one(Integer trip_id) {
		return dao.one(trip_id);
	}
}
