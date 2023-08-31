package com.itbank.libook.service.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.itbank.libook.vo.BasketVO;
import com.itbank.libook.vo.ImsiVO;
import com.itbank.libook.vo.MemberVO;
import com.itbank.libook.vo.OrderVO;

public interface OrderDAO {

	public int insertOrder(OrderVO orderVO);

	public int deleteBasket(String member_num);

	public void updateBookQrt(BasketVO basketVO);

	public void updateMemberPoint(@Param("member_num") String member_num, @Param("used_point") int used_point);

	public MemberVO getOneMember(@Param("member_num") String member_num);
	
	public int findMaxQty(@Param("book_isbn")String book_isbn);
	
	public void deleteOrder(OrderVO orderVO);
	
	public String getBookCategory(@Param("book_isbn")String book_isbn);
	// 통계를 위한 ismi 테이블 데이터 삽입
	public void insert_imsi(@Param("order_number")String order_number, @Param("book_isbn")String book_isbn, 
			@Param("book_category")String book_category, @Param("book_qry")int book_qry);
	
	
	
	// 특정 주문번호에 해당하는 ismi 정보 가져오기
	public ArrayList<ImsiVO> getOrder(OrderVO orderVO);	
	
	
	// 환불시 책 수량 원래대로 돌리기
	
	public void plusQry(ImsiVO imsiVO);
	
	// ########################## 31일 추가 ##########################
	public int confirmPay(OrderVO orderVO);
	public int updateMemberPoint2(OrderVO orderVO);
	// ####################################################
	// 우림
	// 회원 번호를 기준으로 해당 회원의 모든 주문 목록을 가져오는 메서드
	public ArrayList<OrderVO> orderList(OrderVO orderVO);

	ArrayList<OrderVO> everyOrder();

	void orderChange(OrderVO orderVO);
	
	void updateOrderStatus();




	
}