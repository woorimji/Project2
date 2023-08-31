package com.haeva.my;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.yakaja.dao.YakajaDAO;
import com.yakaja.vo.YakajaVO;

public class HaevafindPW implements HaevaImpl{

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		String id = request.getParameter("MEM_ID");
		String name = request.getParameter("MEM_NAME");
		
		YakajaDAO tidao1 = new YakajaDAO();
		YakajaVO mv = tidao1.findPW(id, name);
		System.out.println(mv);
		
		String msg="";
		//mv = md.findID(name, email); // 아이디를 찾는 메서드
		if(mv != null) {
			msg = mv.getmem_id() + "님의 비밀번호는 " + mv.getMemPw() + "입니다.";
			request.setAttribute("msg", msg); 
			request.setAttribute("url", "login_ok.jsp");
			//msg="findid-success";
			 //request.setAttribute("mv", mv);
		
		}else {
			
			// msg="findid-fail";
			msg = "비밀번호 찾기 실패";
			request.setAttribute("msg", msg); 
			request.setAttribute("url", "findpw.jsp");
	
		}
		
		// request.setAttribute("msg", msg);
		
	}
	
	

}
