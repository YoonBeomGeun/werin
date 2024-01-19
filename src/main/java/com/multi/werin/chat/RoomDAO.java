package com.multi.werin.chat;

import java.util.List;

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
	
	public int deleteRoom(int room_id) {
		return my.delete("room.deleteRoom", room_id);
	}
	
	public int countPick(RoomVO roomVO) {
		return my.selectOne("room.countpick", roomVO);
	}
	
	public RoomVO pick(RoomVO roomVO) {
		return my.selectOne("room.pick", roomVO);
	}
	
	public RoomVO one(int room_id) {
		return my.selectOne("room.one", room_id);
	}
	
	public List<RoomVO> roomList(String room_member) {
		return my.selectList("room.roomList", room_member);
	}
	
}
