package com.itbank.libook.service;

import java.util.ArrayList;


import com.itbank.libook.vo.BasketVO;

public interface BasketService {
	void addBasket(BasketVO basketVO)throws Exception;
	
	ArrayList<BasketVO>goBasket(BasketVO basketVO)throws Exception;
	
	void addBasketQry(BasketVO basketVO)throws Exception;
	
	void subsBasketQry(BasketVO basketVO)throws Exception;
	
	void delBasketQry(BasketVO basketVO)throws Exception;
	
	ArrayList<BasketVO>getAllBasket(BasketVO basketVO)throws Exception;
	
	void clearBasket(BasketVO basketVO)throws Exception;
	
	void delSelectedRows(String member_num, String book_isbn)throws Exception;
	
	
	
}
