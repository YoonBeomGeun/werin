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
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public int insert(MemberVO vo) {
		return my.insert("member.create", vo);
	}
	
	 public MemberVO login(MemberVO vo) {
	        return my.selectOne("member.login", vo);
	 }
	 
	 public int idChk(MemberVO vo) throws Exception {
	 	return my.selectOne("member.idChk", vo);
	 }
}