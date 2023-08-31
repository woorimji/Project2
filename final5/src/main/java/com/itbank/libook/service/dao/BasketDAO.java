package com.itbank.libook.service.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.itbank.libook.vo.BasketVO;

public interface BasketDAO {
	void addBasket(BasketVO basketVO)throws Exception;
	
	ArrayList<BasketVO>goBasket(BasketVO basketVO) throws Exception;
	
	void addBasketQry(BasketVO basketVO)throws Exception;
	
	void subsBasketQry(BasketVO basketVO)throws Exception;
	
	void delBasketQry(BasketVO basketVO)throws Exception;
	
	void clearBasket(BasketVO basketVO)throws Exception;
	
	void delSelectedRows(@Param("member_num")String member_num, @Param("book_isbn")String book_isbn)throws Exception;
	
}
