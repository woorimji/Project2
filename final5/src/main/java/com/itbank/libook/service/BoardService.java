package com.itbank.libook.service;

import java.util.ArrayList;
import java.util.List;

import com.itbank.libook.vo.BoardVO;
import com.itbank.libook.vo.PagingVO;

public interface BoardService {

	public ArrayList<BoardVO> listBoard();

	public void countStep(BoardVO boardVO);

	public int insertBoard(BoardVO boardVO);

	public BoardVO getBoard(BoardVO boardVO);

	public void plusCount(BoardVO boardVO);

	public int updateBoard(BoardVO boardVO);

	public int deleteBoard(BoardVO boardVO);
	
	public int getTotalCount();

	public ArrayList<BoardVO> getList(int page, int page2);

}
