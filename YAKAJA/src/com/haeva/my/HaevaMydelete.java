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

        String confirmMsg = "������ �����Ͻðڽ��ϱ�? (���� �� �������� �� ������ �ϰ� �����˴ϴ�.)" ;
        request.setAttribute("confirmMsg", confirmMsg);		
        request.setAttribute("url", "Mydelete.jsp");

        
        
        
        // ������� ���ÿ� ���� �ٸ� ���� ����
        String action = (String) request.getAttribute("action");
        if (action != null && action.equals("confirm")) {
            // Ȯ�� ���� �� ���� ����
            String id = (String) session.getAttribute("id");
            String pw = request.getParameter("MEM_PW");
            
            
            
            try {
                tidao1 = new YakajaDAO();
                
                
                System.out.println(id);
                System.out.println(pw);
                
                
                // ��й�ȣ ���� ���� ���� �ʿ�
                if (tidao1.isValidPassword(id, pw)) { // ������ �κ�
                    tidao1.delete(id);
                    session.invalidate();
                    msg = "�����Ǿ����ϴ�";
                    request.setAttribute("msg", msg);
                    request.setAttribute("url", "index.jsp");
                    response.setHeader("Refresh", "2;URL=index.jsp");
                } else {
                    msg = "��й�ȣ�� �ùٸ��� �ʽ��ϴ�";
                    request.setAttribute("msg", msg);
                    request.setAttribute("url", "Mydelete.jsp");
                }
            } catch (Exception e) {
                // ���� ó��
            }
        } else {
            // �⺻ ���� (�޽��� ǥ��)
            msg = "������ �����Ͻðڽ��ϱ�? (���� �� �������� �� ������ �ϰ� �����˴ϴ�.)";
            request.setAttribute("msg", msg);
            //request.getRequestDispatcher("msg.jsp").forward(request, response);
        }
    }
}


