package com.haeva.my;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yakaja.dao.YakajaDAO;
import com.yakaja.vo.YakajaVO;

public class HaevaHotelJoin implements HaevaImpl {

    @Override
    public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String msg = "";
        String url = "";

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        YakajaDAO tidao1 = new YakajaDAO();
        HttpSession session = request.getSession();

        String hotel_name = request.getParameter("HOTEL_NAME");
        String hotel_address = request.getParameter("HOTEL_ADDRESS");
        int room_aprice = Integer.parseInt(request.getParameter("ROOM_APRICE"));
        int room_bprice = Integer.parseInt(request.getParameter("ROOM_BPRICE"));
        int room_cprice = Integer.parseInt(request.getParameter("ROOM_CPRICE"));
        String mem_id = (String) session.getAttribute("id");
        // üũ�ڽ� ���� Ȯ���Ͽ� ������ �����մϴ�.
        int hotel_wifi = request.getParameter("HOTEL_WIFI") != null ? 0 : 1;
        int hotel_pet = request.getParameter("HOTEL_PET") != null ? 0 : 1;
        int hotel_bf = request.getParameter("HOTEL_BF") != null ? 0 : 1;
        int hotel_rs = request.getParameter("HOTEL_RS") != null ? 0 : 1;
        int hotel_ciga = request.getParameter("HOTEL_CIGA") != null ? 0 : 1;
        int hotel_wc = request.getParameter("HOTEL_WC") != null ? 0 : 1;
        //String mem_id = (String) session.getAttribute("MEM_ID");
        
        System.out.println(mem_id);
        tidao1.insertHotelData(hotel_name, hotel_address, room_aprice, room_bprice, room_cprice,
                mem_id, hotel_wifi, hotel_pet, hotel_bf, hotel_rs, hotel_ciga, hotel_wc);

        if (mem_id == null) {
            // �α����� �Ǿ� ���� ���� ��� ó��
            msg = "�α����� �Ǿ� ���� �ʽ��ϴ�.";
            url = "login.jsp";
        } else {
            // �������� ����Ͽ� hotel_id�� �����մϴ�.
            msg = "ȣ�� ��Ͽ� �����ϼ̽��ϴ�.";
            url = "index.jsp";
        }

        request.setAttribute("msg", msg);
        request.setAttribute("url", url);
    }
}