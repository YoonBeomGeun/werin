package com.multi.werin.gowith;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GowithcmtDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public int insert(GowithcmtVO gowithcmtVO) {
		return my.insert("gowithcmt.create", gowithcmtVO);
	}
	
	public int update(GowithcmtVO gowithcmtVO) {
		return my.update("gowithcmt.update", gowithcmtVO);
	}
	
	public int delete(int gowithcmt_id) {
		return my.delete("gowithcmt.delete", gowithcmt_id);
	}
	
	public GowithcmtVO one(int gowithcmt_id) {
		return my.selectOne("gowithcmt.one", gowithcmt_id);
	}
	
	public int countCmt(int gowith_id) {
		return my.selectOne("gowithcmt.countCmt", gowith_id);
	}
	
	public List<GowithcmtVO> list(int gowith_id) {
		return my.selectList("gowithcmt.list", gowith_id);
	}
}
