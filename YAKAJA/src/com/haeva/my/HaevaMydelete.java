package com.haeva.my;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yakaja.dao.YakajaDAO;
import com.yakaja.vo.YakajaVO;

public class HaevaMydelete implements HaevaImpl {

    @Override
    public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        YakajaDAO tidao1 = new YakajaDAO();
        String msg = "";
        String url = "";
        System.out.println("delete1");

        String confirmMsg = "정말로 삭제하시겠습니까? (삭제 시 예약정보 및 내역은 일괄 삭제됩니다.)" ;
        request.setAttribute("confirmMsg", confirmMsg);		
        request.setAttribute("url", "Mydelete.jsp");

        
        
        
        // 사용자의 선택에 따라 다른 동작 수행
        String action = (String) request.getAttribute("action");
        if (action != null && action.equals("confirm")) {
            // 확인 선택 시 삭제 수행
            String id = (String) session.getAttribute("id");
            String pw = request.getParameter("MEM_PW");
            
            
            
            try {
                tidao1 = new YakajaDAO();
                
                
                System.out.println(id);
                System.out.println(pw);
                
                
                // 비밀번호 검증 로직 구현 필요
                if (tidao1.isValidPassword(id, pw)) { // 수정된 부분
                    tidao1.delete(id);
                    session.invalidate();
                    msg = "삭제되었습니다";
                    request.setAttribute("msg", msg);
                    request.setAttribute("url", "index.jsp");
                    response.setHeader("Refresh", "2;URL=index.jsp");
                } else {
                    msg = "비밀번호가 올바르지 않습니다";
                    request.setAttribute("msg", msg);
                    request.setAttribute("url", "Mydelete.jsp");
                }
            } catch (Exception e) {
                // 예외 처리
            }
        } else {
            // 기본 동작 (메시지 표시)
            msg = "정말로 삭제하시겠습니까? (삭제 시 예약정보 및 내역은 일괄 삭제됩니다.)";
            request.setAttribute("msg", msg);
            //request.getRequestDispatcher("msg.jsp").forward(request, response);
        }
    }
}


