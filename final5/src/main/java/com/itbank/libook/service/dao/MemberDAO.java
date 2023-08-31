package com.itbank.libook.service.dao;


import java.util.ArrayList;

import com.itbank.libook.vo.MemberVO;

public interface MemberDAO {

	void insertMember(MemberVO memberVO);

	int idCheck(String member_id);

	int emailCheck(String member_email);

	int telCheck(String member_tel);

	MemberVO login(MemberVO memberVO);

	int sendIdEmail(MemberVO memberVO);
	
	int sendPwEmail(MemberVO memberVO);

	String myId(String member_name);
	
	String myPassword(String member_id);

	void updateMyInfo(MemberVO memberVO) throws Exception;

	void deleteMyInfo(MemberVO memberVO);
	
	//우림
	ArrayList<MemberVO> listMember();
	    
	int deleteMember(MemberVO memberVO);
	




}