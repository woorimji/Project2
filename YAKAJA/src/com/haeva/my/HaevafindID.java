package com.haeva.my;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yakaja.dao.YakajaDAO;
import com.yakaja.vo.YakajaVO;

public class HaevafindID implements HaevaImpl{

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		String name = request.getParameter("MEM_NAME");
		String email = request.getParameter("MEM_EMAIL");

		YakajaDAO tidao1 = new YakajaDAO();
		YakajaVO mv = tidao1.findID(name, email);
		System.out.println(mv);
		
		String msg="";
		//mv = md.findID(name, email); // ���̵� ã�� �޼���
		if(mv != null) {
			msg = mv.getMemName() + "���� ���̵�� " + mv.getmem_id() + "�Դϴ�.";
			request.setAttribute("msg", msg); 
			request.setAttribute("url", "login.jsp");
			//msg="findid-success";
			 //request.setAttribute("mv", mv);
		
		}else {
			
			// msg="findid-fail";
			msg = "���̵� ã�� ����";
			request.setAttribute("msg", msg); 
			request.setAttribute("url", "findid.jsp");
	
		}
		
		// request.setAttribute("msg", msg);
		
	}
	
	

}
