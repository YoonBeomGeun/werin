package com.multi.werin.gowith;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GowithDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public int insert(GowithVO gowithVO) {
		return my.insert("gowith.create", gowithVO);
	}
	
	public GowithVO one(GowithVO gowithVO) {
		return my.selectOne("gowith.one", gowithVO);
	}
	
	public int count() {
		return my.selectOne("gowith.count");
	}
	
	public List<GowithVO> list1(PageVO pageVO) {
		return my.selectList("gowith.list", pageVO);
	}
}
