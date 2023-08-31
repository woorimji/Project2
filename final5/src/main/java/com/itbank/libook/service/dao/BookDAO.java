package com.itbank.libook.service.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itbank.libook.vo.BookVO;

public interface BookDAO {
	//상민
	ArrayList<BookVO> searchBookInfo(BookVO bookVO) throws Exception;
	
	ArrayList<BookVO> aBookInfo(BookVO bookVO) throws Exception;
	
	ArrayList<BookVO> aBookInfoRe(BookVO bookVO) throws Exception;
	
	ArrayList<BookVO> searchBookCategory(BookVO bookVO)throws Exception;
	
	
	
	
	//우림
	public int bookInsert(BookVO vo);
	
	public int isbnChk(BookVO vo);
	
	
	
	
	
	

	//진규
	ArrayList<BookVO> getAllInfo();
	
	ArrayList<BookVO> getOneBook(BookVO bookvo);
	
	String updateBookQry(BookVO bookvo);

	ArrayList<BookVO> orderbynumdesc();
	
	ArrayList<BookVO> orderbynumasc();

	ArrayList<BookVO> orderbypricedesc();

	ArrayList<BookVO> orderbypriceasc();
	
	ArrayList<BookVO> orderbynamedesc();
	
	ArrayList<BookVO> orderbynameasc();
	
	ArrayList<BookVO> getbetweenprice2();
	
	ArrayList<BookVO> getbetweenprice(@Param("sc1")int sc1, @Param("sc2")int sc2);

	ArrayList<BookVO> getsearchedbook(BookVO bookVO);
	
	ArrayList<BookVO> getsearchedwriter(BookVO bookVO);
}
