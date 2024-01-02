package com.multi.werin.bbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class BbscmtDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public int insert(BbscmtVO vo) {
		return my.insert("bbscmt.create",vo);
	}
	
	public List<BbscmtVO> list(int id) {
		return my.selectList("bbscmt.list", id);
	}
	
	public int update(BbscmtVO vo) {
	    return my.update("bbscmt.update", vo);
	}
	
	 public int delete(BbscmtVO vo) {
	     return my.delete("bbscmt.delete", vo);
	 }
}
