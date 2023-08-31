package com.haeva.my;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yakaja.dao.YakajaDAO;
import com.yakaja.vo.YakajaVO;

public class Haevalogin implements HaevaImpl {

    @Override
    public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String action = (String)request.getAttribute("action"); // 액션 파라미터 값 확인
        String msg = "";
        String url ="";
        System.out.println("login Impl");
        if ("login".equals(action)) {
            // 로그인 처리 로직
            
            // 1. 넘어온 값을 받는다.
            String id = request.getParameter("MEM_ID");
            String pw = request.getParameter("MEM_PW");

            // 2. 처리 (쿼리 실행)
            YakajaDAO tidao1 = new YakajaDAO();
            YakajaVO mv = tidao1.memberLogin(id, pw); // memberLogin 메서드 구현 필요
            PrintWriter out = response.getWriter();

            System.out.println(mv);
            // 세션에 로그인할 때 받아온 값을 저장해 다른 페이지로 이동할 때에도
            // 로그인 상태를 유지하게 한다.
            HttpSession session = request.getSession();

           

            if (mv != null) {
                System.out.println("로그인성공");

                session.setAttribute("id", mv.getmem_id());
                session.setAttribute("pw", mv.getMemPw());
                session.setAttribute("YakajaVO", mv);

                //msg="login-success";
                msg = "로그인 성공";
                request.setAttribute("msg", msg);
                request.setAttribute("url", "index.jsp");


                // 3. 이동
                // saveUrl이라는 로그인 페이지로 이동하기 전 url이 있을 경우 그 페이지로 이동
                // 없을 경우 인덱스 페이지로 이동
                /*
                 * String saveUrl = (String) session.getAttribute("saveUrl"); if (saveUrl !=
                 * null) { response.sendRedirect(saveUrl); } else {
                 * response.sendRedirect(request.getContextPath() + "/login.jsp"); }
                 */
            } else {


                // msg="login-fail";
                msg = "로그인 실패";
                request.setAttribute("msg", msg);
                request.setAttribute("url", "login_ok.jsp");


            }
            
        } else if ("logout".equals(action)) {
            // 로그아웃 처리 로직
            HttpSession session = request.getSession();
            System.out.println(session);
            session.invalidate(); // 세션 무효화

            msg = "로그아웃되었습니다.";
            request.setAttribute("msg", msg);
            request.setAttribute("url", "index.jsp");
        }
         
        // ...
        
    }
}