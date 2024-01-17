package com.multi.werin.bbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.multi.werin.gowith.GowithcmtVO;


@Repository
public class BbscmtDAO {
	@Autowired
	SqlSessionTemplate my;
	
	public int insert(BbscmtVO bbscmtVO) {
		return my.insert("bbscmt.create", bbscmtVO);
	}
	
	public int update(BbscmtVO bbscmtVO) {
		return my.update("bbscmt.update", bbscmtVO);
	}
	
	public int delete(int bbscmt_id) {
		return my.delete("bbscmt.delete", bbscmt_id);
	}
	
	public BbscmtVO one(int bbscmt_id) {
		return my.selectOne("gowithcmt.one", bbscmt_id);
	}
	
	public List<BbscmtVO> list(int bbs_id) {
		return my.selectList("bbscmt.list", bbs_id);
	}
	
}
