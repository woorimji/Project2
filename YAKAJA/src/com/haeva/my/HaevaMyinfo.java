package com.haeva.my;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.yakaja.dao.YakajaDAO;
import com.yakaja.vo.YakajaVO;

public class HaevaMyinfo implements HaevaImpl {

    @Override
    public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {

        request.setCharacterEncoding("euc-kr");
        response.setCharacterEncoding("euc-kr");

        String action = (String) request.getAttribute("action");
        if ("login".equals(action)) {
            // 로그인 처리 로직

            // 1. 넘어온 값을 받는다.
            String id = request.getParameter("MEM_ID");
            String pw = request.getParameter("MEM_PW");
            String email = request.getParameter("MEM_EMAIL"); // 추가된 부분
            String name = request.getParameter("MEM_NAME"); // 추가된 부분
            String tel = request.getParameter("MEM_TEL"); // 추가된 부분
            YakajaDAO tidao1 = new YakajaDAO();
            YakajaVO mv = tidao1.memberLogin(id, pw);
            PrintWriter out = response.getWriter();

            System.out.println(mv);
            // 세션에 로그인할 때 받아온 값을 저장해 다른 페이지로 이동할 때에도
            // 로그인 상태를 유지하게 한다.
            HttpSession session = request.getSession();

            if (mv != null) {
                System.out.println("로그인 성공");

                session.setAttribute("id", mv.getmem_id());
                session.setAttribute("pw", mv.getMemPw());
                session.setAttribute("YakajaVO", mv);

                // 로그인 후에 마이페이지 정보를 가져옴
                YakajaVO myInfo = tidao1.MyInfo(id, email, name, tel);
                if (myInfo != null) {
                    // 마이페이지 정보를 세션에 저장
                    session.setAttribute("YakajaVO", myInfo);
                    

                                     
                      
                }
            } else {
                System.out.println("로그인 실패");
                // 로그인 실패 시 처리할 로직 작성
            }
        }

        // 다른 액션에 대한 처리 로직 작성
        // ...
    }
}