package com.multi.werin.chat;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RoomDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public int insert(RoomVO roomVO) {
		return my.insert("room.create", roomVO);
	}
	
	public RoomVO one(int room_id) {
		return my.selectOne("room.one", room_id);
	}
	
}
