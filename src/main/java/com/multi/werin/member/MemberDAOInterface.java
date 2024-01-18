package com.multi.werin.member;

public interface MemberDAOInterface {

	int insert(MemberVO vo);

	MemberVO login(MemberVO vo);

	int idChk(MemberVO vo) throws Exception;

}