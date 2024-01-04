package com.multi.werin.bbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class BbsDAO{
	
	@Autowired
	SqlSessionTemplate my;
	
	public int insertPost(BbsVO bbsVO) {
		return my.insert("bbs.create", bbsVO);
	}
	
	public int updatePost(BbsVO bbsVO) {
		return my.update("bbs.update", bbsVO);
	}
	
	public int deletePost(int bbs_id) {
		int result = my.delete("bbs.delete", bbs_id);
		return result;
	}
	
	public List<BbsVO> list1(PageVO pageVO) {
		return my.selectList("bbs.list", pageVO);
	}
	
	public int count() {
		return my.selectOne("bbs.count");
	}
	
	public BbsVO one(BbsVO bbsVO) {
		return my.selectOne("bbs.one", bbsVO);
		
	}
}