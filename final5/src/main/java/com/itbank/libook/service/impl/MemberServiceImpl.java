package com.itbank.libook.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.libook.service.MemberService;
import com.itbank.libook.service.dao.MemberDAO;
import com.itbank.libook.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;

	public void insertMember(MemberVO memberVO) {
		memberDAO.insertMember(memberVO);
	}

	@Override
	public int idCheck(String member_id) {
		int cnt = memberDAO.idCheck(member_id);
		System.out.println("cnt:" + cnt);
		return cnt;
	}

	@Override
	public int emailCheck(String member_email) {
		int cnt = memberDAO.emailCheck(member_email);
		System.out.println("cnt:" + cnt);
		return cnt;
	}

	@Override
	public int telCheck(String member_tel) {
		int cnt = memberDAO.telCheck(member_tel);
		System.out.println("cnt:" + cnt);
		return cnt;
	}

	@Override
	public MemberVO login(MemberVO memberVO) {
		return memberDAO.login(memberVO);
	}

	@Override
	public int sendIdEmail(MemberVO memberVO) {
		return memberDAO.sendIdEmail(memberVO);
	}

	@Override
	public int sendPwEmail(MemberVO memberVO) {
		return memberDAO.sendPwEmail(memberVO);
	}

	@Override
	public String myId(String member_name) {
		return memberDAO.myId(member_name);
	}

	@Override
	public String myPassword(String member_id) {
		return memberDAO.myPassword(member_id);
	}
	
	@Override
	public void updateMyInfo(MemberVO memberVO) throws Exception{
		memberDAO.updateMyInfo(memberVO);
		
	}
	
	@Override
	public void deleteMyInfo(MemberVO memberVO) {
	      memberDAO.deleteMyInfo(memberVO);
	      
	   }
	
	
	
	//우림
	@Override
    public ArrayList<MemberVO> listMember() {
        return memberDAO.listMember();
    }
    
    
	@Override
	public int deleteMember(MemberVO memberVO) {
		
		
		System.out.println(memberVO.getMember_num());
		int flag = memberDAO.deleteMember(memberVO);
        if (flag > 0) {
            // 삭제 성공 시 처리
            System.out.println("회원 삭제 성공");
        } else {
            // 삭제 실패 시 처리
            System.out.println("회원 삭제 실패");
        }
        return flag;
	}

}