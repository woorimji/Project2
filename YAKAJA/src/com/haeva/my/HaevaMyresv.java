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

public class HaevaMyresv implements HaevaImpl {

    @Override
    public void haeva(HttpServletRequest request, HttpServletResponse response) {
    	
    	
        try {
			request.setCharacterEncoding("UTF-8");

        response.setCharacterEncoding("UTF-8");

            
        HttpSession session = request.getSession();

        YakajaVO yakajaVO = (YakajaVO)session.getAttribute("YakajaVO");
        System.out.println(" qweqwe "+yakajaVO);
        String mem_id = yakajaVO.getmem_id();
            
        // 2. DAO 객체 생성
        YakajaDAO yakajaDAO = new YakajaDAO();

        // 3. 예약 정보 가져오기
        ArrayList<ReservVO> listReserv = yakajaDAO.ResevInfo(mem_id);
        request.setAttribute("listReserv", listReserv);
        
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        

        // 다른 액션에 대한 처리 로직 작성
        // ...
    }
}