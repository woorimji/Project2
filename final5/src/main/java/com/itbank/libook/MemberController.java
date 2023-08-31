package com.itbank.libook;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UrlPathHelper;

import com.itbank.libook.service.MemberService;
import com.itbank.libook.vo.MemberVO;

@Controller
public class MemberController {

	//
	@Resource(name = "memberService")
	private MemberService memberService;

	@Autowired
	private JavaMailSender mailSender;

	////////////////////////////////////////
	// 회원가입-form
	@RequestMapping("/createAccountForm.do")
	public String createAccountForm() {
		return "user/login/createAccountForm";
	}//

	// 회원가입
	@RequestMapping("/createAccount.do")
	public String createAccount(@ModelAttribute("memberVO") MemberVO memberVO, HttpServletRequest request) throws Exception {
		memberService.insertMember(memberVO);

		request.setAttribute("msg", "회원가입 완료");
	      request.setAttribute("url", "loginForm.do");

	      return "message";
	}//

	// 회원가입-아이디 중복체크
	@PostMapping("/idCheck.do")
	@ResponseBody
	public int idCheck(@RequestParam("member_id") String member_id) throws Exception {
		int cnt = memberService.idCheck(member_id);
		return cnt;
	}

	// 회원가입-이메일 중복체크
	@PostMapping("/emailCheck.do")
	@ResponseBody
	public int emailCheck(@RequestParam("member_email") String member_email) throws Exception {
		int cnt = memberService.emailCheck(member_email);
		return cnt;
	}

	// 회원가입-이메일 중복체크
	@PostMapping("/telCheck.do")
	@ResponseBody
	public int telCheck(@RequestParam("member_tel") String member_tel) throws Exception {
		int cnt = memberService.telCheck(member_tel);
		return cnt;
	}

	// 로그인페이지 이동
	@RequestMapping(value = "/loginForm.do")
	public String loginForm() {
		return "user/login/loginForm";
	}

	// 로그인
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(@ModelAttribute("memberVO") MemberVO memberVO, HttpSession session, HttpServletRequest request)
			throws Exception {

		String returnUrl = "";

		// 기존에 login이란 세션 값이 존재한다면
		if (session.getAttribute("memberVO") != null) {
			session.removeAttribute("memberVO"); // 기존값을 제거해 준다.
		}

		// 로그인 성공여부 판단
		MemberVO mvo = memberService.login(memberVO);

		if (mvo != null) {
			session.setAttribute("memberVO", mvo);
			returnUrl = "libookMain";
			
		} else{
			request.setAttribute("msg", "ID 또는 비밀번호가 틀립니다.");
			request.setAttribute("url", "loginForm.do");
			
			returnUrl = "message";
		}
		return returnUrl;
	}

	// 아이디 찾기
	@RequestMapping("/findId.do")
	public String goFindIdForm() {
		return "user/login/findId";
	}

	// 아이디 발송 구현
	@RequestMapping(value = "/sendIdEmail.do", method = RequestMethod.POST)
	public String sendIdEmail(@ModelAttribute("memberVO") MemberVO memberVO,
			@RequestParam("member_name") String member_name, HttpServletRequest request) throws Exception {

		int result = memberService.sendIdEmail(memberVO);

		// 이메일 발송
		if (result > 0) {

			String memId = memberService.myId(member_name);

			String subject = "아이디입니다.";
			String content = "아이디는 " + memId + "입니다.";

			String from = "zz239966@naver.com";
			String to = memberVO.getMember_email();

			final MimeMessagePreparator preparator = new MimeMessagePreparator() {
				public void prepare(MimeMessage mimeMessage) throws Exception {
					final MimeMessageHelper mailHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

					mailHelper.setFrom(from);
					mailHelper.setTo(to);
					mailHelper.setSubject(subject);
					mailHelper.setText(content, true);// html 사용

				}
			};

			try {
				mailSender.send(preparator);
			} catch (Exception e) {
				e.printStackTrace();
			}

			request.setAttribute("msg", "아이디가 발송되었습니다");
			request.setAttribute("url", "loginForm.do");
		} else {
			request.setAttribute("msg", "해당 회원의 정보가 존재하지 않습니다.");
			request.setAttribute("url", "findId.do");
		}

		return "message";
	}// sendEmail-end

	// 비밀번호 찾기
	@RequestMapping("/findPassword.do")
	public String goFindPwForm() {
		return "user/login/findPassword";
	}

	// 비밀번호 발송
	@RequestMapping(value = "/sendPwEmail.do", method = RequestMethod.POST)
	public String sendPwEmail(@ModelAttribute("memberVO") MemberVO memberVO,
			@RequestParam("member_id") String member_id, HttpServletRequest request) throws Exception {

		int result = memberService.sendPwEmail(memberVO);

		// 이메일 발송 구현
		if (result > 0) {

			String memPw = memberService.myPassword(member_id);

			String subject = "비밀번호입니다.";
			String content = "비밀번호는 " + memPw + "입니다.";

			String from = "zz239966@naver.com";
			String to = memberVO.getMember_email();

			final MimeMessagePreparator preparator = new MimeMessagePreparator() {
				public void prepare(MimeMessage mimeMessage) throws Exception {
					final MimeMessageHelper mailHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

					mailHelper.setFrom(from);
					mailHelper.setTo(to);
					mailHelper.setSubject(subject);
					mailHelper.setText(content, true);// html 사용

				}
			};

			try {
				mailSender.send(preparator);
			} catch (Exception e) {
				e.printStackTrace();
			}

			request.setAttribute("msg", "비밀번호가 발송되었습니다");
			request.setAttribute("url", "loginForm.do");
		} else {
			request.setAttribute("msg", "해당 회원의 정보가 존재하지 않습니다.");
			request.setAttribute("url", "findPassword.do");
		}

		return "message";
	}// sendEmail-end

	// 마이페이지 이동
	// 마이페이지 이동
	@RequestMapping("/mypage.do")
	public String goMypage() {
		return "/user/login/mypage";
	}

	// 내정보수정
	@RequestMapping("/updateMyInfo.do")
	   public String updateMyInfo(@ModelAttribute("memberVO") MemberVO memberVO, HttpSession session) throws Exception {
	      //업데이트 시킴
	      memberService.updateMyInfo(memberVO);
	      
	       // 기존 세션 제거
	      if (session.getAttribute("memberVO") != null) {
	         session.removeAttribute("membeVO");
	      }
	      
	      MemberVO mvo = memberService.login(memberVO);
	      String returnUrl = "";
	      if (mvo != null) {
	         session.setAttribute("memberVO", mvo);
	         //String priorUrl = (String) session.getAttribute("url_prior_login");
	         
	         //로그인 성공시
	         returnUrl = "redirect:/mypage.do";
	         
	      }
	      return returnUrl;
	   }//

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("memberVO");

		return "user/login/loginForm";
	}
	
	@RequestMapping("/deleteMyInfo.do")
	   public String deleteMyInfo(@ModelAttribute("memberVO") MemberVO memberVO, HttpSession session) {
	      memberService.deleteMyInfo(memberVO);
	      if (session.getAttribute("memberVO") != null) {
	         session.removeAttribute("memberVO");
	      }
	      return "libookMain";
	   }
	
	
	
	
	
	
	
	
	
	
	//우림
	@RequestMapping(value = "/memberList.do") 
	public String listMember(Model model) throws Exception {
		ArrayList<MemberVO> alist = memberService.listMember();
		model.addAttribute("alist", alist); 
		return "admin/listMember"; 
	}
	@RequestMapping(value = "/deleteMember.do", method = RequestMethod.GET)
	public String deleteMemberForm(Model model) {
	    try {
	        ArrayList<MemberVO> alist = memberService.listMember();
	        model.addAttribute("alist", alist);
	    } catch (Exception e) {
	        e.printStackTrace();
	        // 실패 시 처리
	    }
	    
	    System.out.println(model);
	    
	    return "admin/deleteMember"; // deleteMember.jsp 뷰 페이지로 이동
	}
	
	@RequestMapping(value = "/deleteMember.do", method = RequestMethod.POST, consumes="application/json;") 
	public String deleteMember(@RequestBody MemberVO memberVO, HttpServletResponse response) {
	    // String member_num = member.getMember_num();
	    // System.out.println(member_num);
	    System.out.print("데이터 수신 완료");
	    System.out.println("member_num : " + memberVO.getMember_num());
		// String member_num = (String)data.get("member_num");
		// System.out.println(member_num);
		
	    try {
	        int flag = memberService.deleteMember(memberVO);
	        if (flag > 0) {
	            // 삭제 성공 시 처리
	            System.out.println("회원 삭제 성공");
	        } else {
	            // 삭제 실패 시 처리
	            System.out.println("회원 삭제 실패");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    // System.out.println(member_num);
	    
	    return "redirect:/memberList.do"; // 회원 목록 페이지로 리다이렉트
	}
	
	
	/*
	 * @RequestMapping(value="/kakaoLoginPro.do", method=RequestMethod.POST) public
	 * Map<String, Object> kakaoLoginPro(@RequestParam Map<String,Object>
	 * paramMap,HttpSession session) throws SQLException, Exception {
	 * System.out.println("paramMap:" + paramMap); Map <String, Object> resultMap =
	 * new HashMap<String, Object>();
	 * 
	 * Map<String, Object> kakaoConnectionCheck =
	 * userservice.kakaoConnectionCheck(paramMap); if(kakaoConnectionCheck == null)
	 * { //일치하는 이메일 없으면 가입 resultMap.put("JavaData", "register"); }else
	 * if(kakaoConnectionCheck.get("KAKAOLOGIN") == null &&
	 * kakaoConnectionCheck.get("EMAIL") != null) { //이메일 가입 되어있고 카카오 연동 안되어 있을시
	 * System.out.println("kakaoLogin"); userservice.setKakaoConnection(paramMap);
	 * Map<String, Object> loginCheck = userservice.userKakaoLoginPro(paramMap);
	 * session.setAttribute("userInfo", loginCheck); resultMap.put("JavaData",
	 * "YES"); }else{ Map<String, Object> loginCheck =
	 * userservice.userKakaoLoginPro(paramMap); session.setAttribute("userInfo",
	 * loginCheck); resultMap.put("JavaData", "YES"); }
	 * 
	 * return resultMap; }
	 */
	
	@RequestMapping(value="setSnsInfo.do")
	public String setKakaoInfo(Model model,HttpSession session,@RequestParam Map<String,Object> paramMap) {
		System.out.println("setKakaoInfo");	
		System.out.println("param ==>"+paramMap);
		
		model.addAttribute("email",paramMap.get("email"));
		model.addAttribute("password",paramMap.get("id"));
		model.addAttribute("flag",paramMap.get("flag"));
		return "user/login/setSnsInfo";
	}
	
//	@RequestMapping(value = "/userid_duplicate_check", method = RequestMethod.POST)
//	@ResponseBody
//	public CommonData userid_duplicate_check(HttpServletRequest request, HttpServletResponse response, @RequestBody CommonData dto, Model model) throws Exception
//	{
//		Util_Message smsp = Util_Message.getInstance();
//		CommonData result = new CommonData();
//		int cnt = first_service.listSearchCount(dto, "MemberMapper.userid_duplicate_check");
//		if (cnt > 0)
//		{
//			result.put("result", "id_duplication");
//			return result;
//		}
//		result.put("result", "ok");
//		return result;
//	}
	

}// class-end