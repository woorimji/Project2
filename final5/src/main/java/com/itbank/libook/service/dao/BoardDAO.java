package com.itbank.libook.service.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.itbank.libook.vo.BoardVO;

public interface BoardDAO {

	public ArrayList<BoardVO> listBoard();

	public void countStep(Map<String, String> map);

	public int insertBoard(BoardVO boardVO);

	public BoardVO getBoard(BoardVO boardVO);

	public void plusCount(BoardVO boardVO);

	public int updateBoard(BoardVO boardVO);

	public int deleteBoard(BoardVO boardVO);
	
	public int getTotalCount();

	public ArrayList<BoardVO> getList(@Param("page") int page,@Param("page2") int page2);

}
