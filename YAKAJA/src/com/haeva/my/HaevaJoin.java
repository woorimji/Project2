package com.haeva.my;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yakaja.dao.YakajaDAO;
import com.yakaja.vo.YakajaVO;

public class HaevaJoin implements HaevaImpl {

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
			String msg = "";
			String url = "";
	
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			YakajaDAO tidao1=new YakajaDAO();
			
			String id = request.getParameter("MEM_ID");
			String pw = request.getParameter("MEM_PW");
			String email = request.getParameter("MEM_EMAIL");
			String name = request.getParameter("MEM_NAME");
			String tel = request.getParameter("MEM_TEL");
			int admin = Integer.parseInt(request.getParameter("MEM_ADMIN"));
			
			msg = "회원가입에 성공하셨습니다.";
            request.setAttribute("msg", msg);
            request.setAttribute("url", "login.jsp");
			
			
			
			
			tidao1.insertData(id, pw, email, name, tel, admin);
  
		// TODO Auto-generated method stub
		
	}
}
