package com.itbank.libook.service;

import java.util.ArrayList;
import java.util.List;

import com.itbank.libook.vo.BookVO;

public interface BookService {
	
	ArrayList<BookVO> searchBookInfo(BookVO bookVO) throws Exception;
	
	ArrayList<BookVO> aBookInfo(BookVO bookVO) throws Exception;
	
	ArrayList<BookVO> aBookInfoRe(BookVO bookVO) throws Exception;
	
	ArrayList<BookVO> searchBookCategory(BookVO bookVO) throws Exception;
	
	
	

	
	//우림
	public int bookInsert(BookVO vo) throws Exception;
	
	public int isbnChk(BookVO vo) throws Exception;
	
	
	
	
	
	//진규

	ArrayList<BookVO> getAllInfo() throws Exception;

	ArrayList<BookVO> getOneBook(BookVO bookvo) throws Exception;

	String updateBookQry(BookVO bookvo);

	ArrayList<BookVO> orderbynumdesc();

	ArrayList<BookVO> orderbynumasc();

	ArrayList<BookVO> orderbypricedesc();

	ArrayList<BookVO> orderbypriceasc();

	ArrayList<BookVO> orderbynamedesc();

	ArrayList<BookVO> orderbynameasc();

	ArrayList<BookVO> getbetweenprice2();

	ArrayList<BookVO> getbetweenprice(int sc1, int sc2);

	ArrayList<BookVO> getsearchedbook(BookVO bookVO);

	ArrayList<BookVO> getsearchedwriter(BookVO bookVO);
}
