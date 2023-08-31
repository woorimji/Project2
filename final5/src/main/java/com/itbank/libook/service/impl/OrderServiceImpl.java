package com.itbank.libook.service.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.libook.service.OrderService;
import com.itbank.libook.service.dao.OrderDAO;
import com.itbank.libook.vo.BasketVO;
import com.itbank.libook.vo.ImsiVO;
import com.itbank.libook.vo.MemberVO;
import com.itbank.libook.vo.OrderVO;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDAO;

	@Override
	public int insertOrder(OrderVO orderVO) throws IOException {
		return orderDAO.insertOrder(orderVO);
	}

	@Override
	public int deleteBasket(String member_num) {

		return orderDAO.deleteBasket(member_num);
	}

	@Override
	public int updateBookQrt(ArrayList<BasketVO> listBasket) {

		for (BasketVO basketVO : listBasket) {
			orderDAO.updateBookQrt(basketVO);
		}

		return 1;
	}

	@Override
	public MemberVO getOneMember(String member_num) {
		return orderDAO.getOneMember(member_num);
	}

	@Override
	public int updateMemberPoint(String member_num, int used_point) {
		orderDAO.updateMemberPoint(member_num, used_point);
		return 1;
	}
	
	@Override
	public int findMaxQty(String book_isbn) {
		return orderDAO.findMaxQty(book_isbn);
	}

	
	@Override
	public void insert_imsi(OrderVO orderVO, ArrayList<BasketVO> listBasket) {
		
		String order_number = orderVO.getOrder_number();
		
		for(BasketVO basketVO : listBasket) {
			
			String book_isbn = basketVO.getBook_isbn();
			String book_category = orderDAO.getBookCategory(book_isbn);
			System.out.println("DB에서 꺼내온 카테고리 : " + book_category);
			int book_qry = basketVO.getBasket_qry();
			orderDAO.insert_imsi(order_number, book_isbn, book_category, book_qry);
		
		}
		
	}
	
	@Override
	public void deleteOrder(OrderVO orderVO) {
		orderDAO.deleteOrder(orderVO);
	}
	
	@Override
	public void plusQry(OrderVO orderVO) {
		// 해당 주문 내역의 모든 ismi(book_isbn과 구매수량 정보) 가져오기 
		ArrayList<ImsiVO> listImsi = orderDAO.getOrder(orderVO);
		
		for(ImsiVO imsiVO : listImsi) {
			System.out.println("수량 삭제 isbn : " + imsiVO.getBook_isbn());
			System.out.println("수량 삭제 qty : " + imsiVO.getQty());
			orderDAO.plusQry(imsiVO);
		}
		
	}
	// ########################## 31일 추가 ##########################
	@Override
	public int confirmPay(OrderVO orderVO) {
		int result1 = orderDAO.confirmPay(orderVO);
		int result2 = orderDAO.updateMemberPoint2(orderVO);
		
		if(result1 > 0 && result2 > 0)
			return 1;
		else 
			return -1;
	}
	// #############################################################
	// 우림
	public ArrayList<OrderVO> orderList(OrderVO orderVO) {
		orderDAO.updateOrderStatus();
		return orderDAO.orderList(orderVO);
	}
	@Override
    public ArrayList<OrderVO> everyOrder() {
        return orderDAO.everyOrder();
    }
    
    @Override
    public void orderChange(OrderVO orderVO) {
        orderDAO.orderChange(orderVO);
    }


}