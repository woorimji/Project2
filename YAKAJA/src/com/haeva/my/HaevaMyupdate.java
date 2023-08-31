package com.haeva.my;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import com.yakaja.dao.YakajaDAO;
import com.yakaja.vo.ReservVO;
import com.yakaja.vo.YakajaVO;


public class HaevaMyupdate implements HaevaImpl{

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) {
		
        String msg = "";
        //String url ="";
		
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		YakajaDAO tidao1 = null;
		
		String id = request.getParameter("MEM_ID");
		String pw = request.getParameter("MEM_PW");
		String email = request.getParameter("MEM_EMAIL");
		String name = request.getParameter("MEM_NAME");
		String tel = request.getParameter("MEM_TEL");
		int admin = Integer.parseInt(request.getParameter("MEM_ADMIN"));
		
		try {
		tidao1 = new YakajaDAO();
		boolean success = tidao1.updateData(id, pw, email, name, tel, admin);

        if (success) {
            msg = "������Ʈ ����";
            
            YakajaVO yakajaVO = tidao1.memberLogin(id, pw);
            
            HttpSession session = request.getSession();
            session.setAttribute("YakajaVO", yakajaVO);
            request.setAttribute("msg", msg);
            request.setAttribute("url", "myinfo.jsp");
           // request.getRequestDispatcher(url).forward(request, response);
        } else {
            msg = "������Ʈ ����";
            request.setAttribute("msg", msg);
            request.setAttribute("url", "myupdate.jsp");
            // ������Ʈ ���� �޽����� ����ֱ� ���� forward ��ſ� �ٷ� JSP �������� �̵���Ŵ
            //request.getRequestDispatcher("myupdate.jsp").forward(request, response);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

}
}