package com.itbank.libook.service.impl;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.libook.service.BoardService;
import com.itbank.libook.service.dao.BoardDAO;
import com.itbank.libook.vo.BoardVO;
import com.itbank.libook.vo.PagingVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boardDAO;

	@Override
	public ArrayList<BoardVO> listBoard() {
		
		return boardDAO.listBoard();
		
	}

	@Override
	public void countStep(BoardVO boardVO) {
		
		String sql = null;
		
		if(boardVO.getBoard_number() == 0) {
			sql = "UPDATE pr3board SET board_step = board_step + 1";
		} else {
			sql = "UPDATE pr3board SET board_step = board_step + 1 WHERE board_step > " + boardVO.getBoard_step();
			boardVO.setBoard_step(boardVO.getBoard_step() + 1);
			boardVO.setBoard_level(boardVO.getBoard_level() + 1);
		}
		
		System.out.println("sql : " + sql);
		
		Map<String, String> map = new Hashtable<>();
		map.put("sql", sql);
		boardDAO.countStep(map);
	}

	@Override
	public int insertBoard(BoardVO boardVO) {
		return boardDAO.insertBoard(boardVO);
	}

	@Override
	public BoardVO getBoard(BoardVO boardVO) {
		return boardDAO.getBoard(boardVO);
	}

	@Override
	public void plusCount(BoardVO boardVO) {
		boardDAO.plusCount(boardVO);
	}

	@Override
	public int updateBoard(BoardVO boardVO) {
		return boardDAO.updateBoard(boardVO);
	}

	@Override
	public int deleteBoard(BoardVO boardVO) {
		return boardDAO.deleteBoard(boardVO);
	}
	
	@Override
	public int getTotalCount() {
		return boardDAO.getTotalCount();
	}

	@Override
	public ArrayList<BoardVO> getList(int page, int page2) {
		return boardDAO.getList(page, page2);
	}
}