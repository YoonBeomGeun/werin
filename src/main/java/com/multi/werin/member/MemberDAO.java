package com.multi.werin.member;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO implements MemberDAOInterface {
	
	@Autowired
	SqlSessionTemplate my;
	
	@Override
	public int insert(MemberVO vo) {
		return my.insert("member.create", vo);
	}
	
	 @Override
	public MemberVO login(MemberVO vo) {
	        return my.selectOne("member.login", vo);
	 }
	 
	 @Override
	public int idChk(MemberVO vo) throws Exception {
	 	return my.selectOne("member.idChk", vo);
	 }
	 
	 public MemberVO pointcheck(MemberVO memberVO) {
		 return my.selectOne("member.pointcheck", memberVO);
	 }
	 
	 public int updategrade(MemberVO memberVO) {
		 return my.update("member.updategrade", memberVO);
	 }
	 
	 public int updatelevel(MemberVO memberVO) {
		 return my.update("member.updatelevel", memberVO);
	 }
	 
	 public MemberVO callgrade(MemberVO memberVO) {
		 return my.selectOne("member.callgrade", memberVO);
	 }
}