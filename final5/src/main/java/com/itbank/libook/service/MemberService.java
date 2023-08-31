package com.itbank.libook.service;

import java.util.ArrayList;

import com.itbank.libook.vo.MemberVO;

public interface MemberService {

	// 회원가입
	void insertMember(MemberVO memberVO) throws Exception;

	// 아이디 유효성검사
	int idCheck(String member_id) throws Exception;

	// 이메일 유효성검사
	int emailCheck(String member_email) throws Exception;

	// 전화번호 유효성검사
	int telCheck(String member_tel) throws Exception;

	// 로그인
	MemberVO login(MemberVO memberVO) throws Exception;

	// 아이디 보내기
	int sendIdEmail(MemberVO memberVO);

	// 비밀번호 보내기
	int sendPwEmail(MemberVO memberVO);

	// 아이디 받아오기
	String myId(String member_name);

	// 비밀번호 받아오기
	String myPassword(String member_id);

	// 내정보수정
	void updateMyInfo(MemberVO memberVO) throws Exception;
	
	// 회원탈퇴
	void deleteMyInfo(MemberVO memberVO);
	

	// 우림
	ArrayList<MemberVO> listMember() throws Exception;

	int deleteMember(MemberVO memberVO) throws Exception;

}