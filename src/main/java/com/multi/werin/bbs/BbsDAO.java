package com.multi.werin.bbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.multi.werin.bbs.BbsVO;
import com.multi.werin.trip.TripLikeVO;
import com.multi.werin.trip.TripVO;

@Repository
public class BbsDAO {

	@Autowired
	SqlSessionTemplate my;

	public int insertBbs(BbsVO bbsVO) {
		return my.insert("bbs.create", bbsVO);
	}

	public int updateBbs(BbsVO bbsVO) {
		return my.update("bbs.update", bbsVO);
	}

	public int deleteBbs(int bbs_id) {
		int result = my.delete("bbs.delete", bbs_id);
		return result;
	}

	public int count() {
		return my.selectOne("bbs.count");
	}// 전체 게시물 카운트

	public BbsVO one(BbsVO bbsVO) {
		return my.selectOne("bbs.one", bbsVO);

	}

	public int increaseBbsView(int bbs_id) {
		return my.update("bbs.increaseView", bbs_id);
	}// 조회수(추후에 수정할수도 있음)

//	public int deleteCancelBbs(int bbs_id) {
//	    // 삭제 취소 로직을 수행하는 적절한 SQL을 실행
//	    return my.update("bbs.deleteCancel", bbs_id);
//	}

//	public int increaeBbsLike(int bbs_id) {
//		return my.update("bbs.increaseLike", bbs_id);
//	}//추천수(수정중..)
//	
	public List<BbsVO> list1(PageVO pageVO) {
		return my.selectList("bbs.list1", pageVO);
	}

	public List<BbsVO> getSearchList(PageVO pageVO) {
		return my.selectList("bbs.selectSearchList", pageVO);
	}// 검색기능

	public int count2(PageVO pageVO) {
		return my.selectOne("bbs.count2", pageVO);
	}// 검색기능에서 쓰는거

	public List<BbsVO> list2(PageVO pageVO) {
		return my.selectList("bbs.list", pageVO);
	}// 검색기능에서 쓰는거

	public int insertLike(BbslikeVO vo) {
		return my.insert("bbs.insertLike", vo);
	}

	
	 public int insertDislike(BbslikeVO vo) { 
		return my.insert("bbs.insertDislike", vo); 
	 }
	 

	public int updateLike(BbsVO vo) {
		return my.update("bbs.updateLike", vo);
	}

	public int updateLike2(BbslikeVO vo) {
		return my.update("bbs.updateLike2", vo);
	}

	public int updateDislike(BbsVO vo) {
		return my.update("bbs.updateDislike", vo);
	}

	public BbslikeVO likeCheck(BbslikeVO vo) {
		return my.selectOne("bbs.likeCheck", vo);
	}

}