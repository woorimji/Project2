package com.haeva.my;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yakaja.dao.YakajaDAO;
import com.yakaja.vo.HotelVO;
import com.yakaja.vo.ReservVO;
import com.yakaja.vo.YakajaVO;

public class HaevaMyResDelete implements HaevaImpl {

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) {
		String msg = "";
		String url = "";
		
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");


		YakajaDAO tidao1 = new YakajaDAO();

		System.out.println("deleteresv");

		String[] reserv_ids = request.getParameterValues("reserv_id");
		boolean success = true;
		System.out.println(reserv_ids);
		
			for (String reserv_id : reserv_ids) {

				System.out.println(reserv_id);
				tidao1 = new YakajaDAO();
				
				if(!tidao1.Resvdelete(reserv_id)) {
					success=false;
				}
				
				

			}

			if (success) {
				msg = "예약삭제 성공했습니다.";

				request.setAttribute("msg", msg);
				request.setAttribute("url", "resv.jsp");
			} else {
				msg = "예약삭제 실패";

				request.setAttribute("msg", msg);
				request.setAttribute("url", "resv.jsp");
			}

		} catch (Exception e) {

			msg = "예약 ID가 유효하지 않습니다.";
			request.setAttribute("msg", msg);
			request.setAttribute("url", "resv.jsp");
			e.printStackTrace();
			
			
		}
	}
}