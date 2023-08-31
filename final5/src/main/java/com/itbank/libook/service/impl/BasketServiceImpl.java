package com.itbank.libook.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.libook.service.BasketService;

import com.itbank.libook.service.dao.BasketDAO;
import com.itbank.libook.vo.BasketVO;


@Service("basketService")
public class BasketServiceImpl implements BasketService {

	@Autowired
	private BasketDAO basketDAO;

	@Override
	public void addBasket(BasketVO basketVO) throws Exception {
		basketDAO.addBasket(basketVO);
	}
	//
	@Override
	public ArrayList<BasketVO> goBasket(BasketVO basketVO) throws Exception {
		return basketDAO.goBasket(basketVO);
	}
	
	
	@Override
	public void addBasketQry(BasketVO basketVO) throws Exception {
		basketDAO.addBasketQry(basketVO);
	}

	@Override
	public void subsBasketQry(BasketVO basketVO) throws Exception {
		basketDAO.subsBasketQry(basketVO);
	}

	@Override
	public void delBasketQry(BasketVO basketVO) throws Exception {
		basketDAO.delBasketQry(basketVO);
		
	}

	@Override
	public ArrayList<BasketVO> getAllBasket(BasketVO basketVO) throws Exception {
		return basketDAO.goBasket(basketVO);
	}

	@Override
	public void clearBasket(BasketVO basketVO) throws Exception {
		basketDAO.clearBasket(basketVO);
		
	}

	

	@Override
	public void delSelectedRows(String member_num, String book_isbn) throws Exception {
		BasketVO basketVO=new BasketVO();
		basketVO.setMember_num(member_num);
		basketVO.setBook_isbn(book_isbn);
		basketDAO.delSelectedRows(member_num, book_isbn);
		
	}

	
	
	
		
}
