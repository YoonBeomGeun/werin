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
	 
	 public MemberVO pointcheck(MemberVO membervo) {
		 return my.selectOne("member.pointcheck", membervo);
	 }
	 
	 public int updategrade(MemberVO membervo) {
		 return my.update("member.updategrade", membervo);
	 }
	 
	 public int updatelevel(int variation) {
		 return my.update("member.updatelevel", variation);
	 }
}