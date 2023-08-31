package com.itbank.libook.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itbank.libook.service.BookService;
import com.itbank.libook.service.dao.BookDAO;
import com.itbank.libook.vo.BookVO;

@Service("bookService")
public class BookServiceImpl implements BookService {
	
	@Autowired
	private BookDAO bookDAO;

	@Override
	public ArrayList<BookVO> searchBookInfo(BookVO bookVO) throws Exception {
		return bookDAO.searchBookInfo(bookVO);
	}

	@Override
	public ArrayList<BookVO> aBookInfo(BookVO bookVO) throws Exception {
		return bookDAO.aBookInfo(bookVO);
	}
	
	@Override
	public ArrayList<BookVO> aBookInfoRe(BookVO bookVO) throws Exception {
		return bookDAO.aBookInfoRe(bookVO);
	}

	@Override
	public ArrayList<BookVO> searchBookCategory(BookVO bookVO) throws Exception {
		return bookDAO.searchBookCategory(bookVO);
	}
	
	//진규
	@Override
	@Transactional
	public ArrayList<BookVO> getAllInfo(){
		// TODO Auto-generated method stub
		return bookDAO.getAllInfo();
	}

	
	public ArrayList<BookVO> getOneBook(BookVO bookVO) throws Exception {
		// TODO Auto-generated method stub
		return bookDAO.getOneBook(bookVO);
	}
	
	 public String updateBookQry(BookVO bookvo) {
		return bookDAO.updateBookQry(bookvo);
	}


	@Override
	public ArrayList<BookVO> orderbynumdesc() {
		// TODO Auto-generated method stub
		return bookDAO.orderbynumdesc();
	}


	@Override
	public ArrayList<BookVO> orderbynumasc() {
		// TODO Auto-generated method stub
		return bookDAO.orderbynumasc();
	}


	public ArrayList<BookVO> orderbypricedesc() {
		// TODO Auto-generated method stub
		return bookDAO.orderbypricedesc();
	}


	@Override
	public ArrayList<BookVO> orderbypriceasc() {
		// TODO Auto-generated method stub
		return bookDAO.orderbypriceasc();
	}


	@Override
	public ArrayList<BookVO> orderbynamedesc() {
		// TODO Auto-generated method stub
		return bookDAO.orderbynamedesc();
	}


	public ArrayList<BookVO> orderbynameasc() {
		// TODO Auto-generated method stub
		return bookDAO.orderbynameasc();
	}


	/*
	 * @Override public ArrayList<BookVO> getbetweenprice(int sc11, int sc22) { //
	 * TODO Auto-generated method stub return dao.getbetweenprice(sc11, sc22); }
	 */


	public ArrayList<BookVO> getbetweenprice2() {
		// TODO Auto-generated method stub
		return bookDAO.getbetweenprice2();
	}
	
	@Override
	   public ArrayList<BookVO> getbetweenprice(int sc1, int sc2) {
	      // TODO Auto-generated method stub
	      return bookDAO.getbetweenprice(sc1, sc2);
	   }


	@Override
	public ArrayList<BookVO> getsearchedbook(BookVO bookVO) {
		// TODO Auto-generated method stub
		return this.bookDAO.getsearchedbook(bookVO);
	}


	@Override
	public ArrayList<BookVO> getsearchedwriter(BookVO bookVO) {
		// TODO Auto-generated method stub
		return this.bookDAO.getsearchedwriter(bookVO);
	}
	
	
	//우림
	@Override
	public int bookInsert(BookVO vo) throws Exception {
		
		
		System.out.println(vo);
		int flag = bookDAO.bookInsert(vo);
		if (flag > 0) {
			return flag;
		} else {
			
			return 0; 
		}
	}
	
	@Override
	public int isbnChk(BookVO vo) throws Exception {
		System.out.println(vo);
		int result = bookDAO.isbnChk(vo);
		
		return result;
	}
	
	
}
