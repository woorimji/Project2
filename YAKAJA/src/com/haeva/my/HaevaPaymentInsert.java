package com.haeva.my;

import java.io.BufferedReader;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import com.yakaja.dao.YakajaDAO;

public class HaevaPaymentInsert implements HaevaImpl{

	@Override
public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		YakajaDAO yakajaDao = new YakajaDAO();
		
		// JSON ������ �б�
		BufferedReader reader = request.getReader();
		StringBuilder stringBuilder = new StringBuilder();
		String line;
		
		while ((line = reader.readLine()) != null) {
		    stringBuilder.append(line);
		}
		
		String requestData = stringBuilder.toString();
		
		System.out.println("�ȳ�" + requestData);

		// JSON �Ľ�
		
		JSONParser parser = new JSONParser();
		JSONObject json = null;
		
		try {
			
			json = (JSONObject)parser.parse(requestData);
			String imp_uid = (String)json.get("imp_uid"); // ���� ������ȣ
			String merchant_uid = (String)json.get("merchant_uid"); // �ֹ���ȣ
			
			int room_num = Integer.parseInt((String)json.get("room_num"));
			int hotel_id = Integer.parseInt((String)json.get("hotel_id"));
			int room_price = Integer.parseInt((String)json.get("room_price"));
			String reserv_in = (String)json.get("reserv_in");
			String reserv_out = (String)json.get("reserv_out");  
			String mem_id = (String)json.get("mem_id");
			
			yakajaDao.insertReserv(room_num, hotel_id, room_price, reserv_in, reserv_out, mem_id);
			
			// JSONArray jsa1 = new JSONArray();
			// jsa1.add(imp_uid);
			// jsa1.add(merchant_uid);
			// jsa1.add(room_num);
			// jsa1.add(hotel_id);
			// jsa1.add(room_price);
			// jsa1.add(reserv_in);
			// jsa1.add(reserv_out);
			// jsa1.add(mem_id);
			// System.out.println("json �迭 ��� : " + jsa1.toString());
			
	        // ������ ���� �ۼ��Ͽ� ��ȯ
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write("{ \"result\": \"success\" }");  
			
		} catch (Exception e) {
			e.printStackTrace();
			// JSON �Ľ� ���� �� ���� ó�� �ڵ� �ۼ�
		}
		
	}

}
