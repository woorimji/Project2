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
            // �α��� ó�� ����

            // 1. �Ѿ�� ���� �޴´�.
            String id = request.getParameter("MEM_ID");
            String pw = request.getParameter("MEM_PW");
            String email = request.getParameter("MEM_EMAIL"); // �߰��� �κ�
            String name = request.getParameter("MEM_NAME"); // �߰��� �κ�
            String tel = request.getParameter("MEM_TEL"); // �߰��� �κ�
            YakajaDAO tidao1 = new YakajaDAO();
            YakajaVO mv = tidao1.memberLogin(id, pw);
            PrintWriter out = response.getWriter();

            System.out.println(mv);
            // ���ǿ� �α����� �� �޾ƿ� ���� ������ �ٸ� �������� �̵��� ������
            // �α��� ���¸� �����ϰ� �Ѵ�.
            HttpSession session = request.getSession();

            if (mv != null) {
                System.out.println("�α��� ����");

                session.setAttribute("id", mv.getmem_id());
                session.setAttribute("pw", mv.getMemPw());
                session.setAttribute("YakajaVO", mv);

                // �α��� �Ŀ� ���������� ������ ������
                YakajaVO myInfo = tidao1.MyInfo(id, email, name, tel);
                if (myInfo != null) {
                    // ���������� ������ ���ǿ� ����
                    session.setAttribute("YakajaVO", myInfo);
                    

                                     
                      
                }
            } else {
                System.out.println("�α��� ����");
                // �α��� ���� �� ó���� ���� �ۼ�
            }
        }

        // �ٸ� �׼ǿ� ���� ó�� ���� �ۼ�
        // ...
    }
}