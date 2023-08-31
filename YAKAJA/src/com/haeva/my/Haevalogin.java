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
        String action = (String)request.getAttribute("action"); // �׼� �Ķ���� �� Ȯ��
        String msg = "";
        String url ="";
        System.out.println("login Impl");
        if ("login".equals(action)) {
            // �α��� ó�� ����
            
            // 1. �Ѿ�� ���� �޴´�.
            String id = request.getParameter("MEM_ID");
            String pw = request.getParameter("MEM_PW");

            // 2. ó�� (���� ����)
            YakajaDAO tidao1 = new YakajaDAO();
            YakajaVO mv = tidao1.memberLogin(id, pw); // memberLogin �޼��� ���� �ʿ�
            PrintWriter out = response.getWriter();

            System.out.println(mv);
            // ���ǿ� �α����� �� �޾ƿ� ���� ������ �ٸ� �������� �̵��� ������
            // �α��� ���¸� �����ϰ� �Ѵ�.
            HttpSession session = request.getSession();

           

            if (mv != null) {
                System.out.println("�α��μ���");

                session.setAttribute("id", mv.getmem_id());
                session.setAttribute("pw", mv.getMemPw());
                session.setAttribute("YakajaVO", mv);

                //msg="login-success";
                msg = "�α��� ����";
                request.setAttribute("msg", msg);
                request.setAttribute("url", "index.jsp");


                // 3. �̵�
                // saveUrl�̶�� �α��� �������� �̵��ϱ� �� url�� ���� ��� �� �������� �̵�
                // ���� ��� �ε��� �������� �̵�
                /*
                 * String saveUrl = (String) session.getAttribute("saveUrl"); if (saveUrl !=
                 * null) { response.sendRedirect(saveUrl); } else {
                 * response.sendRedirect(request.getContextPath() + "/login.jsp"); }
                 */
            } else {


                // msg="login-fail";
                msg = "�α��� ����";
                request.setAttribute("msg", msg);
                request.setAttribute("url", "login_ok.jsp");


            }
            
        } else if ("logout".equals(action)) {
            // �α׾ƿ� ó�� ����
            HttpSession session = request.getSession();
            System.out.println(session);
            session.invalidate(); // ���� ��ȿȭ

            msg = "�α׾ƿ��Ǿ����ϴ�.";
            request.setAttribute("msg", msg);
            request.setAttribute("url", "index.jsp");
        }
         
        // ...
        
    }
}