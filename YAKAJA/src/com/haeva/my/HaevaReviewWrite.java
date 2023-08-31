package com.haeva.my;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yakaja.dao.YakajaDAO;

public class HaevaReviewWrite implements HaevaImpl{

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		YakajaDAO hidao=null;
		hidao=new YakajaDAO();
		
		
		//int number=2;
		String reviewhead=request.getParameter("reviewHead");
		String mem_id="def123";
		String reviewbody=request.getParameter("reviewBody");
		int score=Integer.parseInt(request.getParameter("number"));
		int hotelnum=Integer.parseInt(request.getParameter("hotelnum"));
		
		System.out.println(reviewhead+" , "+reviewbody);
	 
		boolean alist1=hidao.writeReview(reviewhead,mem_id,reviewbody,score,hotelnum);
		
		String hotelname=hidao.getHotelName(hotelnum);

		//String numberstr=Integer.toString(number);
		String scorestr=Integer.toString(score);
		
		
		if(alist1) {
			//request.setAttribute("number",numberstr);
			request.setAttribute("reviewhead", reviewhead);
			request.setAttribute("mem_id",mem_id);
			request.setAttribute("reviewbody", reviewbody);
			request.setAttribute("score",scorestr);
			request.setAttribute("hotelname", hotelname);
		}
	}

}
