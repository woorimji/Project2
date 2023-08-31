
package com.itbank.libook.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.libook.vo.MemberVO;

public class LoginInterceptor implements HandlerInterceptor {

	// preHandle
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		String id = null;
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
		if(memberVO != null)
			id = memberVO.getMember_id();
		// String id = (String)session.getAttribute("id");
		
		System.out.println("[preHandle]" + id);
		
		//만약 로그인하지 않았다면 로그인 페이지로 redirect 한다.
		if(id == null) {
			response.sendRedirect("loginForm.do");
			return false;
		}
		return true;
	}
	// postHandle

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("[postHandle]");
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	// afterCompletion


	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("[afterCompletion]");
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}

}
