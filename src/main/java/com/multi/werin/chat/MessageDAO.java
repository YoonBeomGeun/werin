package com.multi.werin.chat;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public int insert(MessageVO messageVO) {
		return my.insert("message.create", messageVO);
	}
	
	public List<MessageVO> list(int room_id) {
		return my.selectList("message.list", room_id);
	}
}
