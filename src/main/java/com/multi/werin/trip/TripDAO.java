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

	public int delete(TripVO vo) {
		return my.delete("trip.delete", vo);
	}

	public List<TripVO> list() {
		return my.selectList("trip.list");
	}

	public TripVO one(int trip_id) {
		return my.selectOne("trip.one", trip_id);
	}
}
