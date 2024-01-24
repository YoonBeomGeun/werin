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
	
	public int update(GowithVO gowithVO) {
		return my.update("gowith.update", gowithVO);		
	}
	
	public int delete(int gowith_id) {
		return my.delete("gowith.delete", gowith_id);
	}
	
	public String roomHost(int gowith_id) {
		return my.selectOne("gowith.roomHost", gowith_id);
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
	
	public int increaseView(int gowith_id) {
		return my.update("gowith.increaseView", gowith_id);
	}
	
	public int insertLike(GowithLikeVO gowithLikeVO) {
		return my.insert("gowith.createLike", gowithLikeVO);
	}
	
	public int insertDislike(GowithLikeVO gowithLikeVO) {
		return my.insert("gowith.createDislike", gowithLikeVO);
	}
	
	public int deleteLike(GowithLikeVO gowithLikeVO) {
		return my.delete("gowith.deleteLike", gowithLikeVO);
	}
	
	public int stateIn(GowithLikeVO gowithLikeVO) {
		return my.selectOne("gowith.stateIn", gowithLikeVO);
	}
	
	public int checkState(GowithLikeVO gowithLikeVO) {
		return my.selectOne("gowith.checkState", gowithLikeVO);
	}
	
//	public int changeState1(GowithLikeVO gowithLikeVO) {
//		return my.update("gowith.changeState1", gowithLikeVO);
//	}
	
	public int updateLike1(int gowith_id) {
		return my.update("gowith.updateLike1", gowith_id);
	}
	
	public int updateLike2(int gowith_id) {
		return my.update("gowith.updateLike2", gowith_id);
	}
	
	public int updateDislike1(int gowith_id) {
		return my.update("gowith.updateDislike1", gowith_id);
	}
	
	public int updateDislike2(int gowith_id) {
		return my.update("gowith.updateDislike2", gowith_id);
	}
	
	public int totalLike(int gowith_id) {
		return my.selectOne("gowith.totalLike", gowith_id);
	}
	
	public int totalDislike(int gowith_id) {
		return my.selectOne("gowith.totalDislike", gowith_id);
	}
}
